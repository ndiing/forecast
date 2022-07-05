const Fuzzy = require("./fuzzy");
const data = require("../../data/MPOB_data1.json").map((doc) => ({ tanggal: `${doc.Year}/${doc.Month}`, harga: doc.CoconutOil, pemasok: "CoconutOil" }));
for (let i = 0; i < 7; i++) {
    const res = Fuzzy.timeSeries(data, 9, 4);
    const doc = res.data[res.data.length - 1];
    data.push({ harga: Math.min(doc.chen, doc.cheng) });
}
console.table(Fuzzy.timeSeries(data, 9, 4).data, [
    //
    "harga",
    "chen",
    "cheng",
    "pe_chen",
    "pe_cheng",
    "pd_chen",
    "pd_cheng",
]);
