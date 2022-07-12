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
        var harga = data.map((doc) => doc.harga);// map harga
        var length = harga.length;// jumlah data
        var min = Math.min(...harga); // nilai min dari list harga
        var max = Math.max(...harga); // nilai max dari list harga
        d1 = d1 ?? Math.floor(min / 1) * 1 - min; // adjust/rounded harga terendah
        d2 = d2 ?? Math.ceil(max / 1) * 1 - max; // adjust/rounded harga tertinggi
        var min1 = min + d1;
        var max1 = max + d2;
        // partisi harga
        // untuk acuan himpunan
        var jumlah_kelas = Math.round(1 + 3.322 * Math.log10(length));
        // jumlah pembagian klasifikasi himpunan
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

        // map `HSP` himpunan semesta pembicaraan
        var hsp = [];
        for (let i = 0; i < jumlah_kelas; i++) {
            var curr = {};
            var prev = hsp[i - 1];
            curr.kelas = i + 1; // init kelas
            curr.bb = i > 0 ? prev.ba + 1 : min1; // nilai batas bawah
            curr.ba = curr.bb - 1 + panjang_kelas; // nilai batas atas
            curr.median = (curr.bb + curr.ba) / 2; // nilai tengah
            hsp.push(curr);
        }
        // console.table(hsp);

        // fuzifikasi
        var fuzzy = [];
        for (var index in data) {
            var curr = data[index];
            var prev = fuzzy[index - 1];
            // penentuan kelas
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
            // digunakan untuk chart
            // bukan termasuk dalam perhitungan fuzifikasi
            curr.harga_sebelumnya = prev && prev?.harga;
            curr.f = `A${curr.kelas}`; // map excel
            curr.r = prev && `A${prev?.kelas}->A${curr.kelas}`; // map excel
            curr.lh = prev && `A${prev?.kelas}`; // map excel
            curr.rh = `A${curr.kelas}`; // map excel
            curr.flrg = prev && `G${prev?.kelas}`; // map excel
            fuzzy.push(curr);
        }
        // console.table(fuzzy, ["tanggal", "harga", "kelas"]);

        // `FLRG`
        // fuzzy logic relation group
        var flrg = {};
        for (var curr of fuzzy) {
            if (!curr.flrg) continue;
            // klasifikasi
            if (!flrg[curr.flrg]) flrg[curr.flrg] = {};
            // batas kiri
            if (!flrg[curr.flrg].lh) flrg[curr.flrg].lh = {};
            if (!flrg[curr.flrg].lh[curr.lh]) flrg[curr.flrg].lh[curr.lh] = 0;
            ++flrg[curr.flrg].lh[curr.lh];
            // batas kanan
            if (!flrg[curr.flrg].rh) flrg[curr.flrg].rh = {};
            if (!flrg[curr.flrg].rh[curr.rh]) flrg[curr.flrg].rh[curr.rh] = 0;
            ++flrg[curr.flrg].rh[curr.rh];
        }

        // map
        // hitungan dari fuzifikasi
        // dan flrg
        for (var g in flrg) {
            var curr = flrg[g];
            var lh_value = Object.values(curr.lh)[0]; // variable perhitungan
            var rh_keys = Object.keys(curr.rh); // variable perhitungan
            var rh_values = Object.values(curr.rh); // variable perhitungan
            // formula chen
            curr.chen = rh_keys.reduce((p, c) => p + hsp.find((h) => `A${h.kelas}` == c).median, 0) / rh_keys.length;
            // formula cheng
            curr.cheng = rh_keys.reduce((p, c, i) => p + (rh_values[i] / lh_value) * hsp.find((h) => `A${h.kelas}` == c).median, 0);
        }

        // map hasil perhitungan
        // ke data utama
        var doc = {};
        for (var curr of fuzzy) {
            if (!curr.flrg) continue;
            // add chen
            curr.chen = flrg[curr.flrg].chen;
            // curr.chen = parseFloat(curr.chen.toFixed(2));
            
            // add cheng
            curr.cheng = flrg[curr.flrg].cheng;
            // curr.cheng = parseFloat(curr.cheng.toFixed(2));
            
            // epsilon/persentase error metode chen
            curr.pe_chen = (Math.abs(curr.harga - curr.chen) / curr.harga) * 100;
            // curr.pe_chen = parseFloat(curr.pe_chen.toFixed(2));
            
            // epsilon/persentase error metode cheng
            curr.pe_cheng = (Math.abs(curr.harga - curr.cheng) / curr.harga) * 100;
            // curr.pe_cheng = parseFloat(curr.pe_cheng.toFixed(2));

            doc = curr;
        }

        return {
            // harga,
            length, // data pendukung dari inputan
            min, // data pendukung dari inputan
            max, // data pendukung dari inputan
            d1, // data pendukung dari inputan
            d2, // data pendukung dari inputan
            min1, // data pendukung dari inputan
            max1, // data pendukung dari inputan
            jumlah_kelas, // data pendukung dari inputan
            panjang_kelas,  // data pendukung dari inputan
            hsp, // data hasil himpunan semesta pembicarran
            fuzzy, // data hasil data fuzifikasi
            flrg, // data flrg
            data, // semua mutable data awal+pehitungan
            doc, // data terakhir yang digunakan untuk perhitungan
            // prediksi selanjutnya
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
