const express = require("express");
const KontakService = require("./service");
const KontakModel = require("./model");
const UangModel = require("../../uang/v1/model");
const I18n = require("../../../../common/i18n");

class KontakController {
    static pools = {};

    static init() {
        const router = express.Router();
        router.use(KontakController.middleware.bind(this));
        router.get("/", KontakController.getKontak.bind(this));
        router.get("/embed", KontakController.getKontak2.bind(this));
        router.post("/", KontakController.postKontak.bind(this));
        router.patch("/:id", KontakController.patchKontak.bind(this));
        router.delete("/:id", KontakController.deleteKontak.bind(this));

        // router.get("/login", /*  */);
        // router.get("/confirm", /*  */);
        // router.get("/logout", /*  */);
        // router.get("/category", /*  */);
        // router.get("/product", /*  */);
        // router.get("/inquiry", /*  */);
        // router.get("/payment", /*  */);
        // router.get("/history", /*  */);

        // router.get("/connect", /*  */);
        // router.get("/disconnect", /*  */);
        // router.get("/send", /*  */);

        // .on('connecting')
        // .on('connected')
        // .on('disconnecting')
        // .on('disconnected')
        // .on('incoming')

        return router;
    }

    static async middleware(req, res, next) {
        try {
            const _id = req.query._id ?? "default";
            const file = `./data/kontak/${_id}.json`;
            const data = {};

            if (!KontakController.pools[_id]) {
                KontakController.pools[_id] = new KontakService(file, data);
            }

            next();
        } catch (error) {
            next(error);
        }
    }

    static async getKontak(req, res, next) {
        try {
            const [data, [{ "": rowcount }]] = await KontakModel.getKontak(req.query);
            res.set({
                "Access-Control-Expose-Headers": "X-Total-Count",
                "X-Total-Count": rowcount,
            });
            res.json(data);
        } catch (error) {
            next(error);
        }
    }

    static async getKontak2(req, res, next) {
        try {
            const options={
                ...req.query
            }
            const [data, [{ "": rowcount }]] = await KontakModel.getKontak2(options);
            // console.log(options.id_kontak)
            res.set({
                "Access-Control-Expose-Headers": "X-Total-Count",
                "X-Total-Count": rowcount,
            });
            res.json(data);
        } catch (error) {
            next(error);
        }
    }

    static async postKontak(req, res, next) {
        try {
            const result = await KontakModel.postKontak(req.body);
            res.json({ message: I18n.getMessage(`postKontak${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('postKontak0') });
        }
    }

    static async patchKontak(req, res, next) {
        try {
            req.body.id = req.params.id;
            const result = await KontakModel.patchKontak(req.body);
            res.json({ message: I18n.getMessage(`patchKontak${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('patchKontak0') });
        }
    }

    static async deleteKontak(req, res, next) {
        try {
            const result = await KontakModel.deleteKontak(req.params);
            res.json({ message: I18n.getMessage(`deleteKontak${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('deleteKontak0') });
        }
    }
}

module.exports = KontakController.init();
