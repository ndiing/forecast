const express = require("express");
const ExampleService = require("./service");
const ExampleModel = require("./model");
const I18n = require("../../../../common/i18n");

class ExampleController {
    static pools = {};

    static init() {
        const router = express.Router();
        router.use(ExampleController.middleware);
        router.get("/", ExampleController.getKelompok);
        router.post("/", ExampleController.postKelompok);
        router.patch("/:id", ExampleController.patchKelompok);
        router.delete("/:id", ExampleController.deleteKelompok);

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
            const file = `./data/example/${_id}.json`;
            const data = {};

            if (!ExampleController.pools[_id]) {
                ExampleController.pools[_id] = new ExampleService(file, data);
            }

            next();
        } catch (error) {
            next(error);
        }
    }

    static async getKelompok(req, res, next) {
        try {
            const [data, [{ "": rowcount }]] = await ExampleModel.getKelompok(req.query);
            res.set({
                "Access-Control-Expose-Headers": "X-Total-Count",
                "X-Total-Count": rowcount,
            });
            res.json(data);
        } catch (error) {
            next(error);
        }
    }

    static async postKelompok(req, res, next) {
        try {
            const result = await ExampleModel.postKelompok(req.body);
            res.json({ message: I18n.getMessage(`postKelompok${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('postKelompok0') });
        }
    }

    static async patchKelompok(req, res, next) {
        try {
            req.body.id = req.params.id;
            const result = await ExampleModel.patchKelompok(req.body);
            res.json({ message: I18n.getMessage(`patchKelompok${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('patchKelompok0') });
        }
    }

    static async deleteKelompok(req, res, next) {
        try {
            const result = await ExampleModel.deleteKelompok(req.params);
            res.json({ message: I18n.getMessage(`deleteKelompok${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage('deleteKelompok0') });
        }
    }
}

module.exports = ExampleController.init();
