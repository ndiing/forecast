USE forecast

-- CrudePalmOil
-- SoyabeanOil
-- GroundnutOil
-- SunflowerOil
-- RapeseedOil
-- CoconutOil
-- FishOil
-- Tallow
-- Lard

DECLARE @json VARCHAR(MAX)
DECLARE @nama VARCHAR(32) = 'Lard'
DECLARE @id_kontak INT
DECLARE @kontak TABLE (id INT)

SELECT @json = BulkColumn
FROM OPENROWSET (BULK 'C:\Users\Ndiing\Documents\forecast\sql\MPOB_data1.json', SINGLE_CLOB) as j

SELECT @id_kontak = id FROM kontak WHERE nama = @nama
IF @@ROWCOUNT = 0
BEGIN
	INSERT INTO kontak (id_uang, nama)
	OUTPUT INSERTED.id INTO @kontak
	VALUES (1, @nama)

	SELECT @id_kontak = id FROM @kontak
END

INSERT INTO entri (id_kontak, tanggal, harga)
SELECT @id_kontak AS id_kontak, CAST(Year+'/'+Month AS DATETIME) AS tanggal, Lard AS harga FROM OPENJSON(@json)
WITH (
    [Year] VARCHAR(8), 
    [Month] VARCHAR(8), 
    Lard MONEY
)