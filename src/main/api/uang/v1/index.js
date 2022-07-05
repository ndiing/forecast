const express = require("express");
const UangService = require("./service");
const UangModel = require("./model");
const I18n = require("../../../../common/i18n");

class UangController {
    static pools = {};

    static init() {
        const router = express.Router();
        router.use(UangController.middleware);
        router.get("/", UangController.getUang);
        router.post("/", UangController.postUang);
        router.patch("/:id", UangController.patchUang);
        router.delete("/:id", UangController.deleteUang);

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
            const file = `./data/uang/${_id}.json`;
            const data = {};

            if (!UangController.pools[_id]) {
                UangController.pools[_id] = new UangService(file, data);
            }

            next();
        } catch (error) {
            next(error);
        }
    }

    static async getUang(req, res, next) {
        try {
            const [data, [{ "": rowcount }]] = await UangModel.getUang(req.query);
            res.set({
                "Access-Control-Expose-Headers": "X-Total-Count",
                "X-Total-Count": rowcount,
            });
            res.json(data);
        } catch (error) {
            next(error);
        }
    }

    static async postUang(req, res, next) {
        try {
            const result = await UangModel.postUang(req.body);
            res.json({ message: I18n.getMessage(`postUang${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('postUang0') });
        }
    }

    static async patchUang(req, res, next) {
        try {
            req.body.id = req.params.id;
            const result = await UangModel.patchUang(req.body);
            res.json({ message: I18n.getMessage(`patchUang${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('patchUang0') });
        }
    }

    static async deleteUang(req, res, next) {
        try {
            const result = await UangModel.deleteUang(req.params);
            res.json({ message: I18n.getMessage(`deleteUang${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('deleteUang0') });
        }
    }
}

module.exports = UangController.init();
