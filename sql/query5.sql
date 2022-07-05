USE forecast

MERGE kontak AS target
USING (SELECT 
	e.id,
	e.id_kontak,
	e.harga,
	e.tanggal,
	e2.harga AS harga_sebelumnya,
	e2.tanggal AS tanggal_sebelumnya,
	e.harga - e2.harga AS selisih_harga,
	100 * (e.harga - e2.harga) / ((e.harga + e2.harga) / 2) AS persentase_perubahan
FROM entri e
LEFT JOIN (SELECT 
	*
FROM entri
WHERE id IN (SELECT MAX(id) FROM entri e
	WHERE tanggal < DATEADD(DAY, -1, (SELECT tanggal FROM entri WHERE id = (SELECT MAX(id) FROM entri WHERE id_kontak = e.id_kontak)))
	GROUP BY id_kontak)) e2
ON e2.id_kontak = e.id_kontak
WHERE e.id IN (SELECT MAX(id) FROM entri GROUP BY id_kontak)) AS source
ON source.id_kontak = target.id
WHEN MATCHED THEN
UPDATE
SET target.harga=source.harga,
target.tanggal=source.tanggal,
target.harga_sebelumnya=source.harga_sebelumnya,
target.tanggal_sebelumnya=source.tanggal_sebelumnya,
target.selisih_harga=source.selisih_harga,
target.persentase_perubahan=source.persentase_perubahan
OUTPUT $action, INSERTED.*, DELETED.*
;

