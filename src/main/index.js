const express = require("express");
const http = require("http");
const https = require("https");
const helmet = require("helmet");
const cors = require("cors");

// require("../temp/temp");

// require('../common/config')
const { JWE } = require("../common/crypto");
// require('../common/events')
// require('../common/helper')
const I18n = require("../common/i18n");
// require('../common/model')
// require('../common/proxy')
require('../common/fuzzy')

class Server {
    static init() {
        process.on("uncaughtException", Server.nothing());
        process.on("unhandledRejection", Server.nothing());
        const app = express();
        app.use(Server.parse());
        app.use(helmet());
        app.use(cors());
        // app.use(Server.accessControl());
        // app.use("/api/example/v1/", require("./api/example/v1/index"));
        app.use("/api/uang/v1/", require("./api/uang/v1/index"));
        app.use("/api/kontak/v1/", require("./api/kontak/v1/index"));
        app.use("/api/entri/v1/", require("./api/entri/v1/index"));
        app.use("/api/ramalan/v1/", require("./api/ramalan/v1/index"));
        app.use(Server.notFound());
        app.use(Server.error());
        http.createServer(app).listen(global.server.httpPort, "0.0.0.0");
        https.createServer({}, app).listen(global.server.httpsPort, "0.0.0.0");
    }

    static nothing() {
        return (...args) => {
            console.debug(...args);
        };
    }

    static parse() {
        return (req, res, next) => {
            const contentType = req.get("content-type") ?? "";
            if (contentType) {
                req.raw = "";
                req.on("data", (chunk) => {
                    req.raw += chunk;
                });
                req.on("end", () => {
                    if (/application\/json/i.test(contentType)) {
                        req.body = JSON.parse(req.raw);
                    } else if (/application\/x-www-form-urlencoded/i.test(contentType)) {
                        req.body = Object.fromEntries(new URLSearchParams(req.raw).entries());
                    }
                    next();
                });
            } else {
                next();
            }
        };
    }

    static accessControl() {
        return (req, res, next) => {
            const permissions = [
                { method: ".*", remoteAddress: "127.0.0.1", url: ".*", scheme: ".*", credentials: false, role: ".*" },
                { method: ".*", remoteAddress: ".*", url: ".*", scheme: "Bearer", credentials: true, role: "user" },
            ];

            try {
                const [scheme, credentials] = (req.get("authorization") ?? "").split(" ");
                const method = req.method;
                const remoteAddress = req.socket.remoteAddress;
                const url = req.url;
                const permission = permissions.find((permission) => {
                    return new RegExp(`^(${permission.method})$`).test(method) && new RegExp(`^(${permission.remoteAddress})$`).test(remoteAddress) && new RegExp(`^(${permission.url})$`).test(url);
                });
                if (!permission) {
                    throw { code: 403 };
                }
                if (permission.credentials) {
                    if (!credentials) {
                        throw { code: 401 };
                    }
                    if (!new RegExp(`^(${permission.scheme})$`).test(scheme)) {
                        throw { code: 400, name: "invalid_request" };
                    }
                    const payload = JWE.decrypt(credentials);
                    if (Date.now() > payload.exp) {
                        throw { code: 401, name: "invalid_token" };
                    }
                    if (!new RegExp(`^(${permission.role})$`).test(payload.role)) {
                        throw { code: 403, name: "insufficient_scope" };
                    }
                }
                next();
            } catch (error) {
                error.message = I18n.getMessage(error.name);
                next(error);
            }
        };
    }

    static notFound() {
        return (req, res, next) => {
            next({ code: 404 });
        };
    }

    static error() {
        return (err, req, res, next) => {
            err = JSON.parse(JSON.stringify(err, Object.getOwnPropertyNames(err)));
            console.debug(err);

            err.code = (http.STATUS_CODES[err.code] && err.code) || 500;
            err.message = err.message || http.STATUS_CODES[err.code];

            res.status(err.code);
            res.json({
                code: err.code,
                message: err.message,
            });
        };
    }
}

// Server.init();

module.exports = Server;

