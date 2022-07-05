USE forecast

DECLARE @json VARCHAR(MAX)
DECLARE @nama VARCHAR(32)
DECLARE @id_kontak INT
DECLARE @kontak TABLE (id INT)

-- brent-crude-oil.json
-- crude-oil.json
-- ethanol.json
-- gasoline.json
-- heating-oil.json
-- methanol.json
-- naphtha.json
-- natural-gas.json
-- propane.json
-- uranium.json

SELECT @json = BulkColumn
FROM OPENROWSET (BULK 'C:\Users\Ndiing\Documents\forecast\sql\uranium.json', SINGLE_CLOB) as j

SELECT @nama = full_name FROM OPENJSON(@json, '$.series[0]')
WITH (full_name VARCHAR(32))

SELECT @id_kontak = id FROM kontak WHERE nama = @nama
IF @@ROWCOUNT = 0
BEGIN
	INSERT INTO kontak (id_uang, nama)
	OUTPUT INSERTED.id INTO @kontak
	VALUES (1, @nama)

	SELECT @id_kontak = id FROM @kontak
END

INSERT INTO entri (id_kontak, tanggal, harga)
SELECT @id_kontak AS id_kontak, [date] AS tanggal, y AS harga FROM OPENJSON(@json, '$.series[0].data')
WITH ([date] DATETIME, y MONEY)