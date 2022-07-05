USE forecast

ALTER TABLE kontak
ADD harga MONEY 


ALTER TABLE kontak
ADD tanggal DATETIME 


ALTER TABLE kontak
ADD harga_sebelumnya MONEY 


ALTER TABLE kontak
ADD tanggal_sebelumnya DATETIME 


ALTER TABLE kontak
ADD selisih_harga MONEY 


ALTER TABLE kontak
ADD persentase_perubahan MONEY 