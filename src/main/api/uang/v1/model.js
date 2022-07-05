const Model = require("../../../../common/model");
const Helper = require("../../../../common/helper");
const mssql = require("mssql/msnodesqlv8");
const { MAX } = require("mssql/msnodesqlv8");
const UangQuery = {};
UangQuery.getUang = `
USE forecast

SELECT * FROM [uang]
`;
UangQuery.postUang = `
USE forecast

INSERT INTO [uang] (
    [locale],
    [currency],
    [rate]
 )
 VALUES (
    @locale,
    @currency,
    @rate
 )
`;
UangQuery.patchUang = `
USE forecast

UPDATE [uang]
SET 
   [locale] = ISNULL(@locale, [locale]),
   [currency] = ISNULL(@currency, [currency]),
   [rate] = ISNULL(@rate, [rate])
WHERE id = @id
`;
UangQuery.deleteUang = `
USE forecast

DELETE [uang]
WHERE id = @id
`;

class UangModel extends Model {
    static columns = {
        id: { type: mssql.Int, identity: true },
        locale: { type: mssql.VarChar(8) },
        currency: { type: mssql.VarChar(8) },
        rate: { type: mssql.Money },
    };

    static async getUang(options = {}) {
        const pool = await Model.get("uang");
        const request = pool.request();
        const { query, columns } = Model.queryGet(UangQuery.getUang, options, this.columns);
        for (const name in columns) {
            request.input(name, columns[name].type, columns[name].value);
        }
        const result = await request.query(query);
        return result.recordsets;
    }

    static async postUang(options = {}) {
        const pool = await Model.get("uang");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(UangQuery.postUang);
        return result.rowsAffected;
    }

    static async patchUang(options = {}) {
        const pool = await Model.get("uang");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(UangQuery.patchUang);
        return result.rowsAffected;
    }

    static async deleteUang(options = {}) {
        const pool = await Model.get("uang");
        const request = pool.request();
        for (const name in this.columns) {
            request.input(name, this.columns[name].type, options[name]);
        }
        const result = await request.query(UangQuery.deleteUang);
        return result.rowsAffected;
    }
}

UangModel.UangQuery = UangQuery;
module.exports = UangModel;

// Usage
// UangModel.getUang({}).then(console.log).catch(console.log)
// UangModel.postUang({nama:'nama1'}).then(console.log).catch(console.log)
// UangModel.patchUang({nama:'nama2',id:17}).then(console.log).catch(console.log)
// UangModel.deleteUang({id:17}).then(console.log).catch(console.log)
