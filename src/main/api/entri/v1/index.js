const express = require("express");
const EntriService = require("./service");
const EntriModel = require("./model");
const I18n = require("../../../../common/i18n");

class EntriController {
    static pools = {};

    static init() {
        const router = express.Router();
        router.use(EntriController.middleware);
        router.get("/", EntriController.getEntri);
        router.post("/", EntriController.postEntri);
        router.patch("/:id", EntriController.patchEntri);
        router.delete("/:id", EntriController.deleteEntri);

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
            const file = `./data/entri/${_id}.json`;
            const data = {};

            if (!EntriController.pools[_id]) {
                EntriController.pools[_id] = new EntriService(file, data);
            }

            next();
        } catch (error) {
            next(error);
        }
    }

    static async getEntri(req, res, next) {
        try {
            const options = {
                // id_kontak: '1,2,3,4,5,6',
                ...req.query,
            };
            const result = await EntriModel.getEntri(options);
            const [{ "": length }] = result.pop();
            // res.set({
            //     "Access-Control-Expose-Headers": "X-Total-Count",
            //     "X-Total-Count": rowcount,
            // });
            let data = [["id"].concat(options.id_kontak?.split(","))];
            let avg = length / result.length;
            for (let i = 0; i < avg; i++) {
                let data2 = [i];
                for (let ii = 0; ii < result.length; ii++) {
                    var iii = Math.round(((i - 0) * result[ii].length) / (avg - 0));
                    data2[ii + 1] = result[ii]?.[iii]?.harga;
                }
                data.push(data2);
            }
            res.json(data);
        } catch (error) {
            next(error);
        }
    }

    static async postEntri(req, res, next) {
        try {
            const result = await EntriModel.postEntri(req.body);
            res.json({ message: I18n.getMessage(`postEntri${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage("postEntri0") });
        }
    }

    static async patchEntri(req, res, next) {
        try {
            req.body.id = req.params.id;
            const result = await EntriModel.patchEntri(req.body);
            res.json({ message: I18n.getMessage(`patchEntri${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage("patchEntri0") });
        }
    }

    static async deleteEntri(req, res, next) {
        try {
            const result = await EntriModel.deleteEntri(req.params);
            res.json({ message: I18n.getMessage(`deleteEntri${result[1]}`) });
        } catch (error) {
            res.json({ message: I18n.getMessage("deleteEntri0") });
        }
    }
}

module.exports = EntriController.init();
