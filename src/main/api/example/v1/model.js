const Model = require("../../../../common/model");
const Helper = require("../../../../common/helper");
const mssql = require("mssql/msnodesqlv8");
const { MAX } = require("mssql/msnodesqlv8");
const ExampleQuery = {};
ExampleQuery.getKelompok = `
USE forecast

SELECT * FROM [kelompok]
`;
ExampleQuery.postKelompok = `
USE forecast

INSERT INTO [kelompok] (
    [nama],
    [dasar_perhitungan],
    [rumus_perhitungan],
    [nilai_perhitungan],
    [rumus_pembulatan],
    [nilai_pembulatan]
 )
 VALUES (
    @nama,
    @dasar_perhitungan,
    @rumus_perhitungan,
    @nilai_perhitungan,
    @rumus_pembulatan,
    @nilai_pembulatan
 )
`;
ExampleQuery.patchKelompok = `
USE forecast

UPDATE [kelompok]
SET 
   [nama] = ISNULL(@nama, [nama]),
   [dasar_perhitungan] = ISNULL(@dasar_perhitungan, [dasar_perhitungan]),
   [rumus_perhitungan] = ISNULL(@rumus_perhitungan, [rumus_perhitungan]),
   [nilai_perhitungan] = ISNULL(@nilai_perhitungan, [nilai_perhitungan]),
   [rumus_pembulatan] = ISNULL(@rumus_pembulatan, [rumus_pembulatan]),
   [nilai_pembulatan] = ISNULL(@nilai_pembulatan, [nilai_pembulatan])
WHERE id = @id
`;
ExampleQuery.deleteKelompok = `
USE forecast

DELETE [kelompok]
WHERE id = @id
`;

class ExampleModel extends Model {
    static columns = {
        id: { type: mssql.Int, identity: true },
        nama: { type: mssql.VarChar(MAX) },
        dasar_perhitungan: { type: mssql.Int },
        rumus_perhitungan: { type: mssql.Int },
        nilai_perhitungan: { type: mssql.Int },
        rumus_pembulatan: { type: mssql.Int },
        nilai_pembulatan: { type: mssql.Int },
    };

    static async getKelompok(options = {}) {
        const pool = await Model.get("kelompok");
        const request = pool.request();
        const { query, columns } = Model.queryGet(ExampleQuery.getKelompok, options, this.columns);
        for (const name in columns) {
            request.input(name, columns[name].type, columns[name].value);
        }
        const result = await request.query(query);
        return result.recordsets;
    }

    static async postKelompok(options = {}) {
        const pool = await Model.get("kelompok");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(ExampleQuery.postKelompok);
        return result.rowsAffected;
    }

    static async patchKelompok(options = {}) {
        const pool = await Model.get("kelompok");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(ExampleQuery.patchKelompok);
        return result.rowsAffected;
    }

    static async deleteKelompok(options = {}) {
        const pool = await Model.get("kelompok");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(ExampleQuery.deleteKelompok);
        return result.rowsAffected;
    }
}

ExampleModel.ExampleQuery = ExampleQuery;
module.exports = ExampleModel;

// Usage
// ExampleModel.getKelompok({}).then(console.log).catch(console.log)
// ExampleModel.postKelompok({nama:'nama1'}).then(console.log).catch(console.log)
// ExampleModel.patchKelompok({nama:'nama2',id:17}).then(console.log).catch(console.log)
// ExampleModel.deleteKelompok({id:17}).then(console.log).catch(console.log)
