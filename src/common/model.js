const mssql = require("mssql/msnodesqlv8");

class Model {
    static excludes = ["_page", "_limit", "_start", "_end", "q", "_sort", "_order"];

    static operators = {
        _lt: (name) => `${name} < @${name}`,
        _gt: (name) => `${name} > @${name}`,
        _lte: (name) => `${name} <= @${name}`,
        _gte: (name) => `${name} >= @${name}`,
        _eq: (name) => `${name} = @${name}`,
        _ne: (name) => `${name} <> @${name}`,
        _in: (name) => `${name} IN (@${name})`,
        _nin: (name) => `${name} NOT IN (@${name})`,
        _like: (name) => `${name} LIKE '%'+@${name}+'%'`,
        _btwn: (name) => `${name} BETWEEN @${name}1 AND @${name}2`,
    };

    static pools = new Map();

    static get(name = "default", config = global.sql) {
        if (!this.pools.has(name)) {
            const pool = new mssql.ConnectionPool(config);
            const close = pool.close.bind(pool);
            pool.close = (...args) => {
                this.pools.delete(name);
                return close(...args);
            };
            this.pools.set(name, pool.connect());
        }
        return this.pools.get(name);
    }

    static closeAll() {
        return Promise.all(
            Array.from(this.pools.values()).map((connect) => {
                return connect.then((pool) => pool.close());
            })
        );
    }

    static queryGet(query = "", data = {}, columns = {}) {
        let { _page = 1, _limit = 500000, _start = 0, _end = 20, q, _sort, _order, ...filters } = data;

        _page = Number(_page);
        _limit = Number(_limit);
        _start = Number(_start);
        _end = Number(_end);

        _limit = _end - _start;

        let filter = [];
        let search = [];

        query = query.trim();
        query += `\n`;
        // filter
        if (Object.keys(filters).length) {
            for (const key in filters) {
                // key
                const value = filters[key];
                const [name, operator = "_eq"] = key.match(new RegExp(`^(\\w+?)(${Object.keys(this.operators).join("|")})?$`))?.slice(1);
                const column = columns[name];
                if (column) {
                    filter.push(this.operators[operator](name));
                    columns[name] = {
                        type: column.type,
                        value,
                    };

                    if (operator == "_btwn") {
                        const [v1, v2] = value.split(",");
                        columns[`${name}1`] = { type: column.type, value: v1 };
                        columns[`${name}2`] = { type: column.type, value: v2 };
                    }
                }
            }
        }
        // console.log(filter)
        // search
        if (q) {
            for (const name in columns) {
                if (!this.excludes.includes(name)) {
                    const column = columns[name];
                    search.push(`${name} LIKE '%'+@q+'%'`);
                }
            }
            if (filter.length) {
                search = search.map((s) => [s].concat(filter).join(" AND "));
            }
            columns.q = { type: mssql.VarChar(128), value: q };
        }
        // console.log(search)
        if (search.length || filter.length) {
            query += `WHERE `;
            if (search.length) {
                query += search.join(" OR ");
            } else {
                query += filter.join(" AND ");
            }
            query += `\n`;
        }
        let queryCount = query;
        let [queryCount1, queryCount2] = queryCount.split("SELECT");
        let [queryCount3, queryCount4] = queryCount2.split("FROM");
        queryCount = `SELECT COUNT(*) FROM${queryCount4}`;

        // order
        if ((_sort && _order) || (!isNaN(_start) && !isNaN(_limit))) {
            query += `ORDER BY `;
            if (_sort && _order) {
                _order = _order.split(",");
                const sort = _sort
                    .split(",")
                    .map((name, index) => `${name} ${_order[index]}`)
                    .join(", ");
                query += sort;
            } else {
                query += "(SELECT NULL)";
            }
            query += `\n`;
        }
        // slice
        if (!isNaN(_start) && !isNaN(_limit)) {
            query += `OFFSET @_start ROWS\n`;
            query += `FETCH NEXT @_limit ROWS ONLY\n`;
            query += `\n`;
            query += `${queryCount}\n`;
            columns._start = { type: mssql.Int, value: _start };
            columns._limit = { type: mssql.Int, value: _limit };
        }

        // console.log(query, columns);

        return { query, columns };
    }
}

Model.mssql = mssql;
module.exports = Model;

// Usage
// Model.queryGet(
//     `
// USE forecast
// SELECT * FROM akun
// `,
//     {
//         // nama_lt: "utang",
//         // nama_gt: "utang",
//         // nama_lte: "utang",
//         // nama_gte: "utang",
//         // nama_eq: "utang",
//         // nama_ne: "utang",
//         // nama_in: "utang",
//         // nama_nin: "utang",
//         // nama_like: "utang",
//         // nama_btwn: "utang",
//         // q: "utang",
//         // _sort: "nama",
//         // _order: "DESC",
//     },
//     {
//         id: { type: "INT", identity: true },
//         nama: { type: "VARCHAR(64)" },
//         tipe: { type: "INT" },
//         kelompok: { type: "INT" },
//     }
// );
// async function example(){
//     const pool = await Model.get()
//     const request = pool.request()
//     const result = await request.query(`
//         SELECT
//             GETDATE(),
//             SYSDATETIMEOFFSET(),
//             '${new Date().toISOString()}'
//     `)
//     return result.recordset[0]['']
// }
// example().then(console.log)
