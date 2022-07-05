const crypto = require("crypto");
const Helper = require("./helper");

class Crypto {
    static encrypt(data = "", key = global.server.aesKey, iv = global.server.aesIv, algo = "aes256") {
        const cipher = crypto.createCipheriv(algo, key, iv);
        return Buffer.concat([cipher.update(data), cipher.final()]).toString("hex");
    }

    static decrypt(data = "", key = global.server.aesKey, iv = global.server.aesIv, algo = "aes256") {
        const cipher = crypto.createDecipheriv(algo, key, iv);
        return Buffer.concat([cipher.update(data, "hex"), cipher.final()]).toString("utf8");
    }

    static encode(data = "") {
        return Buffer.from(data).toString("base64");
    }

    static decode(data = "") {
        return Buffer.from(data, "base64").toString("utf8");
    }

    static hash(data = "", algo = "sha256") {
        return crypto.createHash(algo).update(data).digest("hex");
    }

    static hmac(data = "", key = "00000000000000000000000000000000", algo = "sha256") {
        return crypto.createHmac(algo, key).update(data).digest("hex");
    }
}

class JWE {
    static encrypt(data = {}) {
        let header = JSON.stringify({ alg: "HS256", typ: "JWE" });
        header = Crypto.encrypt(header, global.server.jweKey, global.server.jweIv);
        header = Crypto.encode(header);
        let payload = JSON.stringify({ exp: Date.now() + 1000 * 60, iat: Date.now(), jti: crypto.randomUUID(), ...data });
        payload = Crypto.encrypt(payload, global.server.jweKey, global.server.jweIv);
        payload = Crypto.encode(payload);
        let secret = this.sign(header, payload);
        return `${header}.${payload}.${secret}`;
    }

    static sign(header, payload) {
        let secret = Crypto.hmac(`${header}.${payload}`, global.server.jweSecret);
        secret = Crypto.encode(secret);
        return secret;
    }

    static verify(header, payload, secret) {
        return secret == this.sign(header, payload);
    }

    static decrypt(data = "") {
        let [header, payload, secret] = data.split(".");
        try {
            if (!this.verify(header, payload, secret)) {
                throw {};
            }
            header = Crypto.decode(header);
            header = Crypto.decrypt(header, global.server.jweKey, global.server.jweIv);
            header = JSON.parse(header);
            payload = Crypto.decode(payload);
            payload = Crypto.decrypt(payload, global.server.jweKey, global.server.jweIv);
            payload = JSON.parse(payload);
        } catch (error) {
            throw { code: 401, name: "invalid_token" };
        }
        // console.log(header, payload, secret);
        return payload;
    }
}

Crypto.JWE = JWE;
module.exports = Crypto;

// Usage
// var key = crypto.randomBytes(16).toString("hex");
// var iv = crypto.randomBytes(8).toString("hex");

// var encrypted = Crypto.encrypt("data", key, iv);
// console.log(encrypted);
// console.log(Crypto.decrypt(encrypted, key, iv));

// var encoded = Crypto.encode("data", key);
// console.log(encoded);
// console.log(Crypto.decode(encoded, key));

// console.log(Crypto.hash("data"));
// console.log(Crypto.hmac("data", key));

// var token = {
//     access_token: JWE.encrypt({}),
//     token_type: "Bearer",
//     expires_in: null,
//     refresh_token: JWE.encrypt({ exp: Date.now() + 1000 * 60 * 60 * 24, role:'refresh' }),
// };
// console.log({ access_token: token.access_token });
// console.log({ refresh_token: token.refresh_token });
// console.log(JWE.decrypt(token.access_token));
// console.log(JWE.decrypt(token.refresh_token));
