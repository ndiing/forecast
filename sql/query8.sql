USE forecast

DECLARE @id_kontak VARCHAR(32) = '1,2,3,4,5,6'
DECLARE @kontak TABLE (id INT, id_kontak INT)

INSERT INTO @kontak
SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS id, [value] FROM STRING_SPLIT(@id_kontak, ',')

DECLARE @index INT = 1
DECLARE @count INT = 0

WHILE @index <= (SELECT COUNT(*) FROM @kontak)
BEGIN
	DECLARE @count2 INT
	DECLARE @id_kontak2 INT = (SELECT id_kontak FROM @kontak WHERE id = @index)

	SELECT * FROM entri 
	WHERE id_kontak = @id_kontak2
	AND tanggal > DATEADD(YEAR, 0 - 8, SYSDATETIMEOFFSET())
	
	SELECT @count2 = @@ROWCOUNT

	IF @count2 > @count
	BEGIN
		SET @count = @count2
	END
	
	SET @index = @index + 1
END

SELECT @count