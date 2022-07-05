const Model = require("../../../../common/model");
const Helper = require("../../../../common/helper");
const mssql = require("mssql/msnodesqlv8");
const { MAX } = require("mssql/msnodesqlv8");
const EntriQuery = {};
EntriQuery.getEntri = `
USE forecast

SELECT * FROM [entri]
WHERE id_kontak = @id_kontak
AND tanggal >= DATEADD(YEAR, (0 - @tahun), ISNULL((SELECT tanggal FROM entri WHERE id = (SELECT MAX(id) FROM entri WHERE id_kontak = @id_kontak)), SYSDATETIMEOFFSET()))
`;
EntriQuery.postEntri = `
USE forecast

INSERT INTO [entri] (
    [id_kontak],
    [tanggal],
    [harga]
 )
 VALUES (
    @id_kontak,
    @tanggal,
    @harga
 )
`;
EntriQuery.patchEntri = `
USE forecast

UPDATE [entri]
SET 
   [id_kontak] = ISNULL(@id_kontak, [id_kontak]),
   [tanggal] = ISNULL(@tanggal, [tanggal]),
   [harga] = ISNULL(@harga, [harga])
WHERE id = @id
`;
EntriQuery.deleteEntri = `
USE forecast

DELETE [entri]
WHERE id = @id
`;

class EntriModel extends Model {
    static columns = {
        id: { type: mssql.Int, identity: true },
        id_kontak: { type: mssql.Int },
        tanggal: { type: mssql.DateTime },
        tahun: { type: mssql.Int },
        harga: { type: mssql.Money },
    };

    static async getEntri(options = {}) {
        const pool = await Model.get("entri");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(EntriQuery.getEntri);
        return result.recordsets;
    }

    static async postEntri(options = {}) {
        const pool = await Model.get("entri");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(EntriQuery.postEntri);
        return result.rowsAffected;
    }

    static async patchEntri(options = {}) {
        const pool = await Model.get("entri");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(EntriQuery.patchEntri);
        return result.rowsAffected;
    }

    static async deleteEntri(options = {}) {
        const pool = await Model.get("entri");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(EntriQuery.deleteEntri);
        return result.rowsAffected;
    }
}

EntriModel.EntriQuery = EntriQuery;
module.exports = EntriModel;

// Usage
// EntriModel.getEntri({}).then(console.log).catch(console.log)
// EntriModel.postEntri({nama:'nama1'}).then(console.log).catch(console.log)
// EntriModel.patchEntri({nama:'nama2',id:17}).then(console.log).catch(console.log)
// EntriModel.deleteEntri({id:17}).then(console.log).catch(console.log)
