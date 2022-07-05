const AnyProxy = require("anyproxy");
const regedit = require("regedit").promisified;
const exec = require("child_process").exec;

if (!AnyProxy.utils.certMgr.ifRootCAFileExists()) {
    AnyProxy.utils.certMgr.generateRootCA((error, keyPath) => {
        if (!error) {
            const certDir = require("path").dirname(keyPath);
            const isWin = /^win/.test(process.platform);
            if (isWin) {
                exec("start .", { cwd: certDir });
            } else {
                exec("open .", { cwd: certDir });
            }
        } else {
        }
    });
}

const useProxyServer = async (value = 0) => {
    try {
        await regedit.putValue({
            "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings": {
                ProxyEnable: {
                    value, //: 1,
                    type: "REG_DWORD",
                },
                ProxyServer: {
                    value: `http=127.0.0.1:${global.server.proxyPort};https=127.0.0.1:${global.server.proxyPort};ftp=127.0.0.1:${global.server.proxyPort}`,
                    type: "REG_SZ",
                },
                ProxyOverride: {
                    value: "<-loopback>",
                    type: "REG_SZ",
                },
            },
        });
    } catch (error) {}
    return value;
};

class ProxyServer extends AnyProxy.ProxyServer {
    constructor(options = {}) {
        super({
            port: global.server.proxyPort,
            //   rule: require('myRuleModule'),
            // rule: {
            //     *beforeSendRequest(requestDetail) { /* ... */ },
            //     *beforeSendResponse(requestDetail, responseDetail) { /* ... */ },
            //     *beforeDealHttpsRequest(requestDetail) { /* ... */ },
            //     *onError(requestDetail, error) { /* ... */ },
            //     *onConnectError(requestDetail, error) { /* ... */ }
            // },
            // webInterface: {
            //     enable: true,
            //     webPort: 8002,
            // },
            throttle: 10000,
            forceProxyHttps: true,
            dangerouslyIgnoreUnauthorized: true,
            // wsIntercept: false,
            silent: true,
            ...options,
        });
    }

    async start() {
        await useProxyServer(1);
        super.start();
    }

    async close() {
        await useProxyServer(0);
        super.close();
    }
}

ProxyServer.regedit = regedit;
module.exports = ProxyServer;

// Usage
// const proxy = new ProxyServer();
// proxy.on('ready', () => console.log('ready'))
// proxy.on('error', () => console.log('error'))
// proxy.start();
// setTimeout(() => {
//     // auto close 30s
//     proxy.close();
// }, 1000 * 30);
