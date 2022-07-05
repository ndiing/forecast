/**
 *
 */
class Fuzzy {
    /**
     * @param {Array} data -
     * @param {Number} d1 -
     * @param {Number} d2 -
     * @returns Object
     */
    static timeSeries(data = [], options = {}) {
        var { d1, d2 } = options;
        var harga = data.map((doc) => doc.harga);
        var length = harga.length;
        var min = Math.min(...harga);
        var max = Math.max(...harga);
        d1 = d1 ?? Math.floor(min / 1) * 1 - min;
        d2 = d2 ?? Math.ceil(max / 1) * 1 - max;
        var min1 = min + d1;
        var max1 = max + d2;
        var jumlah_kelas = Math.round(1 + 3.322 * Math.log10(length));
        var panjang_kelas = Math.round((max1 - min1) / jumlah_kelas);

        // console.table({
        //     d1,
        //     d2,
        //     // harga,
        //     length,
        //     min,
        //     max,
        //     min1,
        //     max1,
        //     jumlah_kelas,
        //     panjang_kelas,
        // });

        var hsp = [];
        for (let i = 0; i < jumlah_kelas; i++) {
            var curr = {};
            var prev = hsp[i - 1];
            curr.kelas = i + 1;
            curr.bb = i > 0 ? prev.ba + 1 : min1;
            curr.ba = curr.bb - 1 + panjang_kelas;
            curr.median = (curr.bb + curr.ba) / 2;
            hsp.push(curr);
        }
        // console.table(hsp);

        var fuzzy = [];
        for (var index in data) {
            var curr = data[index];
            var prev = fuzzy[index - 1];
            for (var curr2 of hsp) {
                curr.kelas = curr2.kelas;
                if (
                    //
                    // curr.harga>=curr2.bb&&
                    // curr.harga<=curr2.ba
                    curr2.ba >= curr.harga
                ) {
                    curr.kelas = curr2.kelas;
                    break;
                }
            }
            curr.harga_sebelumnya = prev && prev?.harga;
            curr.f = `A${curr.kelas}`;
            curr.r = prev && `A${prev?.kelas}->A${curr.kelas}`;
            curr.lh = prev && `A${prev?.kelas}`;
            curr.rh = `A${curr.kelas}`;
            curr.flrg = prev && `G${prev?.kelas}`;
            fuzzy.push(curr);
        }
        // console.table(fuzzy, ["tanggal", "harga", "kelas"]);

        var flrg = {};
        for (var curr of fuzzy) {
            if (!curr.flrg) continue;
            if (!flrg[curr.flrg]) flrg[curr.flrg] = {};
            if (!flrg[curr.flrg].lh) flrg[curr.flrg].lh = {};
            if (!flrg[curr.flrg].lh[curr.lh]) flrg[curr.flrg].lh[curr.lh] = 0;
            ++flrg[curr.flrg].lh[curr.lh];
            if (!flrg[curr.flrg].rh) flrg[curr.flrg].rh = {};
            if (!flrg[curr.flrg].rh[curr.rh]) flrg[curr.flrg].rh[curr.rh] = 0;
            ++flrg[curr.flrg].rh[curr.rh];
        }

        for (var g in flrg) {
            var curr = flrg[g];
            var lh_value = Object.values(curr.lh)[0];
            var rh_keys = Object.keys(curr.rh);
            var rh_values = Object.values(curr.rh);
            curr.chen = rh_keys.reduce((p, c) => p + hsp.find((h) => `A${h.kelas}` == c).median, 0) / rh_keys.length;
            curr.cheng = rh_keys.reduce((p, c, i) => p + (rh_values[i] / lh_value) * hsp.find((h) => `A${h.kelas}` == c).median, 0);
        }

        var doc = {};
        for (var curr of fuzzy) {
            if (!curr.flrg) continue;
            curr.chen = flrg[curr.flrg].chen;
            // curr.chen = parseFloat(curr.chen.toFixed(2));

            curr.cheng = flrg[curr.flrg].cheng;
            // curr.cheng = parseFloat(curr.cheng.toFixed(2));

            curr.pe_chen = (Math.abs(curr.harga - curr.chen) / curr.harga) * 100;
            // curr.pe_chen = parseFloat(curr.pe_chen.toFixed(2));

            curr.pe_cheng = (Math.abs(curr.harga - curr.cheng) / curr.harga) * 100;
            // curr.pe_cheng = parseFloat(curr.pe_cheng.toFixed(2));

            doc = curr;
        }

        return {
            // harga,
            length,
            min,
            max,
            d1,
            d2,
            min1,
            max1,
            jumlah_kelas,
            panjang_kelas,
            hsp,
            fuzzy,
            flrg,
            data,
            doc,
        };
    }
}

module.exports = Fuzzy;

// Usage
// var data = require("./data/MPOB_data1.json");
// data = data.map((doc) => ({ tanggal: `${doc.Year}/${doc.Month}`, harga: doc.CoconutOil, pemasok: "CoconutOil" }));
// data = Fuzzy.timeSeries(data, 9, 4);
// console.table(data.hsp);
// console.table(data.flrg);
// console.table(data.fuzzy);
