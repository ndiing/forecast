const Model = require("../../../../common/model");
const Helper = require("../../../../common/helper");
const mssql = require("mssql/msnodesqlv8");
const { MAX } = require("mssql/msnodesqlv8");
const KontakQuery = {};
KontakQuery.getKontak = `
USE forecast

SELECT * FROM [kontak]
`;
KontakQuery.getKontak2 = `
USE forecast

SELECT
    k.id,
    k.id_uang,
    k.nama,
    k.harga,
    k.harga_sebelumnya,
    k.tanggal,
    k.tanggal_sebelumnya,
    k.selisih_harga,
    k.persentase_perubahan,
    u.locale,
    u.currency,
    u.rate
FROM [kontak] k
LEFT JOIN uang u ON u.id = k.id_uang
`;
KontakQuery.postKontak = `
USE forecast

INSERT INTO [kontak] (
    [id_uang],
    [nama]
 )
 VALUES (
    @id_uang,
    @nama
 )
`;
KontakQuery.patchKontak = `
USE forecast

UPDATE [kontak]
SET 
   [id_uang] = ISNULL(@id_uang, [id_uang]),
   [nama] = ISNULL(@nama, [nama])
WHERE id = @id
`;
KontakQuery.deleteKontak = `
USE forecast

DELETE [kontak]
WHERE id = @id
`;

class KontakModel extends Model {
    static columns = {
        id: { type: mssql.Int, identity: true },
        id_uang: { type: mssql.Int },
        nama: { type: mssql.VarChar(32) },
        harga: { type: mssql.Money },
        harga_sebelumnya: { type: mssql.Money },
        selisih_harga: { type: mssql.Money },
        persentase_perubahan: { type: mssql.Money },
        tanggal: { type: mssql.DateTime },
        tanggal_sebelumnya: { type: mssql.DateTime },
    };

    static async getKontak(options = {}) {
        const pool = await Model.get("kontak");
        const request = pool.request();
        const { query, columns } = Model.queryGet(KontakQuery.getKontak, options, this.columns);
        for (const name in columns) {
            request.input(name, columns[name].type, columns[name].value);
        }
        const result = await request.query(query);
        return result.recordsets;
    }

    static async getKontak2(options = {}) {
        const pool = await Model.get("kontak");
        const request = pool.request();
        const { query, columns } = Model.queryGet(KontakQuery.getKontak2, options, this.columns);
        for (const name in columns) {
            request.input(name, columns[name].type, columns[name].value);
        }
        const result = await request.query(query);
        return result.recordsets;
    }

    static async postKontak(options = {}) {
        const pool = await Model.get("kontak");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(KontakQuery.postKontak);
        return result.rowsAffected;
    }

    static async patchKontak(options = {}) {
        const pool = await Model.get("kontak");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(KontakQuery.patchKontak);
        return result.rowsAffected;
    }

    static async deleteKontak(options = {}) {
        const pool = await Model.get("kontak");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(KontakQuery.deleteKontak);
        return result.rowsAffected;
    }
}

KontakModel.KontakQuery = KontakQuery;
module.exports = KontakModel;

// Usage
// KontakModel.getKontak({}).then(console.log).catch(console.log)
// KontakModel.postKontak({nama:'nama1'}).then(console.log).catch(console.log)
// KontakModel.patchKontak({nama:'nama2',id:17}).then(console.log).catch(console.log)
// KontakModel.deleteKontak({id:17}).then(console.log).catch(console.log)
