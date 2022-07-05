const express = require("express");
const EntriService = require("./service");
const EntriModel = require("./model");
const UangModel = require("../../uang/v1/model");
const KontakModel = require("../../kontak/v1/model");
const I18n = require("../../../../common/i18n");
const Fuzzy = require("../../../../common/fuzzy");
const Helper = require("../../../../common/helper");

class EntriController {
    static pools = {};
    static caches = {};

    static init() {
        const router = express.Router();
        router.use(EntriController.middleware.bind(this));
        router.get("/", EntriController.getEntri.bind(this));
        router.post("/", EntriController.postEntri.bind(this));
        router.patch("/:id", EntriController.patchEntri.bind(this));
        router.delete("/:id", EntriController.deleteEntri.bind(this));

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
                ...req.query,
                id_kontak: Number(req.query.id_kontak ?? 1),
                d1: req.query.d1 && Number(req.query.d1),
                d2: req.query.d2 && Number(req.query.d2),
                hari: Number(req.query.hari ?? 7),
                tahun: Number(req.query.tahun ?? 8),
            };

            const [[kontak]] = await KontakModel.getKontak({ id: options?.id_kontak });
            const [[dari_uang]] = await UangModel.getUang({ id: kontak?.id_uang });
            const [[ke_uang]] = await UangModel.getUang({ id: options?.id_uang ?? kontak?.id_uang });

            const key = [
                //
                options.id_kontak,
                options.tahun,
            ];

            if (!this.caches[key]) {
                const [data] = await EntriModel.getEntri(options);
                this.caches[key] = data;
            }

            const key2 = [
                //
                options.id_kontak,
                options.tahun,
                options.id_uang,
                options.d1,
                options.d2,
                options.hari,
            ];

            if (!this.caches[key2]) {
                const data = this.caches[key].slice();
                for (let i = 0; i < options.hari; i++) {
                    const { doc } = Fuzzy.timeSeries(data, options);
                    const pe = [doc.pe_chen, doc.pe_cheng];
                    const harga = [doc.chen, doc.cheng][pe.indexOf(Math.min(...pe))];
                    const tanggal = Helper.moment().add(1 + i, "day");
                    data.push({ tanggal, harga });
                }
                const result = Fuzzy.timeSeries(data, options);
                this.caches[key2] = result.data;
                this.caches[key2.concat("doc")] = result.doc;
                this.caches[key2.concat("rows")] = this.caches[key2].map((doc, i) => [
                    //
                    // i,
                    doc.tanggal,
                    (() => (dari_uang.rate / ke_uang.rate) * (doc.harga ?? 0))(),
                    doc.id ? null : `stroke-color:#999999;fill-color:transparent;`,
                ]);
            }

            let entri = this.caches[key2];

            res.set({
                "Access-Control-Expose-Headers": "X-Total-Count",
                "X-Total-Count": entri.length,
            });
            res.json({
                entri: entri.slice(options._start, options._end),
                kontak,
                dari_uang,
                ke_uang,
                rows: this.caches[key2.concat("rows")],
                doc: this.caches[key2.concat("doc")],
            });
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
