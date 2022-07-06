USE master

IF DB_ID('forecast') IS NOT NULL
BEGIN
    ALTER DATABASE forecast SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE forecast
END

CREATE DATABASE forecast
GO

USE forecast

ALTER DATABASE forecast
SET COMPATIBILITY_LEVEL = 130
GO

CREATE TABLE uang (
    id INT PRIMARY KEY IDENTITY(1,1),
    locale VARCHAR(8) NOT NULL,
    currency VARCHAR(8) NOT NULL,
    rate MONEY NOT NULL
)

CREATE TABLE kontak (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_uang INT NOT NULL FOREIGN KEY REFERENCES uang(id),
    nama VARCHAR(32) NOT NULL,
    harga MONEY,
    tanggal DATETIME,
    harga_sebelumnya MONEY,
    tanggal_sebelumnya DATETIME,
    selisih_harga MONEY,
    persentase_perubahan MONEY
)

CREATE TABLE entri (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_kontak INT NOT NULL FOREIGN KEY REFERENCES kontak(id),
    tanggal DATETIME NOT NULL,
    harga MONEY NOT NULL
)

USE [forecast]
GO
SET IDENTITY_INSERT [dbo].[uang] ON 
GO
INSERT [dbo].[uang] ([id], [locale], [currency], [rate]) VALUES (1, N'en-US', N'USD', 14975.1500)
GO
INSERT [dbo].[uang] ([id], [locale], [currency], [rate]) VALUES (2, N'id-ID', N'IDR', 1.0000)
GO
INSERT [dbo].[uang] ([id], [locale], [currency], [rate]) VALUES (3, N'ja-JP', N'JPY', 110.7500)
GO
INSERT [dbo].[uang] ([id], [locale], [currency], [rate]) VALUES (4, N'de-DE', N'EUR', 15617.7300)
GO
SET IDENTITY_INSERT [dbo].[uang] OFF
GO
SET IDENTITY_INSERT [dbo].[kontak] ON 
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (1, 1, N'Crude Oil Brent', 111.6300, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 109.0300, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 2.6000, 2.3565)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (2, 1, N'Crude Oil WTI', 108.4300, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 105.7600, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 2.6700, 2.4931)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (3, 1, N'Ethanol', 2.5400, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2.7899, CAST(N'2022-06-01T00:00:00.000' AS DateTime), -0.2499, -9.3774)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (4, 1, N'Gasoline', 3.6878, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 3.5363, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 0.1515, 4.1943)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (5, 1, N'Heating Oil', 3.9389, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 3.8305, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 0.1084, 2.7904)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (6, 1, N'Methanol', 2551.0000, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2575.0000, CAST(N'2022-06-29T00:00:00.000' AS DateTime), -24.0000, -0.9364)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (7, 1, N'Naphtha', 811.8190, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 802.9250, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 8.8940, 1.1015)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (8, 1, N'Natural gas', 5.7300, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 5.4240, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 0.3060, 5.4868)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (9, 1, N'Propane', 1.2158, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1.2150, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 0.0008, 0.0658)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (10, 1, N'Uranium', 51.2500, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 50.8500, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 0.4000, 0.7835)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (11, 1, N'CrudePalmOil', 551.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 561.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -10.0000, -1.7985)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (12, 1, N'SoyabeanOil', 757.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 766.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -9.0000, -1.1818)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (13, 1, N'GroundnutOil', 1265.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 1281.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -16.0000, -1.2568)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (14, 1, N'SunflowerOil', 714.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 740.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -26.0000, -3.5763)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (15, 1, N'RapeseedOil', 843.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 853.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -10.0000, -1.1792)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (16, 1, N'CoconutOil', 904.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 916.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -12.0000, -1.3186)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (17, 1, N'FishOil', 1400.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 1355.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 45.0000, 3.2667)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (18, 1, N'Tallow', 730.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 780.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), -50.0000, -6.6225)
GO
INSERT [dbo].[kontak] ([id], [id_uang], [nama], [harga], [tanggal], [harga_sebelumnya], [tanggal_sebelumnya], [selisih_harga], [persentase_perubahan]) VALUES (19, 1, N'Lard', 679.0000, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 607.0000, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 72.0000, 11.1975)
GO
SET IDENTITY_INSERT [dbo].[kontak] OFF
GO
SET IDENTITY_INSERT [dbo].[entri] ON 
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1, 1, CAST(N'1970-04-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2, 1, CAST(N'1970-05-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3, 1, CAST(N'1970-06-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4, 1, CAST(N'1970-07-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5, 1, CAST(N'1970-09-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6, 1, CAST(N'1970-10-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (7, 1, CAST(N'1970-12-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (8, 1, CAST(N'1971-01-15T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (9, 1, CAST(N'1971-02-15T00:00:00.000' AS DateTime), 2.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (10, 1, CAST(N'1971-03-15T00:00:00.000' AS DateTime), 2.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (11, 1, CAST(N'1971-04-15T00:00:00.000' AS DateTime), 2.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (12, 1, CAST(N'1971-06-15T00:00:00.000' AS DateTime), 3.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (13, 1, CAST(N'1971-07-15T00:00:00.000' AS DateTime), 3.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (14, 1, CAST(N'1971-09-15T00:00:00.000' AS DateTime), 3.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (15, 1, CAST(N'1971-10-15T00:00:00.000' AS DateTime), 3.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (16, 1, CAST(N'1971-11-15T00:00:00.000' AS DateTime), 3.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (17, 1, CAST(N'1971-12-15T00:00:00.000' AS DateTime), 3.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (18, 1, CAST(N'1972-02-15T00:00:00.000' AS DateTime), 3.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (19, 1, CAST(N'1972-03-15T00:00:00.000' AS DateTime), 3.6700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (20, 1, CAST(N'1972-05-15T00:00:00.000' AS DateTime), 3.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (21, 1, CAST(N'1972-06-15T00:00:00.000' AS DateTime), 3.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (22, 1, CAST(N'1972-08-15T00:00:00.000' AS DateTime), 3.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (23, 1, CAST(N'1972-09-15T00:00:00.000' AS DateTime), 3.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (24, 1, CAST(N'1972-11-15T00:00:00.000' AS DateTime), 3.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (25, 1, CAST(N'1972-12-15T00:00:00.000' AS DateTime), 3.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (26, 1, CAST(N'1973-01-15T00:00:00.000' AS DateTime), 3.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (27, 1, CAST(N'1973-02-15T00:00:00.000' AS DateTime), 3.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (28, 1, CAST(N'1973-03-15T00:00:00.000' AS DateTime), 3.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (29, 1, CAST(N'1973-05-15T00:00:00.000' AS DateTime), 4.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (30, 1, CAST(N'1973-06-15T00:00:00.000' AS DateTime), 4.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (31, 1, CAST(N'1973-08-15T00:00:00.000' AS DateTime), 4.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (32, 1, CAST(N'1973-10-15T00:00:00.000' AS DateTime), 4.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (33, 1, CAST(N'1973-11-15T00:00:00.000' AS DateTime), 4.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (34, 1, CAST(N'1974-01-15T00:00:00.000' AS DateTime), 4.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (35, 1, CAST(N'1974-02-15T00:00:00.000' AS DateTime), 15.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (36, 1, CAST(N'1974-03-15T00:00:00.000' AS DateTime), 15.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (37, 1, CAST(N'1974-04-15T00:00:00.000' AS DateTime), 15.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (38, 1, CAST(N'1974-05-15T00:00:00.000' AS DateTime), 13.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (39, 1, CAST(N'1974-07-15T00:00:00.000' AS DateTime), 13.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (40, 1, CAST(N'1974-08-15T00:00:00.000' AS DateTime), 11.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (41, 1, CAST(N'1974-10-15T00:00:00.000' AS DateTime), 11.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (42, 1, CAST(N'1974-11-15T00:00:00.000' AS DateTime), 11.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (43, 1, CAST(N'1975-01-15T00:00:00.000' AS DateTime), 11.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (44, 1, CAST(N'1975-04-15T00:00:00.000' AS DateTime), 11.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (45, 1, CAST(N'1975-05-15T00:00:00.000' AS DateTime), 11.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (46, 1, CAST(N'1975-07-15T00:00:00.000' AS DateTime), 11.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (47, 1, CAST(N'1975-08-15T00:00:00.000' AS DateTime), 11.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (48, 1, CAST(N'1975-09-15T00:00:00.000' AS DateTime), 11.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (49, 1, CAST(N'1975-10-15T00:00:00.000' AS DateTime), 11.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (50, 1, CAST(N'1975-12-15T00:00:00.000' AS DateTime), 11.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (51, 1, CAST(N'1976-01-15T00:00:00.000' AS DateTime), 11.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (52, 1, CAST(N'1976-03-15T00:00:00.000' AS DateTime), 12.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (53, 1, CAST(N'1976-04-15T00:00:00.000' AS DateTime), 12.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (54, 1, CAST(N'1976-06-15T00:00:00.000' AS DateTime), 12.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (55, 1, CAST(N'1976-07-15T00:00:00.000' AS DateTime), 12.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (56, 1, CAST(N'1976-09-15T00:00:00.000' AS DateTime), 13.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (57, 1, CAST(N'1976-10-15T00:00:00.000' AS DateTime), 13.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (58, 1, CAST(N'1976-11-15T00:00:00.000' AS DateTime), 13.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (59, 1, CAST(N'1976-12-15T00:00:00.000' AS DateTime), 13.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (60, 1, CAST(N'1977-02-15T00:00:00.000' AS DateTime), 14.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (61, 1, CAST(N'1977-03-15T00:00:00.000' AS DateTime), 14.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (62, 1, CAST(N'1977-04-15T00:00:00.000' AS DateTime), 14.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (63, 1, CAST(N'1977-06-15T00:00:00.000' AS DateTime), 14.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (64, 1, CAST(N'1977-07-15T00:00:00.000' AS DateTime), 14.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (65, 1, CAST(N'1977-08-15T00:00:00.000' AS DateTime), 14.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (66, 1, CAST(N'1977-09-15T00:00:00.000' AS DateTime), 14.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (67, 1, CAST(N'1977-11-15T00:00:00.000' AS DateTime), 14.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (68, 1, CAST(N'1977-12-15T00:00:00.000' AS DateTime), 14.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (69, 1, CAST(N'1978-02-15T00:00:00.000' AS DateTime), 14.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (70, 1, CAST(N'1978-03-15T00:00:00.000' AS DateTime), 14.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (71, 1, CAST(N'1978-05-15T00:00:00.000' AS DateTime), 13.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (72, 1, CAST(N'1978-06-15T00:00:00.000' AS DateTime), 13.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (73, 1, CAST(N'1978-08-15T00:00:00.000' AS DateTime), 13.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (74, 1, CAST(N'1978-09-15T00:00:00.000' AS DateTime), 13.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (75, 1, CAST(N'1978-11-15T00:00:00.000' AS DateTime), 14.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (76, 1, CAST(N'1978-12-15T00:00:00.000' AS DateTime), 14.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (77, 1, CAST(N'1979-01-15T00:00:00.000' AS DateTime), 16.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (78, 1, CAST(N'1979-02-15T00:00:00.000' AS DateTime), 18.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (79, 1, CAST(N'1979-03-15T00:00:00.000' AS DateTime), 22.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (80, 1, CAST(N'1979-05-15T00:00:00.000' AS DateTime), 23.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (81, 1, CAST(N'1979-06-15T00:00:00.000' AS DateTime), 32.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (82, 1, CAST(N'1979-08-15T00:00:00.000' AS DateTime), 35.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (83, 1, CAST(N'1979-10-15T00:00:00.000' AS DateTime), 36.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (84, 1, CAST(N'1979-11-15T00:00:00.000' AS DateTime), 38.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (85, 1, CAST(N'1980-01-15T00:00:00.000' AS DateTime), 40.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (86, 1, CAST(N'1980-02-15T00:00:00.000' AS DateTime), 40.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (87, 1, CAST(N'1980-04-15T00:00:00.000' AS DateTime), 38.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (88, 1, CAST(N'1980-05-15T00:00:00.000' AS DateTime), 38.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (89, 1, CAST(N'1980-07-15T00:00:00.000' AS DateTime), 38.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (90, 1, CAST(N'1980-08-15T00:00:00.000' AS DateTime), 37.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (91, 1, CAST(N'1980-09-15T00:00:00.000' AS DateTime), 33.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (92, 1, CAST(N'1980-10-15T00:00:00.000' AS DateTime), 33.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (93, 1, CAST(N'1980-12-15T00:00:00.000' AS DateTime), 40.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (94, 1, CAST(N'1981-01-15T00:00:00.000' AS DateTime), 40.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (95, 1, CAST(N'1981-04-15T00:00:00.000' AS DateTime), 38.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (96, 1, CAST(N'1981-05-15T00:00:00.000' AS DateTime), 37.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (97, 1, CAST(N'1981-06-15T00:00:00.000' AS DateTime), 35.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (98, 1, CAST(N'1981-07-15T00:00:00.000' AS DateTime), 33.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (99, 1, CAST(N'1981-09-15T00:00:00.000' AS DateTime), 35.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (100, 1, CAST(N'1981-10-15T00:00:00.000' AS DateTime), 35.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (101, 1, CAST(N'1981-12-15T00:00:00.000' AS DateTime), 37.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (102, 1, CAST(N'1982-01-04T00:00:00.000' AS DateTime), 35.7700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (103, 1, CAST(N'1982-02-01T00:00:00.000' AS DateTime), 31.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (104, 1, CAST(N'1982-03-01T00:00:00.000' AS DateTime), 29.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (105, 1, CAST(N'1982-04-01T00:00:00.000' AS DateTime), 31.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (106, 1, CAST(N'1982-05-03T00:00:00.000' AS DateTime), 34.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (107, 1, CAST(N'1982-06-01T00:00:00.000' AS DateTime), 34.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (108, 1, CAST(N'1982-07-01T00:00:00.000' AS DateTime), 33.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (109, 1, CAST(N'1982-08-02T00:00:00.000' AS DateTime), 32.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (110, 1, CAST(N'1982-09-01T00:00:00.000' AS DateTime), 33.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (111, 1, CAST(N'1982-10-01T00:00:00.000' AS DateTime), 34.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (112, 1, CAST(N'1982-11-01T00:00:00.000' AS DateTime), 33.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (113, 1, CAST(N'1982-12-01T00:00:00.000' AS DateTime), 31.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (114, 1, CAST(N'1983-01-03T00:00:00.000' AS DateTime), 31.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (115, 1, CAST(N'1983-02-01T00:00:00.000' AS DateTime), 28.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (116, 1, CAST(N'1983-03-01T00:00:00.000' AS DateTime), 27.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (117, 1, CAST(N'1983-04-01T00:00:00.000' AS DateTime), 29.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (118, 1, CAST(N'1983-05-02T00:00:00.000' AS DateTime), 29.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (119, 1, CAST(N'1983-06-01T00:00:00.000' AS DateTime), 30.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (120, 1, CAST(N'1983-07-01T00:00:00.000' AS DateTime), 30.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (121, 1, CAST(N'1983-08-01T00:00:00.000' AS DateTime), 31.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (122, 1, CAST(N'1983-09-01T00:00:00.000' AS DateTime), 30.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (123, 1, CAST(N'1983-10-03T00:00:00.000' AS DateTime), 29.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (124, 1, CAST(N'1983-11-01T00:00:00.000' AS DateTime), 28.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (125, 1, CAST(N'1983-12-01T00:00:00.000' AS DateTime), 28.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (126, 1, CAST(N'1984-01-02T00:00:00.000' AS DateTime), 29.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (127, 1, CAST(N'1984-02-01T00:00:00.000' AS DateTime), 29.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (128, 1, CAST(N'1984-03-01T00:00:00.000' AS DateTime), 30.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (129, 1, CAST(N'1984-04-02T00:00:00.000' AS DateTime), 30.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (130, 1, CAST(N'1984-05-01T00:00:00.000' AS DateTime), 29.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (131, 1, CAST(N'1984-06-01T00:00:00.000' AS DateTime), 29.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (132, 1, CAST(N'1984-07-02T00:00:00.000' AS DateTime), 27.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (133, 1, CAST(N'1984-08-01T00:00:00.000' AS DateTime), 28.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (134, 1, CAST(N'1984-09-03T00:00:00.000' AS DateTime), 28.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (135, 1, CAST(N'1984-10-01T00:00:00.000' AS DateTime), 27.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (136, 1, CAST(N'1984-11-01T00:00:00.000' AS DateTime), 27.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (137, 1, CAST(N'1984-12-03T00:00:00.000' AS DateTime), 26.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (138, 1, CAST(N'1985-01-01T00:00:00.000' AS DateTime), 26.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (139, 1, CAST(N'1985-02-01T00:00:00.000' AS DateTime), 28.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (140, 1, CAST(N'1985-03-01T00:00:00.000' AS DateTime), 28.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (141, 1, CAST(N'1985-04-01T00:00:00.000' AS DateTime), 27.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (142, 1, CAST(N'1985-05-01T00:00:00.000' AS DateTime), 26.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (143, 1, CAST(N'1985-06-03T00:00:00.000' AS DateTime), 26.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (144, 1, CAST(N'1985-07-01T00:00:00.000' AS DateTime), 26.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (145, 1, CAST(N'1985-08-01T00:00:00.000' AS DateTime), 27.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (146, 1, CAST(N'1985-09-02T00:00:00.000' AS DateTime), 27.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (147, 1, CAST(N'1985-10-01T00:00:00.000' AS DateTime), 28.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (148, 1, CAST(N'1985-11-01T00:00:00.000' AS DateTime), 29.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (149, 1, CAST(N'1985-12-02T00:00:00.000' AS DateTime), 26.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (150, 1, CAST(N'1986-01-01T00:00:00.000' AS DateTime), 22.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (151, 1, CAST(N'1986-02-03T00:00:00.000' AS DateTime), 17.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (152, 1, CAST(N'1986-03-03T00:00:00.000' AS DateTime), 13.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (153, 1, CAST(N'1986-04-01T00:00:00.000' AS DateTime), 12.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (154, 1, CAST(N'1986-05-01T00:00:00.000' AS DateTime), 14.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (155, 1, CAST(N'1986-06-02T00:00:00.000' AS DateTime), 11.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (156, 1, CAST(N'1986-07-01T00:00:00.000' AS DateTime), 9.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (157, 1, CAST(N'1986-08-01T00:00:00.000' AS DateTime), 13.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (158, 1, CAST(N'1986-09-01T00:00:00.000' AS DateTime), 14.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (159, 1, CAST(N'1986-10-01T00:00:00.000' AS DateTime), 13.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (160, 1, CAST(N'1986-11-03T00:00:00.000' AS DateTime), 14.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (161, 1, CAST(N'1986-12-01T00:00:00.000' AS DateTime), 15.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (162, 1, CAST(N'1987-01-01T00:00:00.000' AS DateTime), 18.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (163, 1, CAST(N'1987-02-02T00:00:00.000' AS DateTime), 17.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (164, 1, CAST(N'1987-03-02T00:00:00.000' AS DateTime), 17.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (165, 1, CAST(N'1987-04-01T00:00:00.000' AS DateTime), 18.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (166, 1, CAST(N'1987-05-01T00:00:00.000' AS DateTime), 18.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (167, 1, CAST(N'1987-06-01T00:00:00.000' AS DateTime), 18.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (168, 1, CAST(N'1987-07-01T00:00:00.000' AS DateTime), 20.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (169, 1, CAST(N'1987-08-03T00:00:00.000' AS DateTime), 18.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (170, 1, CAST(N'1987-09-01T00:00:00.000' AS DateTime), 18.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (171, 1, CAST(N'1987-10-01T00:00:00.000' AS DateTime), 18.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (172, 1, CAST(N'1987-11-02T00:00:00.000' AS DateTime), 17.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (173, 1, CAST(N'1987-12-01T00:00:00.000' AS DateTime), 17.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (174, 1, CAST(N'1988-01-01T00:00:00.000' AS DateTime), 16.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (175, 1, CAST(N'1988-02-01T00:00:00.000' AS DateTime), 14.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (176, 1, CAST(N'1988-03-01T00:00:00.000' AS DateTime), 15.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (177, 1, CAST(N'1988-04-01T00:00:00.000' AS DateTime), 16.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (178, 1, CAST(N'1988-05-02T00:00:00.000' AS DateTime), 16.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (179, 1, CAST(N'1988-06-01T00:00:00.000' AS DateTime), 14.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (180, 1, CAST(N'1988-07-01T00:00:00.000' AS DateTime), 15.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (181, 1, CAST(N'1988-08-01T00:00:00.000' AS DateTime), 14.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (182, 1, CAST(N'1988-09-01T00:00:00.000' AS DateTime), 12.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (183, 1, CAST(N'1988-10-03T00:00:00.000' AS DateTime), 12.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (184, 1, CAST(N'1988-11-01T00:00:00.000' AS DateTime), 14.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (185, 1, CAST(N'1988-12-01T00:00:00.000' AS DateTime), 15.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (186, 1, CAST(N'1989-01-02T00:00:00.000' AS DateTime), 15.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (187, 1, CAST(N'1989-02-01T00:00:00.000' AS DateTime), 16.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (188, 1, CAST(N'1989-03-01T00:00:00.000' AS DateTime), 19.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (189, 1, CAST(N'1989-04-03T00:00:00.000' AS DateTime), 18.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (190, 1, CAST(N'1989-05-01T00:00:00.000' AS DateTime), 17.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (191, 1, CAST(N'1989-06-01T00:00:00.000' AS DateTime), 17.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (192, 1, CAST(N'1989-07-03T00:00:00.000' AS DateTime), 16.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (193, 1, CAST(N'1989-08-01T00:00:00.000' AS DateTime), 17.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (194, 1, CAST(N'1989-09-01T00:00:00.000' AS DateTime), 18.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (195, 1, CAST(N'1989-10-02T00:00:00.000' AS DateTime), 18.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (196, 1, CAST(N'1989-11-01T00:00:00.000' AS DateTime), 18.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (197, 1, CAST(N'1989-12-01T00:00:00.000' AS DateTime), 20.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (198, 1, CAST(N'1990-01-01T00:00:00.000' AS DateTime), 20.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (199, 1, CAST(N'1990-02-01T00:00:00.000' AS DateTime), 19.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (200, 1, CAST(N'1990-03-01T00:00:00.000' AS DateTime), 18.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (201, 1, CAST(N'1990-04-02T00:00:00.000' AS DateTime), 17.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (202, 1, CAST(N'1990-05-01T00:00:00.000' AS DateTime), 16.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (203, 1, CAST(N'1990-06-01T00:00:00.000' AS DateTime), 16.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (204, 1, CAST(N'1990-07-02T00:00:00.000' AS DateTime), 19.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (205, 1, CAST(N'1990-08-01T00:00:00.000' AS DateTime), 26.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (206, 1, CAST(N'1990-09-03T00:00:00.000' AS DateTime), 39.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (207, 1, CAST(N'1990-10-01T00:00:00.000' AS DateTime), 34.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (208, 1, CAST(N'1990-11-01T00:00:00.000' AS DateTime), 29.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (209, 1, CAST(N'1990-12-03T00:00:00.000' AS DateTime), 28.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (210, 1, CAST(N'1991-01-01T00:00:00.000' AS DateTime), 20.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (211, 1, CAST(N'1991-02-01T00:00:00.000' AS DateTime), 18.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (212, 1, CAST(N'1991-03-01T00:00:00.000' AS DateTime), 18.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (213, 1, CAST(N'1991-04-01T00:00:00.000' AS DateTime), 19.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (214, 1, CAST(N'1991-05-01T00:00:00.000' AS DateTime), 19.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (215, 1, CAST(N'1991-06-03T00:00:00.000' AS DateTime), 18.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (216, 1, CAST(N'1991-07-01T00:00:00.000' AS DateTime), 19.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (217, 1, CAST(N'1991-08-01T00:00:00.000' AS DateTime), 20.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (218, 1, CAST(N'1991-09-02T00:00:00.000' AS DateTime), 21.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (219, 1, CAST(N'1991-10-01T00:00:00.000' AS DateTime), 22.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (220, 1, CAST(N'1991-11-04T00:00:00.000' AS DateTime), 20.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (221, 1, CAST(N'1991-12-02T00:00:00.000' AS DateTime), 17.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (222, 1, CAST(N'1992-01-01T00:00:00.000' AS DateTime), 18.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (223, 1, CAST(N'1992-02-03T00:00:00.000' AS DateTime), 17.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (224, 1, CAST(N'1992-03-02T00:00:00.000' AS DateTime), 18.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (225, 1, CAST(N'1992-04-01T00:00:00.000' AS DateTime), 19.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (226, 1, CAST(N'1992-05-01T00:00:00.000' AS DateTime), 20.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (227, 1, CAST(N'1992-06-01T00:00:00.000' AS DateTime), 20.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (228, 1, CAST(N'1992-07-01T00:00:00.000' AS DateTime), 20.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (229, 1, CAST(N'1992-08-03T00:00:00.000' AS DateTime), 19.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (230, 1, CAST(N'1992-09-01T00:00:00.000' AS DateTime), 20.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (231, 1, CAST(N'1992-10-01T00:00:00.000' AS DateTime), 19.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (232, 1, CAST(N'1992-11-02T00:00:00.000' AS DateTime), 18.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (233, 1, CAST(N'1992-12-01T00:00:00.000' AS DateTime), 18.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (234, 1, CAST(N'1993-01-01T00:00:00.000' AS DateTime), 18.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (235, 1, CAST(N'1993-02-01T00:00:00.000' AS DateTime), 18.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (236, 1, CAST(N'1993-03-01T00:00:00.000' AS DateTime), 18.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (237, 1, CAST(N'1993-04-01T00:00:00.000' AS DateTime), 19.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (238, 1, CAST(N'1993-05-03T00:00:00.000' AS DateTime), 18.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (239, 1, CAST(N'1993-06-01T00:00:00.000' AS DateTime), 17.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (240, 1, CAST(N'1993-07-01T00:00:00.000' AS DateTime), 16.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (241, 1, CAST(N'1993-08-02T00:00:00.000' AS DateTime), 17.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (242, 1, CAST(N'1993-09-01T00:00:00.000' AS DateTime), 17.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (243, 1, CAST(N'1993-10-01T00:00:00.000' AS DateTime), 15.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (244, 1, CAST(N'1993-11-01T00:00:00.000' AS DateTime), 14.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (245, 1, CAST(N'1993-12-01T00:00:00.000' AS DateTime), 13.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (246, 1, CAST(N'1994-01-03T00:00:00.000' AS DateTime), 14.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (247, 1, CAST(N'1994-02-01T00:00:00.000' AS DateTime), 13.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (248, 1, CAST(N'1994-03-01T00:00:00.000' AS DateTime), 13.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (249, 1, CAST(N'1994-04-01T00:00:00.000' AS DateTime), 15.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (250, 1, CAST(N'1994-05-02T00:00:00.000' AS DateTime), 16.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (251, 1, CAST(N'1994-06-01T00:00:00.000' AS DateTime), 17.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (252, 1, CAST(N'1994-07-01T00:00:00.000' AS DateTime), 18.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (253, 1, CAST(N'1994-08-01T00:00:00.000' AS DateTime), 16.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (254, 1, CAST(N'1994-09-01T00:00:00.000' AS DateTime), 17.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (255, 1, CAST(N'1994-10-03T00:00:00.000' AS DateTime), 16.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (256, 1, CAST(N'1994-11-01T00:00:00.000' AS DateTime), 17.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (257, 1, CAST(N'1994-12-01T00:00:00.000' AS DateTime), 16.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (258, 1, CAST(N'1995-01-02T00:00:00.000' AS DateTime), 16.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (259, 1, CAST(N'1995-02-01T00:00:00.000' AS DateTime), 16.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (260, 1, CAST(N'1995-03-01T00:00:00.000' AS DateTime), 17.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (261, 1, CAST(N'1995-04-03T00:00:00.000' AS DateTime), 19.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (262, 1, CAST(N'1995-05-01T00:00:00.000' AS DateTime), 17.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (263, 1, CAST(N'1995-06-01T00:00:00.000' AS DateTime), 16.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (264, 1, CAST(N'1995-07-03T00:00:00.000' AS DateTime), 16.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (265, 1, CAST(N'1995-08-01T00:00:00.000' AS DateTime), 16.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (266, 1, CAST(N'1995-09-01T00:00:00.000' AS DateTime), 16.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (267, 1, CAST(N'1995-10-02T00:00:00.000' AS DateTime), 16.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (268, 1, CAST(N'1995-11-01T00:00:00.000' AS DateTime), 17.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (269, 1, CAST(N'1995-12-01T00:00:00.000' AS DateTime), 18.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (270, 1, CAST(N'1996-01-01T00:00:00.000' AS DateTime), 16.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (271, 1, CAST(N'1996-02-01T00:00:00.000' AS DateTime), 17.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (272, 1, CAST(N'1996-03-01T00:00:00.000' AS DateTime), 19.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (273, 1, CAST(N'1996-04-01T00:00:00.000' AS DateTime), 19.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (274, 1, CAST(N'1996-05-01T00:00:00.000' AS DateTime), 17.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (275, 1, CAST(N'1996-06-03T00:00:00.000' AS DateTime), 18.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (276, 1, CAST(N'1996-07-01T00:00:00.000' AS DateTime), 18.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (277, 1, CAST(N'1996-08-01T00:00:00.000' AS DateTime), 20.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (278, 1, CAST(N'1996-09-02T00:00:00.000' AS DateTime), 23.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (279, 1, CAST(N'1996-10-01T00:00:00.000' AS DateTime), 22.6700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (280, 1, CAST(N'1996-11-01T00:00:00.000' AS DateTime), 22.7700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (281, 1, CAST(N'1996-12-02T00:00:00.000' AS DateTime), 23.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (282, 1, CAST(N'1997-01-01T00:00:00.000' AS DateTime), 22.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (283, 1, CAST(N'1997-02-03T00:00:00.000' AS DateTime), 18.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (284, 1, CAST(N'1997-03-03T00:00:00.000' AS DateTime), 18.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (285, 1, CAST(N'1997-04-01T00:00:00.000' AS DateTime), 18.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (286, 1, CAST(N'1997-05-01T00:00:00.000' AS DateTime), 19.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (287, 1, CAST(N'1997-06-02T00:00:00.000' AS DateTime), 18.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (288, 1, CAST(N'1997-07-01T00:00:00.000' AS DateTime), 18.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (289, 1, CAST(N'1997-08-01T00:00:00.000' AS DateTime), 18.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (290, 1, CAST(N'1997-09-01T00:00:00.000' AS DateTime), 19.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (291, 1, CAST(N'1997-10-01T00:00:00.000' AS DateTime), 20.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (292, 1, CAST(N'1997-11-03T00:00:00.000' AS DateTime), 18.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (293, 1, CAST(N'1997-12-01T00:00:00.000' AS DateTime), 16.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (294, 1, CAST(N'1998-01-01T00:00:00.000' AS DateTime), 15.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (295, 1, CAST(N'1998-02-02T00:00:00.000' AS DateTime), 14.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (296, 1, CAST(N'1998-03-02T00:00:00.000' AS DateTime), 14.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (297, 1, CAST(N'1998-04-01T00:00:00.000' AS DateTime), 14.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (298, 1, CAST(N'1998-05-01T00:00:00.000' AS DateTime), 14.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (299, 1, CAST(N'1998-06-01T00:00:00.000' AS DateTime), 13.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (300, 1, CAST(N'1998-07-01T00:00:00.000' AS DateTime), 13.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (301, 1, CAST(N'1998-08-03T00:00:00.000' AS DateTime), 12.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (302, 1, CAST(N'1998-09-01T00:00:00.000' AS DateTime), 14.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (303, 1, CAST(N'1998-10-01T00:00:00.000' AS DateTime), 13.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (304, 1, CAST(N'1998-11-02T00:00:00.000' AS DateTime), 10.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (305, 1, CAST(N'1998-12-01T00:00:00.000' AS DateTime), 10.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (306, 1, CAST(N'1999-01-01T00:00:00.000' AS DateTime), 11.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (307, 1, CAST(N'1999-02-01T00:00:00.000' AS DateTime), 10.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (308, 1, CAST(N'1999-03-01T00:00:00.000' AS DateTime), 15.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (309, 1, CAST(N'1999-04-01T00:00:00.000' AS DateTime), 16.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (310, 1, CAST(N'1999-05-03T00:00:00.000' AS DateTime), 14.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (311, 1, CAST(N'1999-06-01T00:00:00.000' AS DateTime), 17.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (312, 1, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 19.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (313, 1, CAST(N'1999-08-02T00:00:00.000' AS DateTime), 21.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (314, 1, CAST(N'1999-09-01T00:00:00.000' AS DateTime), 23.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (315, 1, CAST(N'1999-10-01T00:00:00.000' AS DateTime), 21.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (316, 1, CAST(N'1999-11-01T00:00:00.000' AS DateTime), 23.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (317, 1, CAST(N'1999-12-01T00:00:00.000' AS DateTime), 25.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (318, 1, CAST(N'2000-01-03T00:00:00.000' AS DateTime), 25.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (319, 1, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 28.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (320, 1, CAST(N'2000-03-01T00:00:00.000' AS DateTime), 24.7700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (321, 1, CAST(N'2000-04-03T00:00:00.000' AS DateTime), 23.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (322, 1, CAST(N'2000-05-01T00:00:00.000' AS DateTime), 28.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (323, 1, CAST(N'2000-06-01T00:00:00.000' AS DateTime), 30.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (324, 1, CAST(N'2000-07-03T00:00:00.000' AS DateTime), 26.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (325, 1, CAST(N'2000-08-01T00:00:00.000' AS DateTime), 31.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (326, 1, CAST(N'2000-09-01T00:00:00.000' AS DateTime), 29.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (327, 1, CAST(N'2000-10-02T00:00:00.000' AS DateTime), 30.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (328, 1, CAST(N'2000-11-01T00:00:00.000' AS DateTime), 31.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (329, 1, CAST(N'2000-12-01T00:00:00.000' AS DateTime), 23.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (330, 1, CAST(N'2001-01-01T00:00:00.000' AS DateTime), 26.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (331, 1, CAST(N'2001-02-01T00:00:00.000' AS DateTime), 25.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (332, 1, CAST(N'2001-03-01T00:00:00.000' AS DateTime), 24.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (333, 1, CAST(N'2001-04-02T00:00:00.000' AS DateTime), 27.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (334, 1, CAST(N'2001-05-01T00:00:00.000' AS DateTime), 29.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (335, 1, CAST(N'2001-06-01T00:00:00.000' AS DateTime), 26.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (336, 1, CAST(N'2001-07-02T00:00:00.000' AS DateTime), 24.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (337, 1, CAST(N'2001-08-01T00:00:00.000' AS DateTime), 26.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (338, 1, CAST(N'2001-09-03T00:00:00.000' AS DateTime), 23.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (339, 1, CAST(N'2001-10-01T00:00:00.000' AS DateTime), 20.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (340, 1, CAST(N'2001-11-01T00:00:00.000' AS DateTime), 19.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (341, 1, CAST(N'2001-12-03T00:00:00.000' AS DateTime), 19.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (342, 1, CAST(N'2002-01-01T00:00:00.000' AS DateTime), 19.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (343, 1, CAST(N'2002-02-01T00:00:00.000' AS DateTime), 21.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (344, 1, CAST(N'2002-03-01T00:00:00.000' AS DateTime), 25.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (345, 1, CAST(N'2002-04-01T00:00:00.000' AS DateTime), 26.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (346, 1, CAST(N'2002-05-01T00:00:00.000' AS DateTime), 24.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (347, 1, CAST(N'2002-06-03T00:00:00.000' AS DateTime), 25.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (348, 1, CAST(N'2002-07-01T00:00:00.000' AS DateTime), 25.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (349, 1, CAST(N'2002-08-01T00:00:00.000' AS DateTime), 27.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (350, 1, CAST(N'2002-09-02T00:00:00.000' AS DateTime), 28.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (351, 1, CAST(N'2002-10-01T00:00:00.000' AS DateTime), 25.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (352, 1, CAST(N'2002-11-01T00:00:00.000' AS DateTime), 25.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (353, 1, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 28.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (354, 1, CAST(N'2003-01-01T00:00:00.000' AS DateTime), 31.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (355, 1, CAST(N'2003-02-03T00:00:00.000' AS DateTime), 32.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (356, 1, CAST(N'2003-03-03T00:00:00.000' AS DateTime), 27.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (357, 1, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 23.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (358, 1, CAST(N'2003-05-01T00:00:00.000' AS DateTime), 26.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (359, 1, CAST(N'2003-06-02T00:00:00.000' AS DateTime), 28.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (360, 1, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 28.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (361, 1, CAST(N'2003-08-01T00:00:00.000' AS DateTime), 29.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (362, 1, CAST(N'2003-09-01T00:00:00.000' AS DateTime), 27.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (363, 1, CAST(N'2003-10-01T00:00:00.000' AS DateTime), 27.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (364, 1, CAST(N'2003-11-03T00:00:00.000' AS DateTime), 28.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (365, 1, CAST(N'2003-12-01T00:00:00.000' AS DateTime), 30.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (366, 1, CAST(N'2004-01-01T00:00:00.000' AS DateTime), 29.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (367, 1, CAST(N'2004-02-02T00:00:00.000' AS DateTime), 32.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (368, 1, CAST(N'2004-03-01T00:00:00.000' AS DateTime), 31.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (369, 1, CAST(N'2004-04-01T00:00:00.000' AS DateTime), 34.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (370, 1, CAST(N'2004-05-03T00:00:00.000' AS DateTime), 37.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (371, 1, CAST(N'2004-06-01T00:00:00.000' AS DateTime), 34.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (372, 1, CAST(N'2004-07-01T00:00:00.000' AS DateTime), 40.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (373, 1, CAST(N'2004-08-02T00:00:00.000' AS DateTime), 39.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (374, 1, CAST(N'2004-09-01T00:00:00.000' AS DateTime), 46.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (375, 1, CAST(N'2004-10-01T00:00:00.000' AS DateTime), 48.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (376, 1, CAST(N'2004-11-01T00:00:00.000' AS DateTime), 45.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (377, 1, CAST(N'2004-12-01T00:00:00.000' AS DateTime), 40.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (378, 1, CAST(N'2005-01-03T00:00:00.000' AS DateTime), 45.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (379, 1, CAST(N'2005-02-01T00:00:00.000' AS DateTime), 50.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (380, 1, CAST(N'2005-03-01T00:00:00.000' AS DateTime), 54.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (381, 1, CAST(N'2005-04-01T00:00:00.000' AS DateTime), 51.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (382, 1, CAST(N'2005-05-02T00:00:00.000' AS DateTime), 50.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (383, 1, CAST(N'2005-06-01T00:00:00.000' AS DateTime), 55.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (384, 1, CAST(N'2005-07-01T00:00:00.000' AS DateTime), 59.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (385, 1, CAST(N'2005-08-01T00:00:00.000' AS DateTime), 67.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (386, 1, CAST(N'2005-09-01T00:00:00.000' AS DateTime), 63.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (387, 1, CAST(N'2005-10-03T00:00:00.000' AS DateTime), 58.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (388, 1, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 55.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (389, 1, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 58.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (390, 1, CAST(N'2006-01-02T00:00:00.000' AS DateTime), 65.9900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (391, 1, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 61.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (392, 1, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 65.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (393, 1, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 72.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (394, 1, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 70.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (395, 1, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 73.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (396, 1, CAST(N'2006-07-03T00:00:00.000' AS DateTime), 75.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (397, 1, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 70.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (398, 1, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 62.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (399, 1, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 59.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (400, 1, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 64.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (401, 1, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 60.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (402, 1, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 57.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (403, 1, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 61.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (404, 1, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 68.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (405, 1, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 67.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (406, 1, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 68.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (407, 1, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 71.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (408, 1, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 77.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (409, 1, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 72.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (410, 1, CAST(N'2007-09-03T00:00:00.000' AS DateTime), 79.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (411, 1, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 90.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (412, 1, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 88.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (413, 1, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 93.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (414, 1, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 92.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (415, 1, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 100.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (416, 1, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 100.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (417, 1, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 111.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (418, 1, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 127.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (419, 1, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 139.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (420, 1, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 123.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (421, 1, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 114.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (422, 1, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 98.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (423, 1, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 65.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (424, 1, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 53.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (425, 1, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 45.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (426, 1, CAST(N'2009-01-02T00:00:00.000' AS DateTime), 45.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (427, 1, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 46.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (428, 1, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 49.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (429, 1, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 50.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (430, 1, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 65.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (431, 1, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 69.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (432, 1, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 71.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (433, 1, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 69.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (434, 1, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 69.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (435, 1, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 75.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (436, 1, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 78.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (437, 1, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 77.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (438, 1, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 71.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (439, 1, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 77.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (440, 1, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 82.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (441, 1, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 87.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (442, 1, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 74.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (443, 1, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 75.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (444, 1, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 78.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (445, 1, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 74.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (446, 1, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 82.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (447, 1, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 83.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (448, 1, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 85.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (449, 1, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 94.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (450, 1, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 101.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (451, 1, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 111.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (452, 1, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 117.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (453, 1, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 125.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (454, 1, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 116.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (455, 1, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 112.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (456, 1, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 116.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (457, 1, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 114.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (458, 1, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 102.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (459, 1, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 109.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (460, 1, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 110.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (461, 1, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 107.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (462, 1, CAST(N'2012-01-02T00:00:00.000' AS DateTime), 110.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (463, 1, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 122.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (464, 1, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 122.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (465, 1, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 119.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (466, 1, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 101.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (467, 1, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 97.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (468, 1, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 104.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (469, 1, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 114.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (470, 1, CAST(N'2012-09-03T00:00:00.000' AS DateTime), 112.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (471, 1, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 108.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (472, 1, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 111.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (473, 1, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 111.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (474, 1, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 115.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (475, 1, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 111.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (476, 1, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 109.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (477, 1, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 102.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (478, 1, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 100.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (479, 1, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 102.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (480, 1, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 107.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (481, 1, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 114.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (482, 1, CAST(N'2013-09-02T00:00:00.000' AS DateTime), 108.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (483, 1, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 108.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (484, 1, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 109.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (485, 1, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 110.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (486, 1, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 106.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (487, 1, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 109.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (488, 1, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 107.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (489, 1, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 108.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (490, 1, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 109.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (491, 1, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 112.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (492, 1, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 106.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (493, 1, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 103.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (494, 1, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 94.6700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (495, 1, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 85.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (496, 1, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 70.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (497, 1, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 57.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (498, 1, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 52.9900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (499, 1, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 62.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (500, 1, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 55.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (501, 1, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 66.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (502, 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 65.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (503, 1, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 63.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (504, 1, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 52.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (505, 1, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 54.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (506, 1, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 48.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (507, 1, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 49.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (508, 1, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 44.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (509, 1, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 37.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (510, 1, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 34.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (511, 1, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 35.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (512, 1, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 39.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (513, 1, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 48.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (514, 1, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 49.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (515, 1, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 49.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (516, 1, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 42.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (517, 1, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 47.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (518, 1, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 49.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (519, 1, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 48.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (520, 1, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 50.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (521, 1, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 56.8200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (522, 1, CAST(N'2017-01-02T00:00:00.000' AS DateTime), 55.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (523, 1, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 55.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (524, 1, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 52.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (525, 1, CAST(N'2017-04-02T00:00:00.000' AS DateTime), 51.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (526, 1, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 50.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (527, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 47.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (528, 1, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 52.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (529, 1, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 52.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (530, 1, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 57.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (531, 1, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 61.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (532, 1, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 63.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (533, 1, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 66.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (534, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 69.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (535, 1, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 65.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (536, 1, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 69.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (537, 1, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 75.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (538, 1, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 77.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (539, 1, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 79.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (540, 1, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 74.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (541, 1, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 77.3296)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (542, 1, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 82.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (543, 1, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 75.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (544, 1, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 58.7100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (545, 1, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 53.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (546, 1, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 61.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (547, 1, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 66.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (548, 1, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 68.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (549, 1, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 72.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (550, 1, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 61.9900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (551, 1, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 66.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (552, 1, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 65.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (553, 1, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 60.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (554, 1, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 60.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (555, 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 60.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (556, 1, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 60.5608)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (557, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 66.2279)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (558, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 56.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (559, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 50.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (560, 1, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 22.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (561, 1, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 25.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (562, 1, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 37.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (563, 1, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 41.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (564, 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 43.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (565, 1, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 45.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (566, 1, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 40.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (567, 1, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 37.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (568, 1, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 47.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (569, 1, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 51.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (570, 1, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 55.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (571, 1, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 64.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (572, 1, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 62.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (573, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 66.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (574, 1, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 69.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (575, 1, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 74.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (576, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 75.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (577, 1, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 71.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (578, 1, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 78.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (579, 1, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 83.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (580, 1, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 68.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (581, 1, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 77.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (582, 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 89.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (583, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 95.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (584, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 102.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (585, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 105.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (586, 1, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 112.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (587, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 109.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (588, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 111.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (589, 2, CAST(N'1983-03-30T00:00:00.000' AS DateTime), 29.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (590, 2, CAST(N'1983-04-04T00:00:00.000' AS DateTime), 30.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (591, 2, CAST(N'1983-05-02T00:00:00.000' AS DateTime), 30.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (592, 2, CAST(N'1983-06-01T00:00:00.000' AS DateTime), 31.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (593, 2, CAST(N'1983-07-01T00:00:00.000' AS DateTime), 32.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (594, 2, CAST(N'1983-08-01T00:00:00.000' AS DateTime), 31.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (595, 2, CAST(N'1983-09-01T00:00:00.000' AS DateTime), 30.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (596, 2, CAST(N'1983-10-03T00:00:00.000' AS DateTime), 30.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (597, 2, CAST(N'1983-11-01T00:00:00.000' AS DateTime), 29.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (598, 2, CAST(N'1983-12-01T00:00:00.000' AS DateTime), 29.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (599, 2, CAST(N'1984-01-03T00:00:00.000' AS DateTime), 29.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (600, 2, CAST(N'1984-02-01T00:00:00.000' AS DateTime), 30.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (601, 2, CAST(N'1984-03-01T00:00:00.000' AS DateTime), 30.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (602, 2, CAST(N'1984-04-02T00:00:00.000' AS DateTime), 30.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (603, 2, CAST(N'1984-05-01T00:00:00.000' AS DateTime), 30.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (604, 2, CAST(N'1984-06-01T00:00:00.000' AS DateTime), 29.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (605, 2, CAST(N'1984-07-02T00:00:00.000' AS DateTime), 27.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (606, 2, CAST(N'1984-08-01T00:00:00.000' AS DateTime), 29.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (607, 2, CAST(N'1984-09-04T00:00:00.000' AS DateTime), 29.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (608, 2, CAST(N'1984-10-01T00:00:00.000' AS DateTime), 28.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (609, 2, CAST(N'1984-11-01T00:00:00.000' AS DateTime), 27.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (610, 2, CAST(N'1984-12-03T00:00:00.000' AS DateTime), 26.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (611, 2, CAST(N'1985-01-02T00:00:00.000' AS DateTime), 26.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (612, 2, CAST(N'1985-02-01T00:00:00.000' AS DateTime), 26.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (613, 2, CAST(N'1985-03-01T00:00:00.000' AS DateTime), 28.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (614, 2, CAST(N'1985-04-01T00:00:00.000' AS DateTime), 27.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (615, 2, CAST(N'1985-05-01T00:00:00.000' AS DateTime), 27.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (616, 2, CAST(N'1985-06-03T00:00:00.000' AS DateTime), 26.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (617, 2, CAST(N'1985-07-01T00:00:00.000' AS DateTime), 27.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (618, 2, CAST(N'1985-08-01T00:00:00.000' AS DateTime), 28.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (619, 2, CAST(N'1985-09-03T00:00:00.000' AS DateTime), 29.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (620, 2, CAST(N'1985-10-01T00:00:00.000' AS DateTime), 30.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (621, 2, CAST(N'1985-11-01T00:00:00.000' AS DateTime), 29.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (622, 2, CAST(N'1985-12-02T00:00:00.000' AS DateTime), 26.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (623, 2, CAST(N'1986-01-02T00:00:00.000' AS DateTime), 18.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (624, 2, CAST(N'1986-02-03T00:00:00.000' AS DateTime), 13.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (625, 2, CAST(N'1986-03-03T00:00:00.000' AS DateTime), 10.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (626, 2, CAST(N'1986-04-01T00:00:00.000' AS DateTime), 13.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (627, 2, CAST(N'1986-05-01T00:00:00.000' AS DateTime), 14.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (628, 2, CAST(N'1986-06-02T00:00:00.000' AS DateTime), 12.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (629, 2, CAST(N'1986-07-01T00:00:00.000' AS DateTime), 11.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (630, 2, CAST(N'1986-08-01T00:00:00.000' AS DateTime), 15.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (631, 2, CAST(N'1986-09-02T00:00:00.000' AS DateTime), 14.7700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (632, 2, CAST(N'1986-10-01T00:00:00.000' AS DateTime), 15.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (633, 2, CAST(N'1986-11-03T00:00:00.000' AS DateTime), 15.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (634, 2, CAST(N'1986-12-01T00:00:00.000' AS DateTime), 17.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (635, 2, CAST(N'1987-01-02T00:00:00.000' AS DateTime), 18.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (636, 2, CAST(N'1987-02-02T00:00:00.000' AS DateTime), 16.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (637, 2, CAST(N'1987-03-02T00:00:00.000' AS DateTime), 18.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (638, 2, CAST(N'1987-04-01T00:00:00.000' AS DateTime), 18.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (639, 2, CAST(N'1987-05-01T00:00:00.000' AS DateTime), 19.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (640, 2, CAST(N'1987-06-01T00:00:00.000' AS DateTime), 20.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (641, 2, CAST(N'1987-07-01T00:00:00.000' AS DateTime), 21.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (642, 2, CAST(N'1987-08-03T00:00:00.000' AS DateTime), 19.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (643, 2, CAST(N'1987-09-01T00:00:00.000' AS DateTime), 19.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (644, 2, CAST(N'1987-10-01T00:00:00.000' AS DateTime), 19.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (645, 2, CAST(N'1987-11-02T00:00:00.000' AS DateTime), 18.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (646, 2, CAST(N'1987-12-01T00:00:00.000' AS DateTime), 16.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (647, 2, CAST(N'1988-01-04T00:00:00.000' AS DateTime), 16.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (648, 2, CAST(N'1988-02-01T00:00:00.000' AS DateTime), 16.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (649, 2, CAST(N'1988-03-01T00:00:00.000' AS DateTime), 17.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (650, 2, CAST(N'1988-04-04T00:00:00.000' AS DateTime), 17.9900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (651, 2, CAST(N'1988-05-02T00:00:00.000' AS DateTime), 17.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (652, 2, CAST(N'1988-06-01T00:00:00.000' AS DateTime), 15.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (653, 2, CAST(N'1988-07-01T00:00:00.000' AS DateTime), 16.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (654, 2, CAST(N'1988-08-01T00:00:00.000' AS DateTime), 15.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (655, 2, CAST(N'1988-09-01T00:00:00.000' AS DateTime), 13.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (656, 2, CAST(N'1988-10-03T00:00:00.000' AS DateTime), 13.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (657, 2, CAST(N'1988-11-01T00:00:00.000' AS DateTime), 15.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (658, 2, CAST(N'1988-12-01T00:00:00.000' AS DateTime), 17.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (659, 2, CAST(N'1989-01-03T00:00:00.000' AS DateTime), 17.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (660, 2, CAST(N'1989-02-01T00:00:00.000' AS DateTime), 18.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (661, 2, CAST(N'1989-03-01T00:00:00.000' AS DateTime), 20.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (662, 2, CAST(N'1989-04-03T00:00:00.000' AS DateTime), 20.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (663, 2, CAST(N'1989-05-01T00:00:00.000' AS DateTime), 19.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (664, 2, CAST(N'1989-06-01T00:00:00.000' AS DateTime), 20.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (665, 2, CAST(N'1989-07-05T00:00:00.000' AS DateTime), 18.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (666, 2, CAST(N'1989-08-01T00:00:00.000' AS DateTime), 18.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (667, 2, CAST(N'1989-09-01T00:00:00.000' AS DateTime), 20.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (668, 2, CAST(N'1989-10-02T00:00:00.000' AS DateTime), 19.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (669, 2, CAST(N'1989-11-01T00:00:00.000' AS DateTime), 19.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (670, 2, CAST(N'1989-12-01T00:00:00.000' AS DateTime), 21.8200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (671, 2, CAST(N'1990-01-02T00:00:00.000' AS DateTime), 22.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (672, 2, CAST(N'1990-02-01T00:00:00.000' AS DateTime), 21.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (673, 2, CAST(N'1990-03-01T00:00:00.000' AS DateTime), 20.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (674, 2, CAST(N'1990-04-02T00:00:00.000' AS DateTime), 18.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (675, 2, CAST(N'1990-05-01T00:00:00.000' AS DateTime), 17.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (676, 2, CAST(N'1990-06-01T00:00:00.000' AS DateTime), 17.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (677, 2, CAST(N'1990-07-02T00:00:00.000' AS DateTime), 20.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (678, 2, CAST(N'1990-08-01T00:00:00.000' AS DateTime), 27.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (679, 2, CAST(N'1990-09-04T00:00:00.000' AS DateTime), 39.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (680, 2, CAST(N'1990-10-01T00:00:00.000' AS DateTime), 35.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (681, 2, CAST(N'1990-11-01T00:00:00.000' AS DateTime), 28.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (682, 2, CAST(N'1990-12-03T00:00:00.000' AS DateTime), 28.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (683, 2, CAST(N'1991-01-02T00:00:00.000' AS DateTime), 21.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (684, 2, CAST(N'1991-02-01T00:00:00.000' AS DateTime), 19.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (685, 2, CAST(N'1991-03-01T00:00:00.000' AS DateTime), 19.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (686, 2, CAST(N'1991-04-01T00:00:00.000' AS DateTime), 20.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (687, 2, CAST(N'1991-05-01T00:00:00.000' AS DateTime), 21.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (688, 2, CAST(N'1991-06-03T00:00:00.000' AS DateTime), 20.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (689, 2, CAST(N'1991-07-01T00:00:00.000' AS DateTime), 21.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (690, 2, CAST(N'1991-08-01T00:00:00.000' AS DateTime), 22.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (691, 2, CAST(N'1991-09-03T00:00:00.000' AS DateTime), 22.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (692, 2, CAST(N'1991-10-01T00:00:00.000' AS DateTime), 23.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (693, 2, CAST(N'1991-11-01T00:00:00.000' AS DateTime), 21.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (694, 2, CAST(N'1991-12-02T00:00:00.000' AS DateTime), 19.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (695, 2, CAST(N'1992-01-02T00:00:00.000' AS DateTime), 18.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (696, 2, CAST(N'1992-02-03T00:00:00.000' AS DateTime), 18.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (697, 2, CAST(N'1992-03-02T00:00:00.000' AS DateTime), 19.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (698, 2, CAST(N'1992-04-01T00:00:00.000' AS DateTime), 20.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (699, 2, CAST(N'1992-05-01T00:00:00.000' AS DateTime), 22.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (700, 2, CAST(N'1992-06-01T00:00:00.000' AS DateTime), 21.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (701, 2, CAST(N'1992-07-01T00:00:00.000' AS DateTime), 21.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (702, 2, CAST(N'1992-08-03T00:00:00.000' AS DateTime), 21.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (703, 2, CAST(N'1992-09-01T00:00:00.000' AS DateTime), 21.7100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (704, 2, CAST(N'1992-10-01T00:00:00.000' AS DateTime), 20.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (705, 2, CAST(N'1992-11-02T00:00:00.000' AS DateTime), 19.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (706, 2, CAST(N'1992-12-01T00:00:00.000' AS DateTime), 19.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (707, 2, CAST(N'1993-01-04T00:00:00.000' AS DateTime), 20.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (708, 2, CAST(N'1993-02-01T00:00:00.000' AS DateTime), 20.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (709, 2, CAST(N'1993-03-02T00:00:00.000' AS DateTime), 20.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (710, 2, CAST(N'1993-04-01T00:00:00.000' AS DateTime), 20.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (711, 2, CAST(N'1993-05-03T00:00:00.000' AS DateTime), 20.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (712, 2, CAST(N'1993-06-01T00:00:00.000' AS DateTime), 18.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (713, 2, CAST(N'1993-07-01T00:00:00.000' AS DateTime), 17.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (714, 2, CAST(N'1993-08-03T00:00:00.000' AS DateTime), 18.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (715, 2, CAST(N'1993-09-01T00:00:00.000' AS DateTime), 18.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (716, 2, CAST(N'1993-10-01T00:00:00.000' AS DateTime), 16.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (717, 2, CAST(N'1993-11-01T00:00:00.000' AS DateTime), 15.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (718, 2, CAST(N'1993-12-01T00:00:00.000' AS DateTime), 14.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (719, 2, CAST(N'1994-01-04T00:00:00.000' AS DateTime), 15.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (720, 2, CAST(N'1994-02-01T00:00:00.000' AS DateTime), 14.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (721, 2, CAST(N'1994-03-01T00:00:00.000' AS DateTime), 14.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (722, 2, CAST(N'1994-04-04T00:00:00.000' AS DateTime), 16.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (723, 2, CAST(N'1994-05-03T00:00:00.000' AS DateTime), 18.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (724, 2, CAST(N'1994-06-01T00:00:00.000' AS DateTime), 19.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (725, 2, CAST(N'1994-07-01T00:00:00.000' AS DateTime), 19.7700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (726, 2, CAST(N'1994-08-01T00:00:00.000' AS DateTime), 17.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (727, 2, CAST(N'1994-09-01T00:00:00.000' AS DateTime), 18.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (728, 2, CAST(N'1994-10-03T00:00:00.000' AS DateTime), 18.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (729, 2, CAST(N'1994-11-01T00:00:00.000' AS DateTime), 18.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (730, 2, CAST(N'1994-12-01T00:00:00.000' AS DateTime), 17.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (731, 2, CAST(N'1995-01-03T00:00:00.000' AS DateTime), 18.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (732, 2, CAST(N'1995-02-01T00:00:00.000' AS DateTime), 18.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (733, 2, CAST(N'1995-03-01T00:00:00.000' AS DateTime), 19.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (734, 2, CAST(N'1995-04-03T00:00:00.000' AS DateTime), 20.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (735, 2, CAST(N'1995-05-01T00:00:00.000' AS DateTime), 18.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (736, 2, CAST(N'1995-06-01T00:00:00.000' AS DateTime), 17.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (737, 2, CAST(N'1995-07-05T00:00:00.000' AS DateTime), 17.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (738, 2, CAST(N'1995-08-01T00:00:00.000' AS DateTime), 17.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (739, 2, CAST(N'1995-09-01T00:00:00.000' AS DateTime), 17.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (740, 2, CAST(N'1995-10-02T00:00:00.000' AS DateTime), 17.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (741, 2, CAST(N'1995-11-01T00:00:00.000' AS DateTime), 18.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (742, 2, CAST(N'1995-12-01T00:00:00.000' AS DateTime), 19.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (743, 2, CAST(N'1996-01-02T00:00:00.000' AS DateTime), 17.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (744, 2, CAST(N'1996-02-01T00:00:00.000' AS DateTime), 19.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (745, 2, CAST(N'1996-03-01T00:00:00.000' AS DateTime), 21.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (746, 2, CAST(N'1996-04-01T00:00:00.000' AS DateTime), 21.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (747, 2, CAST(N'1996-05-01T00:00:00.000' AS DateTime), 19.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (748, 2, CAST(N'1996-06-03T00:00:00.000' AS DateTime), 20.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (749, 2, CAST(N'1996-07-01T00:00:00.000' AS DateTime), 20.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (750, 2, CAST(N'1996-08-01T00:00:00.000' AS DateTime), 22.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (751, 2, CAST(N'1996-09-03T00:00:00.000' AS DateTime), 24.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (752, 2, CAST(N'1996-10-01T00:00:00.000' AS DateTime), 23.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (753, 2, CAST(N'1996-11-01T00:00:00.000' AS DateTime), 23.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (754, 2, CAST(N'1996-12-02T00:00:00.000' AS DateTime), 25.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (755, 2, CAST(N'1997-01-02T00:00:00.000' AS DateTime), 24.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (756, 2, CAST(N'1997-02-03T00:00:00.000' AS DateTime), 20.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (757, 2, CAST(N'1997-03-03T00:00:00.000' AS DateTime), 20.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (758, 2, CAST(N'1997-04-01T00:00:00.000' AS DateTime), 20.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (759, 2, CAST(N'1997-05-01T00:00:00.000' AS DateTime), 20.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (760, 2, CAST(N'1997-06-02T00:00:00.000' AS DateTime), 19.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (761, 2, CAST(N'1997-07-01T00:00:00.000' AS DateTime), 20.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (762, 2, CAST(N'1997-08-01T00:00:00.000' AS DateTime), 19.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (763, 2, CAST(N'1997-09-02T00:00:00.000' AS DateTime), 21.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (764, 2, CAST(N'1997-10-01T00:00:00.000' AS DateTime), 21.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (765, 2, CAST(N'1997-11-03T00:00:00.000' AS DateTime), 19.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (766, 2, CAST(N'1997-12-01T00:00:00.000' AS DateTime), 17.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (767, 2, CAST(N'1998-01-02T00:00:00.000' AS DateTime), 17.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (768, 2, CAST(N'1998-02-02T00:00:00.000' AS DateTime), 15.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (769, 2, CAST(N'1998-03-02T00:00:00.000' AS DateTime), 15.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (770, 2, CAST(N'1998-04-01T00:00:00.000' AS DateTime), 15.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (771, 2, CAST(N'1998-05-01T00:00:00.000' AS DateTime), 15.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (772, 2, CAST(N'1998-06-01T00:00:00.000' AS DateTime), 14.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (773, 2, CAST(N'1998-07-01T00:00:00.000' AS DateTime), 14.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (774, 2, CAST(N'1998-08-03T00:00:00.000' AS DateTime), 13.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (775, 2, CAST(N'1998-09-01T00:00:00.000' AS DateTime), 16.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (776, 2, CAST(N'1998-10-01T00:00:00.000' AS DateTime), 14.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (777, 2, CAST(N'1998-11-02T00:00:00.000' AS DateTime), 11.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (778, 2, CAST(N'1998-12-01T00:00:00.000' AS DateTime), 12.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (779, 2, CAST(N'1999-01-04T00:00:00.000' AS DateTime), 12.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (780, 2, CAST(N'1999-02-01T00:00:00.000' AS DateTime), 12.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (781, 2, CAST(N'1999-03-01T00:00:00.000' AS DateTime), 16.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (782, 2, CAST(N'1999-04-01T00:00:00.000' AS DateTime), 18.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (783, 2, CAST(N'1999-05-03T00:00:00.000' AS DateTime), 16.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (784, 2, CAST(N'1999-06-01T00:00:00.000' AS DateTime), 19.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (785, 2, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 20.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (786, 2, CAST(N'1999-08-02T00:00:00.000' AS DateTime), 22.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (787, 2, CAST(N'1999-09-01T00:00:00.000' AS DateTime), 24.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (788, 2, CAST(N'1999-10-01T00:00:00.000' AS DateTime), 21.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (789, 2, CAST(N'1999-11-01T00:00:00.000' AS DateTime), 24.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (790, 2, CAST(N'1999-12-01T00:00:00.000' AS DateTime), 25.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (791, 2, CAST(N'2000-01-04T00:00:00.000' AS DateTime), 27.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (792, 2, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 30.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (793, 2, CAST(N'2000-03-01T00:00:00.000' AS DateTime), 26.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (794, 2, CAST(N'2000-04-03T00:00:00.000' AS DateTime), 25.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (795, 2, CAST(N'2000-05-01T00:00:00.000' AS DateTime), 29.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (796, 2, CAST(N'2000-06-01T00:00:00.000' AS DateTime), 32.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (797, 2, CAST(N'2000-07-05T00:00:00.000' AS DateTime), 27.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (798, 2, CAST(N'2000-08-01T00:00:00.000' AS DateTime), 33.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (799, 2, CAST(N'2000-09-01T00:00:00.000' AS DateTime), 30.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (800, 2, CAST(N'2000-10-02T00:00:00.000' AS DateTime), 32.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (801, 2, CAST(N'2000-11-01T00:00:00.000' AS DateTime), 33.8200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (802, 2, CAST(N'2000-12-01T00:00:00.000' AS DateTime), 26.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (803, 2, CAST(N'2001-01-02T00:00:00.000' AS DateTime), 28.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (804, 2, CAST(N'2001-02-01T00:00:00.000' AS DateTime), 27.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (805, 2, CAST(N'2001-03-01T00:00:00.000' AS DateTime), 26.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (806, 2, CAST(N'2001-04-02T00:00:00.000' AS DateTime), 28.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (807, 2, CAST(N'2001-05-01T00:00:00.000' AS DateTime), 28.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (808, 2, CAST(N'2001-06-01T00:00:00.000' AS DateTime), 26.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (809, 2, CAST(N'2001-07-02T00:00:00.000' AS DateTime), 26.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (810, 2, CAST(N'2001-08-01T00:00:00.000' AS DateTime), 27.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (811, 2, CAST(N'2001-09-04T00:00:00.000' AS DateTime), 23.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (812, 2, CAST(N'2001-10-01T00:00:00.000' AS DateTime), 21.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (813, 2, CAST(N'2001-11-01T00:00:00.000' AS DateTime), 19.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (814, 2, CAST(N'2001-12-03T00:00:00.000' AS DateTime), 19.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (815, 2, CAST(N'2002-01-02T00:00:00.000' AS DateTime), 19.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (816, 2, CAST(N'2002-02-01T00:00:00.000' AS DateTime), 21.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (817, 2, CAST(N'2002-03-01T00:00:00.000' AS DateTime), 26.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (818, 2, CAST(N'2002-04-01T00:00:00.000' AS DateTime), 27.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (819, 2, CAST(N'2002-05-01T00:00:00.000' AS DateTime), 25.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (820, 2, CAST(N'2002-06-03T00:00:00.000' AS DateTime), 26.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (821, 2, CAST(N'2002-07-01T00:00:00.000' AS DateTime), 27.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (822, 2, CAST(N'2002-08-01T00:00:00.000' AS DateTime), 28.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (823, 2, CAST(N'2002-09-03T00:00:00.000' AS DateTime), 30.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (824, 2, CAST(N'2002-10-01T00:00:00.000' AS DateTime), 27.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (825, 2, CAST(N'2002-11-01T00:00:00.000' AS DateTime), 26.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (826, 2, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 31.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (827, 2, CAST(N'2003-01-02T00:00:00.000' AS DateTime), 33.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (828, 2, CAST(N'2003-02-03T00:00:00.000' AS DateTime), 36.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (829, 2, CAST(N'2003-03-03T00:00:00.000' AS DateTime), 31.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (830, 2, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 25.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (831, 2, CAST(N'2003-05-01T00:00:00.000' AS DateTime), 29.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (832, 2, CAST(N'2003-06-02T00:00:00.000' AS DateTime), 30.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (833, 2, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 30.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (834, 2, CAST(N'2003-08-01T00:00:00.000' AS DateTime), 31.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (835, 2, CAST(N'2003-09-02T00:00:00.000' AS DateTime), 29.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (836, 2, CAST(N'2003-10-01T00:00:00.000' AS DateTime), 29.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (837, 2, CAST(N'2003-11-03T00:00:00.000' AS DateTime), 30.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (838, 2, CAST(N'2003-12-01T00:00:00.000' AS DateTime), 32.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (839, 2, CAST(N'2004-01-05T00:00:00.000' AS DateTime), 33.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (840, 2, CAST(N'2004-02-02T00:00:00.000' AS DateTime), 36.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (841, 2, CAST(N'2004-03-01T00:00:00.000' AS DateTime), 35.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (842, 2, CAST(N'2004-04-01T00:00:00.000' AS DateTime), 37.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (843, 2, CAST(N'2004-05-03T00:00:00.000' AS DateTime), 39.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (844, 2, CAST(N'2004-06-02T00:00:00.000' AS DateTime), 37.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (845, 2, CAST(N'2004-07-01T00:00:00.000' AS DateTime), 43.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (846, 2, CAST(N'2004-08-02T00:00:00.000' AS DateTime), 42.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (847, 2, CAST(N'2004-09-01T00:00:00.000' AS DateTime), 49.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (848, 2, CAST(N'2004-10-01T00:00:00.000' AS DateTime), 51.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (849, 2, CAST(N'2004-11-01T00:00:00.000' AS DateTime), 49.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (850, 2, CAST(N'2004-12-01T00:00:00.000' AS DateTime), 43.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (851, 2, CAST(N'2005-01-03T00:00:00.000' AS DateTime), 48.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (852, 2, CAST(N'2005-02-01T00:00:00.000' AS DateTime), 51.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (853, 2, CAST(N'2005-03-01T00:00:00.000' AS DateTime), 55.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (854, 2, CAST(N'2005-04-01T00:00:00.000' AS DateTime), 49.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (855, 2, CAST(N'2005-05-02T00:00:00.000' AS DateTime), 51.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (856, 2, CAST(N'2005-06-01T00:00:00.000' AS DateTime), 56.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (857, 2, CAST(N'2005-07-01T00:00:00.000' AS DateTime), 60.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (858, 2, CAST(N'2005-08-01T00:00:00.000' AS DateTime), 68.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (859, 2, CAST(N'2005-09-01T00:00:00.000' AS DateTime), 66.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (860, 2, CAST(N'2005-10-03T00:00:00.000' AS DateTime), 59.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (861, 2, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 57.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (862, 2, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 61.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (863, 2, CAST(N'2006-01-03T00:00:00.000' AS DateTime), 67.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (864, 2, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 61.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (865, 2, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 66.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (866, 2, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 71.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (867, 2, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 71.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (868, 2, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 73.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (869, 2, CAST(N'2006-07-05T00:00:00.000' AS DateTime), 74.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (870, 2, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 70.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (871, 2, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 62.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (872, 2, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 58.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (873, 2, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 63.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (874, 2, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 61.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (875, 2, CAST(N'2007-01-02T00:00:00.000' AS DateTime), 58.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (876, 2, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 61.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (877, 2, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 65.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (878, 2, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 65.7100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (879, 2, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 64.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (880, 2, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 70.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (881, 2, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 78.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (882, 2, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 74.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (883, 2, CAST(N'2007-09-04T00:00:00.000' AS DateTime), 81.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (884, 2, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 94.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (885, 2, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 88.7100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (886, 2, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 95.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (887, 2, CAST(N'2008-01-02T00:00:00.000' AS DateTime), 91.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (888, 2, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 101.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (889, 2, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 101.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (890, 2, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 113.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (891, 2, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 127.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (892, 2, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 140.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (893, 2, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 124.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (894, 2, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 115.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (895, 2, CAST(N'2008-09-02T00:00:00.000' AS DateTime), 100.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (896, 2, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 67.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (897, 2, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 54.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (898, 2, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 44.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (899, 2, CAST(N'2009-01-02T00:00:00.000' AS DateTime), 41.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (900, 2, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 44.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (901, 2, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 49.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (902, 2, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 51.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (903, 2, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 66.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (904, 2, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 69.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (905, 2, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 69.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (906, 2, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 69.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (907, 2, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 70.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (908, 2, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 77.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (909, 2, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 77.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (910, 2, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 79.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (911, 2, CAST(N'2010-01-04T00:00:00.000' AS DateTime), 72.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (912, 2, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 79.6600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (913, 2, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 83.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (914, 2, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 86.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (915, 2, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 73.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (916, 2, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 75.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (917, 2, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 78.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (918, 2, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 71.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (919, 2, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 79.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (920, 2, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 81.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (921, 2, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 84.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (922, 2, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 91.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (923, 2, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 92.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (924, 2, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 96.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (925, 2, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 106.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (926, 2, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 113.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (927, 2, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 102.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (928, 2, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 95.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (929, 2, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 95.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (930, 2, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 88.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (931, 2, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 79.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (932, 2, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 93.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (933, 2, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 100.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (934, 2, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 98.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (935, 2, CAST(N'2012-01-03T00:00:00.000' AS DateTime), 98.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (936, 2, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 107.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (937, 2, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 103.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (938, 2, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 104.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (939, 2, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 86.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (940, 2, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 84.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (941, 2, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 88.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (942, 2, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 96.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (943, 2, CAST(N'2012-09-04T00:00:00.000' AS DateTime), 92.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (944, 2, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 86.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (945, 2, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 88.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (946, 2, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 91.8200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (947, 2, CAST(N'2013-01-02T00:00:00.000' AS DateTime), 97.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (948, 2, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 92.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (949, 2, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 97.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (950, 2, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 93.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (951, 2, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 91.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (952, 2, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 96.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (953, 2, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 105.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (954, 2, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 107.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (955, 2, CAST(N'2013-09-03T00:00:00.000' AS DateTime), 102.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (956, 2, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 96.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (957, 2, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 92.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (958, 2, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 98.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (959, 2, CAST(N'2014-01-02T00:00:00.000' AS DateTime), 97.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (960, 2, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 102.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (961, 2, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 101.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (962, 2, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 99.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (963, 2, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 102.7100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (964, 2, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 105.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (965, 2, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 98.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (966, 2, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 95.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (967, 2, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 91.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (968, 2, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 80.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (969, 2, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 66.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (970, 2, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 53.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (971, 2, CAST(N'2015-01-02T00:00:00.000' AS DateTime), 48.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (972, 2, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 49.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (973, 2, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 47.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (974, 2, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 59.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (975, 2, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 60.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (976, 2, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 59.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (977, 2, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 47.1200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (978, 2, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 49.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (979, 2, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 45.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (980, 2, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 46.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (981, 2, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 41.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (982, 2, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 37.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (983, 2, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 33.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (984, 2, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 33.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (985, 2, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 38.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (986, 2, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 45.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (987, 2, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 49.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (988, 2, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 48.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (989, 2, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 41.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (990, 2, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 44.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (991, 2, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 48.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (992, 2, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 46.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (993, 2, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 49.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (994, 2, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 53.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (995, 2, CAST(N'2017-01-02T00:00:00.000' AS DateTime), 52.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (996, 2, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 54.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (997, 2, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 50.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (998, 2, CAST(N'2017-04-02T00:00:00.000' AS DateTime), 49.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (999, 2, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 48.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1000, 2, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 46.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1001, 2, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 50.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1002, 2, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 47.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1003, 2, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 51.6700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1004, 2, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 54.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1005, 2, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 57.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1006, 2, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 60.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1007, 2, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 64.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1008, 2, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 61.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1009, 2, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 64.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1010, 2, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 68.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1011, 2, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 67.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1012, 2, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 74.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1013, 2, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 68.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1014, 2, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 69.9977)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1015, 2, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 73.5992)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1016, 2, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 65.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1017, 2, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 50.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1018, 2, CAST(N'2018-12-01T00:00:00.000' AS DateTime), 45.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1019, 2, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 53.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1020, 2, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 57.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1021, 2, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 60.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1022, 2, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 63.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1023, 2, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 53.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1024, 2, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 59.4601)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1025, 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 58.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1026, 2, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 55.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1027, 2, CAST(N'2019-09-01T00:00:00.000' AS DateTime), 54.0700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1028, 2, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 54.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1029, 2, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 55.4872)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1030, 2, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 60.7556)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1031, 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 51.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1032, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 44.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1033, 2, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 20.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1034, 2, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 18.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1035, 2, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 35.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1036, 2, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 39.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1037, 2, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 40.2700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1038, 2, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 42.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1039, 2, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 40.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1040, 2, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 35.7900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1041, 2, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 45.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1042, 2, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 48.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1043, 2, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 52.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1044, 2, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 61.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1045, 2, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 59.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1046, 2, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 63.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1047, 2, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 66.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1048, 2, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 73.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1049, 2, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 73.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1050, 2, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 68.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1051, 2, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 75.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1052, 2, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 81.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1053, 2, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 65.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1054, 2, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 74.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1055, 2, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 86.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1056, 2, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 93.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1057, 2, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 98.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1058, 2, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 102.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1059, 2, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 111.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1060, 2, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 105.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1061, 2, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 108.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1062, 3, CAST(N'2005-04-11T00:00:00.000' AS DateTime), 1.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1063, 3, CAST(N'2005-05-02T00:00:00.000' AS DateTime), 1.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1064, 3, CAST(N'2005-06-01T00:00:00.000' AS DateTime), 1.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1065, 3, CAST(N'2005-07-01T00:00:00.000' AS DateTime), 1.7700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1066, 3, CAST(N'2005-08-01T00:00:00.000' AS DateTime), 2.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1067, 3, CAST(N'2005-09-01T00:00:00.000' AS DateTime), 2.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1068, 3, CAST(N'2005-10-03T00:00:00.000' AS DateTime), 2.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1069, 3, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 1.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1070, 3, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 2.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1071, 3, CAST(N'2006-01-03T00:00:00.000' AS DateTime), 2.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1072, 3, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 2.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1073, 3, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 2.5650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1074, 3, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 2.7250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1075, 3, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 3.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1076, 3, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 3.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1077, 3, CAST(N'2006-07-03T00:00:00.000' AS DateTime), 2.5590)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1078, 3, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 2.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1079, 3, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 1.7650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1080, 3, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 2.0150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1081, 3, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 2.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1082, 3, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 2.4930)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1083, 3, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 1.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1084, 3, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 2.2580)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1085, 3, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 2.1950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1086, 3, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 2.1620)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1087, 3, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 2.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1088, 3, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 1.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1089, 3, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 1.8900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1090, 3, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 1.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1091, 3, CAST(N'2007-09-03T00:00:00.000' AS DateTime), 1.5887)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1092, 3, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1.6353)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1093, 3, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1.8988)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1094, 3, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 2.1382)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1095, 3, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 2.2902)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1096, 3, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 2.2453)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1097, 3, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 2.4530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1098, 3, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 2.5452)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1099, 3, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 2.5125)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1100, 3, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 2.7021)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1101, 3, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 2.5941)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1102, 3, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 2.2543)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1103, 3, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 2.2012)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1104, 3, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 1.7830)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1105, 3, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 1.6972)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1106, 3, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 1.5308)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1107, 3, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 1.6011)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1108, 3, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 1.5661)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1109, 3, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 1.5516)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1110, 3, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 1.5658)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1111, 3, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 1.6997)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1112, 3, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 1.7672)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1113, 3, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 1.7026)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1114, 3, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 1.6116)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1115, 3, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 1.6924)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1116, 3, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 2.0033)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1117, 3, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 2.1267)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1118, 3, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 2.0142)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1119, 3, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 1.8591)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1120, 3, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 1.7603)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1121, 3, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 1.5797)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1122, 3, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 1.5408)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1123, 3, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 1.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1124, 3, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 1.5784)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1125, 3, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 1.6125)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1126, 3, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 1.8652)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1127, 3, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 2.1512)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1128, 3, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 2.2997)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1129, 3, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 2.3291)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1130, 3, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 2.2199)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1131, 3, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 2.3146)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1132, 3, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 2.4324)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1133, 3, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 2.5013)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1134, 3, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 2.6490)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1135, 3, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 2.5926)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1136, 3, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 2.6928)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1137, 3, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 2.8910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1138, 3, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 2.8540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1139, 3, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 2.4850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1140, 3, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 2.6881)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1141, 3, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 2.8781)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1142, 3, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 2.2030)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1143, 3, CAST(N'2012-01-02T00:00:00.000' AS DateTime), 2.1542)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1144, 3, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 2.1809)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1145, 3, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 2.2650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1146, 3, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 2.1845)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1147, 3, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 2.1205)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1148, 3, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 2.0468)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1149, 3, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 2.5243)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1150, 3, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 2.5897)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1151, 3, CAST(N'2012-09-03T00:00:00.000' AS DateTime), 2.3440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1152, 3, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 2.4076)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1153, 3, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 2.4080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1154, 3, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 2.2904)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1155, 3, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 2.3050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1156, 3, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 2.3849)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1157, 3, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 2.2870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1158, 3, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 2.4854)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1159, 3, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 2.7440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1160, 3, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 2.4530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1161, 3, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 2.4397)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1162, 3, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 2.3834)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1163, 3, CAST(N'2013-09-02T00:00:00.000' AS DateTime), 2.4317)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1164, 3, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 2.0208)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1165, 3, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 2.1338)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1166, 3, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 2.2992)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1167, 3, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 2.0330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1168, 3, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 2.0218)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1169, 3, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 2.8125)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1170, 3, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 2.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1171, 3, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 2.2883)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1172, 3, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 2.1750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1173, 3, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 2.1567)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1174, 3, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 2.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1175, 3, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 1.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1176, 3, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 1.6700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1177, 3, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 2.3291)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1178, 3, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 1.9414)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1179, 3, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 1.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1180, 3, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 1.3775)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1181, 3, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 1.4488)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1182, 3, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 1.5850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1183, 3, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 1.6281)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1184, 3, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 1.5138)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1185, 3, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 1.5050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1186, 3, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 1.4642)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1187, 3, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1188, 3, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 1.5624)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1189, 3, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 1.5050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1190, 3, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1.4382)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1191, 3, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 1.3325)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1192, 3, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1.3894)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1193, 3, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1194, 3, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1.5211)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1195, 3, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 1.5654)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1196, 3, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1.6450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1197, 3, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1.5225)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1198, 3, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1.4307)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1199, 3, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1.5470)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1200, 3, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 1.6250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1201, 3, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 1.6269)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1202, 3, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 1.7493)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1203, 3, CAST(N'2017-01-03T00:00:00.000' AS DateTime), 1.4711)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1204, 3, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1205, 3, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1.4939)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1206, 3, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 1.6139)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1207, 3, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1.4635)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1208, 3, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1.5134)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1209, 3, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 1.5220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1210, 3, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 1.5517)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1211, 3, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 1.5684)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1212, 3, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 1.4251)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1213, 3, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 1.4050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1214, 3, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 1.2965)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1215, 3, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1.3045)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1216, 3, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 1.4423)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1217, 3, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 1.4589)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1218, 3, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 1.4635)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1219, 3, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 1.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1220, 3, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 1.4123)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1221, 3, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 1.4233)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1222, 3, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 1.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1223, 3, CAST(N'2018-09-04T00:00:00.000' AS DateTime), 1.2850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1224, 3, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 1.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1225, 3, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 1.2357)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1226, 3, CAST(N'2018-12-01T00:00:00.000' AS DateTime), 1.2129)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1227, 3, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1.2644)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1228, 3, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 1.3325)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1229, 3, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 1.3450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1230, 3, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 1.3205)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1231, 3, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1.3675)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1232, 3, CAST(N'2019-06-01T00:00:00.000' AS DateTime), 1.5050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1233, 3, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 1.4950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1234, 3, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 1.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1235, 3, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 1.3850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1236, 3, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 1.5650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1237, 3, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 1.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1238, 3, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 1.4150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1239, 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1.3050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1240, 3, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 1.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1241, 3, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 1.0750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1242, 3, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 0.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1243, 3, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1.1175)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1244, 3, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 1.2725)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1245, 3, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 1.3825)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1246, 3, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 1.2925)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1247, 3, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 1.4225)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1248, 3, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 1.4850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1249, 3, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 1.4525)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1250, 3, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 1.3346)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1251, 3, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 1.5688)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1252, 3, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1.7075)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1253, 3, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 1.8275)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1254, 3, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 2.1175)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1255, 3, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 2.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1256, 3, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 2.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1257, 3, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 2.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1258, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 2.2475)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1259, 3, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 2.4125)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1260, 3, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 2.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1261, 3, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 3.4050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1262, 3, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 3.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1263, 3, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 2.1600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1264, 3, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2.1567)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1265, 3, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2.4681)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1266, 3, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 2.6358)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1267, 3, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 2.7557)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1268, 3, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 2.7899)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1269, 3, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2.5400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1270, 4, CAST(N'2005-10-03T00:00:00.000' AS DateTime), 1.5811)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1271, 4, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 1.5271)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1272, 4, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 1.7400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1273, 4, CAST(N'2006-01-03T00:00:00.000' AS DateTime), 1.7558)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1274, 4, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 1.5443)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1275, 4, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 2.0645)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1276, 4, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 2.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1277, 4, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 2.2873)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1278, 4, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 2.3931)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1279, 4, CAST(N'2006-07-05T00:00:00.000' AS DateTime), 2.3496)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1280, 4, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 1.8207)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1281, 4, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 1.5632)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1282, 4, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 1.4466)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1283, 4, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 1.7024)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1284, 4, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 1.6021)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1285, 4, CAST(N'2007-01-02T00:00:00.000' AS DateTime), 1.5009)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1286, 4, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 1.8476)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1287, 4, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 2.1115)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1288, 4, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 2.4405)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1289, 4, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 2.2512)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1290, 4, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 2.2942)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1291, 4, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 2.1408)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1292, 4, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 2.0519)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1293, 4, CAST(N'2007-09-04T00:00:00.000' AS DateTime), 2.0683)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1294, 4, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 2.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1295, 4, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 2.2591)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1296, 4, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 2.4758)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1297, 4, CAST(N'2008-01-02T00:00:00.000' AS DateTime), 2.3091)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1298, 4, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 2.5123)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1299, 4, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 2.6163)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1300, 4, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 2.9312)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1301, 4, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 3.4089)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1302, 4, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 3.5015)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1303, 4, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 3.0480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1304, 4, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 3.0099)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1305, 4, CAST(N'2008-09-02T00:00:00.000' AS DateTime), 2.4847)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1306, 4, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 1.4413)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1307, 4, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 1.1462)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1308, 4, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 1.0082)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1309, 4, CAST(N'2009-01-02T00:00:00.000' AS DateTime), 1.2689)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1310, 4, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 1.2807)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1311, 4, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 1.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1312, 4, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 1.4742)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1313, 4, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 1.9310)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1314, 4, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 1.8972)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1315, 4, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 2.0448)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1316, 4, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 1.9859)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1317, 4, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 1.7259)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1318, 4, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 1.9432)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1319, 4, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 2.0008)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1320, 4, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 2.0525)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1321, 4, CAST(N'2010-01-04T00:00:00.000' AS DateTime), 1.9031)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1322, 4, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 2.0788)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1323, 4, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 2.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1324, 4, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 2.3963)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1325, 4, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 2.0198)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1326, 4, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 2.0606)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1327, 4, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 2.1066)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1328, 4, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 1.8894)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1329, 4, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 2.0448)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1330, 4, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 2.1045)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1331, 4, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 2.2652)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1332, 4, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 2.4532)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1333, 4, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 2.4906)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1334, 4, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 2.7296)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1335, 4, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 3.1076)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1336, 4, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 3.4648)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1337, 4, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 3.1504)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1338, 4, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 3.0316)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1339, 4, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 3.1129)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1340, 4, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 3.0320)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1341, 4, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 2.6260)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1342, 4, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 2.6429)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1343, 4, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 2.5677)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1344, 4, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 2.6863)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1345, 4, CAST(N'2012-01-03T00:00:00.000' AS DateTime), 2.8874)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1346, 4, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 3.0423)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1347, 4, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 3.3899)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1348, 4, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 3.1844)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1349, 4, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 2.8250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1350, 4, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 2.7272)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1351, 4, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 2.9146)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1352, 4, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 3.1056)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1353, 4, CAST(N'2012-09-04T00:00:00.000' AS DateTime), 3.3420)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1354, 4, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 2.7618)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1355, 4, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 2.7614)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1356, 4, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 2.8120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1357, 4, CAST(N'2013-01-02T00:00:00.000' AS DateTime), 3.0258)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1358, 4, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 2.9146)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1359, 4, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 3.1054)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1360, 4, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 2.8009)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1361, 4, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 2.7792)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1362, 4, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 2.7520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1363, 4, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 3.0442)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1364, 4, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 3.0183)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1365, 4, CAST(N'2013-09-03T00:00:00.000' AS DateTime), 2.6347)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1366, 4, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 2.6337)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1367, 4, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 2.6841)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1368, 4, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 2.7858)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1369, 4, CAST(N'2014-01-02T00:00:00.000' AS DateTime), 2.6272)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1370, 4, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 2.7898)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1371, 4, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 2.9110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1372, 4, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 3.0077)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1373, 4, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 2.9965)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1374, 4, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 3.0770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1375, 4, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 2.8311)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1376, 4, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 2.7827)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1377, 4, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 2.5869)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1378, 4, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 2.1695)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1379, 4, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 1.9039)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1380, 4, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 1.4353)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1381, 4, CAST(N'2015-01-02T00:00:00.000' AS DateTime), 1.4152)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1382, 4, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 1.7676)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1383, 4, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 1.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1384, 4, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 2.0497)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1385, 4, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 2.0858)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1386, 4, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 2.0896)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1387, 4, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 1.8410)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1388, 4, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 1.6404)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1389, 4, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1.3894)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1390, 4, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 1.4050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1391, 4, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 1.3587)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1392, 4, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1.2671)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1393, 4, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 1.1031)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1394, 4, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1.0497)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1395, 4, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1.4265)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1396, 4, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1.5848)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1397, 4, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 1.6149)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1398, 4, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1.5014)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1399, 4, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1.3210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1400, 4, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1.4122)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1401, 4, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1.4874)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1402, 4, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 1.4495)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1403, 4, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 1.4908)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1404, 4, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 1.6651)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1405, 4, CAST(N'2017-01-02T00:00:00.000' AS DateTime), 1.5256)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1406, 4, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1.5120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1407, 4, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1.7001)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1408, 4, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 1.5480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1409, 4, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1.6122)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1410, 4, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1.5152)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1411, 4, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 1.7058)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1412, 4, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 2.1399)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1413, 4, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 1.6065)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1414, 4, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 1.7796)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1415, 4, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 1.7284)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1416, 4, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 1.7992)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1417, 4, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1.9075)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1418, 4, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 1.7577)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1419, 4, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 2.0179)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1420, 4, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 2.1292)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1421, 4, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 2.1603)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1422, 4, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 2.1791)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1423, 4, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 2.1291)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1424, 4, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 2.1012)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1425, 4, CAST(N'2018-09-03T00:00:00.000' AS DateTime), 2.1012)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1426, 4, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 1.7680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1427, 4, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 1.4413)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1428, 4, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 1.3237)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1429, 4, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1.3627)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1430, 4, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 1.6293)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1431, 4, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 1.8956)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1432, 4, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 2.1232)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1433, 4, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1.8020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1434, 4, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 1.9425)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1435, 4, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 1.9020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1436, 4, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 1.6134)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1437, 4, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 1.6049)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1438, 4, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 1.6312)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1439, 4, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 1.5890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1440, 4, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 1.7061)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1441, 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1.5006)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1442, 4, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 1.3883)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1443, 4, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 0.6308)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1444, 4, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 0.7836)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1445, 4, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1.0259)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1446, 4, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 1.2162)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1447, 4, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 1.1776)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1448, 4, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 1.2233)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1449, 4, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 1.2063)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1450, 4, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 1.0495)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1451, 4, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 1.2489)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1452, 4, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 1.4101)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1453, 4, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1.5527)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1454, 4, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1.9505)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1455, 4, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 1.9597)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1456, 4, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 2.0763)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1457, 4, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 2.1463)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1458, 4, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 2.2418)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1459, 4, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 2.3347)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1460, 4, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 2.1419)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1461, 4, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 2.1940)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1462, 4, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 2.3697)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1463, 4, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 1.9282)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1464, 4, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 2.2286)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1465, 4, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 2.5544)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1466, 4, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2.9089)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1467, 4, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 3.0978)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1468, 4, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 3.3744)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1469, 4, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 3.7455)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1470, 4, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 3.5363)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1471, 4, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 3.6878)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1472, 5, CAST(N'1980-01-02T00:00:00.000' AS DateTime), 0.7825)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1473, 5, CAST(N'1980-02-01T00:00:00.000' AS DateTime), 0.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1474, 5, CAST(N'1980-03-03T00:00:00.000' AS DateTime), 0.7550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1475, 5, CAST(N'1980-04-01T00:00:00.000' AS DateTime), 0.7780)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1476, 5, CAST(N'1980-05-01T00:00:00.000' AS DateTime), 0.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1477, 5, CAST(N'1980-06-02T00:00:00.000' AS DateTime), 0.7600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1478, 5, CAST(N'1980-07-01T00:00:00.000' AS DateTime), 0.7737)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1479, 5, CAST(N'1980-08-01T00:00:00.000' AS DateTime), 0.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1480, 5, CAST(N'1980-09-02T00:00:00.000' AS DateTime), 0.7911)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1481, 5, CAST(N'1980-10-01T00:00:00.000' AS DateTime), 0.8385)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1482, 5, CAST(N'1980-11-03T00:00:00.000' AS DateTime), 0.9210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1483, 5, CAST(N'1980-12-01T00:00:00.000' AS DateTime), 0.9690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1484, 5, CAST(N'1981-01-05T00:00:00.000' AS DateTime), 1.0280)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1485, 5, CAST(N'1981-02-02T00:00:00.000' AS DateTime), 0.9920)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1486, 5, CAST(N'1981-03-02T00:00:00.000' AS DateTime), 0.9409)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1487, 5, CAST(N'1981-04-01T00:00:00.000' AS DateTime), 0.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1488, 5, CAST(N'1981-05-01T00:00:00.000' AS DateTime), 0.9150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1489, 5, CAST(N'1981-06-01T00:00:00.000' AS DateTime), 0.9119)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1490, 5, CAST(N'1981-07-01T00:00:00.000' AS DateTime), 0.9415)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1491, 5, CAST(N'1981-08-03T00:00:00.000' AS DateTime), 0.9364)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1492, 5, CAST(N'1981-09-01T00:00:00.000' AS DateTime), 0.9550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1493, 5, CAST(N'1981-10-01T00:00:00.000' AS DateTime), 0.9960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1494, 5, CAST(N'1981-11-02T00:00:00.000' AS DateTime), 1.0100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1495, 5, CAST(N'1981-12-08T00:00:00.000' AS DateTime), 0.9710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1496, 5, CAST(N'1982-01-04T00:00:00.000' AS DateTime), 0.8970)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1497, 5, CAST(N'1982-02-01T00:00:00.000' AS DateTime), 0.8784)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1498, 5, CAST(N'1982-03-01T00:00:00.000' AS DateTime), 0.8200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1499, 5, CAST(N'1982-04-01T00:00:00.000' AS DateTime), 0.9050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1500, 5, CAST(N'1982-05-17T00:00:00.000' AS DateTime), 0.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1501, 5, CAST(N'1982-06-01T00:00:00.000' AS DateTime), 0.9193)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1502, 5, CAST(N'1982-07-01T00:00:00.000' AS DateTime), 0.8770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1503, 5, CAST(N'1982-08-04T00:00:00.000' AS DateTime), 0.9389)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1504, 5, CAST(N'1982-09-01T00:00:00.000' AS DateTime), 0.9910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1505, 5, CAST(N'1982-10-01T00:00:00.000' AS DateTime), 0.9900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1506, 5, CAST(N'1982-11-01T00:00:00.000' AS DateTime), 0.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1507, 5, CAST(N'1982-12-01T00:00:00.000' AS DateTime), 0.8281)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1508, 5, CAST(N'1983-01-04T00:00:00.000' AS DateTime), 0.7838)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1509, 5, CAST(N'1983-02-01T00:00:00.000' AS DateTime), 0.7284)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1510, 5, CAST(N'1983-03-01T00:00:00.000' AS DateTime), 0.7551)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1511, 5, CAST(N'1983-04-04T00:00:00.000' AS DateTime), 0.8369)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1512, 5, CAST(N'1983-05-02T00:00:00.000' AS DateTime), 0.7950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1513, 5, CAST(N'1983-06-01T00:00:00.000' AS DateTime), 0.8102)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1514, 5, CAST(N'1983-07-01T00:00:00.000' AS DateTime), 0.8323)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1515, 5, CAST(N'1983-08-01T00:00:00.000' AS DateTime), 0.8419)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1516, 5, CAST(N'1983-09-01T00:00:00.000' AS DateTime), 0.8041)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1517, 5, CAST(N'1983-10-03T00:00:00.000' AS DateTime), 0.7998)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1518, 5, CAST(N'1983-11-01T00:00:00.000' AS DateTime), 0.7821)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1519, 5, CAST(N'1983-12-01T00:00:00.000' AS DateTime), 0.8424)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1520, 5, CAST(N'1984-01-03T00:00:00.000' AS DateTime), 1.0037)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1521, 5, CAST(N'1984-02-01T00:00:00.000' AS DateTime), 0.7858)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1522, 5, CAST(N'1984-03-01T00:00:00.000' AS DateTime), 0.8047)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1523, 5, CAST(N'1984-04-02T00:00:00.000' AS DateTime), 0.8304)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1524, 5, CAST(N'1984-05-01T00:00:00.000' AS DateTime), 0.8161)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1525, 5, CAST(N'1984-06-01T00:00:00.000' AS DateTime), 0.7745)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1526, 5, CAST(N'1984-07-02T00:00:00.000' AS DateTime), 0.7254)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1527, 5, CAST(N'1984-08-01T00:00:00.000' AS DateTime), 0.7835)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1528, 5, CAST(N'1984-09-04T00:00:00.000' AS DateTime), 0.8165)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1529, 5, CAST(N'1984-10-01T00:00:00.000' AS DateTime), 0.7770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1530, 5, CAST(N'1984-11-01T00:00:00.000' AS DateTime), 0.7559)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1531, 5, CAST(N'1984-12-12T00:00:00.000' AS DateTime), 0.7240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1532, 5, CAST(N'1985-01-02T00:00:00.000' AS DateTime), 0.7350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1533, 5, CAST(N'1985-02-01T00:00:00.000' AS DateTime), 0.7653)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1534, 5, CAST(N'1985-03-01T00:00:00.000' AS DateTime), 0.8092)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1535, 5, CAST(N'1985-04-01T00:00:00.000' AS DateTime), 0.7574)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1536, 5, CAST(N'1985-05-01T00:00:00.000' AS DateTime), 0.7150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1537, 5, CAST(N'1985-06-03T00:00:00.000' AS DateTime), 0.6846)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1538, 5, CAST(N'1985-07-01T00:00:00.000' AS DateTime), 0.6988)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1539, 5, CAST(N'1985-08-01T00:00:00.000' AS DateTime), 0.7750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1540, 5, CAST(N'1985-09-03T00:00:00.000' AS DateTime), 0.8195)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1541, 5, CAST(N'1985-10-01T00:00:00.000' AS DateTime), 0.8744)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1542, 5, CAST(N'1985-11-01T00:00:00.000' AS DateTime), 0.8705)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1543, 5, CAST(N'1985-12-02T00:00:00.000' AS DateTime), 0.8055)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1544, 5, CAST(N'1986-01-02T00:00:00.000' AS DateTime), 0.5783)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1545, 5, CAST(N'1986-02-04T00:00:00.000' AS DateTime), 0.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1546, 5, CAST(N'1986-03-03T00:00:00.000' AS DateTime), 0.4278)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1547, 5, CAST(N'1986-04-01T00:00:00.000' AS DateTime), 0.4483)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1548, 5, CAST(N'1986-05-01T00:00:00.000' AS DateTime), 0.4013)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1549, 5, CAST(N'1986-06-02T00:00:00.000' AS DateTime), 0.3727)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1550, 5, CAST(N'1986-07-01T00:00:00.000' AS DateTime), 0.3198)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1551, 5, CAST(N'1986-08-01T00:00:00.000' AS DateTime), 0.4327)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1552, 5, CAST(N'1986-09-02T00:00:00.000' AS DateTime), 0.4128)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1553, 5, CAST(N'1986-10-01T00:00:00.000' AS DateTime), 0.4054)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1554, 5, CAST(N'1986-11-03T00:00:00.000' AS DateTime), 0.4203)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1555, 5, CAST(N'1986-12-01T00:00:00.000' AS DateTime), 0.4890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1556, 5, CAST(N'1987-01-02T00:00:00.000' AS DateTime), 0.5222)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1557, 5, CAST(N'1987-02-02T00:00:00.000' AS DateTime), 0.4341)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1558, 5, CAST(N'1987-03-02T00:00:00.000' AS DateTime), 0.4970)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1559, 5, CAST(N'1987-04-01T00:00:00.000' AS DateTime), 0.4952)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1560, 5, CAST(N'1987-05-01T00:00:00.000' AS DateTime), 0.5145)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1561, 5, CAST(N'1987-06-01T00:00:00.000' AS DateTime), 0.5379)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1562, 5, CAST(N'1987-07-01T00:00:00.000' AS DateTime), 0.5465)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1563, 5, CAST(N'1987-08-03T00:00:00.000' AS DateTime), 0.5211)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1564, 5, CAST(N'1987-09-01T00:00:00.000' AS DateTime), 0.5412)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1565, 5, CAST(N'1987-10-01T00:00:00.000' AS DateTime), 0.5746)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1566, 5, CAST(N'1987-11-02T00:00:00.000' AS DateTime), 0.5592)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1567, 5, CAST(N'1987-12-01T00:00:00.000' AS DateTime), 0.5144)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1568, 5, CAST(N'1988-01-04T00:00:00.000' AS DateTime), 0.4801)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1569, 5, CAST(N'1988-02-01T00:00:00.000' AS DateTime), 0.4716)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1570, 5, CAST(N'1988-03-01T00:00:00.000' AS DateTime), 0.4815)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1571, 5, CAST(N'1988-04-04T00:00:00.000' AS DateTime), 0.5179)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1572, 5, CAST(N'1988-05-02T00:00:00.000' AS DateTime), 0.4823)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1573, 5, CAST(N'1988-06-01T00:00:00.000' AS DateTime), 0.4088)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1574, 5, CAST(N'1988-07-01T00:00:00.000' AS DateTime), 0.4466)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1575, 5, CAST(N'1988-08-01T00:00:00.000' AS DateTime), 0.4295)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1576, 5, CAST(N'1988-09-01T00:00:00.000' AS DateTime), 0.3804)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1577, 5, CAST(N'1988-10-03T00:00:00.000' AS DateTime), 0.4262)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1578, 5, CAST(N'1988-11-01T00:00:00.000' AS DateTime), 0.4832)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1579, 5, CAST(N'1988-12-01T00:00:00.000' AS DateTime), 0.5348)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1580, 5, CAST(N'1989-01-03T00:00:00.000' AS DateTime), 0.5228)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1581, 5, CAST(N'1989-02-01T00:00:00.000' AS DateTime), 0.5245)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1582, 5, CAST(N'1989-03-01T00:00:00.000' AS DateTime), 0.5689)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1583, 5, CAST(N'1989-04-03T00:00:00.000' AS DateTime), 0.5220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1584, 5, CAST(N'1989-05-01T00:00:00.000' AS DateTime), 0.4871)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1585, 5, CAST(N'1989-06-01T00:00:00.000' AS DateTime), 0.4935)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1586, 5, CAST(N'1989-07-05T00:00:00.000' AS DateTime), 0.4867)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1587, 5, CAST(N'1989-08-01T00:00:00.000' AS DateTime), 0.5382)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1588, 5, CAST(N'1989-09-01T00:00:00.000' AS DateTime), 0.5944)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1589, 5, CAST(N'1989-10-02T00:00:00.000' AS DateTime), 0.5864)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1590, 5, CAST(N'1989-11-01T00:00:00.000' AS DateTime), 0.6271)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1591, 5, CAST(N'1989-12-01T00:00:00.000' AS DateTime), 1.0187)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1592, 5, CAST(N'1990-01-02T00:00:00.000' AS DateTime), 0.5887)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1593, 5, CAST(N'1990-02-01T00:00:00.000' AS DateTime), 0.5732)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1594, 5, CAST(N'1990-03-01T00:00:00.000' AS DateTime), 0.5702)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1595, 5, CAST(N'1990-04-02T00:00:00.000' AS DateTime), 0.5653)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1596, 5, CAST(N'1990-05-01T00:00:00.000' AS DateTime), 0.5007)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1597, 5, CAST(N'1990-06-01T00:00:00.000' AS DateTime), 0.4867)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1598, 5, CAST(N'1990-07-02T00:00:00.000' AS DateTime), 0.5711)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1599, 5, CAST(N'1990-08-01T00:00:00.000' AS DateTime), 0.7589)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1600, 5, CAST(N'1990-09-04T00:00:00.000' AS DateTime), 1.0498)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1601, 5, CAST(N'1990-10-01T00:00:00.000' AS DateTime), 0.8954)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1602, 5, CAST(N'1990-11-01T00:00:00.000' AS DateTime), 0.8587)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1603, 5, CAST(N'1990-12-03T00:00:00.000' AS DateTime), 0.8131)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1604, 5, CAST(N'1991-01-02T00:00:00.000' AS DateTime), 0.7125)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1605, 5, CAST(N'1991-02-01T00:00:00.000' AS DateTime), 0.6536)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1606, 5, CAST(N'1991-03-01T00:00:00.000' AS DateTime), 0.5689)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1607, 5, CAST(N'1991-04-01T00:00:00.000' AS DateTime), 0.5357)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1608, 5, CAST(N'1991-05-01T00:00:00.000' AS DateTime), 0.5648)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1609, 5, CAST(N'1991-06-03T00:00:00.000' AS DateTime), 0.5530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1610, 5, CAST(N'1991-07-01T00:00:00.000' AS DateTime), 0.6020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1611, 5, CAST(N'1991-08-01T00:00:00.000' AS DateTime), 0.6412)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1612, 5, CAST(N'1991-09-03T00:00:00.000' AS DateTime), 0.6368)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1613, 5, CAST(N'1991-10-01T00:00:00.000' AS DateTime), 0.6857)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1614, 5, CAST(N'1991-11-01T00:00:00.000' AS DateTime), 0.6172)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1615, 5, CAST(N'1991-12-02T00:00:00.000' AS DateTime), 0.4829)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1616, 5, CAST(N'1992-01-02T00:00:00.000' AS DateTime), 0.5285)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1617, 5, CAST(N'1992-02-03T00:00:00.000' AS DateTime), 0.5152)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1618, 5, CAST(N'1992-03-02T00:00:00.000' AS DateTime), 0.5373)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1619, 5, CAST(N'1992-04-01T00:00:00.000' AS DateTime), 0.5785)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1620, 5, CAST(N'1992-05-01T00:00:00.000' AS DateTime), 0.6050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1621, 5, CAST(N'1992-06-01T00:00:00.000' AS DateTime), 0.6009)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1622, 5, CAST(N'1992-07-01T00:00:00.000' AS DateTime), 0.6054)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1623, 5, CAST(N'1992-08-03T00:00:00.000' AS DateTime), 0.6047)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1624, 5, CAST(N'1992-09-01T00:00:00.000' AS DateTime), 0.6320)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1625, 5, CAST(N'1992-10-01T00:00:00.000' AS DateTime), 0.5882)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1626, 5, CAST(N'1992-11-02T00:00:00.000' AS DateTime), 0.5607)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1627, 5, CAST(N'1992-12-01T00:00:00.000' AS DateTime), 0.5640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1628, 5, CAST(N'1993-01-04T00:00:00.000' AS DateTime), 0.5579)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1629, 5, CAST(N'1993-02-01T00:00:00.000' AS DateTime), 0.5795)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1630, 5, CAST(N'1993-03-02T00:00:00.000' AS DateTime), 0.5588)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1631, 5, CAST(N'1993-04-01T00:00:00.000' AS DateTime), 0.5549)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1632, 5, CAST(N'1993-05-03T00:00:00.000' AS DateTime), 0.5486)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1633, 5, CAST(N'1993-06-01T00:00:00.000' AS DateTime), 0.5245)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1634, 5, CAST(N'1993-07-01T00:00:00.000' AS DateTime), 0.4994)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1635, 5, CAST(N'1993-08-03T00:00:00.000' AS DateTime), 0.5384)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1636, 5, CAST(N'1993-09-01T00:00:00.000' AS DateTime), 0.5344)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1637, 5, CAST(N'1993-10-01T00:00:00.000' AS DateTime), 0.5112)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1638, 5, CAST(N'1993-11-02T00:00:00.000' AS DateTime), 0.4697)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1639, 5, CAST(N'1993-12-01T00:00:00.000' AS DateTime), 0.4416)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1640, 5, CAST(N'1994-01-03T00:00:00.000' AS DateTime), 0.5370)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1641, 5, CAST(N'1994-02-01T00:00:00.000' AS DateTime), 0.4968)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1642, 5, CAST(N'1994-03-02T00:00:00.000' AS DateTime), 0.4580)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1643, 5, CAST(N'1994-04-04T00:00:00.000' AS DateTime), 0.4705)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1644, 5, CAST(N'1994-05-03T00:00:00.000' AS DateTime), 0.4782)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1645, 5, CAST(N'1994-06-01T00:00:00.000' AS DateTime), 0.4958)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1646, 5, CAST(N'1994-07-01T00:00:00.000' AS DateTime), 0.5290)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1647, 5, CAST(N'1994-08-02T00:00:00.000' AS DateTime), 0.4939)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1648, 5, CAST(N'1994-09-01T00:00:00.000' AS DateTime), 0.4766)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1649, 5, CAST(N'1994-10-03T00:00:00.000' AS DateTime), 0.4898)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1650, 5, CAST(N'1994-11-01T00:00:00.000' AS DateTime), 0.4896)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1651, 5, CAST(N'1994-12-01T00:00:00.000' AS DateTime), 0.5066)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1652, 5, CAST(N'1995-01-03T00:00:00.000' AS DateTime), 0.4686)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1653, 5, CAST(N'1995-02-02T00:00:00.000' AS DateTime), 0.4690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1654, 5, CAST(N'1995-03-01T00:00:00.000' AS DateTime), 0.4706)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1655, 5, CAST(N'1995-04-03T00:00:00.000' AS DateTime), 0.5119)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1656, 5, CAST(N'1995-05-01T00:00:00.000' AS DateTime), 0.4847)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1657, 5, CAST(N'1995-06-01T00:00:00.000' AS DateTime), 0.4672)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1658, 5, CAST(N'1995-07-05T00:00:00.000' AS DateTime), 0.4827)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1659, 5, CAST(N'1995-08-01T00:00:00.000' AS DateTime), 0.5015)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1660, 5, CAST(N'1995-09-01T00:00:00.000' AS DateTime), 0.4865)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1661, 5, CAST(N'1995-10-02T00:00:00.000' AS DateTime), 0.5040)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1662, 5, CAST(N'1995-11-01T00:00:00.000' AS DateTime), 0.5162)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1663, 5, CAST(N'1995-12-01T00:00:00.000' AS DateTime), 0.5863)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1664, 5, CAST(N'1996-01-02T00:00:00.000' AS DateTime), 0.5351)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1665, 5, CAST(N'1996-02-01T00:00:00.000' AS DateTime), 0.6181)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1666, 5, CAST(N'1996-03-01T00:00:00.000' AS DateTime), 0.6276)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1667, 5, CAST(N'1996-04-01T00:00:00.000' AS DateTime), 0.6182)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1668, 5, CAST(N'1996-05-01T00:00:00.000' AS DateTime), 0.5085)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1669, 5, CAST(N'1996-06-03T00:00:00.000' AS DateTime), 0.5395)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1670, 5, CAST(N'1996-07-01T00:00:00.000' AS DateTime), 0.5708)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1671, 5, CAST(N'1996-08-01T00:00:00.000' AS DateTime), 0.6282)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1672, 5, CAST(N'1996-09-03T00:00:00.000' AS DateTime), 0.7151)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1673, 5, CAST(N'1996-10-01T00:00:00.000' AS DateTime), 0.6634)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1674, 5, CAST(N'1996-11-01T00:00:00.000' AS DateTime), 0.7197)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1675, 5, CAST(N'1996-12-02T00:00:00.000' AS DateTime), 0.7284)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1676, 5, CAST(N'1997-01-02T00:00:00.000' AS DateTime), 0.6865)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1677, 5, CAST(N'1997-02-03T00:00:00.000' AS DateTime), 0.5476)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1678, 5, CAST(N'1997-03-03T00:00:00.000' AS DateTime), 0.5672)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1679, 5, CAST(N'1997-04-01T00:00:00.000' AS DateTime), 0.5807)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1680, 5, CAST(N'1997-05-01T00:00:00.000' AS DateTime), 0.5649)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1681, 5, CAST(N'1997-06-02T00:00:00.000' AS DateTime), 0.5370)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1682, 5, CAST(N'1997-07-01T00:00:00.000' AS DateTime), 0.5561)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1683, 5, CAST(N'1997-08-01T00:00:00.000' AS DateTime), 0.5185)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1684, 5, CAST(N'1997-09-02T00:00:00.000' AS DateTime), 0.5793)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1685, 5, CAST(N'1997-10-01T00:00:00.000' AS DateTime), 0.5777)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1686, 5, CAST(N'1997-11-03T00:00:00.000' AS DateTime), 0.5310)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1687, 5, CAST(N'1997-12-01T00:00:00.000' AS DateTime), 0.4908)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1688, 5, CAST(N'1998-01-02T00:00:00.000' AS DateTime), 0.4758)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1689, 5, CAST(N'1998-02-02T00:00:00.000' AS DateTime), 0.4280)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1690, 5, CAST(N'1998-03-02T00:00:00.000' AS DateTime), 0.4302)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1691, 5, CAST(N'1998-04-01T00:00:00.000' AS DateTime), 0.4275)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1692, 5, CAST(N'1998-05-01T00:00:00.000' AS DateTime), 0.3910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1693, 5, CAST(N'1998-06-01T00:00:00.000' AS DateTime), 0.3815)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1694, 5, CAST(N'1998-07-01T00:00:00.000' AS DateTime), 0.3534)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1695, 5, CAST(N'1998-08-03T00:00:00.000' AS DateTime), 0.3529)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1696, 5, CAST(N'1998-09-01T00:00:00.000' AS DateTime), 0.4211)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1697, 5, CAST(N'1998-10-01T00:00:00.000' AS DateTime), 0.3882)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1698, 5, CAST(N'1998-11-02T00:00:00.000' AS DateTime), 0.3132)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1699, 5, CAST(N'1998-12-01T00:00:00.000' AS DateTime), 0.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1700, 5, CAST(N'1999-01-04T00:00:00.000' AS DateTime), 0.3316)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1701, 5, CAST(N'1999-02-01T00:00:00.000' AS DateTime), 0.3229)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1702, 5, CAST(N'1999-03-01T00:00:00.000' AS DateTime), 0.4468)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1703, 5, CAST(N'1999-04-01T00:00:00.000' AS DateTime), 0.4447)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1704, 5, CAST(N'1999-05-04T00:00:00.000' AS DateTime), 0.3943)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1705, 5, CAST(N'1999-06-01T00:00:00.000' AS DateTime), 0.4785)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1706, 5, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 0.5217)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1707, 5, CAST(N'1999-08-02T00:00:00.000' AS DateTime), 0.5802)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1708, 5, CAST(N'1999-09-01T00:00:00.000' AS DateTime), 0.6154)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1709, 5, CAST(N'1999-10-01T00:00:00.000' AS DateTime), 0.5740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1710, 5, CAST(N'1999-11-01T00:00:00.000' AS DateTime), 0.6417)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1711, 5, CAST(N'1999-12-01T00:00:00.000' AS DateTime), 0.6903)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1712, 5, CAST(N'2000-01-04T00:00:00.000' AS DateTime), 0.9520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1713, 5, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 0.8246)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1714, 5, CAST(N'2000-03-01T00:00:00.000' AS DateTime), 0.7833)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1715, 5, CAST(N'2000-04-03T00:00:00.000' AS DateTime), 0.7318)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1716, 5, CAST(N'2000-05-01T00:00:00.000' AS DateTime), 0.7398)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1717, 5, CAST(N'2000-06-01T00:00:00.000' AS DateTime), 0.8414)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1718, 5, CAST(N'2000-07-05T00:00:00.000' AS DateTime), 0.7793)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1719, 5, CAST(N'2000-08-01T00:00:00.000' AS DateTime), 0.9842)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1720, 5, CAST(N'2000-09-01T00:00:00.000' AS DateTime), 0.9240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1721, 5, CAST(N'2000-10-02T00:00:00.000' AS DateTime), 0.9410)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1722, 5, CAST(N'2000-11-01T00:00:00.000' AS DateTime), 1.0534)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1723, 5, CAST(N'2000-12-01T00:00:00.000' AS DateTime), 0.9066)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1724, 5, CAST(N'2001-01-02T00:00:00.000' AS DateTime), 0.7863)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1725, 5, CAST(N'2001-02-01T00:00:00.000' AS DateTime), 0.7334)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1726, 5, CAST(N'2001-03-01T00:00:00.000' AS DateTime), 0.7567)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1727, 5, CAST(N'2001-04-02T00:00:00.000' AS DateTime), 0.7434)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1728, 5, CAST(N'2001-05-01T00:00:00.000' AS DateTime), 0.7795)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1729, 5, CAST(N'2001-06-01T00:00:00.000' AS DateTime), 0.7090)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1730, 5, CAST(N'2001-07-02T00:00:00.000' AS DateTime), 0.6973)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1731, 5, CAST(N'2001-08-01T00:00:00.000' AS DateTime), 0.7663)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1732, 5, CAST(N'2001-09-04T00:00:00.000' AS DateTime), 0.6635)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1733, 5, CAST(N'2001-10-01T00:00:00.000' AS DateTime), 0.5979)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1734, 5, CAST(N'2001-11-01T00:00:00.000' AS DateTime), 0.5323)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1735, 5, CAST(N'2001-12-03T00:00:00.000' AS DateTime), 0.5507)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1736, 5, CAST(N'2002-01-02T00:00:00.000' AS DateTime), 0.5229)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1737, 5, CAST(N'2002-02-01T00:00:00.000' AS DateTime), 0.5628)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1738, 5, CAST(N'2002-03-01T00:00:00.000' AS DateTime), 0.6689)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1739, 5, CAST(N'2002-04-01T00:00:00.000' AS DateTime), 0.6890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1740, 5, CAST(N'2002-05-01T00:00:00.000' AS DateTime), 0.6297)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1741, 5, CAST(N'2002-06-03T00:00:00.000' AS DateTime), 0.6796)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1742, 5, CAST(N'2002-07-01T00:00:00.000' AS DateTime), 0.6764)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1743, 5, CAST(N'2002-08-01T00:00:00.000' AS DateTime), 0.7482)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1744, 5, CAST(N'2002-09-03T00:00:00.000' AS DateTime), 0.8018)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1745, 5, CAST(N'2002-10-01T00:00:00.000' AS DateTime), 0.7438)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1746, 5, CAST(N'2002-11-01T00:00:00.000' AS DateTime), 0.7571)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1747, 5, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 0.8655)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1748, 5, CAST(N'2003-01-02T00:00:00.000' AS DateTime), 0.9588)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1749, 5, CAST(N'2003-02-03T00:00:00.000' AS DateTime), 1.2559)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1750, 5, CAST(N'2003-03-03T00:00:00.000' AS DateTime), 0.7924)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1751, 5, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 0.7614)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1752, 5, CAST(N'2003-05-01T00:00:00.000' AS DateTime), 0.7542)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1753, 5, CAST(N'2003-06-02T00:00:00.000' AS DateTime), 0.7808)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1754, 5, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 0.7933)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1755, 5, CAST(N'2003-08-01T00:00:00.000' AS DateTime), 0.8187)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1756, 5, CAST(N'2003-09-02T00:00:00.000' AS DateTime), 0.7778)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1757, 5, CAST(N'2003-10-01T00:00:00.000' AS DateTime), 0.7858)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1758, 5, CAST(N'2003-11-03T00:00:00.000' AS DateTime), 0.8349)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1759, 5, CAST(N'2003-12-01T00:00:00.000' AS DateTime), 0.9127)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1760, 5, CAST(N'2004-01-05T00:00:00.000' AS DateTime), 0.9314)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1761, 5, CAST(N'2004-02-02T00:00:00.000' AS DateTime), 0.9609)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1762, 5, CAST(N'2004-03-01T00:00:00.000' AS DateTime), 0.8864)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1763, 5, CAST(N'2004-04-01T00:00:00.000' AS DateTime), 0.9536)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1764, 5, CAST(N'2004-05-03T00:00:00.000' AS DateTime), 0.9992)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1765, 5, CAST(N'2004-06-02T00:00:00.000' AS DateTime), 1.0055)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1766, 5, CAST(N'2004-07-01T00:00:00.000' AS DateTime), 1.1568)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1767, 5, CAST(N'2004-08-02T00:00:00.000' AS DateTime), 1.1106)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1768, 5, CAST(N'2004-09-01T00:00:00.000' AS DateTime), 1.3917)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1769, 5, CAST(N'2004-10-01T00:00:00.000' AS DateTime), 1.4462)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1770, 5, CAST(N'2004-11-01T00:00:00.000' AS DateTime), 1.3927)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1771, 5, CAST(N'2004-12-01T00:00:00.000' AS DateTime), 1.2297)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1772, 5, CAST(N'2005-01-03T00:00:00.000' AS DateTime), 1.3308)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1773, 5, CAST(N'2005-02-01T00:00:00.000' AS DateTime), 1.4914)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1774, 5, CAST(N'2005-03-01T00:00:00.000' AS DateTime), 1.6576)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1775, 5, CAST(N'2005-04-01T00:00:00.000' AS DateTime), 1.4358)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1776, 5, CAST(N'2005-05-02T00:00:00.000' AS DateTime), 1.4519)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1777, 5, CAST(N'2005-06-01T00:00:00.000' AS DateTime), 1.6191)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1778, 5, CAST(N'2005-07-01T00:00:00.000' AS DateTime), 1.6362)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1779, 5, CAST(N'2005-08-01T00:00:00.000' AS DateTime), 2.0530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1780, 5, CAST(N'2005-09-01T00:00:00.000' AS DateTime), 2.0673)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1781, 5, CAST(N'2005-10-03T00:00:00.000' AS DateTime), 1.7698)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1782, 5, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 1.6164)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1783, 5, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 1.7280)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1784, 5, CAST(N'2006-01-03T00:00:00.000' AS DateTime), 1.8019)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1785, 5, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 1.7120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1786, 5, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 1.8618)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1787, 5, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 2.0129)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1788, 5, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 1.9605)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1789, 5, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 1.9642)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1790, 5, CAST(N'2006-07-05T00:00:00.000' AS DateTime), 1.9679)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1791, 5, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 1.9542)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1792, 5, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 1.6846)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1793, 5, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 1.5869)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1794, 5, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 1.8133)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1795, 5, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 1.5979)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1796, 5, CAST(N'2007-01-02T00:00:00.000' AS DateTime), 1.6546)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1797, 5, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 1.7804)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1798, 5, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 1.8794)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1799, 5, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 1.9135)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1800, 5, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 1.8827)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1801, 5, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 2.0319)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1802, 5, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 2.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1803, 5, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 2.0422)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1804, 5, CAST(N'2007-09-04T00:00:00.000' AS DateTime), 2.2379)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1805, 5, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 2.5078)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1806, 5, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 2.5296)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1807, 5, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 2.6444)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1808, 5, CAST(N'2008-01-02T00:00:00.000' AS DateTime), 2.5345)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1809, 5, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 2.8397)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1810, 5, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 3.0492)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1811, 5, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 3.1770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1812, 5, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 3.6598)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1813, 5, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 3.9029)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1814, 5, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 3.4387)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1815, 5, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 3.1819)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1816, 5, CAST(N'2008-09-02T00:00:00.000' AS DateTime), 2.8636)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1817, 5, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 2.0063)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1818, 5, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 1.6737)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1819, 5, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 1.4057)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1820, 5, CAST(N'2009-01-02T00:00:00.000' AS DateTime), 1.4538)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1821, 5, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 1.2659)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1822, 5, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 1.3438)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1823, 5, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 1.3147)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1824, 5, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 1.6419)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1825, 5, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 1.7180)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1826, 5, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 1.7938)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1827, 5, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 1.7792)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1828, 5, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 1.7960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1829, 5, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 1.9811)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1830, 5, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 2.0181)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1831, 5, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 2.1188)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1832, 5, CAST(N'2010-01-04T00:00:00.000' AS DateTime), 1.9029)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1833, 5, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 2.0249)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1834, 5, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 2.1646)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1835, 5, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 2.2885)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1836, 5, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 1.9802)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1837, 5, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 1.9817)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1838, 5, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 2.0427)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1839, 5, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 1.9944)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1840, 5, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 2.2440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1841, 5, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 2.2201)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1842, 5, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 2.3169)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1843, 5, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 2.5437)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1844, 5, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 2.7468)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1845, 5, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 2.9258)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1846, 5, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 3.0898)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1847, 5, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 3.2558)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1848, 5, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 3.0563)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1849, 5, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 2.9327)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1850, 5, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 3.0962)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1851, 5, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 3.0782)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1852, 5, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 2.7948)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1853, 5, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 3.0429)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1854, 5, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 3.0214)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1855, 5, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 2.9350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1856, 5, CAST(N'2012-01-03T00:00:00.000' AS DateTime), 3.0628)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1857, 5, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 3.1880)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1858, 5, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 3.1684)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1859, 5, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 3.1834)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1860, 5, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 2.7062)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1861, 5, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 2.6960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1862, 5, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 2.8417)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1863, 5, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 3.1696)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1864, 5, CAST(N'2012-09-04T00:00:00.000' AS DateTime), 3.1694)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1865, 5, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 3.0682)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1866, 5, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 3.0413)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1867, 5, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 3.0451)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1868, 5, CAST(N'2013-01-02T00:00:00.000' AS DateTime), 3.1298)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1869, 5, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 2.9719)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1870, 5, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 2.9152)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1871, 5, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 2.8734)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1872, 5, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 2.7923)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1873, 5, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 2.8798)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1874, 5, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 3.0431)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1875, 5, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 3.1396)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1876, 5, CAST(N'2013-09-03T00:00:00.000' AS DateTime), 2.9710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1877, 5, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 2.9678)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1878, 5, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 3.0478)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1879, 5, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 3.0772)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1880, 5, CAST(N'2014-01-02T00:00:00.000' AS DateTime), 3.2794)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1881, 5, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 3.0893)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1882, 5, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 2.9320)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1883, 5, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 2.9349)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1884, 5, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 2.8846)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1885, 5, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 2.9708)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1886, 5, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 2.8866)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1887, 5, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 2.8569)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1888, 5, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 2.6472)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1889, 5, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 2.5145)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1890, 5, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 2.2308)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1891, 5, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 1.8466)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1892, 5, CAST(N'2015-01-02T00:00:00.000' AS DateTime), 1.6863)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1893, 5, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 2.2989)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1894, 5, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 1.7179)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1895, 5, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 1.9763)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1896, 5, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 1.9553)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1897, 5, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 1.8866)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1898, 5, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 1.5840)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1899, 5, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 1.6736)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1900, 5, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1.5126)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1901, 5, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 1.4994)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1902, 5, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 1.3369)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1903, 5, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1.1007)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1904, 5, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 1.0551)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1905, 5, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1.0760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1906, 5, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1.1848)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1907, 5, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1.3779)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1908, 5, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 1.4975)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1909, 5, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1.4847)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1910, 5, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1.2760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1911, 5, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1.4102)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1912, 5, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1.5279)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1913, 5, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 1.4955)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1914, 5, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 1.5709)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1915, 5, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 1.7043)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1916, 5, CAST(N'2017-01-02T00:00:00.000' AS DateTime), 1.6117)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1917, 5, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1.6208)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1918, 5, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1.5736)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1919, 5, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 1.5040)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1920, 5, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1.5153)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1921, 5, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1.4755)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1922, 5, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 1.6519)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1923, 5, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 1.7575)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1924, 5, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 1.8117)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1925, 5, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 1.8845)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1926, 5, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 1.8927)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1927, 5, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 2.0755)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1928, 5, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 2.0692)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1929, 5, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 1.9136)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1930, 5, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 2.0284)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1931, 5, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 2.1674)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1932, 5, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 2.1914)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1933, 5, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 2.2093)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1934, 5, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 2.1319)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1935, 5, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 2.2360)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1936, 5, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 2.3518)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1937, 5, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 2.2618)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1938, 5, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 1.8455)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1939, 5, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 1.6808)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1940, 5, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1.8788)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1941, 5, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 2.0235)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1942, 5, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 1.9734)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1943, 5, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 2.0812)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1944, 5, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1.8418)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1945, 5, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 1.9446)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1946, 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 1.9550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1947, 5, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 1.8282)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1948, 5, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 1.9056)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1949, 5, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 1.8780)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1950, 5, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 1.8788)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1951, 5, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 2.0232)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1952, 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1.6331)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1953, 5, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 1.4824)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1954, 5, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 1.0062)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1955, 5, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 0.8502)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1956, 5, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 0.9647)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1957, 5, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 1.1925)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1958, 5, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 1.2294)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1959, 5, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 1.2241)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1960, 5, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 1.1489)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1961, 5, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 1.0813)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1962, 5, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 1.3559)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1963, 5, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 1.4840)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1964, 5, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 1.5984)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1965, 5, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1.8431)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1966, 5, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 1.7698)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1967, 5, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1.9224)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1968, 5, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 2.0520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1969, 5, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 2.1283)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1970, 5, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 2.1956)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1971, 5, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 2.1302)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1972, 5, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 2.3385)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1973, 5, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 2.4787)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1974, 5, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 2.0528)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1975, 5, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 2.3084)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1976, 5, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 2.7157)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1977, 5, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2.8466)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1978, 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 3.2009)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1979, 5, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 3.6975)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1980, 5, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 3.8469)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1981, 5, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 3.8305)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1982, 5, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 3.9389)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1983, 6, CAST(N'2014-06-17T00:00:00.000' AS DateTime), 2862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1984, 6, CAST(N'2014-06-18T00:00:00.000' AS DateTime), 2885.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1985, 6, CAST(N'2014-06-19T00:00:00.000' AS DateTime), 2910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1986, 6, CAST(N'2014-06-20T00:00:00.000' AS DateTime), 2907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1987, 6, CAST(N'2014-06-23T00:00:00.000' AS DateTime), 2919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1988, 6, CAST(N'2014-06-24T00:00:00.000' AS DateTime), 2923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1989, 6, CAST(N'2014-06-25T00:00:00.000' AS DateTime), 2965.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1990, 6, CAST(N'2014-06-26T00:00:00.000' AS DateTime), 3003.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1991, 6, CAST(N'2014-06-27T00:00:00.000' AS DateTime), 2991.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1992, 6, CAST(N'2014-06-30T00:00:00.000' AS DateTime), 2990.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1993, 6, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 2980.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1994, 6, CAST(N'2014-07-02T00:00:00.000' AS DateTime), 2965.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1995, 6, CAST(N'2014-07-03T00:00:00.000' AS DateTime), 2964.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1996, 6, CAST(N'2014-07-04T00:00:00.000' AS DateTime), 2962.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1997, 6, CAST(N'2014-07-07T00:00:00.000' AS DateTime), 2986.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1998, 6, CAST(N'2014-07-08T00:00:00.000' AS DateTime), 3016.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (1999, 6, CAST(N'2014-07-09T00:00:00.000' AS DateTime), 2978.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2000, 6, CAST(N'2014-07-10T00:00:00.000' AS DateTime), 2946.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2001, 6, CAST(N'2014-07-11T00:00:00.000' AS DateTime), 2937.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2002, 6, CAST(N'2014-07-14T00:00:00.000' AS DateTime), 2894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2003, 6, CAST(N'2014-07-15T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2004, 6, CAST(N'2014-07-16T00:00:00.000' AS DateTime), 2887.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2005, 6, CAST(N'2014-07-17T00:00:00.000' AS DateTime), 2912.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2006, 6, CAST(N'2014-07-18T00:00:00.000' AS DateTime), 2887.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2007, 6, CAST(N'2014-07-21T00:00:00.000' AS DateTime), 2868.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2008, 6, CAST(N'2014-07-22T00:00:00.000' AS DateTime), 2873.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2009, 6, CAST(N'2014-07-23T00:00:00.000' AS DateTime), 2880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2010, 6, CAST(N'2014-07-24T00:00:00.000' AS DateTime), 2879.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2011, 6, CAST(N'2014-07-25T00:00:00.000' AS DateTime), 2883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2012, 6, CAST(N'2014-07-28T00:00:00.000' AS DateTime), 2921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2013, 6, CAST(N'2014-07-29T00:00:00.000' AS DateTime), 2934.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2014, 6, CAST(N'2014-07-30T00:00:00.000' AS DateTime), 2921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2015, 6, CAST(N'2014-07-31T00:00:00.000' AS DateTime), 2927.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2016, 6, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 2896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2017, 6, CAST(N'2014-08-04T00:00:00.000' AS DateTime), 2892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2018, 6, CAST(N'2014-08-05T00:00:00.000' AS DateTime), 2910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2019, 6, CAST(N'2014-08-06T00:00:00.000' AS DateTime), 2884.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2020, 6, CAST(N'2014-08-07T00:00:00.000' AS DateTime), 2899.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2021, 6, CAST(N'2014-08-08T00:00:00.000' AS DateTime), 2910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2022, 6, CAST(N'2014-08-11T00:00:00.000' AS DateTime), 2929.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2023, 6, CAST(N'2014-08-12T00:00:00.000' AS DateTime), 2915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2024, 6, CAST(N'2014-08-13T00:00:00.000' AS DateTime), 2987.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2025, 6, CAST(N'2014-08-14T00:00:00.000' AS DateTime), 2984.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2026, 6, CAST(N'2014-08-15T00:00:00.000' AS DateTime), 2977.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2027, 6, CAST(N'2014-08-18T00:00:00.000' AS DateTime), 2976.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2028, 6, CAST(N'2014-08-19T00:00:00.000' AS DateTime), 2987.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2029, 6, CAST(N'2014-08-20T00:00:00.000' AS DateTime), 2970.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2030, 6, CAST(N'2014-08-21T00:00:00.000' AS DateTime), 2970.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2031, 6, CAST(N'2014-08-22T00:00:00.000' AS DateTime), 2952.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2032, 6, CAST(N'2014-08-25T00:00:00.000' AS DateTime), 2914.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2033, 6, CAST(N'2014-08-26T00:00:00.000' AS DateTime), 2852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2034, 6, CAST(N'2014-08-27T00:00:00.000' AS DateTime), 2862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2035, 6, CAST(N'2014-08-28T00:00:00.000' AS DateTime), 2850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2036, 6, CAST(N'2014-08-29T00:00:00.000' AS DateTime), 2820.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2037, 6, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 2848.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2038, 6, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 2870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2039, 6, CAST(N'2014-09-03T00:00:00.000' AS DateTime), 2854.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2040, 6, CAST(N'2014-09-04T00:00:00.000' AS DateTime), 2864.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2041, 6, CAST(N'2014-09-05T00:00:00.000' AS DateTime), 2853.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2042, 6, CAST(N'2014-09-09T00:00:00.000' AS DateTime), 2853.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2043, 6, CAST(N'2014-09-10T00:00:00.000' AS DateTime), 2844.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2044, 6, CAST(N'2014-09-11T00:00:00.000' AS DateTime), 2856.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2045, 6, CAST(N'2014-09-12T00:00:00.000' AS DateTime), 2833.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2046, 6, CAST(N'2014-09-15T00:00:00.000' AS DateTime), 2847.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2047, 6, CAST(N'2014-09-16T00:00:00.000' AS DateTime), 2886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2048, 6, CAST(N'2014-09-17T00:00:00.000' AS DateTime), 2907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2049, 6, CAST(N'2014-09-18T00:00:00.000' AS DateTime), 2908.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2050, 6, CAST(N'2014-09-19T00:00:00.000' AS DateTime), 2914.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2051, 6, CAST(N'2014-09-22T00:00:00.000' AS DateTime), 2912.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2052, 6, CAST(N'2014-09-23T00:00:00.000' AS DateTime), 2897.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2053, 6, CAST(N'2014-09-24T00:00:00.000' AS DateTime), 2866.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2054, 6, CAST(N'2014-09-25T00:00:00.000' AS DateTime), 2871.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2055, 6, CAST(N'2014-09-26T00:00:00.000' AS DateTime), 2866.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2056, 6, CAST(N'2014-09-29T00:00:00.000' AS DateTime), 2850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2057, 6, CAST(N'2014-09-30T00:00:00.000' AS DateTime), 2879.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2058, 6, CAST(N'2014-10-08T00:00:00.000' AS DateTime), 2845.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2059, 6, CAST(N'2014-10-09T00:00:00.000' AS DateTime), 2828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2060, 6, CAST(N'2014-10-10T00:00:00.000' AS DateTime), 2778.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2061, 6, CAST(N'2014-10-13T00:00:00.000' AS DateTime), 2766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2062, 6, CAST(N'2014-10-14T00:00:00.000' AS DateTime), 2768.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2063, 6, CAST(N'2014-10-15T00:00:00.000' AS DateTime), 2777.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2064, 6, CAST(N'2014-10-16T00:00:00.000' AS DateTime), 2772.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2065, 6, CAST(N'2014-10-17T00:00:00.000' AS DateTime), 2763.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2066, 6, CAST(N'2014-10-20T00:00:00.000' AS DateTime), 2722.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2067, 6, CAST(N'2014-10-21T00:00:00.000' AS DateTime), 2728.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2068, 6, CAST(N'2014-10-22T00:00:00.000' AS DateTime), 2740.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2069, 6, CAST(N'2014-10-23T00:00:00.000' AS DateTime), 2757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2070, 6, CAST(N'2014-10-24T00:00:00.000' AS DateTime), 2777.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2071, 6, CAST(N'2014-10-27T00:00:00.000' AS DateTime), 2777.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2072, 6, CAST(N'2014-10-28T00:00:00.000' AS DateTime), 2766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2073, 6, CAST(N'2014-10-29T00:00:00.000' AS DateTime), 2775.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2074, 6, CAST(N'2014-10-30T00:00:00.000' AS DateTime), 2797.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2075, 6, CAST(N'2014-10-31T00:00:00.000' AS DateTime), 2761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2076, 6, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 2732.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2077, 6, CAST(N'2014-11-04T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2078, 6, CAST(N'2014-11-05T00:00:00.000' AS DateTime), 2675.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2079, 6, CAST(N'2014-11-06T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2080, 6, CAST(N'2014-11-07T00:00:00.000' AS DateTime), 2599.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2081, 6, CAST(N'2014-11-10T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2082, 6, CAST(N'2014-11-11T00:00:00.000' AS DateTime), 2639.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2083, 6, CAST(N'2014-11-12T00:00:00.000' AS DateTime), 2668.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2084, 6, CAST(N'2014-11-13T00:00:00.000' AS DateTime), 2684.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2085, 6, CAST(N'2014-11-14T00:00:00.000' AS DateTime), 2664.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2086, 6, CAST(N'2014-11-17T00:00:00.000' AS DateTime), 2669.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2087, 6, CAST(N'2014-11-18T00:00:00.000' AS DateTime), 2641.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2088, 6, CAST(N'2014-11-19T00:00:00.000' AS DateTime), 2657.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2089, 6, CAST(N'2014-11-20T00:00:00.000' AS DateTime), 2689.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2090, 6, CAST(N'2014-11-21T00:00:00.000' AS DateTime), 2683.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2091, 6, CAST(N'2014-11-24T00:00:00.000' AS DateTime), 2660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2092, 6, CAST(N'2014-11-25T00:00:00.000' AS DateTime), 2644.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2093, 6, CAST(N'2014-11-26T00:00:00.000' AS DateTime), 2624.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2094, 6, CAST(N'2014-11-27T00:00:00.000' AS DateTime), 2576.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2095, 6, CAST(N'2014-11-28T00:00:00.000' AS DateTime), 2548.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2096, 6, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 2486.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2097, 6, CAST(N'2014-12-02T00:00:00.000' AS DateTime), 2515.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2098, 6, CAST(N'2014-12-03T00:00:00.000' AS DateTime), 2500.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2099, 6, CAST(N'2014-12-04T00:00:00.000' AS DateTime), 2486.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2100, 6, CAST(N'2014-12-05T00:00:00.000' AS DateTime), 2453.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2101, 6, CAST(N'2014-12-08T00:00:00.000' AS DateTime), 2377.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2102, 6, CAST(N'2014-12-09T00:00:00.000' AS DateTime), 2317.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2103, 6, CAST(N'2014-12-10T00:00:00.000' AS DateTime), 2343.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2104, 6, CAST(N'2014-12-11T00:00:00.000' AS DateTime), 2323.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2105, 6, CAST(N'2014-12-12T00:00:00.000' AS DateTime), 2310.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2106, 6, CAST(N'2014-12-15T00:00:00.000' AS DateTime), 2298.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2107, 6, CAST(N'2014-12-16T00:00:00.000' AS DateTime), 2240.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2108, 6, CAST(N'2014-12-17T00:00:00.000' AS DateTime), 2167.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2109, 6, CAST(N'2014-12-18T00:00:00.000' AS DateTime), 2034.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2110, 6, CAST(N'2014-12-19T00:00:00.000' AS DateTime), 2064.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2111, 6, CAST(N'2014-12-22T00:00:00.000' AS DateTime), 2060.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2112, 6, CAST(N'2014-12-23T00:00:00.000' AS DateTime), 2015.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2113, 6, CAST(N'2014-12-24T00:00:00.000' AS DateTime), 2041.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2114, 6, CAST(N'2014-12-25T00:00:00.000' AS DateTime), 2075.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2115, 6, CAST(N'2014-12-26T00:00:00.000' AS DateTime), 2090.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2116, 6, CAST(N'2014-12-29T00:00:00.000' AS DateTime), 2057.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2117, 6, CAST(N'2014-12-30T00:00:00.000' AS DateTime), 2054.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2118, 6, CAST(N'2014-12-31T00:00:00.000' AS DateTime), 2057.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2119, 6, CAST(N'2015-01-05T00:00:00.000' AS DateTime), 2022.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2120, 6, CAST(N'2015-01-06T00:00:00.000' AS DateTime), 2013.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2121, 6, CAST(N'2015-01-07T00:00:00.000' AS DateTime), 2027.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2122, 6, CAST(N'2015-01-08T00:00:00.000' AS DateTime), 2036.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2123, 6, CAST(N'2015-01-09T00:00:00.000' AS DateTime), 2024.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2124, 6, CAST(N'2015-01-12T00:00:00.000' AS DateTime), 1973.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2125, 6, CAST(N'2015-01-13T00:00:00.000' AS DateTime), 1921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2126, 6, CAST(N'2015-01-14T00:00:00.000' AS DateTime), 1928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2127, 6, CAST(N'2015-01-15T00:00:00.000' AS DateTime), 1945.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2128, 6, CAST(N'2015-01-16T00:00:00.000' AS DateTime), 1981.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2129, 6, CAST(N'2015-01-19T00:00:00.000' AS DateTime), 1998.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2130, 6, CAST(N'2015-01-20T00:00:00.000' AS DateTime), 1998.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2131, 6, CAST(N'2015-01-21T00:00:00.000' AS DateTime), 2032.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2132, 6, CAST(N'2015-01-22T00:00:00.000' AS DateTime), 2062.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2133, 6, CAST(N'2015-01-23T00:00:00.000' AS DateTime), 2054.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2134, 6, CAST(N'2015-01-26T00:00:00.000' AS DateTime), 2030.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2135, 6, CAST(N'2015-01-27T00:00:00.000' AS DateTime), 2031.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2136, 6, CAST(N'2015-01-28T00:00:00.000' AS DateTime), 2059.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2137, 6, CAST(N'2015-01-29T00:00:00.000' AS DateTime), 2066.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2138, 6, CAST(N'2015-01-30T00:00:00.000' AS DateTime), 2047.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2139, 6, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 2062.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2140, 6, CAST(N'2015-02-03T00:00:00.000' AS DateTime), 2103.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2141, 6, CAST(N'2015-02-04T00:00:00.000' AS DateTime), 2141.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2142, 6, CAST(N'2015-02-05T00:00:00.000' AS DateTime), 2126.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2143, 6, CAST(N'2015-02-06T00:00:00.000' AS DateTime), 2154.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2144, 6, CAST(N'2015-02-09T00:00:00.000' AS DateTime), 2149.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2145, 6, CAST(N'2015-02-10T00:00:00.000' AS DateTime), 2142.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2146, 6, CAST(N'2015-02-11T00:00:00.000' AS DateTime), 2130.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2147, 6, CAST(N'2015-02-12T00:00:00.000' AS DateTime), 2141.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2148, 6, CAST(N'2015-02-13T00:00:00.000' AS DateTime), 2191.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2149, 6, CAST(N'2015-02-16T00:00:00.000' AS DateTime), 2247.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2150, 6, CAST(N'2015-02-17T00:00:00.000' AS DateTime), 2246.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2151, 6, CAST(N'2015-02-25T00:00:00.000' AS DateTime), 2257.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2152, 6, CAST(N'2015-02-26T00:00:00.000' AS DateTime), 2307.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2153, 6, CAST(N'2015-02-27T00:00:00.000' AS DateTime), 2343.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2154, 6, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 2405.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2155, 6, CAST(N'2015-03-03T00:00:00.000' AS DateTime), 2468.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2156, 6, CAST(N'2015-03-04T00:00:00.000' AS DateTime), 2403.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2157, 6, CAST(N'2015-03-05T00:00:00.000' AS DateTime), 2404.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2158, 6, CAST(N'2015-03-06T00:00:00.000' AS DateTime), 2448.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2159, 6, CAST(N'2015-03-09T00:00:00.000' AS DateTime), 2416.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2160, 6, CAST(N'2015-03-10T00:00:00.000' AS DateTime), 2449.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2161, 6, CAST(N'2015-03-11T00:00:00.000' AS DateTime), 2419.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2162, 6, CAST(N'2015-03-12T00:00:00.000' AS DateTime), 2428.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2163, 6, CAST(N'2015-03-13T00:00:00.000' AS DateTime), 2457.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2164, 6, CAST(N'2015-03-16T00:00:00.000' AS DateTime), 2427.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2165, 6, CAST(N'2015-03-17T00:00:00.000' AS DateTime), 2404.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2166, 6, CAST(N'2015-03-18T00:00:00.000' AS DateTime), 2360.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2167, 6, CAST(N'2015-03-19T00:00:00.000' AS DateTime), 2332.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2168, 6, CAST(N'2015-03-20T00:00:00.000' AS DateTime), 2331.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2169, 6, CAST(N'2015-03-23T00:00:00.000' AS DateTime), 2341.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2170, 6, CAST(N'2015-03-24T00:00:00.000' AS DateTime), 2406.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2171, 6, CAST(N'2015-03-25T00:00:00.000' AS DateTime), 2420.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2172, 6, CAST(N'2015-03-26T00:00:00.000' AS DateTime), 2421.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2173, 6, CAST(N'2015-03-27T00:00:00.000' AS DateTime), 2402.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2174, 6, CAST(N'2015-03-30T00:00:00.000' AS DateTime), 2375.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2175, 6, CAST(N'2015-03-31T00:00:00.000' AS DateTime), 2403.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2176, 6, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 2397.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2177, 6, CAST(N'2015-04-02T00:00:00.000' AS DateTime), 2449.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2178, 6, CAST(N'2015-04-03T00:00:00.000' AS DateTime), 2424.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2179, 6, CAST(N'2015-04-07T00:00:00.000' AS DateTime), 2433.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2180, 6, CAST(N'2015-04-08T00:00:00.000' AS DateTime), 2431.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2181, 6, CAST(N'2015-04-09T00:00:00.000' AS DateTime), 2406.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2182, 6, CAST(N'2015-04-10T00:00:00.000' AS DateTime), 2397.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2183, 6, CAST(N'2015-04-13T00:00:00.000' AS DateTime), 2409.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2184, 6, CAST(N'2015-04-14T00:00:00.000' AS DateTime), 2415.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2185, 6, CAST(N'2015-04-15T00:00:00.000' AS DateTime), 2425.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2186, 6, CAST(N'2015-04-16T00:00:00.000' AS DateTime), 2476.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2187, 6, CAST(N'2015-04-17T00:00:00.000' AS DateTime), 2510.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2188, 6, CAST(N'2015-04-20T00:00:00.000' AS DateTime), 2560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2189, 6, CAST(N'2015-04-21T00:00:00.000' AS DateTime), 2582.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2190, 6, CAST(N'2015-04-22T00:00:00.000' AS DateTime), 2555.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2191, 6, CAST(N'2015-04-23T00:00:00.000' AS DateTime), 2548.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2192, 6, CAST(N'2015-04-24T00:00:00.000' AS DateTime), 2564.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2193, 6, CAST(N'2015-04-27T00:00:00.000' AS DateTime), 2582.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2194, 6, CAST(N'2015-04-28T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2195, 6, CAST(N'2015-04-29T00:00:00.000' AS DateTime), 2579.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2196, 6, CAST(N'2015-04-30T00:00:00.000' AS DateTime), 2587.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2197, 6, CAST(N'2015-05-04T00:00:00.000' AS DateTime), 2573.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2198, 6, CAST(N'2015-05-05T00:00:00.000' AS DateTime), 2572.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2199, 6, CAST(N'2015-05-06T00:00:00.000' AS DateTime), 2593.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2200, 6, CAST(N'2015-05-07T00:00:00.000' AS DateTime), 2551.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2201, 6, CAST(N'2015-05-08T00:00:00.000' AS DateTime), 2500.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2202, 6, CAST(N'2015-05-11T00:00:00.000' AS DateTime), 2507.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2203, 6, CAST(N'2015-05-12T00:00:00.000' AS DateTime), 2513.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2204, 6, CAST(N'2015-05-13T00:00:00.000' AS DateTime), 2519.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2205, 6, CAST(N'2015-05-14T00:00:00.000' AS DateTime), 2497.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2206, 6, CAST(N'2015-05-15T00:00:00.000' AS DateTime), 2510.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2207, 6, CAST(N'2015-05-18T00:00:00.000' AS DateTime), 2507.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2208, 6, CAST(N'2015-05-19T00:00:00.000' AS DateTime), 2493.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2209, 6, CAST(N'2015-05-20T00:00:00.000' AS DateTime), 2471.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2210, 6, CAST(N'2015-05-21T00:00:00.000' AS DateTime), 2500.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2211, 6, CAST(N'2015-05-22T00:00:00.000' AS DateTime), 2537.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2212, 6, CAST(N'2015-05-25T00:00:00.000' AS DateTime), 2522.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2213, 6, CAST(N'2015-05-26T00:00:00.000' AS DateTime), 2548.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2214, 6, CAST(N'2015-05-27T00:00:00.000' AS DateTime), 2522.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2215, 6, CAST(N'2015-05-28T00:00:00.000' AS DateTime), 2521.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2216, 6, CAST(N'2015-05-29T00:00:00.000' AS DateTime), 2543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2217, 6, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 2568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2218, 6, CAST(N'2015-06-02T00:00:00.000' AS DateTime), 2547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2219, 6, CAST(N'2015-06-03T00:00:00.000' AS DateTime), 2521.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2220, 6, CAST(N'2015-06-04T00:00:00.000' AS DateTime), 2499.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2221, 6, CAST(N'2015-06-05T00:00:00.000' AS DateTime), 2500.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2222, 6, CAST(N'2015-06-08T00:00:00.000' AS DateTime), 2469.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2223, 6, CAST(N'2015-06-09T00:00:00.000' AS DateTime), 2488.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2224, 6, CAST(N'2015-06-10T00:00:00.000' AS DateTime), 2494.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2225, 6, CAST(N'2015-06-11T00:00:00.000' AS DateTime), 2466.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2226, 6, CAST(N'2015-06-12T00:00:00.000' AS DateTime), 2493.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2227, 6, CAST(N'2015-06-15T00:00:00.000' AS DateTime), 2560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2228, 6, CAST(N'2015-06-16T00:00:00.000' AS DateTime), 2559.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2229, 6, CAST(N'2015-06-17T00:00:00.000' AS DateTime), 2586.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2230, 6, CAST(N'2015-06-18T00:00:00.000' AS DateTime), 2584.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2231, 6, CAST(N'2015-06-19T00:00:00.000' AS DateTime), 2546.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2232, 6, CAST(N'2015-06-23T00:00:00.000' AS DateTime), 2627.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2233, 6, CAST(N'2015-06-24T00:00:00.000' AS DateTime), 2617.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2234, 6, CAST(N'2015-06-25T00:00:00.000' AS DateTime), 2617.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2235, 6, CAST(N'2015-06-26T00:00:00.000' AS DateTime), 2617.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2236, 6, CAST(N'2015-06-29T00:00:00.000' AS DateTime), 2597.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2237, 6, CAST(N'2015-06-30T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2238, 6, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2239, 6, CAST(N'2015-07-02T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2240, 6, CAST(N'2015-07-03T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2241, 6, CAST(N'2015-07-06T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2242, 6, CAST(N'2015-07-07T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2243, 6, CAST(N'2015-07-08T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2244, 6, CAST(N'2015-07-09T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2245, 6, CAST(N'2015-07-10T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2246, 6, CAST(N'2015-07-13T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2247, 6, CAST(N'2015-07-14T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2248, 6, CAST(N'2015-07-15T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2249, 6, CAST(N'2015-07-16T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2250, 6, CAST(N'2015-07-17T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2251, 6, CAST(N'2015-07-20T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2252, 6, CAST(N'2015-07-21T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2253, 6, CAST(N'2015-07-22T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2254, 6, CAST(N'2015-07-23T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2255, 6, CAST(N'2015-07-24T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2256, 6, CAST(N'2015-07-27T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2257, 6, CAST(N'2015-07-28T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2258, 6, CAST(N'2015-07-29T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2259, 6, CAST(N'2015-07-30T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2260, 6, CAST(N'2015-07-31T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2261, 6, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2262, 6, CAST(N'2015-08-04T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2263, 6, CAST(N'2015-08-05T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2264, 6, CAST(N'2015-08-06T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2265, 6, CAST(N'2015-08-07T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2266, 6, CAST(N'2015-08-10T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2267, 6, CAST(N'2015-08-11T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2268, 6, CAST(N'2015-08-12T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2269, 6, CAST(N'2015-08-13T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2270, 6, CAST(N'2015-08-14T00:00:00.000' AS DateTime), 2467.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2271, 6, CAST(N'2015-08-17T00:00:00.000' AS DateTime), 2034.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2272, 6, CAST(N'2015-08-18T00:00:00.000' AS DateTime), 2002.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2273, 6, CAST(N'2015-08-19T00:00:00.000' AS DateTime), 1990.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2274, 6, CAST(N'2015-08-20T00:00:00.000' AS DateTime), 1985.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2275, 6, CAST(N'2015-08-21T00:00:00.000' AS DateTime), 1986.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2276, 6, CAST(N'2015-08-24T00:00:00.000' AS DateTime), 1940.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2277, 6, CAST(N'2015-08-25T00:00:00.000' AS DateTime), 1812.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2278, 6, CAST(N'2015-08-26T00:00:00.000' AS DateTime), 1797.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2279, 6, CAST(N'2015-08-27T00:00:00.000' AS DateTime), 1816.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2280, 6, CAST(N'2015-08-28T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2281, 6, CAST(N'2015-08-31T00:00:00.000' AS DateTime), 1857.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2282, 6, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1832.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2283, 6, CAST(N'2015-09-02T00:00:00.000' AS DateTime), 1829.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2284, 6, CAST(N'2015-09-07T00:00:00.000' AS DateTime), 1851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2285, 6, CAST(N'2015-09-08T00:00:00.000' AS DateTime), 1838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2286, 6, CAST(N'2015-09-09T00:00:00.000' AS DateTime), 1854.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2287, 6, CAST(N'2015-09-10T00:00:00.000' AS DateTime), 1849.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2288, 6, CAST(N'2015-09-11T00:00:00.000' AS DateTime), 1862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2289, 6, CAST(N'2015-09-14T00:00:00.000' AS DateTime), 1842.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2290, 6, CAST(N'2015-09-15T00:00:00.000' AS DateTime), 1847.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2291, 6, CAST(N'2015-09-16T00:00:00.000' AS DateTime), 1844.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2292, 6, CAST(N'2015-09-17T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2293, 6, CAST(N'2015-09-18T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2294, 6, CAST(N'2015-09-21T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2295, 6, CAST(N'2015-09-22T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2296, 6, CAST(N'2015-09-23T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2297, 6, CAST(N'2015-09-24T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2298, 6, CAST(N'2015-09-25T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2299, 6, CAST(N'2015-09-28T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2300, 6, CAST(N'2015-09-29T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2301, 6, CAST(N'2015-09-30T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2302, 6, CAST(N'2015-10-08T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2303, 6, CAST(N'2015-10-09T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2304, 6, CAST(N'2015-10-12T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2305, 6, CAST(N'2015-10-13T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2306, 6, CAST(N'2015-10-14T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2307, 6, CAST(N'2015-10-15T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2308, 6, CAST(N'2015-10-16T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2309, 6, CAST(N'2015-10-19T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2310, 6, CAST(N'2015-10-20T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2311, 6, CAST(N'2015-10-21T00:00:00.000' AS DateTime), 1893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2312, 6, CAST(N'2015-10-22T00:00:00.000' AS DateTime), 2091.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2313, 6, CAST(N'2015-10-23T00:00:00.000' AS DateTime), 2091.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2314, 6, CAST(N'2015-10-26T00:00:00.000' AS DateTime), 2091.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2315, 6, CAST(N'2015-10-27T00:00:00.000' AS DateTime), 2080.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2316, 6, CAST(N'2015-10-28T00:00:00.000' AS DateTime), 2080.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2317, 6, CAST(N'2015-10-29T00:00:00.000' AS DateTime), 2054.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2318, 6, CAST(N'2015-10-30T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2319, 6, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2320, 6, CAST(N'2015-11-03T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2321, 6, CAST(N'2015-11-04T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2322, 6, CAST(N'2015-11-05T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2323, 6, CAST(N'2015-11-06T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2324, 6, CAST(N'2015-11-09T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2325, 6, CAST(N'2015-11-10T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2326, 6, CAST(N'2015-11-11T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2327, 6, CAST(N'2015-11-12T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2328, 6, CAST(N'2015-11-13T00:00:00.000' AS DateTime), 2048.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2329, 6, CAST(N'2015-11-16T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2330, 6, CAST(N'2015-11-17T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2331, 6, CAST(N'2015-11-18T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2332, 6, CAST(N'2015-11-19T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2333, 6, CAST(N'2015-11-20T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2334, 6, CAST(N'2015-11-23T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2335, 6, CAST(N'2015-11-24T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2336, 6, CAST(N'2015-11-25T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2337, 6, CAST(N'2015-11-26T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2338, 6, CAST(N'2015-11-27T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2339, 6, CAST(N'2015-11-30T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2340, 6, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2341, 6, CAST(N'2015-12-02T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2342, 6, CAST(N'2015-12-03T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2343, 6, CAST(N'2015-12-04T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2344, 6, CAST(N'2015-12-07T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2345, 6, CAST(N'2015-12-08T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2346, 6, CAST(N'2015-12-09T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2347, 6, CAST(N'2015-12-10T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2348, 6, CAST(N'2015-12-11T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2349, 6, CAST(N'2015-12-14T00:00:00.000' AS DateTime), 1956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2350, 6, CAST(N'2015-12-15T00:00:00.000' AS DateTime), 1825.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2351, 6, CAST(N'2015-12-16T00:00:00.000' AS DateTime), 1825.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2352, 6, CAST(N'2015-12-17T00:00:00.000' AS DateTime), 1817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2353, 6, CAST(N'2015-12-18T00:00:00.000' AS DateTime), 1808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2354, 6, CAST(N'2015-12-21T00:00:00.000' AS DateTime), 1788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2355, 6, CAST(N'2015-12-22T00:00:00.000' AS DateTime), 1781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2356, 6, CAST(N'2015-12-23T00:00:00.000' AS DateTime), 1780.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2357, 6, CAST(N'2015-12-24T00:00:00.000' AS DateTime), 1781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2358, 6, CAST(N'2015-12-25T00:00:00.000' AS DateTime), 1776.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2359, 6, CAST(N'2015-12-28T00:00:00.000' AS DateTime), 1774.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2360, 6, CAST(N'2015-12-29T00:00:00.000' AS DateTime), 1764.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2361, 6, CAST(N'2015-12-30T00:00:00.000' AS DateTime), 1756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2362, 6, CAST(N'2015-12-31T00:00:00.000' AS DateTime), 1726.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2363, 6, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 1729.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2364, 6, CAST(N'2016-01-05T00:00:00.000' AS DateTime), 1732.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2365, 6, CAST(N'2016-01-06T00:00:00.000' AS DateTime), 1735.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2366, 6, CAST(N'2016-01-07T00:00:00.000' AS DateTime), 1773.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2367, 6, CAST(N'2016-01-08T00:00:00.000' AS DateTime), 1764.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2368, 6, CAST(N'2016-01-11T00:00:00.000' AS DateTime), 1760.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2369, 6, CAST(N'2016-01-12T00:00:00.000' AS DateTime), 1741.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2370, 6, CAST(N'2016-01-13T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2371, 6, CAST(N'2016-01-14T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2372, 6, CAST(N'2016-01-15T00:00:00.000' AS DateTime), 1756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2373, 6, CAST(N'2016-01-18T00:00:00.000' AS DateTime), 1748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2374, 6, CAST(N'2016-01-19T00:00:00.000' AS DateTime), 1748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2375, 6, CAST(N'2016-01-20T00:00:00.000' AS DateTime), 1748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2376, 6, CAST(N'2016-01-21T00:00:00.000' AS DateTime), 1748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2377, 6, CAST(N'2016-01-22T00:00:00.000' AS DateTime), 1665.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2378, 6, CAST(N'2016-01-25T00:00:00.000' AS DateTime), 1615.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2379, 6, CAST(N'2016-01-26T00:00:00.000' AS DateTime), 1540.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2380, 6, CAST(N'2016-01-27T00:00:00.000' AS DateTime), 1617.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2381, 6, CAST(N'2016-01-28T00:00:00.000' AS DateTime), 1579.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2382, 6, CAST(N'2016-01-29T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2383, 6, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2384, 6, CAST(N'2016-02-02T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2385, 6, CAST(N'2016-02-03T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2386, 6, CAST(N'2016-02-04T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2387, 6, CAST(N'2016-02-05T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2388, 6, CAST(N'2016-02-15T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2389, 6, CAST(N'2016-02-16T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2390, 6, CAST(N'2016-02-17T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2391, 6, CAST(N'2016-02-18T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2392, 6, CAST(N'2016-02-19T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2393, 6, CAST(N'2016-02-22T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2394, 6, CAST(N'2016-02-23T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2395, 6, CAST(N'2016-02-24T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2396, 6, CAST(N'2016-02-25T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2397, 6, CAST(N'2016-02-26T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2398, 6, CAST(N'2016-02-29T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2399, 6, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2400, 6, CAST(N'2016-03-02T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2401, 6, CAST(N'2016-03-03T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2402, 6, CAST(N'2016-03-04T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2403, 6, CAST(N'2016-03-07T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2404, 6, CAST(N'2016-03-08T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2405, 6, CAST(N'2016-03-09T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2406, 6, CAST(N'2016-03-10T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2407, 6, CAST(N'2016-03-11T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2408, 6, CAST(N'2016-03-14T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2409, 6, CAST(N'2016-03-15T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2410, 6, CAST(N'2016-03-16T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2411, 6, CAST(N'2016-03-17T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2412, 6, CAST(N'2016-03-18T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2413, 6, CAST(N'2016-03-21T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2414, 6, CAST(N'2016-03-22T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2415, 6, CAST(N'2016-03-23T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2416, 6, CAST(N'2016-03-24T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2417, 6, CAST(N'2016-03-25T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2418, 6, CAST(N'2016-03-28T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2419, 6, CAST(N'2016-03-29T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2420, 6, CAST(N'2016-03-30T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2421, 6, CAST(N'2016-03-31T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2422, 6, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2423, 6, CAST(N'2016-04-05T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2424, 6, CAST(N'2016-04-06T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2425, 6, CAST(N'2016-04-07T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2426, 6, CAST(N'2016-04-08T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2427, 6, CAST(N'2016-04-11T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2428, 6, CAST(N'2016-04-12T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2429, 6, CAST(N'2016-04-13T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2430, 6, CAST(N'2016-04-14T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2431, 6, CAST(N'2016-04-15T00:00:00.000' AS DateTime), 1870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2432, 6, CAST(N'2016-04-18T00:00:00.000' AS DateTime), 1869.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2433, 6, CAST(N'2016-04-19T00:00:00.000' AS DateTime), 1871.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2434, 6, CAST(N'2016-04-20T00:00:00.000' AS DateTime), 1866.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2435, 6, CAST(N'2016-04-21T00:00:00.000' AS DateTime), 1888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2436, 6, CAST(N'2016-04-22T00:00:00.000' AS DateTime), 1873.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2437, 6, CAST(N'2016-04-25T00:00:00.000' AS DateTime), 1913.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2438, 6, CAST(N'2016-04-26T00:00:00.000' AS DateTime), 1911.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2439, 6, CAST(N'2016-04-27T00:00:00.000' AS DateTime), 1923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2440, 6, CAST(N'2016-04-28T00:00:00.000' AS DateTime), 1909.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2441, 6, CAST(N'2016-04-29T00:00:00.000' AS DateTime), 1917.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2442, 6, CAST(N'2016-05-03T00:00:00.000' AS DateTime), 1901.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2443, 6, CAST(N'2016-05-04T00:00:00.000' AS DateTime), 1902.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2444, 6, CAST(N'2016-05-05T00:00:00.000' AS DateTime), 1885.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2445, 6, CAST(N'2016-05-06T00:00:00.000' AS DateTime), 1862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2446, 6, CAST(N'2016-05-09T00:00:00.000' AS DateTime), 1873.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2447, 6, CAST(N'2016-05-10T00:00:00.000' AS DateTime), 1873.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2448, 6, CAST(N'2016-05-11T00:00:00.000' AS DateTime), 1883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2449, 6, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2450, 6, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2451, 6, CAST(N'2016-05-16T00:00:00.000' AS DateTime), 1843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2452, 6, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2453, 6, CAST(N'2016-05-18T00:00:00.000' AS DateTime), 1891.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2454, 6, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1832.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2455, 6, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2456, 6, CAST(N'2016-05-23T00:00:00.000' AS DateTime), 1759.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2457, 6, CAST(N'2016-05-24T00:00:00.000' AS DateTime), 1749.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2458, 6, CAST(N'2016-05-25T00:00:00.000' AS DateTime), 1720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2459, 6, CAST(N'2016-05-26T00:00:00.000' AS DateTime), 1723.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2460, 6, CAST(N'2016-05-27T00:00:00.000' AS DateTime), 1721.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2461, 6, CAST(N'2016-05-30T00:00:00.000' AS DateTime), 1762.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2462, 6, CAST(N'2016-05-31T00:00:00.000' AS DateTime), 1796.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2463, 6, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2464, 6, CAST(N'2016-06-02T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2465, 6, CAST(N'2016-06-03T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2466, 6, CAST(N'2016-06-06T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2467, 6, CAST(N'2016-06-07T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2468, 6, CAST(N'2016-06-08T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2469, 6, CAST(N'2016-06-13T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2470, 6, CAST(N'2016-06-14T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2471, 6, CAST(N'2016-06-15T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2472, 6, CAST(N'2016-06-16T00:00:00.000' AS DateTime), 1953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2473, 6, CAST(N'2016-06-17T00:00:00.000' AS DateTime), 1876.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2474, 6, CAST(N'2016-06-20T00:00:00.000' AS DateTime), 1876.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2475, 6, CAST(N'2016-06-21T00:00:00.000' AS DateTime), 1876.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2476, 6, CAST(N'2016-06-22T00:00:00.000' AS DateTime), 1876.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2477, 6, CAST(N'2016-06-23T00:00:00.000' AS DateTime), 1887.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2478, 6, CAST(N'2016-06-24T00:00:00.000' AS DateTime), 1942.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2479, 6, CAST(N'2016-06-27T00:00:00.000' AS DateTime), 1942.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2480, 6, CAST(N'2016-06-28T00:00:00.000' AS DateTime), 1942.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2481, 6, CAST(N'2016-06-29T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2482, 6, CAST(N'2016-06-30T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2483, 6, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2484, 6, CAST(N'2016-07-04T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2485, 6, CAST(N'2016-07-05T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2486, 6, CAST(N'2016-07-06T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2487, 6, CAST(N'2016-07-07T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2488, 6, CAST(N'2016-07-08T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2489, 6, CAST(N'2016-07-11T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2490, 6, CAST(N'2016-07-12T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2491, 6, CAST(N'2016-07-13T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2492, 6, CAST(N'2016-07-14T00:00:00.000' AS DateTime), 1949.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2493, 6, CAST(N'2016-07-15T00:00:00.000' AS DateTime), 2025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2494, 6, CAST(N'2016-07-18T00:00:00.000' AS DateTime), 1924.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2495, 6, CAST(N'2016-07-19T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2496, 6, CAST(N'2016-07-20T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2497, 6, CAST(N'2016-07-21T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2498, 6, CAST(N'2016-07-22T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2499, 6, CAST(N'2016-07-25T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2500, 6, CAST(N'2016-07-26T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2501, 6, CAST(N'2016-07-27T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2502, 6, CAST(N'2016-07-28T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2503, 6, CAST(N'2016-07-29T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2504, 6, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1966.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2505, 6, CAST(N'2016-08-02T00:00:00.000' AS DateTime), 1984.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2506, 6, CAST(N'2016-08-03T00:00:00.000' AS DateTime), 1978.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2507, 6, CAST(N'2016-08-04T00:00:00.000' AS DateTime), 1972.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2508, 6, CAST(N'2016-08-05T00:00:00.000' AS DateTime), 1971.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2509, 6, CAST(N'2016-08-08T00:00:00.000' AS DateTime), 1971.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2510, 6, CAST(N'2016-08-09T00:00:00.000' AS DateTime), 1976.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2511, 6, CAST(N'2016-08-10T00:00:00.000' AS DateTime), 1987.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2512, 6, CAST(N'2016-08-11T00:00:00.000' AS DateTime), 1983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2513, 6, CAST(N'2016-08-12T00:00:00.000' AS DateTime), 1992.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2514, 6, CAST(N'2016-08-15T00:00:00.000' AS DateTime), 1921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2515, 6, CAST(N'2016-08-16T00:00:00.000' AS DateTime), 1920.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2516, 6, CAST(N'2016-08-17T00:00:00.000' AS DateTime), 1915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2517, 6, CAST(N'2016-08-18T00:00:00.000' AS DateTime), 1907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2518, 6, CAST(N'2016-08-19T00:00:00.000' AS DateTime), 1905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2519, 6, CAST(N'2016-08-22T00:00:00.000' AS DateTime), 1889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2520, 6, CAST(N'2016-08-23T00:00:00.000' AS DateTime), 1875.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2521, 6, CAST(N'2016-08-24T00:00:00.000' AS DateTime), 1875.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2522, 6, CAST(N'2016-08-25T00:00:00.000' AS DateTime), 1869.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2523, 6, CAST(N'2016-08-26T00:00:00.000' AS DateTime), 1863.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2524, 6, CAST(N'2016-08-29T00:00:00.000' AS DateTime), 1860.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2525, 6, CAST(N'2016-08-30T00:00:00.000' AS DateTime), 1852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2526, 6, CAST(N'2016-08-31T00:00:00.000' AS DateTime), 1838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2527, 6, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2528, 6, CAST(N'2016-09-02T00:00:00.000' AS DateTime), 1868.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2529, 6, CAST(N'2016-09-05T00:00:00.000' AS DateTime), 1873.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2530, 6, CAST(N'2016-09-06T00:00:00.000' AS DateTime), 1867.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2531, 6, CAST(N'2016-09-07T00:00:00.000' AS DateTime), 1861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2532, 6, CAST(N'2016-09-08T00:00:00.000' AS DateTime), 1875.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2533, 6, CAST(N'2016-09-09T00:00:00.000' AS DateTime), 1863.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2534, 6, CAST(N'2016-09-12T00:00:00.000' AS DateTime), 1878.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2535, 6, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2536, 6, CAST(N'2016-09-14T00:00:00.000' AS DateTime), 1889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2537, 6, CAST(N'2016-09-19T00:00:00.000' AS DateTime), 1979.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2538, 6, CAST(N'2016-09-20T00:00:00.000' AS DateTime), 1979.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2539, 6, CAST(N'2016-09-21T00:00:00.000' AS DateTime), 1963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2540, 6, CAST(N'2016-09-22T00:00:00.000' AS DateTime), 1963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2541, 6, CAST(N'2016-09-23T00:00:00.000' AS DateTime), 1963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2542, 6, CAST(N'2016-09-26T00:00:00.000' AS DateTime), 2013.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2543, 6, CAST(N'2016-09-27T00:00:00.000' AS DateTime), 2005.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2544, 6, CAST(N'2016-09-28T00:00:00.000' AS DateTime), 2005.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2545, 6, CAST(N'2016-09-29T00:00:00.000' AS DateTime), 2005.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2546, 6, CAST(N'2016-09-30T00:00:00.000' AS DateTime), 2008.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2547, 6, CAST(N'2016-10-10T00:00:00.000' AS DateTime), 2091.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2548, 6, CAST(N'2016-10-11T00:00:00.000' AS DateTime), 2149.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2549, 6, CAST(N'2016-10-12T00:00:00.000' AS DateTime), 2142.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2550, 6, CAST(N'2016-10-13T00:00:00.000' AS DateTime), 2141.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2551, 6, CAST(N'2016-10-14T00:00:00.000' AS DateTime), 2156.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2552, 6, CAST(N'2016-10-17T00:00:00.000' AS DateTime), 2161.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2553, 6, CAST(N'2016-10-18T00:00:00.000' AS DateTime), 2168.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2554, 6, CAST(N'2016-10-19T00:00:00.000' AS DateTime), 2195.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2555, 6, CAST(N'2016-10-20T00:00:00.000' AS DateTime), 2183.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2556, 6, CAST(N'2016-10-21T00:00:00.000' AS DateTime), 2149.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2557, 6, CAST(N'2016-10-24T00:00:00.000' AS DateTime), 2163.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2558, 6, CAST(N'2016-10-25T00:00:00.000' AS DateTime), 2217.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2559, 6, CAST(N'2016-10-26T00:00:00.000' AS DateTime), 2242.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2560, 6, CAST(N'2016-10-27T00:00:00.000' AS DateTime), 2242.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2561, 6, CAST(N'2016-10-28T00:00:00.000' AS DateTime), 2271.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2562, 6, CAST(N'2016-10-31T00:00:00.000' AS DateTime), 2337.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2563, 6, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 2370.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2564, 6, CAST(N'2016-11-02T00:00:00.000' AS DateTime), 2343.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2565, 6, CAST(N'2016-11-03T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2566, 6, CAST(N'2016-11-04T00:00:00.000' AS DateTime), 2318.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2567, 6, CAST(N'2016-11-07T00:00:00.000' AS DateTime), 2301.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2568, 6, CAST(N'2016-11-08T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2569, 6, CAST(N'2016-11-09T00:00:00.000' AS DateTime), 2338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2570, 6, CAST(N'2016-11-10T00:00:00.000' AS DateTime), 2323.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2571, 6, CAST(N'2016-11-11T00:00:00.000' AS DateTime), 2368.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2572, 6, CAST(N'2016-11-14T00:00:00.000' AS DateTime), 2313.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2573, 6, CAST(N'2016-11-15T00:00:00.000' AS DateTime), 2325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2574, 6, CAST(N'2016-11-16T00:00:00.000' AS DateTime), 2325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2575, 6, CAST(N'2016-11-17T00:00:00.000' AS DateTime), 2369.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2576, 6, CAST(N'2016-11-18T00:00:00.000' AS DateTime), 2415.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2577, 6, CAST(N'2016-11-21T00:00:00.000' AS DateTime), 2481.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2578, 6, CAST(N'2016-11-22T00:00:00.000' AS DateTime), 2516.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2579, 6, CAST(N'2016-11-23T00:00:00.000' AS DateTime), 2517.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2580, 6, CAST(N'2016-11-24T00:00:00.000' AS DateTime), 2568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2581, 6, CAST(N'2016-11-25T00:00:00.000' AS DateTime), 2561.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2582, 6, CAST(N'2016-11-28T00:00:00.000' AS DateTime), 2583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2583, 6, CAST(N'2016-11-29T00:00:00.000' AS DateTime), 2572.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2584, 6, CAST(N'2016-11-30T00:00:00.000' AS DateTime), 2526.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2585, 6, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2586, 6, CAST(N'2016-12-02T00:00:00.000' AS DateTime), 2578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2587, 6, CAST(N'2016-12-05T00:00:00.000' AS DateTime), 2669.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2588, 6, CAST(N'2016-12-06T00:00:00.000' AS DateTime), 2761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2589, 6, CAST(N'2016-12-07T00:00:00.000' AS DateTime), 2852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2590, 6, CAST(N'2016-12-08T00:00:00.000' AS DateTime), 2881.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2591, 6, CAST(N'2016-12-09T00:00:00.000' AS DateTime), 2885.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2592, 6, CAST(N'2016-12-12T00:00:00.000' AS DateTime), 2946.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2593, 6, CAST(N'2016-12-13T00:00:00.000' AS DateTime), 2922.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2594, 6, CAST(N'2016-12-14T00:00:00.000' AS DateTime), 2984.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2595, 6, CAST(N'2016-12-15T00:00:00.000' AS DateTime), 2996.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2596, 6, CAST(N'2016-12-16T00:00:00.000' AS DateTime), 3064.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2597, 6, CAST(N'2016-12-19T00:00:00.000' AS DateTime), 2997.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2598, 6, CAST(N'2016-12-20T00:00:00.000' AS DateTime), 2881.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2599, 6, CAST(N'2016-12-21T00:00:00.000' AS DateTime), 2915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2600, 6, CAST(N'2016-12-22T00:00:00.000' AS DateTime), 2943.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2601, 6, CAST(N'2016-12-23T00:00:00.000' AS DateTime), 2957.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2602, 6, CAST(N'2016-12-26T00:00:00.000' AS DateTime), 2941.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2603, 6, CAST(N'2016-12-27T00:00:00.000' AS DateTime), 2943.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2604, 6, CAST(N'2016-12-28T00:00:00.000' AS DateTime), 2963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2605, 6, CAST(N'2016-12-29T00:00:00.000' AS DateTime), 2962.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2606, 6, CAST(N'2016-12-30T00:00:00.000' AS DateTime), 2906.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2607, 6, CAST(N'2017-01-03T00:00:00.000' AS DateTime), 2856.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2608, 6, CAST(N'2017-01-05T00:00:00.000' AS DateTime), 2890.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2609, 6, CAST(N'2017-01-06T00:00:00.000' AS DateTime), 2880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2610, 6, CAST(N'2017-01-09T00:00:00.000' AS DateTime), 2883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2611, 6, CAST(N'2017-01-10T00:00:00.000' AS DateTime), 2860.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2612, 6, CAST(N'2017-01-11T00:00:00.000' AS DateTime), 2843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2613, 6, CAST(N'2017-01-12T00:00:00.000' AS DateTime), 2841.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2614, 6, CAST(N'2017-01-13T00:00:00.000' AS DateTime), 2815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2615, 6, CAST(N'2017-01-16T00:00:00.000' AS DateTime), 2878.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2616, 6, CAST(N'2017-01-17T00:00:00.000' AS DateTime), 2753.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2617, 6, CAST(N'2017-01-18T00:00:00.000' AS DateTime), 2745.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2618, 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 2882.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2619, 6, CAST(N'2017-01-20T00:00:00.000' AS DateTime), 2850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2620, 6, CAST(N'2017-01-23T00:00:00.000' AS DateTime), 2750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2621, 6, CAST(N'2017-01-24T00:00:00.000' AS DateTime), 2707.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2622, 6, CAST(N'2017-01-25T00:00:00.000' AS DateTime), 2738.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2623, 6, CAST(N'2017-01-26T00:00:00.000' AS DateTime), 2580.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2624, 6, CAST(N'2017-02-03T00:00:00.000' AS DateTime), 2581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2625, 6, CAST(N'2017-02-06T00:00:00.000' AS DateTime), 2583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2626, 6, CAST(N'2017-02-07T00:00:00.000' AS DateTime), 2609.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2627, 6, CAST(N'2017-02-08T00:00:00.000' AS DateTime), 2596.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2628, 6, CAST(N'2017-02-09T00:00:00.000' AS DateTime), 2604.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2629, 6, CAST(N'2017-02-10T00:00:00.000' AS DateTime), 2584.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2630, 6, CAST(N'2017-02-13T00:00:00.000' AS DateTime), 2660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2631, 6, CAST(N'2017-02-14T00:00:00.000' AS DateTime), 2699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2632, 6, CAST(N'2017-02-15T00:00:00.000' AS DateTime), 2734.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2633, 6, CAST(N'2017-02-16T00:00:00.000' AS DateTime), 2718.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2634, 6, CAST(N'2017-02-17T00:00:00.000' AS DateTime), 2833.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2635, 6, CAST(N'2017-02-20T00:00:00.000' AS DateTime), 2944.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2636, 6, CAST(N'2017-02-21T00:00:00.000' AS DateTime), 2944.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2637, 6, CAST(N'2017-02-22T00:00:00.000' AS DateTime), 2886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2638, 6, CAST(N'2017-02-23T00:00:00.000' AS DateTime), 2886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2639, 6, CAST(N'2017-02-24T00:00:00.000' AS DateTime), 2886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2640, 6, CAST(N'2017-02-27T00:00:00.000' AS DateTime), 3029.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2641, 6, CAST(N'2017-02-28T00:00:00.000' AS DateTime), 3008.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2642, 6, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 3159.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2643, 6, CAST(N'2017-03-02T00:00:00.000' AS DateTime), 3135.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2644, 6, CAST(N'2017-03-03T00:00:00.000' AS DateTime), 3121.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2645, 6, CAST(N'2017-03-06T00:00:00.000' AS DateTime), 3122.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2646, 6, CAST(N'2017-03-07T00:00:00.000' AS DateTime), 3112.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2647, 6, CAST(N'2017-03-08T00:00:00.000' AS DateTime), 3068.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2648, 6, CAST(N'2017-03-09T00:00:00.000' AS DateTime), 2994.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2649, 6, CAST(N'2017-03-10T00:00:00.000' AS DateTime), 2987.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2650, 6, CAST(N'2017-03-13T00:00:00.000' AS DateTime), 2920.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2651, 6, CAST(N'2017-03-14T00:00:00.000' AS DateTime), 2936.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2652, 6, CAST(N'2017-03-15T00:00:00.000' AS DateTime), 2718.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2653, 6, CAST(N'2017-03-16T00:00:00.000' AS DateTime), 2714.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2654, 6, CAST(N'2017-03-17T00:00:00.000' AS DateTime), 2698.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2655, 6, CAST(N'2017-03-20T00:00:00.000' AS DateTime), 2678.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2656, 6, CAST(N'2017-03-21T00:00:00.000' AS DateTime), 2626.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2657, 6, CAST(N'2017-03-22T00:00:00.000' AS DateTime), 2568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2658, 6, CAST(N'2017-03-23T00:00:00.000' AS DateTime), 2546.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2659, 6, CAST(N'2017-03-24T00:00:00.000' AS DateTime), 2560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2660, 6, CAST(N'2017-03-27T00:00:00.000' AS DateTime), 2522.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2661, 6, CAST(N'2017-03-28T00:00:00.000' AS DateTime), 2578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2662, 6, CAST(N'2017-03-29T00:00:00.000' AS DateTime), 2583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2663, 6, CAST(N'2017-03-30T00:00:00.000' AS DateTime), 2576.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2664, 6, CAST(N'2017-03-31T00:00:00.000' AS DateTime), 2604.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2665, 6, CAST(N'2017-04-05T00:00:00.000' AS DateTime), 2625.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2666, 6, CAST(N'2017-04-06T00:00:00.000' AS DateTime), 2670.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2667, 6, CAST(N'2017-04-07T00:00:00.000' AS DateTime), 2653.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2668, 6, CAST(N'2017-04-10T00:00:00.000' AS DateTime), 2569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2669, 6, CAST(N'2017-04-11T00:00:00.000' AS DateTime), 2548.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2670, 6, CAST(N'2017-04-12T00:00:00.000' AS DateTime), 2506.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2671, 6, CAST(N'2017-04-13T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2672, 6, CAST(N'2017-04-14T00:00:00.000' AS DateTime), 2465.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2673, 6, CAST(N'2017-04-17T00:00:00.000' AS DateTime), 2439.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2674, 6, CAST(N'2017-04-18T00:00:00.000' AS DateTime), 2409.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2675, 6, CAST(N'2017-04-19T00:00:00.000' AS DateTime), 2531.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2676, 6, CAST(N'2017-04-20T00:00:00.000' AS DateTime), 2528.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2677, 6, CAST(N'2017-04-21T00:00:00.000' AS DateTime), 2531.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2678, 6, CAST(N'2017-04-24T00:00:00.000' AS DateTime), 2499.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2679, 6, CAST(N'2017-04-25T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2680, 6, CAST(N'2017-04-26T00:00:00.000' AS DateTime), 2496.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2681, 6, CAST(N'2017-04-27T00:00:00.000' AS DateTime), 2512.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2682, 6, CAST(N'2017-04-28T00:00:00.000' AS DateTime), 2500.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2683, 6, CAST(N'2017-05-02T00:00:00.000' AS DateTime), 2476.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2684, 6, CAST(N'2017-05-03T00:00:00.000' AS DateTime), 2479.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2685, 6, CAST(N'2017-05-04T00:00:00.000' AS DateTime), 2450.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2686, 6, CAST(N'2017-05-05T00:00:00.000' AS DateTime), 2354.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2687, 6, CAST(N'2017-05-08T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2688, 6, CAST(N'2017-05-09T00:00:00.000' AS DateTime), 2345.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2689, 6, CAST(N'2017-05-10T00:00:00.000' AS DateTime), 2311.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2690, 6, CAST(N'2017-05-11T00:00:00.000' AS DateTime), 2310.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2691, 6, CAST(N'2017-05-12T00:00:00.000' AS DateTime), 2280.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2692, 6, CAST(N'2017-05-15T00:00:00.000' AS DateTime), 2280.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2693, 6, CAST(N'2017-05-16T00:00:00.000' AS DateTime), 2322.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2694, 6, CAST(N'2017-05-17T00:00:00.000' AS DateTime), 2367.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2695, 6, CAST(N'2017-05-18T00:00:00.000' AS DateTime), 2347.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2696, 6, CAST(N'2017-05-19T00:00:00.000' AS DateTime), 2409.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2697, 6, CAST(N'2017-05-22T00:00:00.000' AS DateTime), 2528.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2698, 6, CAST(N'2017-05-23T00:00:00.000' AS DateTime), 2513.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2699, 6, CAST(N'2017-05-24T00:00:00.000' AS DateTime), 2482.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2700, 6, CAST(N'2017-05-25T00:00:00.000' AS DateTime), 2399.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2701, 6, CAST(N'2017-05-26T00:00:00.000' AS DateTime), 2543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2702, 6, CAST(N'2017-05-31T00:00:00.000' AS DateTime), 2543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2703, 6, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 2477.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2704, 6, CAST(N'2017-06-02T00:00:00.000' AS DateTime), 2473.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2705, 6, CAST(N'2017-06-05T00:00:00.000' AS DateTime), 2460.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2706, 6, CAST(N'2017-06-06T00:00:00.000' AS DateTime), 2497.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2707, 6, CAST(N'2017-06-07T00:00:00.000' AS DateTime), 2523.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2708, 6, CAST(N'2017-06-08T00:00:00.000' AS DateTime), 2533.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2709, 6, CAST(N'2017-06-09T00:00:00.000' AS DateTime), 2557.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2710, 6, CAST(N'2017-06-12T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2711, 6, CAST(N'2017-06-13T00:00:00.000' AS DateTime), 2555.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2712, 6, CAST(N'2017-06-14T00:00:00.000' AS DateTime), 2525.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2713, 6, CAST(N'2017-06-15T00:00:00.000' AS DateTime), 2325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2714, 6, CAST(N'2017-06-16T00:00:00.000' AS DateTime), 2338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2715, 6, CAST(N'2017-06-19T00:00:00.000' AS DateTime), 2385.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2716, 6, CAST(N'2017-06-20T00:00:00.000' AS DateTime), 2388.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2717, 6, CAST(N'2017-06-21T00:00:00.000' AS DateTime), 2305.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2718, 6, CAST(N'2017-06-22T00:00:00.000' AS DateTime), 2333.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2719, 6, CAST(N'2017-06-23T00:00:00.000' AS DateTime), 2337.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2720, 6, CAST(N'2017-06-26T00:00:00.000' AS DateTime), 2327.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2721, 6, CAST(N'2017-06-27T00:00:00.000' AS DateTime), 2314.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2722, 6, CAST(N'2017-06-28T00:00:00.000' AS DateTime), 2325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2723, 6, CAST(N'2017-06-29T00:00:00.000' AS DateTime), 2353.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2724, 6, CAST(N'2017-06-30T00:00:00.000' AS DateTime), 2379.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2725, 6, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 2406.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2726, 6, CAST(N'2017-07-04T00:00:00.000' AS DateTime), 2402.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2727, 6, CAST(N'2017-07-05T00:00:00.000' AS DateTime), 2422.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2728, 6, CAST(N'2017-07-06T00:00:00.000' AS DateTime), 2448.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2729, 6, CAST(N'2017-07-07T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2730, 6, CAST(N'2017-07-10T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2731, 6, CAST(N'2017-07-11T00:00:00.000' AS DateTime), 2509.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2732, 6, CAST(N'2017-07-12T00:00:00.000' AS DateTime), 2517.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2733, 6, CAST(N'2017-07-13T00:00:00.000' AS DateTime), 2483.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2734, 6, CAST(N'2017-07-14T00:00:00.000' AS DateTime), 2504.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2735, 6, CAST(N'2017-07-17T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2736, 6, CAST(N'2017-07-18T00:00:00.000' AS DateTime), 2702.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2737, 6, CAST(N'2017-07-19T00:00:00.000' AS DateTime), 2702.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2738, 6, CAST(N'2017-07-20T00:00:00.000' AS DateTime), 2838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2739, 6, CAST(N'2017-07-21T00:00:00.000' AS DateTime), 2765.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2740, 6, CAST(N'2017-07-24T00:00:00.000' AS DateTime), 2628.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2741, 6, CAST(N'2017-07-25T00:00:00.000' AS DateTime), 2623.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2742, 6, CAST(N'2017-07-26T00:00:00.000' AS DateTime), 2681.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2743, 6, CAST(N'2017-07-27T00:00:00.000' AS DateTime), 2740.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2744, 6, CAST(N'2017-07-28T00:00:00.000' AS DateTime), 2804.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2745, 6, CAST(N'2017-07-31T00:00:00.000' AS DateTime), 2805.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2746, 6, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 2851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2747, 6, CAST(N'2017-08-02T00:00:00.000' AS DateTime), 2863.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2748, 6, CAST(N'2017-08-03T00:00:00.000' AS DateTime), 2870.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2749, 6, CAST(N'2017-08-04T00:00:00.000' AS DateTime), 2907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2750, 6, CAST(N'2017-08-07T00:00:00.000' AS DateTime), 2928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2751, 6, CAST(N'2017-08-08T00:00:00.000' AS DateTime), 2969.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2752, 6, CAST(N'2017-08-09T00:00:00.000' AS DateTime), 3013.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2753, 6, CAST(N'2017-08-10T00:00:00.000' AS DateTime), 3018.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2754, 6, CAST(N'2017-08-11T00:00:00.000' AS DateTime), 2986.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2755, 6, CAST(N'2017-08-14T00:00:00.000' AS DateTime), 2966.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2756, 6, CAST(N'2017-08-15T00:00:00.000' AS DateTime), 2470.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2757, 6, CAST(N'2017-08-16T00:00:00.000' AS DateTime), 2471.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2758, 6, CAST(N'2017-08-17T00:00:00.000' AS DateTime), 2533.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2759, 6, CAST(N'2017-08-18T00:00:00.000' AS DateTime), 2549.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2760, 6, CAST(N'2017-08-21T00:00:00.000' AS DateTime), 2578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2761, 6, CAST(N'2017-08-22T00:00:00.000' AS DateTime), 2584.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2762, 6, CAST(N'2017-08-23T00:00:00.000' AS DateTime), 2620.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2763, 6, CAST(N'2017-08-24T00:00:00.000' AS DateTime), 2603.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2764, 6, CAST(N'2017-08-25T00:00:00.000' AS DateTime), 2604.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2765, 6, CAST(N'2017-08-28T00:00:00.000' AS DateTime), 2619.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2766, 6, CAST(N'2017-08-29T00:00:00.000' AS DateTime), 2685.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2767, 6, CAST(N'2017-08-30T00:00:00.000' AS DateTime), 2737.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2768, 6, CAST(N'2017-08-31T00:00:00.000' AS DateTime), 2762.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2769, 6, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 2800.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2770, 6, CAST(N'2017-09-04T00:00:00.000' AS DateTime), 2888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2771, 6, CAST(N'2017-09-05T00:00:00.000' AS DateTime), 2813.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2772, 6, CAST(N'2017-09-06T00:00:00.000' AS DateTime), 2859.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2773, 6, CAST(N'2017-09-07T00:00:00.000' AS DateTime), 2819.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2774, 6, CAST(N'2017-09-08T00:00:00.000' AS DateTime), 2827.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2775, 6, CAST(N'2017-09-11T00:00:00.000' AS DateTime), 2780.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2776, 6, CAST(N'2017-09-12T00:00:00.000' AS DateTime), 2850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2777, 6, CAST(N'2017-09-13T00:00:00.000' AS DateTime), 2960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2778, 6, CAST(N'2017-09-14T00:00:00.000' AS DateTime), 2905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2779, 6, CAST(N'2017-09-15T00:00:00.000' AS DateTime), 2695.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2780, 6, CAST(N'2017-09-18T00:00:00.000' AS DateTime), 2695.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2781, 6, CAST(N'2017-09-19T00:00:00.000' AS DateTime), 2690.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2782, 6, CAST(N'2017-09-20T00:00:00.000' AS DateTime), 2690.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2783, 6, CAST(N'2017-09-21T00:00:00.000' AS DateTime), 2653.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2784, 6, CAST(N'2017-09-22T00:00:00.000' AS DateTime), 2637.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2785, 6, CAST(N'2017-09-25T00:00:00.000' AS DateTime), 2637.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2786, 6, CAST(N'2017-09-26T00:00:00.000' AS DateTime), 2576.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2787, 6, CAST(N'2017-09-27T00:00:00.000' AS DateTime), 2566.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2788, 6, CAST(N'2017-09-28T00:00:00.000' AS DateTime), 2566.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2789, 6, CAST(N'2017-09-29T00:00:00.000' AS DateTime), 2387.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2790, 6, CAST(N'2017-10-09T00:00:00.000' AS DateTime), 2426.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2791, 6, CAST(N'2017-10-10T00:00:00.000' AS DateTime), 2390.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2792, 6, CAST(N'2017-10-11T00:00:00.000' AS DateTime), 2352.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2793, 6, CAST(N'2017-10-12T00:00:00.000' AS DateTime), 2294.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2794, 6, CAST(N'2017-10-13T00:00:00.000' AS DateTime), 2325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2795, 6, CAST(N'2017-10-16T00:00:00.000' AS DateTime), 2361.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2796, 6, CAST(N'2017-10-17T00:00:00.000' AS DateTime), 2367.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2797, 6, CAST(N'2017-10-18T00:00:00.000' AS DateTime), 2400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2798, 6, CAST(N'2017-10-19T00:00:00.000' AS DateTime), 2364.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2799, 6, CAST(N'2017-10-20T00:00:00.000' AS DateTime), 2384.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2800, 6, CAST(N'2017-10-23T00:00:00.000' AS DateTime), 2696.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2801, 6, CAST(N'2017-10-24T00:00:00.000' AS DateTime), 2696.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2802, 6, CAST(N'2017-10-25T00:00:00.000' AS DateTime), 2696.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2803, 6, CAST(N'2017-10-26T00:00:00.000' AS DateTime), 2696.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2804, 6, CAST(N'2017-10-27T00:00:00.000' AS DateTime), 2662.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2805, 6, CAST(N'2017-10-30T00:00:00.000' AS DateTime), 2577.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2806, 6, CAST(N'2017-10-31T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2807, 6, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 2644.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2808, 6, CAST(N'2017-11-02T00:00:00.000' AS DateTime), 2675.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2809, 6, CAST(N'2017-11-03T00:00:00.000' AS DateTime), 2721.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2810, 6, CAST(N'2017-11-06T00:00:00.000' AS DateTime), 2776.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2811, 6, CAST(N'2017-11-07T00:00:00.000' AS DateTime), 2789.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2812, 6, CAST(N'2017-11-08T00:00:00.000' AS DateTime), 2797.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2813, 6, CAST(N'2017-11-09T00:00:00.000' AS DateTime), 2816.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2814, 6, CAST(N'2017-11-10T00:00:00.000' AS DateTime), 2798.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2815, 6, CAST(N'2017-11-13T00:00:00.000' AS DateTime), 2815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2816, 6, CAST(N'2017-11-14T00:00:00.000' AS DateTime), 2856.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2817, 6, CAST(N'2017-11-15T00:00:00.000' AS DateTime), 2818.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2818, 6, CAST(N'2017-11-16T00:00:00.000' AS DateTime), 2804.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2819, 6, CAST(N'2017-11-17T00:00:00.000' AS DateTime), 2834.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2820, 6, CAST(N'2017-11-20T00:00:00.000' AS DateTime), 2878.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2821, 6, CAST(N'2017-11-21T00:00:00.000' AS DateTime), 2926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2822, 6, CAST(N'2017-11-22T00:00:00.000' AS DateTime), 2960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2823, 6, CAST(N'2017-11-23T00:00:00.000' AS DateTime), 2944.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2824, 6, CAST(N'2017-11-24T00:00:00.000' AS DateTime), 2936.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2825, 6, CAST(N'2017-11-27T00:00:00.000' AS DateTime), 2921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2826, 6, CAST(N'2017-11-28T00:00:00.000' AS DateTime), 2837.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2827, 6, CAST(N'2017-11-29T00:00:00.000' AS DateTime), 2851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2828, 6, CAST(N'2017-11-30T00:00:00.000' AS DateTime), 2910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2829, 6, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 2892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2830, 6, CAST(N'2017-12-04T00:00:00.000' AS DateTime), 2979.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2831, 6, CAST(N'2017-12-05T00:00:00.000' AS DateTime), 3127.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2832, 6, CAST(N'2017-12-06T00:00:00.000' AS DateTime), 3155.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2833, 6, CAST(N'2017-12-07T00:00:00.000' AS DateTime), 3119.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2834, 6, CAST(N'2017-12-08T00:00:00.000' AS DateTime), 3076.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2835, 6, CAST(N'2017-12-11T00:00:00.000' AS DateTime), 3166.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2836, 6, CAST(N'2017-12-12T00:00:00.000' AS DateTime), 3189.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2837, 6, CAST(N'2017-12-13T00:00:00.000' AS DateTime), 3231.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2838, 6, CAST(N'2017-12-14T00:00:00.000' AS DateTime), 3215.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2839, 6, CAST(N'2017-12-15T00:00:00.000' AS DateTime), 3245.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2840, 6, CAST(N'2017-12-18T00:00:00.000' AS DateTime), 3241.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2841, 6, CAST(N'2017-12-19T00:00:00.000' AS DateTime), 3268.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2842, 6, CAST(N'2017-12-20T00:00:00.000' AS DateTime), 3338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2843, 6, CAST(N'2017-12-21T00:00:00.000' AS DateTime), 3287.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2844, 6, CAST(N'2017-12-22T00:00:00.000' AS DateTime), 3291.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2845, 6, CAST(N'2017-12-25T00:00:00.000' AS DateTime), 3262.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2846, 6, CAST(N'2017-12-26T00:00:00.000' AS DateTime), 3223.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2847, 6, CAST(N'2017-12-27T00:00:00.000' AS DateTime), 3180.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2848, 6, CAST(N'2017-12-28T00:00:00.000' AS DateTime), 3110.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2849, 6, CAST(N'2017-12-29T00:00:00.000' AS DateTime), 3172.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2850, 6, CAST(N'2018-01-02T00:00:00.000' AS DateTime), 3272.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2851, 6, CAST(N'2018-01-03T00:00:00.000' AS DateTime), 3290.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2852, 6, CAST(N'2018-01-04T00:00:00.000' AS DateTime), 3298.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2853, 6, CAST(N'2018-01-05T00:00:00.000' AS DateTime), 3380.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2854, 6, CAST(N'2018-01-08T00:00:00.000' AS DateTime), 3543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2855, 6, CAST(N'2018-01-09T00:00:00.000' AS DateTime), 3627.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2856, 6, CAST(N'2018-01-10T00:00:00.000' AS DateTime), 3448.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2857, 6, CAST(N'2018-01-11T00:00:00.000' AS DateTime), 3536.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2858, 6, CAST(N'2018-01-12T00:00:00.000' AS DateTime), 3549.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2859, 6, CAST(N'2018-01-15T00:00:00.000' AS DateTime), 3535.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2860, 6, CAST(N'2018-01-16T00:00:00.000' AS DateTime), 3003.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2861, 6, CAST(N'2018-01-17T00:00:00.000' AS DateTime), 2970.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2862, 6, CAST(N'2018-01-18T00:00:00.000' AS DateTime), 2960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2863, 6, CAST(N'2018-01-19T00:00:00.000' AS DateTime), 2930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2864, 6, CAST(N'2018-01-22T00:00:00.000' AS DateTime), 2930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2865, 6, CAST(N'2018-01-23T00:00:00.000' AS DateTime), 2945.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2866, 6, CAST(N'2018-01-24T00:00:00.000' AS DateTime), 2913.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2867, 6, CAST(N'2018-01-25T00:00:00.000' AS DateTime), 2892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2868, 6, CAST(N'2018-01-26T00:00:00.000' AS DateTime), 2901.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2869, 6, CAST(N'2018-01-29T00:00:00.000' AS DateTime), 2939.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2870, 6, CAST(N'2018-01-30T00:00:00.000' AS DateTime), 2904.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2871, 6, CAST(N'2018-01-31T00:00:00.000' AS DateTime), 2923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2872, 6, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 2923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2873, 6, CAST(N'2018-02-02T00:00:00.000' AS DateTime), 2923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2874, 6, CAST(N'2018-02-05T00:00:00.000' AS DateTime), 2923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2875, 6, CAST(N'2018-02-06T00:00:00.000' AS DateTime), 2923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2876, 6, CAST(N'2018-02-07T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2877, 6, CAST(N'2018-02-08T00:00:00.000' AS DateTime), 2950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2878, 6, CAST(N'2018-02-09T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2879, 6, CAST(N'2018-02-12T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2880, 6, CAST(N'2018-02-13T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2881, 6, CAST(N'2018-02-14T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2882, 6, CAST(N'2018-02-22T00:00:00.000' AS DateTime), 2851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2883, 6, CAST(N'2018-02-23T00:00:00.000' AS DateTime), 2859.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2884, 6, CAST(N'2018-02-26T00:00:00.000' AS DateTime), 2841.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2885, 6, CAST(N'2018-02-27T00:00:00.000' AS DateTime), 2818.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2886, 6, CAST(N'2018-02-28T00:00:00.000' AS DateTime), 2757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2887, 6, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 2751.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2888, 6, CAST(N'2018-03-02T00:00:00.000' AS DateTime), 2751.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2889, 6, CAST(N'2018-03-05T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2890, 6, CAST(N'2018-03-06T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2891, 6, CAST(N'2018-03-07T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2892, 6, CAST(N'2018-03-08T00:00:00.000' AS DateTime), 2708.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2893, 6, CAST(N'2018-03-09T00:00:00.000' AS DateTime), 2724.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2894, 6, CAST(N'2018-03-12T00:00:00.000' AS DateTime), 2741.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2895, 6, CAST(N'2018-03-13T00:00:00.000' AS DateTime), 2761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2896, 6, CAST(N'2018-03-14T00:00:00.000' AS DateTime), 2779.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2897, 6, CAST(N'2018-03-15T00:00:00.000' AS DateTime), 2684.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2898, 6, CAST(N'2018-03-16T00:00:00.000' AS DateTime), 2667.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2899, 6, CAST(N'2018-03-19T00:00:00.000' AS DateTime), 2699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2900, 6, CAST(N'2018-03-20T00:00:00.000' AS DateTime), 2723.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2901, 6, CAST(N'2018-03-21T00:00:00.000' AS DateTime), 2726.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2902, 6, CAST(N'2018-03-22T00:00:00.000' AS DateTime), 2749.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2903, 6, CAST(N'2018-03-23T00:00:00.000' AS DateTime), 2697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2904, 6, CAST(N'2018-03-26T00:00:00.000' AS DateTime), 2672.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2905, 6, CAST(N'2018-03-27T00:00:00.000' AS DateTime), 2631.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2906, 6, CAST(N'2018-03-28T00:00:00.000' AS DateTime), 2635.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2907, 6, CAST(N'2018-03-29T00:00:00.000' AS DateTime), 2623.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2908, 6, CAST(N'2018-03-30T00:00:00.000' AS DateTime), 2640.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2909, 6, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 2648.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2910, 6, CAST(N'2018-04-03T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2911, 6, CAST(N'2018-04-04T00:00:00.000' AS DateTime), 2609.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2912, 6, CAST(N'2018-04-09T00:00:00.000' AS DateTime), 2680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2913, 6, CAST(N'2018-04-10T00:00:00.000' AS DateTime), 2810.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2914, 6, CAST(N'2018-04-11T00:00:00.000' AS DateTime), 2826.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2915, 6, CAST(N'2018-04-12T00:00:00.000' AS DateTime), 2850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2916, 6, CAST(N'2018-04-13T00:00:00.000' AS DateTime), 2867.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2917, 6, CAST(N'2018-04-16T00:00:00.000' AS DateTime), 2890.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2918, 6, CAST(N'2018-04-17T00:00:00.000' AS DateTime), 2892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2919, 6, CAST(N'2018-04-18T00:00:00.000' AS DateTime), 2916.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2920, 6, CAST(N'2018-04-19T00:00:00.000' AS DateTime), 2905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2921, 6, CAST(N'2018-04-20T00:00:00.000' AS DateTime), 2855.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2922, 6, CAST(N'2018-04-23T00:00:00.000' AS DateTime), 2851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2923, 6, CAST(N'2018-04-24T00:00:00.000' AS DateTime), 2895.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2924, 6, CAST(N'2018-04-25T00:00:00.000' AS DateTime), 2905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2925, 6, CAST(N'2018-04-26T00:00:00.000' AS DateTime), 2902.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2926, 6, CAST(N'2018-04-27T00:00:00.000' AS DateTime), 2967.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2927, 6, CAST(N'2018-05-02T00:00:00.000' AS DateTime), 2961.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2928, 6, CAST(N'2018-05-03T00:00:00.000' AS DateTime), 2969.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2929, 6, CAST(N'2018-05-04T00:00:00.000' AS DateTime), 3011.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2930, 6, CAST(N'2018-05-07T00:00:00.000' AS DateTime), 3007.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2931, 6, CAST(N'2018-05-08T00:00:00.000' AS DateTime), 2970.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2932, 6, CAST(N'2018-05-09T00:00:00.000' AS DateTime), 2997.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2933, 6, CAST(N'2018-05-10T00:00:00.000' AS DateTime), 2980.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2934, 6, CAST(N'2018-05-11T00:00:00.000' AS DateTime), 2998.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2935, 6, CAST(N'2018-05-14T00:00:00.000' AS DateTime), 2905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2936, 6, CAST(N'2018-05-15T00:00:00.000' AS DateTime), 2941.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2937, 6, CAST(N'2018-05-16T00:00:00.000' AS DateTime), 2795.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2938, 6, CAST(N'2018-05-17T00:00:00.000' AS DateTime), 2795.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2939, 6, CAST(N'2018-05-18T00:00:00.000' AS DateTime), 2785.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2940, 6, CAST(N'2018-05-21T00:00:00.000' AS DateTime), 2766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2941, 6, CAST(N'2018-05-22T00:00:00.000' AS DateTime), 2756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2942, 6, CAST(N'2018-05-23T00:00:00.000' AS DateTime), 2729.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2943, 6, CAST(N'2018-05-24T00:00:00.000' AS DateTime), 2721.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2944, 6, CAST(N'2018-05-25T00:00:00.000' AS DateTime), 2719.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2945, 6, CAST(N'2018-05-28T00:00:00.000' AS DateTime), 2675.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2946, 6, CAST(N'2018-05-29T00:00:00.000' AS DateTime), 2688.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2947, 6, CAST(N'2018-05-30T00:00:00.000' AS DateTime), 2688.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2948, 6, CAST(N'2018-05-31T00:00:00.000' AS DateTime), 2703.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2949, 6, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 2713.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2950, 6, CAST(N'2018-06-04T00:00:00.000' AS DateTime), 2731.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2951, 6, CAST(N'2018-06-05T00:00:00.000' AS DateTime), 2699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2952, 6, CAST(N'2018-06-06T00:00:00.000' AS DateTime), 2694.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2953, 6, CAST(N'2018-06-07T00:00:00.000' AS DateTime), 2736.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2954, 6, CAST(N'2018-06-08T00:00:00.000' AS DateTime), 2756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2955, 6, CAST(N'2018-06-11T00:00:00.000' AS DateTime), 2759.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2956, 6, CAST(N'2018-06-12T00:00:00.000' AS DateTime), 2782.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2957, 6, CAST(N'2018-06-13T00:00:00.000' AS DateTime), 2782.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2958, 6, CAST(N'2018-06-14T00:00:00.000' AS DateTime), 2770.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2959, 6, CAST(N'2018-06-15T00:00:00.000' AS DateTime), 2755.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2960, 6, CAST(N'2018-06-19T00:00:00.000' AS DateTime), 2752.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2961, 6, CAST(N'2018-06-20T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2962, 6, CAST(N'2018-06-21T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2963, 6, CAST(N'2018-06-22T00:00:00.000' AS DateTime), 2763.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2964, 6, CAST(N'2018-06-25T00:00:00.000' AS DateTime), 2728.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2965, 6, CAST(N'2018-06-26T00:00:00.000' AS DateTime), 2650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2966, 6, CAST(N'2018-06-27T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2967, 6, CAST(N'2018-06-28T00:00:00.000' AS DateTime), 2541.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2968, 6, CAST(N'2018-06-29T00:00:00.000' AS DateTime), 2667.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2969, 6, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 2881.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2970, 6, CAST(N'2018-07-03T00:00:00.000' AS DateTime), 2700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2971, 6, CAST(N'2018-07-04T00:00:00.000' AS DateTime), 2723.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2972, 6, CAST(N'2018-07-05T00:00:00.000' AS DateTime), 2747.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2973, 6, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 2757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2974, 6, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 2760.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2975, 6, CAST(N'2018-07-10T00:00:00.000' AS DateTime), 2762.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2976, 6, CAST(N'2018-07-11T00:00:00.000' AS DateTime), 2775.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2977, 6, CAST(N'2018-07-12T00:00:00.000' AS DateTime), 2760.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2978, 6, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 2769.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2979, 6, CAST(N'2018-07-16T00:00:00.000' AS DateTime), 2874.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2980, 6, CAST(N'2018-07-17T00:00:00.000' AS DateTime), 2874.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2981, 6, CAST(N'2018-07-18T00:00:00.000' AS DateTime), 2878.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2982, 6, CAST(N'2018-07-19T00:00:00.000' AS DateTime), 2913.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2983, 6, CAST(N'2018-07-20T00:00:00.000' AS DateTime), 2901.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2984, 6, CAST(N'2018-07-23T00:00:00.000' AS DateTime), 2909.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2985, 6, CAST(N'2018-07-24T00:00:00.000' AS DateTime), 2983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2986, 6, CAST(N'2018-07-25T00:00:00.000' AS DateTime), 2960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2987, 6, CAST(N'2018-07-26T00:00:00.000' AS DateTime), 2852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2988, 6, CAST(N'2018-07-27T00:00:00.000' AS DateTime), 2919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2989, 6, CAST(N'2018-07-30T00:00:00.000' AS DateTime), 2861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2990, 6, CAST(N'2018-07-31T00:00:00.000' AS DateTime), 2971.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2991, 6, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 3120.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2992, 6, CAST(N'2018-08-02T00:00:00.000' AS DateTime), 3150.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2993, 6, CAST(N'2018-08-03T00:00:00.000' AS DateTime), 3246.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2994, 6, CAST(N'2018-08-06T00:00:00.000' AS DateTime), 3409.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2995, 6, CAST(N'2018-08-07T00:00:00.000' AS DateTime), 3406.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2996, 6, CAST(N'2018-08-08T00:00:00.000' AS DateTime), 3430.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2997, 6, CAST(N'2018-08-09T00:00:00.000' AS DateTime), 3409.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2998, 6, CAST(N'2018-08-10T00:00:00.000' AS DateTime), 3390.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (2999, 6, CAST(N'2018-08-13T00:00:00.000' AS DateTime), 3354.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3000, 6, CAST(N'2018-08-14T00:00:00.000' AS DateTime), 3474.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3001, 6, CAST(N'2018-08-15T00:00:00.000' AS DateTime), 3198.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3002, 6, CAST(N'2018-08-16T00:00:00.000' AS DateTime), 3178.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3003, 6, CAST(N'2018-08-17T00:00:00.000' AS DateTime), 3145.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3004, 6, CAST(N'2018-08-20T00:00:00.000' AS DateTime), 3168.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3005, 6, CAST(N'2018-08-21T00:00:00.000' AS DateTime), 3213.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3006, 6, CAST(N'2018-08-22T00:00:00.000' AS DateTime), 3306.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3007, 6, CAST(N'2018-08-23T00:00:00.000' AS DateTime), 3255.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3008, 6, CAST(N'2018-08-24T00:00:00.000' AS DateTime), 3171.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3009, 6, CAST(N'2018-08-27T00:00:00.000' AS DateTime), 3170.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3010, 6, CAST(N'2018-08-28T00:00:00.000' AS DateTime), 3196.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3011, 6, CAST(N'2018-08-29T00:00:00.000' AS DateTime), 3176.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3012, 6, CAST(N'2018-08-30T00:00:00.000' AS DateTime), 3155.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3013, 6, CAST(N'2018-08-31T00:00:00.000' AS DateTime), 3190.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3014, 6, CAST(N'2018-09-03T00:00:00.000' AS DateTime), 3135.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3015, 6, CAST(N'2018-09-04T00:00:00.000' AS DateTime), 3185.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3016, 6, CAST(N'2018-09-05T00:00:00.000' AS DateTime), 3244.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3017, 6, CAST(N'2018-09-06T00:00:00.000' AS DateTime), 3263.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3018, 6, CAST(N'2018-09-07T00:00:00.000' AS DateTime), 3262.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3019, 6, CAST(N'2018-09-10T00:00:00.000' AS DateTime), 3297.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3020, 6, CAST(N'2018-09-11T00:00:00.000' AS DateTime), 3351.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3021, 6, CAST(N'2018-09-12T00:00:00.000' AS DateTime), 3275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3022, 6, CAST(N'2018-09-13T00:00:00.000' AS DateTime), 3242.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3023, 6, CAST(N'2018-09-14T00:00:00.000' AS DateTime), 3242.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3024, 6, CAST(N'2018-09-17T00:00:00.000' AS DateTime), 3300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3025, 6, CAST(N'2018-09-18T00:00:00.000' AS DateTime), 3300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3026, 6, CAST(N'2018-09-19T00:00:00.000' AS DateTime), 3333.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3027, 6, CAST(N'2018-09-20T00:00:00.000' AS DateTime), 3333.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3028, 6, CAST(N'2018-09-21T00:00:00.000' AS DateTime), 3347.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3029, 6, CAST(N'2018-09-25T00:00:00.000' AS DateTime), 3423.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3030, 6, CAST(N'2018-09-26T00:00:00.000' AS DateTime), 3423.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3031, 6, CAST(N'2018-09-27T00:00:00.000' AS DateTime), 3395.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3032, 6, CAST(N'2018-09-28T00:00:00.000' AS DateTime), 3472.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3033, 6, CAST(N'2018-10-08T00:00:00.000' AS DateTime), 3681.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3034, 6, CAST(N'2018-10-09T00:00:00.000' AS DateTime), 3808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3035, 6, CAST(N'2018-10-10T00:00:00.000' AS DateTime), 3889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3036, 6, CAST(N'2018-10-11T00:00:00.000' AS DateTime), 3843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3037, 6, CAST(N'2018-10-12T00:00:00.000' AS DateTime), 3888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3038, 6, CAST(N'2018-10-15T00:00:00.000' AS DateTime), 3939.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3039, 6, CAST(N'2018-10-16T00:00:00.000' AS DateTime), 3845.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3040, 6, CAST(N'2018-10-17T00:00:00.000' AS DateTime), 3818.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3041, 6, CAST(N'2018-10-18T00:00:00.000' AS DateTime), 3799.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3042, 6, CAST(N'2018-10-19T00:00:00.000' AS DateTime), 3811.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3043, 6, CAST(N'2018-10-22T00:00:00.000' AS DateTime), 3416.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3044, 6, CAST(N'2018-10-23T00:00:00.000' AS DateTime), 3417.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3045, 6, CAST(N'2018-10-24T00:00:00.000' AS DateTime), 3410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3046, 6, CAST(N'2018-10-25T00:00:00.000' AS DateTime), 3386.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3047, 6, CAST(N'2018-10-26T00:00:00.000' AS DateTime), 3317.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3048, 6, CAST(N'2018-10-29T00:00:00.000' AS DateTime), 3237.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3049, 6, CAST(N'2018-10-30T00:00:00.000' AS DateTime), 3317.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3050, 6, CAST(N'2018-10-31T00:00:00.000' AS DateTime), 3262.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3051, 6, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 3217.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3052, 6, CAST(N'2018-11-02T00:00:00.000' AS DateTime), 3190.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3053, 6, CAST(N'2018-11-05T00:00:00.000' AS DateTime), 3227.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3054, 6, CAST(N'2018-11-06T00:00:00.000' AS DateTime), 3185.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3055, 6, CAST(N'2018-11-07T00:00:00.000' AS DateTime), 3095.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3056, 6, CAST(N'2018-11-08T00:00:00.000' AS DateTime), 3092.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3057, 6, CAST(N'2018-11-09T00:00:00.000' AS DateTime), 3080.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3058, 6, CAST(N'2018-11-12T00:00:00.000' AS DateTime), 3060.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3059, 6, CAST(N'2018-11-13T00:00:00.000' AS DateTime), 3038.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3060, 6, CAST(N'2018-11-14T00:00:00.000' AS DateTime), 2983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3061, 6, CAST(N'2018-11-15T00:00:00.000' AS DateTime), 2978.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3062, 6, CAST(N'2018-11-16T00:00:00.000' AS DateTime), 2999.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3063, 6, CAST(N'2018-11-19T00:00:00.000' AS DateTime), 2913.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3064, 6, CAST(N'2018-11-20T00:00:00.000' AS DateTime), 2820.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3065, 6, CAST(N'2018-11-21T00:00:00.000' AS DateTime), 2712.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3066, 6, CAST(N'2018-11-22T00:00:00.000' AS DateTime), 2664.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3067, 6, CAST(N'2018-11-23T00:00:00.000' AS DateTime), 2642.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3068, 6, CAST(N'2018-11-26T00:00:00.000' AS DateTime), 2523.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3069, 6, CAST(N'2018-11-27T00:00:00.000' AS DateTime), 2509.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3070, 6, CAST(N'2018-11-28T00:00:00.000' AS DateTime), 2549.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3071, 6, CAST(N'2018-11-29T00:00:00.000' AS DateTime), 2547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3072, 6, CAST(N'2018-11-30T00:00:00.000' AS DateTime), 2516.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3073, 6, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 2474.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3074, 6, CAST(N'2018-12-04T00:00:00.000' AS DateTime), 2510.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3075, 6, CAST(N'2018-12-05T00:00:00.000' AS DateTime), 2583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3076, 6, CAST(N'2018-12-06T00:00:00.000' AS DateTime), 2590.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3077, 6, CAST(N'2018-12-07T00:00:00.000' AS DateTime), 2621.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3078, 6, CAST(N'2018-12-10T00:00:00.000' AS DateTime), 2645.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3079, 6, CAST(N'2018-12-11T00:00:00.000' AS DateTime), 2547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3080, 6, CAST(N'2018-12-12T00:00:00.000' AS DateTime), 2528.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3081, 6, CAST(N'2018-12-13T00:00:00.000' AS DateTime), 2536.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3082, 6, CAST(N'2018-12-14T00:00:00.000' AS DateTime), 2567.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3083, 6, CAST(N'2018-12-17T00:00:00.000' AS DateTime), 2438.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3084, 6, CAST(N'2018-12-18T00:00:00.000' AS DateTime), 2431.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3085, 6, CAST(N'2018-12-19T00:00:00.000' AS DateTime), 2411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3086, 6, CAST(N'2018-12-20T00:00:00.000' AS DateTime), 2417.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3087, 6, CAST(N'2018-12-21T00:00:00.000' AS DateTime), 2407.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3088, 6, CAST(N'2018-12-24T00:00:00.000' AS DateTime), 2377.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3089, 6, CAST(N'2018-12-25T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3090, 6, CAST(N'2018-12-26T00:00:00.000' AS DateTime), 2287.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3091, 6, CAST(N'2018-12-27T00:00:00.000' AS DateTime), 2329.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3092, 6, CAST(N'2018-12-28T00:00:00.000' AS DateTime), 2287.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3093, 6, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 2301.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3094, 6, CAST(N'2019-01-03T00:00:00.000' AS DateTime), 2320.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3095, 6, CAST(N'2019-01-04T00:00:00.000' AS DateTime), 2361.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3096, 6, CAST(N'2019-01-07T00:00:00.000' AS DateTime), 2372.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3097, 6, CAST(N'2019-01-08T00:00:00.000' AS DateTime), 2365.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3098, 6, CAST(N'2019-01-09T00:00:00.000' AS DateTime), 2395.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3099, 6, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 2397.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3100, 6, CAST(N'2019-01-11T00:00:00.000' AS DateTime), 2384.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3101, 6, CAST(N'2019-01-14T00:00:00.000' AS DateTime), 2420.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3102, 6, CAST(N'2019-01-15T00:00:00.000' AS DateTime), 2430.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3103, 6, CAST(N'2019-01-16T00:00:00.000' AS DateTime), 2494.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3104, 6, CAST(N'2019-01-17T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3105, 6, CAST(N'2019-01-18T00:00:00.000' AS DateTime), 2411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3106, 6, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 2457.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3107, 6, CAST(N'2019-01-22T00:00:00.000' AS DateTime), 2476.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3108, 6, CAST(N'2019-01-23T00:00:00.000' AS DateTime), 2392.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3109, 6, CAST(N'2019-01-24T00:00:00.000' AS DateTime), 2438.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3110, 6, CAST(N'2019-01-25T00:00:00.000' AS DateTime), 2434.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3111, 6, CAST(N'2019-01-28T00:00:00.000' AS DateTime), 2400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3112, 6, CAST(N'2019-01-29T00:00:00.000' AS DateTime), 2376.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3113, 6, CAST(N'2019-01-30T00:00:00.000' AS DateTime), 2477.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3114, 6, CAST(N'2019-01-31T00:00:00.000' AS DateTime), 2360.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3115, 6, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3116, 6, CAST(N'2019-02-11T00:00:00.000' AS DateTime), 2390.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3117, 6, CAST(N'2019-02-12T00:00:00.000' AS DateTime), 2415.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3118, 6, CAST(N'2019-02-13T00:00:00.000' AS DateTime), 2420.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3119, 6, CAST(N'2019-02-14T00:00:00.000' AS DateTime), 2410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3120, 6, CAST(N'2019-02-15T00:00:00.000' AS DateTime), 2400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3121, 6, CAST(N'2019-02-18T00:00:00.000' AS DateTime), 2351.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3122, 6, CAST(N'2019-02-19T00:00:00.000' AS DateTime), 2351.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3123, 6, CAST(N'2019-02-20T00:00:00.000' AS DateTime), 2351.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3124, 6, CAST(N'2019-02-21T00:00:00.000' AS DateTime), 2384.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3125, 6, CAST(N'2019-02-22T00:00:00.000' AS DateTime), 2403.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3126, 6, CAST(N'2019-02-25T00:00:00.000' AS DateTime), 2394.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3127, 6, CAST(N'2019-02-26T00:00:00.000' AS DateTime), 2332.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3128, 6, CAST(N'2019-02-27T00:00:00.000' AS DateTime), 2420.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3129, 6, CAST(N'2019-02-28T00:00:00.000' AS DateTime), 2464.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3130, 6, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 2509.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3131, 6, CAST(N'2019-03-04T00:00:00.000' AS DateTime), 2635.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3132, 6, CAST(N'2019-03-05T00:00:00.000' AS DateTime), 2636.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3133, 6, CAST(N'2019-03-06T00:00:00.000' AS DateTime), 2635.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3134, 6, CAST(N'2019-03-07T00:00:00.000' AS DateTime), 2614.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3135, 6, CAST(N'2019-03-08T00:00:00.000' AS DateTime), 2559.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3136, 6, CAST(N'2019-03-11T00:00:00.000' AS DateTime), 2560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3137, 6, CAST(N'2019-03-12T00:00:00.000' AS DateTime), 2583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3138, 6, CAST(N'2019-03-13T00:00:00.000' AS DateTime), 2608.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3139, 6, CAST(N'2019-03-14T00:00:00.000' AS DateTime), 2578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3140, 6, CAST(N'2019-03-15T00:00:00.000' AS DateTime), 2569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3141, 6, CAST(N'2019-03-18T00:00:00.000' AS DateTime), 2518.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3142, 6, CAST(N'2019-03-19T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3143, 6, CAST(N'2019-03-20T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3144, 6, CAST(N'2019-03-21T00:00:00.000' AS DateTime), 2562.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3145, 6, CAST(N'2019-03-22T00:00:00.000' AS DateTime), 2556.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3146, 6, CAST(N'2019-03-25T00:00:00.000' AS DateTime), 2547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3147, 6, CAST(N'2019-03-26T00:00:00.000' AS DateTime), 2445.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3148, 6, CAST(N'2019-03-27T00:00:00.000' AS DateTime), 2424.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3149, 6, CAST(N'2019-03-28T00:00:00.000' AS DateTime), 2384.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3150, 6, CAST(N'2019-03-29T00:00:00.000' AS DateTime), 2303.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3151, 6, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 2329.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3152, 6, CAST(N'2019-04-02T00:00:00.000' AS DateTime), 2357.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3153, 6, CAST(N'2019-04-03T00:00:00.000' AS DateTime), 2361.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3154, 6, CAST(N'2019-04-04T00:00:00.000' AS DateTime), 2366.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3155, 6, CAST(N'2019-04-08T00:00:00.000' AS DateTime), 2422.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3156, 6, CAST(N'2019-04-09T00:00:00.000' AS DateTime), 2421.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3157, 6, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 2389.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3158, 6, CAST(N'2019-04-11T00:00:00.000' AS DateTime), 2379.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3159, 6, CAST(N'2019-04-12T00:00:00.000' AS DateTime), 2352.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3160, 6, CAST(N'2019-04-15T00:00:00.000' AS DateTime), 2348.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3161, 6, CAST(N'2019-04-16T00:00:00.000' AS DateTime), 2402.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3162, 6, CAST(N'2019-04-17T00:00:00.000' AS DateTime), 2396.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3163, 6, CAST(N'2019-04-18T00:00:00.000' AS DateTime), 2375.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3164, 6, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 2350.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3165, 6, CAST(N'2019-04-22T00:00:00.000' AS DateTime), 2375.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3166, 6, CAST(N'2019-04-23T00:00:00.000' AS DateTime), 2369.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3167, 6, CAST(N'2019-04-24T00:00:00.000' AS DateTime), 2354.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3168, 6, CAST(N'2019-04-25T00:00:00.000' AS DateTime), 2365.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3169, 6, CAST(N'2019-04-26T00:00:00.000' AS DateTime), 2326.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3170, 6, CAST(N'2019-04-29T00:00:00.000' AS DateTime), 2301.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3171, 6, CAST(N'2019-04-30T00:00:00.000' AS DateTime), 2268.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3172, 6, CAST(N'2019-05-06T00:00:00.000' AS DateTime), 2265.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3173, 6, CAST(N'2019-05-07T00:00:00.000' AS DateTime), 2312.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3174, 6, CAST(N'2019-05-08T00:00:00.000' AS DateTime), 2321.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3175, 6, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 2317.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3176, 6, CAST(N'2019-05-10T00:00:00.000' AS DateTime), 2286.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3177, 6, CAST(N'2019-05-13T00:00:00.000' AS DateTime), 2287.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3178, 6, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 2275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3179, 6, CAST(N'2019-05-15T00:00:00.000' AS DateTime), 2254.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3180, 6, CAST(N'2019-05-16T00:00:00.000' AS DateTime), 2283.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3181, 6, CAST(N'2019-05-17T00:00:00.000' AS DateTime), 2299.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3182, 6, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 2317.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3183, 6, CAST(N'2019-05-21T00:00:00.000' AS DateTime), 2384.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3184, 6, CAST(N'2019-05-22T00:00:00.000' AS DateTime), 2384.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3185, 6, CAST(N'2019-05-23T00:00:00.000' AS DateTime), 2368.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3186, 6, CAST(N'2019-05-24T00:00:00.000' AS DateTime), 2285.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3187, 6, CAST(N'2019-05-27T00:00:00.000' AS DateTime), 2303.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3188, 6, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 2320.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3189, 6, CAST(N'2019-05-29T00:00:00.000' AS DateTime), 2372.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3190, 6, CAST(N'2019-05-30T00:00:00.000' AS DateTime), 2410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3191, 6, CAST(N'2019-05-31T00:00:00.000' AS DateTime), 2298.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3192, 6, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 2266.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3193, 6, CAST(N'2019-06-04T00:00:00.000' AS DateTime), 2266.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3194, 6, CAST(N'2019-06-05T00:00:00.000' AS DateTime), 2252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3195, 6, CAST(N'2019-06-06T00:00:00.000' AS DateTime), 2252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3196, 6, CAST(N'2019-06-10T00:00:00.000' AS DateTime), 2252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3197, 6, CAST(N'2019-06-11T00:00:00.000' AS DateTime), 2237.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3198, 6, CAST(N'2019-06-12T00:00:00.000' AS DateTime), 2236.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3199, 6, CAST(N'2019-06-13T00:00:00.000' AS DateTime), 2257.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3200, 6, CAST(N'2019-06-14T00:00:00.000' AS DateTime), 2268.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3201, 6, CAST(N'2019-06-17T00:00:00.000' AS DateTime), 2257.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3202, 6, CAST(N'2019-06-18T00:00:00.000' AS DateTime), 2309.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3203, 6, CAST(N'2019-06-19T00:00:00.000' AS DateTime), 2331.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3204, 6, CAST(N'2019-06-20T00:00:00.000' AS DateTime), 2333.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3205, 6, CAST(N'2019-06-21T00:00:00.000' AS DateTime), 2360.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3206, 6, CAST(N'2019-06-24T00:00:00.000' AS DateTime), 2326.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3207, 6, CAST(N'2019-06-25T00:00:00.000' AS DateTime), 2326.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3208, 6, CAST(N'2019-06-26T00:00:00.000' AS DateTime), 2261.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3209, 6, CAST(N'2019-06-27T00:00:00.000' AS DateTime), 2248.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3210, 6, CAST(N'2019-06-28T00:00:00.000' AS DateTime), 2191.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3211, 6, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 2188.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3212, 6, CAST(N'2019-07-02T00:00:00.000' AS DateTime), 2209.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3213, 6, CAST(N'2019-07-03T00:00:00.000' AS DateTime), 2226.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3214, 6, CAST(N'2019-07-04T00:00:00.000' AS DateTime), 2222.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3215, 6, CAST(N'2019-07-05T00:00:00.000' AS DateTime), 2222.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3216, 6, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 2228.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3217, 6, CAST(N'2019-07-09T00:00:00.000' AS DateTime), 2210.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3218, 6, CAST(N'2019-07-10T00:00:00.000' AS DateTime), 2165.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3219, 6, CAST(N'2019-07-11T00:00:00.000' AS DateTime), 2171.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3220, 6, CAST(N'2019-07-12T00:00:00.000' AS DateTime), 2137.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3221, 6, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 2262.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3222, 6, CAST(N'2019-07-16T00:00:00.000' AS DateTime), 2255.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3223, 6, CAST(N'2019-07-17T00:00:00.000' AS DateTime), 2249.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3224, 6, CAST(N'2019-07-18T00:00:00.000' AS DateTime), 2236.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3225, 6, CAST(N'2019-07-19T00:00:00.000' AS DateTime), 2154.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3226, 6, CAST(N'2019-07-22T00:00:00.000' AS DateTime), 2081.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3227, 6, CAST(N'2019-07-23T00:00:00.000' AS DateTime), 2158.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3228, 6, CAST(N'2019-07-24T00:00:00.000' AS DateTime), 2131.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3229, 6, CAST(N'2019-07-25T00:00:00.000' AS DateTime), 2123.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3230, 6, CAST(N'2019-07-26T00:00:00.000' AS DateTime), 2089.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3231, 6, CAST(N'2019-07-29T00:00:00.000' AS DateTime), 1999.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3232, 6, CAST(N'2019-07-30T00:00:00.000' AS DateTime), 2019.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3233, 6, CAST(N'2019-07-31T00:00:00.000' AS DateTime), 2040.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3234, 6, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 2040.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3235, 6, CAST(N'2019-08-02T00:00:00.000' AS DateTime), 2047.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3236, 6, CAST(N'2019-08-05T00:00:00.000' AS DateTime), 2014.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3237, 6, CAST(N'2019-08-06T00:00:00.000' AS DateTime), 1991.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3238, 6, CAST(N'2019-08-07T00:00:00.000' AS DateTime), 2025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3239, 6, CAST(N'2019-08-08T00:00:00.000' AS DateTime), 2043.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3240, 6, CAST(N'2019-08-09T00:00:00.000' AS DateTime), 2043.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3241, 6, CAST(N'2019-08-12T00:00:00.000' AS DateTime), 2045.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3242, 6, CAST(N'2019-08-13T00:00:00.000' AS DateTime), 2049.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3243, 6, CAST(N'2019-08-14T00:00:00.000' AS DateTime), 2068.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3244, 6, CAST(N'2019-08-15T00:00:00.000' AS DateTime), 2115.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3245, 6, CAST(N'2019-08-16T00:00:00.000' AS DateTime), 2097.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3246, 6, CAST(N'2019-08-19T00:00:00.000' AS DateTime), 2086.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3247, 6, CAST(N'2019-08-20T00:00:00.000' AS DateTime), 2085.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3248, 6, CAST(N'2019-08-21T00:00:00.000' AS DateTime), 2039.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3249, 6, CAST(N'2019-08-22T00:00:00.000' AS DateTime), 2032.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3250, 6, CAST(N'2019-08-23T00:00:00.000' AS DateTime), 2040.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3251, 6, CAST(N'2019-08-26T00:00:00.000' AS DateTime), 2053.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3252, 6, CAST(N'2019-08-27T00:00:00.000' AS DateTime), 2024.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3253, 6, CAST(N'2019-08-28T00:00:00.000' AS DateTime), 2024.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3254, 6, CAST(N'2019-08-29T00:00:00.000' AS DateTime), 2023.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3255, 6, CAST(N'2019-08-30T00:00:00.000' AS DateTime), 1998.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3256, 6, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 2031.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3257, 6, CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2076.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3258, 6, CAST(N'2019-09-04T00:00:00.000' AS DateTime), 2081.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3259, 6, CAST(N'2019-09-05T00:00:00.000' AS DateTime), 2083.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3260, 6, CAST(N'2019-09-06T00:00:00.000' AS DateTime), 2062.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3261, 6, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 2086.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3262, 6, CAST(N'2019-09-10T00:00:00.000' AS DateTime), 2107.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3263, 6, CAST(N'2019-09-11T00:00:00.000' AS DateTime), 2095.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3264, 6, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 2070.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3265, 6, CAST(N'2019-09-16T00:00:00.000' AS DateTime), 2160.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3266, 6, CAST(N'2019-09-17T00:00:00.000' AS DateTime), 2276.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3267, 6, CAST(N'2019-09-18T00:00:00.000' AS DateTime), 2204.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3268, 6, CAST(N'2019-09-19T00:00:00.000' AS DateTime), 2177.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3269, 6, CAST(N'2019-09-20T00:00:00.000' AS DateTime), 2206.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3270, 6, CAST(N'2019-09-23T00:00:00.000' AS DateTime), 2252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3271, 6, CAST(N'2019-09-24T00:00:00.000' AS DateTime), 2245.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3272, 6, CAST(N'2019-09-25T00:00:00.000' AS DateTime), 2259.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3273, 6, CAST(N'2019-09-26T00:00:00.000' AS DateTime), 2289.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3274, 6, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 2242.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3275, 6, CAST(N'2019-09-30T00:00:00.000' AS DateTime), 2288.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3276, 6, CAST(N'2019-10-08T00:00:00.000' AS DateTime), 2288.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3277, 6, CAST(N'2019-10-09T00:00:00.000' AS DateTime), 2288.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3278, 6, CAST(N'2019-10-10T00:00:00.000' AS DateTime), 2275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3279, 6, CAST(N'2019-10-11T00:00:00.000' AS DateTime), 2234.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3280, 6, CAST(N'2019-10-14T00:00:00.000' AS DateTime), 2196.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3281, 6, CAST(N'2019-10-15T00:00:00.000' AS DateTime), 2169.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3282, 6, CAST(N'2019-10-16T00:00:00.000' AS DateTime), 2155.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3283, 6, CAST(N'2019-10-17T00:00:00.000' AS DateTime), 2114.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3284, 6, CAST(N'2019-10-18T00:00:00.000' AS DateTime), 2117.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3285, 6, CAST(N'2019-10-21T00:00:00.000' AS DateTime), 2086.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3286, 6, CAST(N'2019-10-22T00:00:00.000' AS DateTime), 2077.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3287, 6, CAST(N'2019-10-23T00:00:00.000' AS DateTime), 2064.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3288, 6, CAST(N'2019-10-24T00:00:00.000' AS DateTime), 2055.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3289, 6, CAST(N'2019-10-25T00:00:00.000' AS DateTime), 2042.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3290, 6, CAST(N'2019-10-28T00:00:00.000' AS DateTime), 2012.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3291, 6, CAST(N'2019-10-29T00:00:00.000' AS DateTime), 2028.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3292, 6, CAST(N'2019-10-30T00:00:00.000' AS DateTime), 2021.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3293, 6, CAST(N'2019-10-31T00:00:00.000' AS DateTime), 2031.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3294, 6, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 2020.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3295, 6, CAST(N'2019-11-04T00:00:00.000' AS DateTime), 2015.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3296, 6, CAST(N'2019-11-05T00:00:00.000' AS DateTime), 2035.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3297, 6, CAST(N'2019-11-06T00:00:00.000' AS DateTime), 2041.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3298, 6, CAST(N'2019-11-07T00:00:00.000' AS DateTime), 1990.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3299, 6, CAST(N'2019-11-08T00:00:00.000' AS DateTime), 2010.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3300, 6, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3301, 6, CAST(N'2019-11-12T00:00:00.000' AS DateTime), 1914.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3302, 6, CAST(N'2019-11-13T00:00:00.000' AS DateTime), 1926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3303, 6, CAST(N'2019-11-14T00:00:00.000' AS DateTime), 1985.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3304, 6, CAST(N'2019-11-15T00:00:00.000' AS DateTime), 1929.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3305, 6, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 1937.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3306, 6, CAST(N'2019-11-19T00:00:00.000' AS DateTime), 1929.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3307, 6, CAST(N'2019-11-20T00:00:00.000' AS DateTime), 1872.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3308, 6, CAST(N'2019-11-21T00:00:00.000' AS DateTime), 1790.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3309, 6, CAST(N'2019-11-22T00:00:00.000' AS DateTime), 1880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3310, 6, CAST(N'2019-11-25T00:00:00.000' AS DateTime), 1963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3311, 6, CAST(N'2019-11-26T00:00:00.000' AS DateTime), 1995.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3312, 6, CAST(N'2019-11-27T00:00:00.000' AS DateTime), 1981.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3313, 6, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 1981.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3314, 6, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1939.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3315, 6, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 1915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3316, 6, CAST(N'2019-12-03T00:00:00.000' AS DateTime), 1942.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3317, 6, CAST(N'2019-12-04T00:00:00.000' AS DateTime), 1972.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3318, 6, CAST(N'2019-12-05T00:00:00.000' AS DateTime), 2000.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3319, 6, CAST(N'2019-12-06T00:00:00.000' AS DateTime), 1989.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3320, 6, CAST(N'2019-12-09T00:00:00.000' AS DateTime), 2000.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3321, 6, CAST(N'2019-12-10T00:00:00.000' AS DateTime), 1994.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3322, 6, CAST(N'2019-12-11T00:00:00.000' AS DateTime), 1965.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3323, 6, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 1992.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3324, 6, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 2006.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3325, 6, CAST(N'2019-12-16T00:00:00.000' AS DateTime), 2018.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3326, 6, CAST(N'2019-12-17T00:00:00.000' AS DateTime), 2025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3327, 6, CAST(N'2019-12-18T00:00:00.000' AS DateTime), 2017.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3328, 6, CAST(N'2019-12-19T00:00:00.000' AS DateTime), 2014.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3329, 6, CAST(N'2019-12-20T00:00:00.000' AS DateTime), 2032.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3330, 6, CAST(N'2019-12-23T00:00:00.000' AS DateTime), 2050.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3331, 6, CAST(N'2019-12-24T00:00:00.000' AS DateTime), 2044.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3332, 6, CAST(N'2019-12-25T00:00:00.000' AS DateTime), 2064.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3333, 6, CAST(N'2019-12-26T00:00:00.000' AS DateTime), 2092.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3334, 6, CAST(N'2019-12-27T00:00:00.000' AS DateTime), 2114.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3335, 6, CAST(N'2019-12-30T00:00:00.000' AS DateTime), 2151.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3336, 6, CAST(N'2019-12-31T00:00:00.000' AS DateTime), 2137.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3337, 6, CAST(N'2020-01-02T00:00:00.000' AS DateTime), 2094.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3338, 6, CAST(N'2020-01-03T00:00:00.000' AS DateTime), 2126.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3339, 6, CAST(N'2020-01-06T00:00:00.000' AS DateTime), 2188.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3340, 6, CAST(N'2020-01-07T00:00:00.000' AS DateTime), 2263.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3341, 6, CAST(N'2020-01-08T00:00:00.000' AS DateTime), 2328.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3342, 6, CAST(N'2020-01-09T00:00:00.000' AS DateTime), 2293.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3343, 6, CAST(N'2020-01-10T00:00:00.000' AS DateTime), 2224.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3344, 6, CAST(N'2020-01-13T00:00:00.000' AS DateTime), 2322.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3345, 6, CAST(N'2020-01-14T00:00:00.000' AS DateTime), 2375.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3346, 6, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 2360.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3347, 6, CAST(N'2020-01-16T00:00:00.000' AS DateTime), 2388.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3348, 6, CAST(N'2020-01-17T00:00:00.000' AS DateTime), 2377.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3349, 6, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 2361.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3350, 6, CAST(N'2020-01-21T00:00:00.000' AS DateTime), 2375.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3351, 6, CAST(N'2020-01-22T00:00:00.000' AS DateTime), 2332.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3352, 6, CAST(N'2020-01-23T00:00:00.000' AS DateTime), 2318.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3353, 6, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 2163.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3354, 6, CAST(N'2020-02-04T00:00:00.000' AS DateTime), 2104.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3355, 6, CAST(N'2020-02-05T00:00:00.000' AS DateTime), 2143.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3356, 6, CAST(N'2020-02-06T00:00:00.000' AS DateTime), 2157.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3357, 6, CAST(N'2020-02-07T00:00:00.000' AS DateTime), 2169.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3358, 6, CAST(N'2020-02-10T00:00:00.000' AS DateTime), 2184.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3359, 6, CAST(N'2020-02-11T00:00:00.000' AS DateTime), 2178.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3360, 6, CAST(N'2020-02-12T00:00:00.000' AS DateTime), 2069.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3361, 6, CAST(N'2020-02-13T00:00:00.000' AS DateTime), 2063.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3362, 6, CAST(N'2020-02-14T00:00:00.000' AS DateTime), 2056.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3363, 6, CAST(N'2020-02-17T00:00:00.000' AS DateTime), 2054.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3364, 6, CAST(N'2020-02-18T00:00:00.000' AS DateTime), 2052.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3365, 6, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2054.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3366, 6, CAST(N'2020-02-20T00:00:00.000' AS DateTime), 2073.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3367, 6, CAST(N'2020-02-21T00:00:00.000' AS DateTime), 2069.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3368, 6, CAST(N'2020-02-24T00:00:00.000' AS DateTime), 2021.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3369, 6, CAST(N'2020-02-25T00:00:00.000' AS DateTime), 2034.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3370, 6, CAST(N'2020-02-26T00:00:00.000' AS DateTime), 2064.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3371, 6, CAST(N'2020-02-27T00:00:00.000' AS DateTime), 2027.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3372, 6, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1981.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3373, 6, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 1974.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3374, 6, CAST(N'2020-03-03T00:00:00.000' AS DateTime), 2006.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3375, 6, CAST(N'2020-03-04T00:00:00.000' AS DateTime), 1960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3376, 6, CAST(N'2020-03-05T00:00:00.000' AS DateTime), 1960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3377, 6, CAST(N'2020-03-06T00:00:00.000' AS DateTime), 1960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3378, 6, CAST(N'2020-03-09T00:00:00.000' AS DateTime), 1862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3379, 6, CAST(N'2020-03-10T00:00:00.000' AS DateTime), 1859.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3380, 6, CAST(N'2020-03-11T00:00:00.000' AS DateTime), 1810.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3381, 6, CAST(N'2020-03-12T00:00:00.000' AS DateTime), 1770.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3382, 6, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 1760.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3383, 6, CAST(N'2020-03-16T00:00:00.000' AS DateTime), 1789.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3384, 6, CAST(N'2020-03-17T00:00:00.000' AS DateTime), 1830.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3385, 6, CAST(N'2020-03-18T00:00:00.000' AS DateTime), 1811.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3386, 6, CAST(N'2020-03-19T00:00:00.000' AS DateTime), 1740.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3387, 6, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1704.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3388, 6, CAST(N'2020-03-23T00:00:00.000' AS DateTime), 1653.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3389, 6, CAST(N'2020-03-24T00:00:00.000' AS DateTime), 1679.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3390, 6, CAST(N'2020-03-25T00:00:00.000' AS DateTime), 1711.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3391, 6, CAST(N'2020-03-26T00:00:00.000' AS DateTime), 1626.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3392, 6, CAST(N'2020-03-27T00:00:00.000' AS DateTime), 1549.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3393, 6, CAST(N'2020-03-30T00:00:00.000' AS DateTime), 1510.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3394, 6, CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1491.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3395, 6, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 1463.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3396, 6, CAST(N'2020-04-02T00:00:00.000' AS DateTime), 1480.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3397, 6, CAST(N'2020-04-03T00:00:00.000' AS DateTime), 1523.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3398, 6, CAST(N'2020-04-07T00:00:00.000' AS DateTime), 1569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3399, 6, CAST(N'2020-04-08T00:00:00.000' AS DateTime), 1568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3400, 6, CAST(N'2020-04-09T00:00:00.000' AS DateTime), 1663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3401, 6, CAST(N'2020-04-10T00:00:00.000' AS DateTime), 1690.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3402, 6, CAST(N'2020-04-13T00:00:00.000' AS DateTime), 1715.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3403, 6, CAST(N'2020-04-14T00:00:00.000' AS DateTime), 1641.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3404, 6, CAST(N'2020-04-15T00:00:00.000' AS DateTime), 1626.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3405, 6, CAST(N'2020-04-16T00:00:00.000' AS DateTime), 1667.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3406, 6, CAST(N'2020-04-17T00:00:00.000' AS DateTime), 1662.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3407, 6, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1640.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3408, 6, CAST(N'2020-04-21T00:00:00.000' AS DateTime), 1615.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3409, 6, CAST(N'2020-04-22T00:00:00.000' AS DateTime), 1568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3410, 6, CAST(N'2020-04-23T00:00:00.000' AS DateTime), 1627.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3411, 6, CAST(N'2020-04-24T00:00:00.000' AS DateTime), 1680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3412, 6, CAST(N'2020-04-27T00:00:00.000' AS DateTime), 1644.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3413, 6, CAST(N'2020-04-28T00:00:00.000' AS DateTime), 1664.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3414, 6, CAST(N'2020-04-29T00:00:00.000' AS DateTime), 1673.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3415, 6, CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3416, 6, CAST(N'2020-05-06T00:00:00.000' AS DateTime), 1762.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3417, 6, CAST(N'2020-05-07T00:00:00.000' AS DateTime), 1774.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3418, 6, CAST(N'2020-05-08T00:00:00.000' AS DateTime), 1732.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3419, 6, CAST(N'2020-05-11T00:00:00.000' AS DateTime), 1735.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3420, 6, CAST(N'2020-05-12T00:00:00.000' AS DateTime), 1712.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3421, 6, CAST(N'2020-05-13T00:00:00.000' AS DateTime), 1698.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3422, 6, CAST(N'2020-05-14T00:00:00.000' AS DateTime), 1703.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3423, 6, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1723.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3424, 6, CAST(N'2020-05-18T00:00:00.000' AS DateTime), 1697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3425, 6, CAST(N'2020-05-19T00:00:00.000' AS DateTime), 1721.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3426, 6, CAST(N'2020-05-20T00:00:00.000' AS DateTime), 1617.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3427, 6, CAST(N'2020-05-21T00:00:00.000' AS DateTime), 1618.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3428, 6, CAST(N'2020-05-22T00:00:00.000' AS DateTime), 1604.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3429, 6, CAST(N'2020-05-25T00:00:00.000' AS DateTime), 1562.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3430, 6, CAST(N'2020-05-26T00:00:00.000' AS DateTime), 1556.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3431, 6, CAST(N'2020-05-27T00:00:00.000' AS DateTime), 1499.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3432, 6, CAST(N'2020-05-28T00:00:00.000' AS DateTime), 1490.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3433, 6, CAST(N'2020-05-29T00:00:00.000' AS DateTime), 1526.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3434, 6, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 1544.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3435, 6, CAST(N'2020-06-02T00:00:00.000' AS DateTime), 1540.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3436, 6, CAST(N'2020-06-03T00:00:00.000' AS DateTime), 1566.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3437, 6, CAST(N'2020-06-04T00:00:00.000' AS DateTime), 1556.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3438, 6, CAST(N'2020-06-05T00:00:00.000' AS DateTime), 1562.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3439, 6, CAST(N'2020-06-08T00:00:00.000' AS DateTime), 1581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3440, 6, CAST(N'2020-06-09T00:00:00.000' AS DateTime), 1581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3441, 6, CAST(N'2020-06-10T00:00:00.000' AS DateTime), 1581.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3442, 6, CAST(N'2020-06-11T00:00:00.000' AS DateTime), 1578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3443, 6, CAST(N'2020-06-12T00:00:00.000' AS DateTime), 1568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3444, 6, CAST(N'2020-06-15T00:00:00.000' AS DateTime), 1590.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3445, 6, CAST(N'2020-06-16T00:00:00.000' AS DateTime), 1599.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3446, 6, CAST(N'2020-06-17T00:00:00.000' AS DateTime), 1603.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3447, 6, CAST(N'2020-06-18T00:00:00.000' AS DateTime), 1603.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3448, 6, CAST(N'2020-06-19T00:00:00.000' AS DateTime), 1621.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3449, 6, CAST(N'2020-06-22T00:00:00.000' AS DateTime), 1628.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3450, 6, CAST(N'2020-06-23T00:00:00.000' AS DateTime), 1643.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3451, 6, CAST(N'2020-06-24T00:00:00.000' AS DateTime), 1654.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3452, 6, CAST(N'2020-06-29T00:00:00.000' AS DateTime), 1629.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3453, 6, CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1649.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3454, 6, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 1645.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3455, 6, CAST(N'2020-07-02T00:00:00.000' AS DateTime), 1657.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3456, 6, CAST(N'2020-07-03T00:00:00.000' AS DateTime), 1699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3457, 6, CAST(N'2020-07-06T00:00:00.000' AS DateTime), 1701.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3458, 6, CAST(N'2020-07-07T00:00:00.000' AS DateTime), 1642.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3459, 6, CAST(N'2020-07-08T00:00:00.000' AS DateTime), 1697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3460, 6, CAST(N'2020-07-09T00:00:00.000' AS DateTime), 1701.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3461, 6, CAST(N'2020-07-10T00:00:00.000' AS DateTime), 1639.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3462, 6, CAST(N'2020-07-13T00:00:00.000' AS DateTime), 1691.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3463, 6, CAST(N'2020-07-14T00:00:00.000' AS DateTime), 1701.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3464, 6, CAST(N'2020-07-15T00:00:00.000' AS DateTime), 1791.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3465, 6, CAST(N'2020-07-16T00:00:00.000' AS DateTime), 1829.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3466, 6, CAST(N'2020-07-17T00:00:00.000' AS DateTime), 1753.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3467, 6, CAST(N'2020-07-20T00:00:00.000' AS DateTime), 1728.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3468, 6, CAST(N'2020-07-21T00:00:00.000' AS DateTime), 1720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3469, 6, CAST(N'2020-07-22T00:00:00.000' AS DateTime), 1720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3470, 6, CAST(N'2020-07-23T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3471, 6, CAST(N'2020-07-24T00:00:00.000' AS DateTime), 1699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3472, 6, CAST(N'2020-07-27T00:00:00.000' AS DateTime), 1687.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3473, 6, CAST(N'2020-07-28T00:00:00.000' AS DateTime), 1690.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3474, 6, CAST(N'2020-07-29T00:00:00.000' AS DateTime), 1686.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3475, 6, CAST(N'2020-07-30T00:00:00.000' AS DateTime), 1702.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3476, 6, CAST(N'2020-07-31T00:00:00.000' AS DateTime), 1660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3477, 6, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 1660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3478, 6, CAST(N'2020-08-04T00:00:00.000' AS DateTime), 1660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3479, 6, CAST(N'2020-08-05T00:00:00.000' AS DateTime), 1660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3480, 6, CAST(N'2020-08-06T00:00:00.000' AS DateTime), 1660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3481, 6, CAST(N'2020-08-07T00:00:00.000' AS DateTime), 1688.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3482, 6, CAST(N'2020-08-10T00:00:00.000' AS DateTime), 1690.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3483, 6, CAST(N'2020-08-11T00:00:00.000' AS DateTime), 1685.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3484, 6, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3485, 6, CAST(N'2020-08-13T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3486, 6, CAST(N'2020-08-14T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3487, 6, CAST(N'2020-08-17T00:00:00.000' AS DateTime), 1739.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3488, 6, CAST(N'2020-08-18T00:00:00.000' AS DateTime), 1746.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3489, 6, CAST(N'2020-08-19T00:00:00.000' AS DateTime), 1745.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3490, 6, CAST(N'2020-08-20T00:00:00.000' AS DateTime), 1733.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3491, 6, CAST(N'2020-08-21T00:00:00.000' AS DateTime), 1736.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3492, 6, CAST(N'2020-08-24T00:00:00.000' AS DateTime), 1750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3493, 6, CAST(N'2020-08-25T00:00:00.000' AS DateTime), 1757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3494, 6, CAST(N'2020-08-26T00:00:00.000' AS DateTime), 1758.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3495, 6, CAST(N'2020-08-27T00:00:00.000' AS DateTime), 1767.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3496, 6, CAST(N'2020-08-28T00:00:00.000' AS DateTime), 1760.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3497, 6, CAST(N'2020-08-31T00:00:00.000' AS DateTime), 1765.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3498, 6, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 1788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3499, 6, CAST(N'2020-09-02T00:00:00.000' AS DateTime), 1823.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3500, 6, CAST(N'2020-09-03T00:00:00.000' AS DateTime), 1817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3501, 6, CAST(N'2020-09-04T00:00:00.000' AS DateTime), 1817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3502, 6, CAST(N'2020-09-07T00:00:00.000' AS DateTime), 1877.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3503, 6, CAST(N'2020-09-08T00:00:00.000' AS DateTime), 1856.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3504, 6, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 1808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3505, 6, CAST(N'2020-09-10T00:00:00.000' AS DateTime), 1805.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3506, 6, CAST(N'2020-09-11T00:00:00.000' AS DateTime), 1798.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3507, 6, CAST(N'2020-09-14T00:00:00.000' AS DateTime), 1838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3508, 6, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 1988.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3509, 6, CAST(N'2020-09-16T00:00:00.000' AS DateTime), 1985.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3510, 6, CAST(N'2020-09-17T00:00:00.000' AS DateTime), 1988.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3511, 6, CAST(N'2020-09-18T00:00:00.000' AS DateTime), 1971.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3512, 6, CAST(N'2020-09-21T00:00:00.000' AS DateTime), 1961.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3513, 6, CAST(N'2020-09-22T00:00:00.000' AS DateTime), 1923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3514, 6, CAST(N'2020-09-23T00:00:00.000' AS DateTime), 1897.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3515, 6, CAST(N'2020-09-24T00:00:00.000' AS DateTime), 1882.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3516, 6, CAST(N'2020-09-25T00:00:00.000' AS DateTime), 1884.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3517, 6, CAST(N'2020-09-28T00:00:00.000' AS DateTime), 1884.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3518, 6, CAST(N'2020-09-29T00:00:00.000' AS DateTime), 1858.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3519, 6, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 1823.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3520, 6, CAST(N'2020-10-09T00:00:00.000' AS DateTime), 1844.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3521, 6, CAST(N'2020-10-12T00:00:00.000' AS DateTime), 1895.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3522, 6, CAST(N'2020-10-13T00:00:00.000' AS DateTime), 1899.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3523, 6, CAST(N'2020-10-14T00:00:00.000' AS DateTime), 1914.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3524, 6, CAST(N'2020-10-15T00:00:00.000' AS DateTime), 1935.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3525, 6, CAST(N'2020-10-16T00:00:00.000' AS DateTime), 1942.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3526, 6, CAST(N'2020-10-19T00:00:00.000' AS DateTime), 1951.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3527, 6, CAST(N'2020-10-20T00:00:00.000' AS DateTime), 1886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3528, 6, CAST(N'2020-10-21T00:00:00.000' AS DateTime), 1963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3529, 6, CAST(N'2020-10-22T00:00:00.000' AS DateTime), 1960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3530, 6, CAST(N'2020-10-23T00:00:00.000' AS DateTime), 1959.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3531, 6, CAST(N'2020-10-26T00:00:00.000' AS DateTime), 1915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3532, 6, CAST(N'2020-10-27T00:00:00.000' AS DateTime), 1879.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3533, 6, CAST(N'2020-10-28T00:00:00.000' AS DateTime), 1921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3534, 6, CAST(N'2020-10-29T00:00:00.000' AS DateTime), 1925.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3535, 6, CAST(N'2020-10-30T00:00:00.000' AS DateTime), 1919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3536, 6, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 1900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3537, 6, CAST(N'2020-11-03T00:00:00.000' AS DateTime), 1933.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3538, 6, CAST(N'2020-11-04T00:00:00.000' AS DateTime), 1957.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3539, 6, CAST(N'2020-11-05T00:00:00.000' AS DateTime), 1929.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3540, 6, CAST(N'2020-11-06T00:00:00.000' AS DateTime), 1951.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3541, 6, CAST(N'2020-11-09T00:00:00.000' AS DateTime), 1979.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3542, 6, CAST(N'2020-11-10T00:00:00.000' AS DateTime), 1967.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3543, 6, CAST(N'2020-11-11T00:00:00.000' AS DateTime), 2086.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3544, 6, CAST(N'2020-11-12T00:00:00.000' AS DateTime), 2156.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3545, 6, CAST(N'2020-11-13T00:00:00.000' AS DateTime), 2286.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3546, 6, CAST(N'2020-11-16T00:00:00.000' AS DateTime), 2220.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3547, 6, CAST(N'2020-11-17T00:00:00.000' AS DateTime), 2192.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3548, 6, CAST(N'2020-11-18T00:00:00.000' AS DateTime), 2190.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3549, 6, CAST(N'2020-11-19T00:00:00.000' AS DateTime), 2275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3550, 6, CAST(N'2020-11-20T00:00:00.000' AS DateTime), 2272.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3551, 6, CAST(N'2020-11-23T00:00:00.000' AS DateTime), 2279.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3552, 6, CAST(N'2020-11-24T00:00:00.000' AS DateTime), 2251.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3553, 6, CAST(N'2020-11-25T00:00:00.000' AS DateTime), 2276.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3554, 6, CAST(N'2020-11-26T00:00:00.000' AS DateTime), 2233.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3555, 6, CAST(N'2020-11-27T00:00:00.000' AS DateTime), 2197.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3556, 6, CAST(N'2020-11-30T00:00:00.000' AS DateTime), 2227.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3557, 6, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 2238.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3558, 6, CAST(N'2020-12-02T00:00:00.000' AS DateTime), 2275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3559, 6, CAST(N'2020-12-03T00:00:00.000' AS DateTime), 2170.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3560, 6, CAST(N'2020-12-04T00:00:00.000' AS DateTime), 2108.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3561, 6, CAST(N'2020-12-07T00:00:00.000' AS DateTime), 2191.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3562, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), 2191.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3563, 6, CAST(N'2020-12-09T00:00:00.000' AS DateTime), 2136.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3564, 6, CAST(N'2020-12-10T00:00:00.000' AS DateTime), 2252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3565, 6, CAST(N'2020-12-11T00:00:00.000' AS DateTime), 2357.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3566, 6, CAST(N'2020-12-14T00:00:00.000' AS DateTime), 2386.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3567, 6, CAST(N'2020-12-15T00:00:00.000' AS DateTime), 2399.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3568, 6, CAST(N'2020-12-16T00:00:00.000' AS DateTime), 2427.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3569, 6, CAST(N'2020-12-17T00:00:00.000' AS DateTime), 2454.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3570, 6, CAST(N'2020-12-18T00:00:00.000' AS DateTime), 2517.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3571, 6, CAST(N'2020-12-21T00:00:00.000' AS DateTime), 2553.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3572, 6, CAST(N'2020-12-22T00:00:00.000' AS DateTime), 2527.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3573, 6, CAST(N'2020-12-23T00:00:00.000' AS DateTime), 2489.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3574, 6, CAST(N'2020-12-24T00:00:00.000' AS DateTime), 2569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3575, 6, CAST(N'2020-12-25T00:00:00.000' AS DateTime), 2535.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3576, 6, CAST(N'2020-12-28T00:00:00.000' AS DateTime), 2471.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3577, 6, CAST(N'2020-12-29T00:00:00.000' AS DateTime), 2386.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3578, 6, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 2400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3579, 6, CAST(N'2020-12-31T00:00:00.000' AS DateTime), 2416.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3580, 6, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 2410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3581, 6, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 2452.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3582, 6, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 2448.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3583, 6, CAST(N'2021-01-07T00:00:00.000' AS DateTime), 2376.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3584, 6, CAST(N'2021-01-08T00:00:00.000' AS DateTime), 2369.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3585, 6, CAST(N'2021-01-11T00:00:00.000' AS DateTime), 2401.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3586, 6, CAST(N'2021-01-12T00:00:00.000' AS DateTime), 2361.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3587, 6, CAST(N'2021-01-13T00:00:00.000' AS DateTime), 2397.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3588, 6, CAST(N'2021-01-14T00:00:00.000' AS DateTime), 2450.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3589, 6, CAST(N'2021-01-15T00:00:00.000' AS DateTime), 2397.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3590, 6, CAST(N'2021-01-18T00:00:00.000' AS DateTime), 2399.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3591, 6, CAST(N'2021-01-19T00:00:00.000' AS DateTime), 2401.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3592, 6, CAST(N'2021-01-20T00:00:00.000' AS DateTime), 2387.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3593, 6, CAST(N'2021-01-21T00:00:00.000' AS DateTime), 2404.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3594, 6, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 2424.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3595, 6, CAST(N'2021-01-25T00:00:00.000' AS DateTime), 2411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3596, 6, CAST(N'2021-01-26T00:00:00.000' AS DateTime), 2370.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3597, 6, CAST(N'2021-01-27T00:00:00.000' AS DateTime), 2333.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3598, 6, CAST(N'2021-01-28T00:00:00.000' AS DateTime), 2298.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3599, 6, CAST(N'2021-01-29T00:00:00.000' AS DateTime), 2315.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3600, 6, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 2366.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3601, 6, CAST(N'2021-02-02T00:00:00.000' AS DateTime), 2321.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3602, 6, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3603, 6, CAST(N'2021-02-04T00:00:00.000' AS DateTime), 2319.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3604, 6, CAST(N'2021-02-05T00:00:00.000' AS DateTime), 2338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3605, 6, CAST(N'2021-02-08T00:00:00.000' AS DateTime), 2335.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3606, 6, CAST(N'2021-02-09T00:00:00.000' AS DateTime), 2335.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3607, 6, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 2294.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3608, 6, CAST(N'2021-02-18T00:00:00.000' AS DateTime), 2348.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3609, 6, CAST(N'2021-02-19T00:00:00.000' AS DateTime), 2391.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3610, 6, CAST(N'2021-02-22T00:00:00.000' AS DateTime), 2388.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3611, 6, CAST(N'2021-02-23T00:00:00.000' AS DateTime), 2404.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3612, 6, CAST(N'2021-02-24T00:00:00.000' AS DateTime), 2441.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3613, 6, CAST(N'2021-02-25T00:00:00.000' AS DateTime), 2508.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3614, 6, CAST(N'2021-02-26T00:00:00.000' AS DateTime), 2465.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3615, 6, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2511.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3616, 6, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3617, 6, CAST(N'2021-03-03T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3618, 6, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 2471.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3619, 6, CAST(N'2021-03-05T00:00:00.000' AS DateTime), 2513.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3620, 6, CAST(N'2021-03-08T00:00:00.000' AS DateTime), 2610.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3621, 6, CAST(N'2021-03-09T00:00:00.000' AS DateTime), 2585.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3622, 6, CAST(N'2021-03-10T00:00:00.000' AS DateTime), 2465.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3623, 6, CAST(N'2021-03-11T00:00:00.000' AS DateTime), 2388.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3624, 6, CAST(N'2021-03-12T00:00:00.000' AS DateTime), 2388.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3625, 6, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 2425.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3626, 6, CAST(N'2021-03-16T00:00:00.000' AS DateTime), 2423.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3627, 6, CAST(N'2021-03-17T00:00:00.000' AS DateTime), 2398.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3628, 6, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 2374.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3629, 6, CAST(N'2021-03-19T00:00:00.000' AS DateTime), 2305.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3630, 6, CAST(N'2021-03-22T00:00:00.000' AS DateTime), 2294.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3631, 6, CAST(N'2021-03-23T00:00:00.000' AS DateTime), 2302.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3632, 6, CAST(N'2021-03-24T00:00:00.000' AS DateTime), 2326.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3633, 6, CAST(N'2021-03-25T00:00:00.000' AS DateTime), 2316.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3634, 6, CAST(N'2021-03-26T00:00:00.000' AS DateTime), 2314.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3635, 6, CAST(N'2021-03-29T00:00:00.000' AS DateTime), 2338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3636, 6, CAST(N'2021-03-30T00:00:00.000' AS DateTime), 2373.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3637, 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), 2338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3638, 6, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 2268.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3639, 6, CAST(N'2021-04-02T00:00:00.000' AS DateTime), 2369.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3640, 6, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 2413.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3641, 6, CAST(N'2021-04-07T00:00:00.000' AS DateTime), 2436.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3642, 6, CAST(N'2021-04-08T00:00:00.000' AS DateTime), 2421.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3643, 6, CAST(N'2021-04-09T00:00:00.000' AS DateTime), 2400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3644, 6, CAST(N'2021-04-12T00:00:00.000' AS DateTime), 2350.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3645, 6, CAST(N'2021-04-13T00:00:00.000' AS DateTime), 2280.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3646, 6, CAST(N'2021-04-14T00:00:00.000' AS DateTime), 2317.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3647, 6, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 2347.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3648, 6, CAST(N'2021-04-16T00:00:00.000' AS DateTime), 2477.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3649, 6, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 2474.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3650, 6, CAST(N'2021-04-20T00:00:00.000' AS DateTime), 2489.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3651, 6, CAST(N'2021-04-21T00:00:00.000' AS DateTime), 2448.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3652, 6, CAST(N'2021-04-22T00:00:00.000' AS DateTime), 2438.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3653, 6, CAST(N'2021-04-23T00:00:00.000' AS DateTime), 2427.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3654, 6, CAST(N'2021-04-26T00:00:00.000' AS DateTime), 2455.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3655, 6, CAST(N'2021-04-27T00:00:00.000' AS DateTime), 2484.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3656, 6, CAST(N'2021-04-28T00:00:00.000' AS DateTime), 2456.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3657, 6, CAST(N'2021-04-29T00:00:00.000' AS DateTime), 2462.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3658, 6, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 2453.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3659, 6, CAST(N'2021-05-06T00:00:00.000' AS DateTime), 2494.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3660, 6, CAST(N'2021-05-07T00:00:00.000' AS DateTime), 2536.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3661, 6, CAST(N'2021-05-10T00:00:00.000' AS DateTime), 2586.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3662, 6, CAST(N'2021-05-11T00:00:00.000' AS DateTime), 2588.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3663, 6, CAST(N'2021-05-12T00:00:00.000' AS DateTime), 2719.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3664, 6, CAST(N'2021-05-13T00:00:00.000' AS DateTime), 2773.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3665, 6, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 2750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3666, 6, CAST(N'2021-05-17T00:00:00.000' AS DateTime), 2772.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3667, 6, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 2772.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3668, 6, CAST(N'2021-05-19T00:00:00.000' AS DateTime), 2730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3669, 6, CAST(N'2021-05-20T00:00:00.000' AS DateTime), 2553.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3670, 6, CAST(N'2021-05-21T00:00:00.000' AS DateTime), 2522.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3671, 6, CAST(N'2021-05-24T00:00:00.000' AS DateTime), 2579.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3672, 6, CAST(N'2021-05-25T00:00:00.000' AS DateTime), 2663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3673, 6, CAST(N'2021-05-26T00:00:00.000' AS DateTime), 2674.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3674, 6, CAST(N'2021-05-27T00:00:00.000' AS DateTime), 2695.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3675, 6, CAST(N'2021-05-28T00:00:00.000' AS DateTime), 2706.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3676, 6, CAST(N'2021-05-31T00:00:00.000' AS DateTime), 2691.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3677, 6, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 2550.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3678, 6, CAST(N'2021-06-02T00:00:00.000' AS DateTime), 2618.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3679, 6, CAST(N'2021-06-03T00:00:00.000' AS DateTime), 2618.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3680, 6, CAST(N'2021-06-04T00:00:00.000' AS DateTime), 2618.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3681, 6, CAST(N'2021-06-07T00:00:00.000' AS DateTime), 2618.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3682, 6, CAST(N'2021-06-08T00:00:00.000' AS DateTime), 2565.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3683, 6, CAST(N'2021-06-09T00:00:00.000' AS DateTime), 2576.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3684, 6, CAST(N'2021-06-10T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3685, 6, CAST(N'2021-06-11T00:00:00.000' AS DateTime), 2572.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3686, 6, CAST(N'2021-06-15T00:00:00.000' AS DateTime), 2599.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3687, 6, CAST(N'2021-06-16T00:00:00.000' AS DateTime), 2543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3688, 6, CAST(N'2021-06-17T00:00:00.000' AS DateTime), 2532.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3689, 6, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 2503.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3690, 6, CAST(N'2021-06-21T00:00:00.000' AS DateTime), 2477.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3691, 6, CAST(N'2021-06-22T00:00:00.000' AS DateTime), 2519.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3692, 6, CAST(N'2021-06-23T00:00:00.000' AS DateTime), 2556.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3693, 6, CAST(N'2021-06-24T00:00:00.000' AS DateTime), 2570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3694, 6, CAST(N'2021-06-25T00:00:00.000' AS DateTime), 2577.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3695, 6, CAST(N'2021-06-28T00:00:00.000' AS DateTime), 2543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3696, 6, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 2540.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3697, 6, CAST(N'2021-06-30T00:00:00.000' AS DateTime), 2557.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3698, 6, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 2537.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3699, 6, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 2500.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3700, 6, CAST(N'2021-07-05T00:00:00.000' AS DateTime), 2534.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3701, 6, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 2549.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3702, 6, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 2485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3703, 6, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 2462.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3704, 6, CAST(N'2021-07-09T00:00:00.000' AS DateTime), 2473.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3705, 6, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 2532.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3706, 6, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 2545.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3707, 6, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 2560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3708, 6, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 2599.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3709, 6, CAST(N'2021-07-16T00:00:00.000' AS DateTime), 2649.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3710, 6, CAST(N'2021-07-19T00:00:00.000' AS DateTime), 2665.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3711, 6, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 2668.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3712, 6, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 2659.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3713, 6, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 2684.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3714, 6, CAST(N'2021-07-23T00:00:00.000' AS DateTime), 2678.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3715, 6, CAST(N'2021-07-26T00:00:00.000' AS DateTime), 2624.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3716, 6, CAST(N'2021-07-27T00:00:00.000' AS DateTime), 2613.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3717, 6, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 2592.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3718, 6, CAST(N'2021-07-29T00:00:00.000' AS DateTime), 2611.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3719, 6, CAST(N'2021-07-30T00:00:00.000' AS DateTime), 2694.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3720, 6, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 2650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3721, 6, CAST(N'2021-08-03T00:00:00.000' AS DateTime), 2647.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3722, 6, CAST(N'2021-08-04T00:00:00.000' AS DateTime), 2571.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3723, 6, CAST(N'2021-08-05T00:00:00.000' AS DateTime), 2482.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3724, 6, CAST(N'2021-08-06T00:00:00.000' AS DateTime), 2428.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3725, 6, CAST(N'2021-08-09T00:00:00.000' AS DateTime), 2529.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3726, 6, CAST(N'2021-08-10T00:00:00.000' AS DateTime), 2447.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3727, 6, CAST(N'2021-08-11T00:00:00.000' AS DateTime), 2446.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3728, 6, CAST(N'2021-08-12T00:00:00.000' AS DateTime), 2537.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3729, 6, CAST(N'2021-08-13T00:00:00.000' AS DateTime), 2480.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3730, 6, CAST(N'2021-08-16T00:00:00.000' AS DateTime), 2684.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3731, 6, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2681.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3732, 6, CAST(N'2021-08-18T00:00:00.000' AS DateTime), 2697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3733, 6, CAST(N'2021-08-19T00:00:00.000' AS DateTime), 2674.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3734, 6, CAST(N'2021-08-20T00:00:00.000' AS DateTime), 2658.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3735, 6, CAST(N'2021-08-23T00:00:00.000' AS DateTime), 2709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3736, 6, CAST(N'2021-08-24T00:00:00.000' AS DateTime), 2739.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3737, 6, CAST(N'2021-08-25T00:00:00.000' AS DateTime), 2715.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3738, 6, CAST(N'2021-08-26T00:00:00.000' AS DateTime), 2676.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3739, 6, CAST(N'2021-08-27T00:00:00.000' AS DateTime), 2663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3740, 6, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 2674.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3741, 6, CAST(N'2021-08-31T00:00:00.000' AS DateTime), 2678.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3742, 6, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 2672.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3743, 6, CAST(N'2021-09-02T00:00:00.000' AS DateTime), 2741.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3744, 6, CAST(N'2021-09-03T00:00:00.000' AS DateTime), 2753.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3745, 6, CAST(N'2021-09-06T00:00:00.000' AS DateTime), 2782.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3746, 6, CAST(N'2021-09-07T00:00:00.000' AS DateTime), 2847.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3747, 6, CAST(N'2021-09-08T00:00:00.000' AS DateTime), 2917.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3748, 6, CAST(N'2021-09-09T00:00:00.000' AS DateTime), 2927.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3749, 6, CAST(N'2021-09-10T00:00:00.000' AS DateTime), 2880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3750, 6, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 2932.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3751, 6, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 2891.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3752, 6, CAST(N'2021-09-15T00:00:00.000' AS DateTime), 2919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3753, 6, CAST(N'2021-09-16T00:00:00.000' AS DateTime), 3042.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3754, 6, CAST(N'2021-09-17T00:00:00.000' AS DateTime), 2967.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3755, 6, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 3011.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3756, 6, CAST(N'2021-09-23T00:00:00.000' AS DateTime), 3086.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3757, 6, CAST(N'2021-09-24T00:00:00.000' AS DateTime), 3159.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3758, 6, CAST(N'2021-09-27T00:00:00.000' AS DateTime), 3301.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3759, 6, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 3371.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3760, 6, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 3410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3761, 6, CAST(N'2021-09-30T00:00:00.000' AS DateTime), 3487.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3762, 6, CAST(N'2021-10-08T00:00:00.000' AS DateTime), 3670.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3763, 6, CAST(N'2021-10-11T00:00:00.000' AS DateTime), 3889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3764, 6, CAST(N'2021-10-12T00:00:00.000' AS DateTime), 4022.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3765, 6, CAST(N'2021-10-13T00:00:00.000' AS DateTime), 3954.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3766, 6, CAST(N'2021-10-14T00:00:00.000' AS DateTime), 3706.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3767, 6, CAST(N'2021-10-15T00:00:00.000' AS DateTime), 3769.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3768, 6, CAST(N'2021-10-18T00:00:00.000' AS DateTime), 3709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3769, 6, CAST(N'2021-10-19T00:00:00.000' AS DateTime), 3757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3770, 6, CAST(N'2021-10-20T00:00:00.000' AS DateTime), 3600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3771, 6, CAST(N'2021-10-21T00:00:00.000' AS DateTime), 3465.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3772, 6, CAST(N'2021-10-22T00:00:00.000' AS DateTime), 3245.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3773, 6, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 3178.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3774, 6, CAST(N'2021-10-26T00:00:00.000' AS DateTime), 3113.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3775, 6, CAST(N'2021-10-27T00:00:00.000' AS DateTime), 2960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3776, 6, CAST(N'2021-10-28T00:00:00.000' AS DateTime), 2720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3777, 6, CAST(N'2021-10-29T00:00:00.000' AS DateTime), 2793.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3778, 6, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 2816.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3779, 6, CAST(N'2021-11-02T00:00:00.000' AS DateTime), 2791.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3780, 6, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 2900.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3781, 6, CAST(N'2021-11-04T00:00:00.000' AS DateTime), 2840.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3782, 6, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 2840.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3783, 6, CAST(N'2021-11-08T00:00:00.000' AS DateTime), 2905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3784, 6, CAST(N'2021-11-09T00:00:00.000' AS DateTime), 2905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3785, 6, CAST(N'2021-11-10T00:00:00.000' AS DateTime), 2835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3786, 6, CAST(N'2021-11-11T00:00:00.000' AS DateTime), 2835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3787, 6, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 2765.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3788, 6, CAST(N'2021-11-15T00:00:00.000' AS DateTime), 2603.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3789, 6, CAST(N'2021-11-16T00:00:00.000' AS DateTime), 2611.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3790, 6, CAST(N'2021-11-17T00:00:00.000' AS DateTime), 2580.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3791, 6, CAST(N'2021-11-18T00:00:00.000' AS DateTime), 2557.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3792, 6, CAST(N'2021-11-19T00:00:00.000' AS DateTime), 2569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3793, 6, CAST(N'2021-11-22T00:00:00.000' AS DateTime), 2691.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3794, 6, CAST(N'2021-11-23T00:00:00.000' AS DateTime), 2707.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3795, 6, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 2739.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3796, 6, CAST(N'2021-11-25T00:00:00.000' AS DateTime), 2736.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3797, 6, CAST(N'2021-11-26T00:00:00.000' AS DateTime), 2699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3798, 6, CAST(N'2021-11-29T00:00:00.000' AS DateTime), 2640.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3799, 6, CAST(N'2021-11-30T00:00:00.000' AS DateTime), 2651.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3800, 6, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 2663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3801, 6, CAST(N'2021-12-02T00:00:00.000' AS DateTime), 2631.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3802, 6, CAST(N'2021-12-03T00:00:00.000' AS DateTime), 2620.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3803, 6, CAST(N'2021-12-06T00:00:00.000' AS DateTime), 2680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3804, 6, CAST(N'2021-12-07T00:00:00.000' AS DateTime), 2635.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3805, 6, CAST(N'2021-12-08T00:00:00.000' AS DateTime), 2625.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3806, 6, CAST(N'2021-12-09T00:00:00.000' AS DateTime), 2624.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3807, 6, CAST(N'2021-12-10T00:00:00.000' AS DateTime), 2622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3808, 6, CAST(N'2021-12-13T00:00:00.000' AS DateTime), 2671.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3809, 6, CAST(N'2021-12-14T00:00:00.000' AS DateTime), 2680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3810, 6, CAST(N'2021-12-15T00:00:00.000' AS DateTime), 2676.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3811, 6, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 2670.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3812, 6, CAST(N'2021-12-17T00:00:00.000' AS DateTime), 2704.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3813, 6, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 2705.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3814, 6, CAST(N'2021-12-21T00:00:00.000' AS DateTime), 2662.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3815, 6, CAST(N'2021-12-22T00:00:00.000' AS DateTime), 2643.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3816, 6, CAST(N'2021-12-23T00:00:00.000' AS DateTime), 2627.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3817, 6, CAST(N'2021-12-24T00:00:00.000' AS DateTime), 2654.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3818, 6, CAST(N'2021-12-27T00:00:00.000' AS DateTime), 2612.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3819, 6, CAST(N'2021-12-28T00:00:00.000' AS DateTime), 2578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3820, 6, CAST(N'2021-12-29T00:00:00.000' AS DateTime), 2577.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3821, 6, CAST(N'2021-12-30T00:00:00.000' AS DateTime), 2558.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3822, 6, CAST(N'2021-12-31T00:00:00.000' AS DateTime), 2486.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3823, 6, CAST(N'2022-01-04T00:00:00.000' AS DateTime), 2518.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3824, 6, CAST(N'2022-01-05T00:00:00.000' AS DateTime), 2506.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3825, 6, CAST(N'2022-01-06T00:00:00.000' AS DateTime), 2528.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3826, 6, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 2536.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3827, 6, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 2566.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3828, 6, CAST(N'2022-01-11T00:00:00.000' AS DateTime), 2502.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3829, 6, CAST(N'2022-01-12T00:00:00.000' AS DateTime), 2482.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3830, 6, CAST(N'2022-01-13T00:00:00.000' AS DateTime), 2504.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3831, 6, CAST(N'2022-01-14T00:00:00.000' AS DateTime), 2553.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3832, 6, CAST(N'2022-01-17T00:00:00.000' AS DateTime), 2573.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3833, 6, CAST(N'2022-01-18T00:00:00.000' AS DateTime), 2661.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3834, 6, CAST(N'2022-01-19T00:00:00.000' AS DateTime), 2757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3835, 6, CAST(N'2022-01-20T00:00:00.000' AS DateTime), 2746.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3836, 6, CAST(N'2022-01-21T00:00:00.000' AS DateTime), 2717.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3837, 6, CAST(N'2022-01-24T00:00:00.000' AS DateTime), 2719.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3838, 6, CAST(N'2022-01-25T00:00:00.000' AS DateTime), 2683.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3839, 6, CAST(N'2022-01-26T00:00:00.000' AS DateTime), 2720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3840, 6, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 2758.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3841, 6, CAST(N'2022-01-28T00:00:00.000' AS DateTime), 2788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3842, 6, CAST(N'2022-02-07T00:00:00.000' AS DateTime), 2880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3843, 6, CAST(N'2022-02-08T00:00:00.000' AS DateTime), 2831.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3844, 6, CAST(N'2022-02-09T00:00:00.000' AS DateTime), 2743.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3845, 6, CAST(N'2022-02-10T00:00:00.000' AS DateTime), 2676.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3846, 6, CAST(N'2022-02-11T00:00:00.000' AS DateTime), 2697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3847, 6, CAST(N'2022-02-14T00:00:00.000' AS DateTime), 2575.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3848, 6, CAST(N'2022-02-15T00:00:00.000' AS DateTime), 2652.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3849, 6, CAST(N'2022-02-16T00:00:00.000' AS DateTime), 2620.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3850, 6, CAST(N'2022-02-17T00:00:00.000' AS DateTime), 2584.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3851, 6, CAST(N'2022-02-18T00:00:00.000' AS DateTime), 2653.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3852, 6, CAST(N'2022-02-21T00:00:00.000' AS DateTime), 2695.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3853, 6, CAST(N'2022-02-22T00:00:00.000' AS DateTime), 2739.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3854, 6, CAST(N'2022-02-23T00:00:00.000' AS DateTime), 2734.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3855, 6, CAST(N'2022-02-24T00:00:00.000' AS DateTime), 2752.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3856, 6, CAST(N'2022-02-25T00:00:00.000' AS DateTime), 2749.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3857, 6, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 2729.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3858, 6, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2826.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3859, 6, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2903.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3860, 6, CAST(N'2022-03-03T00:00:00.000' AS DateTime), 3013.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3861, 6, CAST(N'2022-03-04T00:00:00.000' AS DateTime), 2991.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3862, 6, CAST(N'2022-03-07T00:00:00.000' AS DateTime), 3093.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3863, 6, CAST(N'2022-03-08T00:00:00.000' AS DateTime), 3035.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3864, 6, CAST(N'2022-03-09T00:00:00.000' AS DateTime), 3035.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3865, 6, CAST(N'2022-03-10T00:00:00.000' AS DateTime), 2861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3866, 6, CAST(N'2022-03-11T00:00:00.000' AS DateTime), 2890.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3867, 6, CAST(N'2022-03-14T00:00:00.000' AS DateTime), 2951.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3868, 6, CAST(N'2022-03-15T00:00:00.000' AS DateTime), 2933.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3869, 6, CAST(N'2022-03-16T00:00:00.000' AS DateTime), 2860.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3870, 6, CAST(N'2022-03-17T00:00:00.000' AS DateTime), 2879.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3871, 6, CAST(N'2022-03-18T00:00:00.000' AS DateTime), 2958.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3872, 6, CAST(N'2022-03-21T00:00:00.000' AS DateTime), 2997.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3873, 6, CAST(N'2022-03-22T00:00:00.000' AS DateTime), 3062.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3874, 6, CAST(N'2022-03-23T00:00:00.000' AS DateTime), 3025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3875, 6, CAST(N'2022-03-24T00:00:00.000' AS DateTime), 3032.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3876, 6, CAST(N'2022-03-25T00:00:00.000' AS DateTime), 3042.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3877, 6, CAST(N'2022-03-28T00:00:00.000' AS DateTime), 3061.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3878, 6, CAST(N'2022-03-29T00:00:00.000' AS DateTime), 3000.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3879, 6, CAST(N'2022-03-30T00:00:00.000' AS DateTime), 2965.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3880, 6, CAST(N'2022-03-31T00:00:00.000' AS DateTime), 2911.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3881, 6, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 2884.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3882, 6, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 2904.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3883, 6, CAST(N'2022-04-07T00:00:00.000' AS DateTime), 2904.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3884, 6, CAST(N'2022-04-08T00:00:00.000' AS DateTime), 2846.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3885, 6, CAST(N'2022-04-11T00:00:00.000' AS DateTime), 2809.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3886, 6, CAST(N'2022-04-12T00:00:00.000' AS DateTime), 2809.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3887, 6, CAST(N'2022-04-13T00:00:00.000' AS DateTime), 2810.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3888, 6, CAST(N'2022-04-14T00:00:00.000' AS DateTime), 2857.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3889, 6, CAST(N'2022-04-15T00:00:00.000' AS DateTime), 2822.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3890, 6, CAST(N'2022-04-18T00:00:00.000' AS DateTime), 2857.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3891, 6, CAST(N'2022-04-19T00:00:00.000' AS DateTime), 2933.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3892, 6, CAST(N'2022-04-20T00:00:00.000' AS DateTime), 2908.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3893, 6, CAST(N'2022-04-21T00:00:00.000' AS DateTime), 2890.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3894, 6, CAST(N'2022-04-22T00:00:00.000' AS DateTime), 2869.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3895, 6, CAST(N'2022-04-25T00:00:00.000' AS DateTime), 2738.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3896, 6, CAST(N'2022-04-26T00:00:00.000' AS DateTime), 2689.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3897, 6, CAST(N'2022-04-27T00:00:00.000' AS DateTime), 2692.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3898, 6, CAST(N'2022-04-28T00:00:00.000' AS DateTime), 2657.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3899, 6, CAST(N'2022-04-29T00:00:00.000' AS DateTime), 2655.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3900, 6, CAST(N'2022-05-05T00:00:00.000' AS DateTime), 2701.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3901, 6, CAST(N'2022-05-06T00:00:00.000' AS DateTime), 2753.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3902, 6, CAST(N'2022-05-09T00:00:00.000' AS DateTime), 2673.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3903, 6, CAST(N'2022-05-10T00:00:00.000' AS DateTime), 2620.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3904, 6, CAST(N'2022-05-11T00:00:00.000' AS DateTime), 2663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3905, 6, CAST(N'2022-05-12T00:00:00.000' AS DateTime), 2675.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3906, 6, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 2707.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3907, 6, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 2951.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3908, 6, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 2802.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3909, 6, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 2705.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3910, 6, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 2702.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3911, 6, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 2703.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3912, 6, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 2768.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3913, 6, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 2765.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3914, 6, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2708.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3915, 6, CAST(N'2022-05-26T00:00:00.000' AS DateTime), 2746.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3916, 6, CAST(N'2022-05-27T00:00:00.000' AS DateTime), 2788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3917, 6, CAST(N'2022-05-30T00:00:00.000' AS DateTime), 2779.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3918, 6, CAST(N'2022-05-31T00:00:00.000' AS DateTime), 2782.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3919, 6, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 2786.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3920, 6, CAST(N'2022-06-02T00:00:00.000' AS DateTime), 2828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3921, 6, CAST(N'2022-06-06T00:00:00.000' AS DateTime), 2838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3922, 6, CAST(N'2022-06-07T00:00:00.000' AS DateTime), 2838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3923, 6, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 2833.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3924, 6, CAST(N'2022-06-09T00:00:00.000' AS DateTime), 2836.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3925, 6, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 2730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3926, 6, CAST(N'2022-06-13T00:00:00.000' AS DateTime), 2783.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3927, 6, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 2787.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3928, 6, CAST(N'2022-06-15T00:00:00.000' AS DateTime), 2724.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3929, 6, CAST(N'2022-06-16T00:00:00.000' AS DateTime), 2746.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3930, 6, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 2701.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3931, 6, CAST(N'2022-06-20T00:00:00.000' AS DateTime), 2641.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3932, 6, CAST(N'2022-06-21T00:00:00.000' AS DateTime), 2611.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3933, 6, CAST(N'2022-06-22T00:00:00.000' AS DateTime), 2637.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3934, 6, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 2585.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3935, 6, CAST(N'2022-06-24T00:00:00.000' AS DateTime), 2560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3936, 6, CAST(N'2022-06-27T00:00:00.000' AS DateTime), 2512.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3937, 6, CAST(N'2022-06-28T00:00:00.000' AS DateTime), 2530.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3938, 6, CAST(N'2022-06-29T00:00:00.000' AS DateTime), 2575.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3939, 6, CAST(N'2022-06-30T00:00:00.000' AS DateTime), 2589.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3940, 6, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2551.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3941, 7, CAST(N'2005-09-30T00:00:00.000' AS DateTime), -75.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3942, 7, CAST(N'2005-10-03T00:00:00.000' AS DateTime), -108.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3943, 7, CAST(N'2005-11-01T00:00:00.000' AS DateTime), -176.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3944, 7, CAST(N'2005-12-01T00:00:00.000' AS DateTime), -157.1100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3945, 7, CAST(N'2006-01-03T00:00:00.000' AS DateTime), -90.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3946, 7, CAST(N'2006-02-01T00:00:00.000' AS DateTime), -130.9600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3947, 7, CAST(N'2006-03-01T00:00:00.000' AS DateTime), -127.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3948, 7, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 590.6700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3949, 7, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 601.4600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3950, 7, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 614.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3951, 7, CAST(N'2006-07-03T00:00:00.000' AS DateTime), 643.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3952, 7, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 620.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3953, 7, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 523.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3954, 7, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 508.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3955, 7, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 513.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3956, 7, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 546.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3957, 7, CAST(N'2007-01-02T00:00:00.000' AS DateTime), 507.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3958, 7, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 549.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3959, 7, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 604.4700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3960, 7, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 655.9900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3961, 7, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 686.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3962, 7, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 667.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3963, 7, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 684.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3964, 7, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 645.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3965, 7, CAST(N'2007-09-04T00:00:00.000' AS DateTime), 694.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3966, 7, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 745.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3967, 7, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 826.9700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3968, 7, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 839.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3969, 7, CAST(N'2008-01-02T00:00:00.000' AS DateTime), 827.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3970, 7, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 832.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3971, 7, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 864.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3972, 7, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 903.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3973, 7, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 987.2400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3974, 7, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 1092.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3975, 7, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1080.8200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3976, 7, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 955.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3977, 7, CAST(N'2008-09-02T00:00:00.000' AS DateTime), 847.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3978, 7, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 530.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3979, 7, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 306.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3980, 7, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 258.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3981, 7, CAST(N'2009-01-02T00:00:00.000' AS DateTime), 351.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3982, 7, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 398.3900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3983, 7, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 399.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3984, 7, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 425.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3985, 7, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 476.7200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3986, 7, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 569.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3987, 7, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 556.2800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3988, 7, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 641.6900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3989, 7, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 596.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3990, 7, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 626.5200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3991, 7, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 675.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3992, 7, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 682.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3993, 7, CAST(N'2010-01-04T00:00:00.000' AS DateTime), 715.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3994, 7, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 679.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3995, 7, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 731.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3996, 7, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 736.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3997, 7, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 684.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3998, 7, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 659.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (3999, 7, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 627.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4000, 7, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 663.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4001, 7, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 680.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4002, 7, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 755.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4003, 7, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 781.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4004, 7, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 842.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4005, 7, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 854.7100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4006, 7, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 881.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4007, 7, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 981.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4008, 7, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1054.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4009, 7, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 986.4100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4010, 7, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 933.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4011, 7, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 979.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4012, 7, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 940.9100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4013, 7, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 940.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4014, 7, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 882.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4015, 7, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 864.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4016, 7, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 876.8400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4017, 7, CAST(N'2012-01-03T00:00:00.000' AS DateTime), 950.6100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4018, 7, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1026.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4019, 7, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1068.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4020, 7, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 1029.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4021, 7, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 877.1140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4022, 7, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 729.4870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4023, 7, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 825.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4024, 7, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 935.1820)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4025, 7, CAST(N'2012-09-04T00:00:00.000' AS DateTime), 966.1310)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4026, 7, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 954.5870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4027, 7, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 930.9890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4028, 7, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 938.4740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4029, 7, CAST(N'2013-01-02T00:00:00.000' AS DateTime), 932.9550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4030, 7, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 991.8630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4031, 7, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 910.2880)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4032, 7, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 815.7020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4033, 7, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 834.1080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4034, 7, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 843.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4035, 7, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 876.7930)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4036, 7, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 913.8810)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4037, 7, CAST(N'2013-09-03T00:00:00.000' AS DateTime), 929.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4038, 7, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 901.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4039, 7, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 929.3330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4040, 7, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 956.7750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4041, 7, CAST(N'2014-01-02T00:00:00.000' AS DateTime), 918.5800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4042, 7, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 913.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4043, 7, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 911.4050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4044, 7, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 925.6250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4045, 7, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 937.8380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4046, 7, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 952.4520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4047, 7, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 935.5110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4048, 7, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 865.8130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4049, 7, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 841.3640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4050, 7, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 711.5220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4051, 7, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 628.9380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4052, 7, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 491.9760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4053, 7, CAST(N'2015-01-02T00:00:00.000' AS DateTime), 396.9050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4054, 7, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 502.1250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4055, 7, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 504.8640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4056, 7, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 525.6130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4057, 7, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 550.8550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4058, 7, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 538.0680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4059, 7, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 472.3700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4060, 7, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 448.7790)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4061, 7, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 411.6590)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4062, 7, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 430.2610)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4063, 7, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 419.1790)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4064, 7, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 387.4050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4065, 7, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 317.8250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4066, 7, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 292.7140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4067, 7, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 350.6430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4068, 7, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 379.2740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4069, 7, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 402.4380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4070, 7, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 417.1930)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4071, 7, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 380.1550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4072, 7, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 369.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4073, 7, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 395.9720)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4074, 7, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 441.7980)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4075, 7, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 415.9770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4076, 7, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 463.1630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4077, 7, CAST(N'2017-01-03T00:00:00.000' AS DateTime), 499.3690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4078, 7, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 498.2630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4079, 7, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 459.4130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4080, 7, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 467.9440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4081, 7, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 434.6190)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4082, 7, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 400.6820)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4083, 7, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 424.8100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4084, 7, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 459.1590)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4085, 7, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 503.9640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4086, 7, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 519.1250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4087, 7, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 571.7270)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4088, 7, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 576.5530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4089, 7, CAST(N'2018-01-02T00:00:00.000' AS DateTime), 592.2270)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4090, 7, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 555.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4091, 7, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 571.4400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4092, 7, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 607.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4093, 7, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 666.8210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4094, 7, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 632.5480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4095, 7, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 642.7270)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4096, 7, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 640.6020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4097, 7, CAST(N'2018-09-04T00:00:00.000' AS DateTime), 676.1250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4098, 7, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 661.8150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4099, 7, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 505.5910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4100, 7, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 462.8680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4101, 7, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 459.1590)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4102, 7, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 499.8250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4103, 7, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 533.1550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4104, 7, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 563.1630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4105, 7, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 544.5710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4106, 7, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 472.9380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4107, 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 503.4570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4108, 7, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 446.8570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4109, 7, CAST(N'2019-09-03T00:00:00.000' AS DateTime), 479.4640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4110, 7, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 491.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4111, 7, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 529.9880)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4112, 7, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 540.3250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4113, 7, CAST(N'2020-01-02T00:00:00.000' AS DateTime), 527.2270)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4114, 7, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 465.4130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4115, 7, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 246.7050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4116, 7, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 138.4130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4117, 7, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 228.9080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4118, 7, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 342.2270)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4119, 7, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 380.8480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4120, 7, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 388.4160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4121, 7, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 366.7390)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4122, 7, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 375.0680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4123, 7, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 370.7380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4124, 7, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 432.7020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4125, 7, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 499.9890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4126, 7, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 555.3380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4127, 7, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 572.9460)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4128, 7, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 557.9380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4129, 7, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 592.9470)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4130, 7, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 633.6140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4131, 7, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 673.3860)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4132, 7, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 646.8690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4133, 7, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 678.8070)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4134, 7, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 763.0480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4135, 7, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 733.0680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4136, 7, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 698.0480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4137, 7, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 775.0630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4138, 7, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 861.5250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4139, 7, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 996.0330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4140, 7, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 904.2110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4141, 7, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 888.3930)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4142, 7, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 802.9250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4143, 7, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 811.8190)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4144, 8, CAST(N'1990-04-03T00:00:00.000' AS DateTime), 1.5650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4145, 8, CAST(N'1990-05-01T00:00:00.000' AS DateTime), 1.5900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4146, 8, CAST(N'1990-06-01T00:00:00.000' AS DateTime), 1.5190)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4147, 8, CAST(N'1990-07-02T00:00:00.000' AS DateTime), 1.4110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4148, 8, CAST(N'1990-08-01T00:00:00.000' AS DateTime), 1.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4149, 8, CAST(N'1990-09-03T00:00:00.000' AS DateTime), 1.9350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4150, 8, CAST(N'1990-10-01T00:00:00.000' AS DateTime), 2.3600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4151, 8, CAST(N'1990-11-01T00:00:00.000' AS DateTime), 2.4450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4152, 8, CAST(N'1990-12-03T00:00:00.000' AS DateTime), 1.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4153, 8, CAST(N'1991-01-01T00:00:00.000' AS DateTime), 1.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4154, 8, CAST(N'1991-02-01T00:00:00.000' AS DateTime), 1.3730)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4155, 8, CAST(N'1991-03-01T00:00:00.000' AS DateTime), 1.3400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4156, 8, CAST(N'1991-04-01T00:00:00.000' AS DateTime), 1.3750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4157, 8, CAST(N'1991-05-01T00:00:00.000' AS DateTime), 1.3330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4158, 8, CAST(N'1991-06-03T00:00:00.000' AS DateTime), 1.2080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4159, 8, CAST(N'1991-07-01T00:00:00.000' AS DateTime), 1.2600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4160, 8, CAST(N'1991-08-01T00:00:00.000' AS DateTime), 1.5640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4161, 8, CAST(N'1991-09-02T00:00:00.000' AS DateTime), 1.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4162, 8, CAST(N'1991-10-01T00:00:00.000' AS DateTime), 2.0460)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4163, 8, CAST(N'1991-11-04T00:00:00.000' AS DateTime), 2.0900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4164, 8, CAST(N'1991-12-02T00:00:00.000' AS DateTime), 1.3430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4165, 8, CAST(N'1992-01-01T00:00:00.000' AS DateTime), 1.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4166, 8, CAST(N'1992-02-04T00:00:00.000' AS DateTime), 1.1710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4167, 8, CAST(N'1992-03-02T00:00:00.000' AS DateTime), 1.3570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4168, 8, CAST(N'1992-04-01T00:00:00.000' AS DateTime), 1.4220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4169, 8, CAST(N'1992-05-01T00:00:00.000' AS DateTime), 1.6250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4170, 8, CAST(N'1992-06-01T00:00:00.000' AS DateTime), 1.5180)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4171, 8, CAST(N'1992-07-01T00:00:00.000' AS DateTime), 1.8920)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4172, 8, CAST(N'1992-08-03T00:00:00.000' AS DateTime), 2.1120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4173, 8, CAST(N'1992-09-01T00:00:00.000' AS DateTime), 2.5150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4174, 8, CAST(N'1992-10-01T00:00:00.000' AS DateTime), 2.2950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4175, 8, CAST(N'1992-11-02T00:00:00.000' AS DateTime), 2.0870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4176, 8, CAST(N'1992-12-01T00:00:00.000' AS DateTime), 1.6870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4177, 8, CAST(N'1993-01-01T00:00:00.000' AS DateTime), 1.5970)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4178, 8, CAST(N'1993-02-01T00:00:00.000' AS DateTime), 1.8560)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4179, 8, CAST(N'1993-03-01T00:00:00.000' AS DateTime), 2.0690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4180, 8, CAST(N'1993-04-01T00:00:00.000' AS DateTime), 2.3650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4181, 8, CAST(N'1993-05-03T00:00:00.000' AS DateTime), 2.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4182, 8, CAST(N'1993-06-01T00:00:00.000' AS DateTime), 2.1810)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4183, 8, CAST(N'1993-07-01T00:00:00.000' AS DateTime), 2.2200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4184, 8, CAST(N'1993-08-02T00:00:00.000' AS DateTime), 2.3750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4185, 8, CAST(N'1993-09-01T00:00:00.000' AS DateTime), 2.2910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4186, 8, CAST(N'1993-10-01T00:00:00.000' AS DateTime), 2.3680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4187, 8, CAST(N'1993-11-01T00:00:00.000' AS DateTime), 2.2430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4188, 8, CAST(N'1993-12-01T00:00:00.000' AS DateTime), 2.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4189, 8, CAST(N'1994-01-03T00:00:00.000' AS DateTime), 2.5540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4190, 8, CAST(N'1994-02-01T00:00:00.000' AS DateTime), 2.2080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4191, 8, CAST(N'1994-03-01T00:00:00.000' AS DateTime), 2.0750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4192, 8, CAST(N'1994-04-01T00:00:00.000' AS DateTime), 2.0670)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4193, 8, CAST(N'1994-05-02T00:00:00.000' AS DateTime), 1.9170)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4194, 8, CAST(N'1994-06-01T00:00:00.000' AS DateTime), 2.1840)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4195, 8, CAST(N'1994-07-01T00:00:00.000' AS DateTime), 1.8930)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4196, 8, CAST(N'1994-08-01T00:00:00.000' AS DateTime), 1.5860)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4197, 8, CAST(N'1994-09-01T00:00:00.000' AS DateTime), 1.6570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4198, 8, CAST(N'1994-10-03T00:00:00.000' AS DateTime), 1.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4199, 8, CAST(N'1994-11-01T00:00:00.000' AS DateTime), 1.6950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4200, 8, CAST(N'1994-12-01T00:00:00.000' AS DateTime), 1.6860)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4201, 8, CAST(N'1995-01-02T00:00:00.000' AS DateTime), 1.3540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4202, 8, CAST(N'1995-02-01T00:00:00.000' AS DateTime), 1.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4203, 8, CAST(N'1995-03-01T00:00:00.000' AS DateTime), 1.6850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4204, 8, CAST(N'1995-04-03T00:00:00.000' AS DateTime), 1.6620)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4205, 8, CAST(N'1995-05-01T00:00:00.000' AS DateTime), 1.7180)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4206, 8, CAST(N'1995-06-01T00:00:00.000' AS DateTime), 1.5300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4207, 8, CAST(N'1995-07-03T00:00:00.000' AS DateTime), 1.6140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4208, 8, CAST(N'1995-08-01T00:00:00.000' AS DateTime), 1.7480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4209, 8, CAST(N'1995-09-01T00:00:00.000' AS DateTime), 1.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4210, 8, CAST(N'1995-10-02T00:00:00.000' AS DateTime), 1.8660)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4211, 8, CAST(N'1995-11-01T00:00:00.000' AS DateTime), 2.0180)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4212, 8, CAST(N'1995-12-01T00:00:00.000' AS DateTime), 2.6190)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4213, 8, CAST(N'1996-01-01T00:00:00.000' AS DateTime), 2.6580)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4214, 8, CAST(N'1996-02-01T00:00:00.000' AS DateTime), 2.2360)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4215, 8, CAST(N'1996-03-01T00:00:00.000' AS DateTime), 2.3360)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4216, 8, CAST(N'1996-04-01T00:00:00.000' AS DateTime), 2.2240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4217, 8, CAST(N'1996-05-01T00:00:00.000' AS DateTime), 2.4060)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4218, 8, CAST(N'1996-06-03T00:00:00.000' AS DateTime), 2.9110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4219, 8, CAST(N'1996-07-01T00:00:00.000' AS DateTime), 2.1630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4220, 8, CAST(N'1996-08-01T00:00:00.000' AS DateTime), 1.8590)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4221, 8, CAST(N'1996-09-02T00:00:00.000' AS DateTime), 2.2140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4222, 8, CAST(N'1996-10-01T00:00:00.000' AS DateTime), 2.7280)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4223, 8, CAST(N'1996-11-01T00:00:00.000' AS DateTime), 3.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4224, 8, CAST(N'1996-12-02T00:00:00.000' AS DateTime), 2.7570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4225, 8, CAST(N'1997-01-01T00:00:00.000' AS DateTime), 2.3850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4226, 8, CAST(N'1997-02-03T00:00:00.000' AS DateTime), 1.8210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4227, 8, CAST(N'1997-03-03T00:00:00.000' AS DateTime), 1.9260)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4228, 8, CAST(N'1997-04-01T00:00:00.000' AS DateTime), 2.1840)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4229, 8, CAST(N'1997-05-01T00:00:00.000' AS DateTime), 2.2390)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4230, 8, CAST(N'1997-06-02T00:00:00.000' AS DateTime), 2.1390)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4231, 8, CAST(N'1997-07-01T00:00:00.000' AS DateTime), 2.1770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4232, 8, CAST(N'1997-08-01T00:00:00.000' AS DateTime), 2.7140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4233, 8, CAST(N'1997-09-01T00:00:00.000' AS DateTime), 3.0820)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4234, 8, CAST(N'1997-10-01T00:00:00.000' AS DateTime), 3.5520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4235, 8, CAST(N'1997-11-03T00:00:00.000' AS DateTime), 2.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4236, 8, CAST(N'1997-12-01T00:00:00.000' AS DateTime), 2.2640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4237, 8, CAST(N'1998-01-01T00:00:00.000' AS DateTime), 2.2570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4238, 8, CAST(N'1998-02-02T00:00:00.000' AS DateTime), 2.3210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4239, 8, CAST(N'1998-03-02T00:00:00.000' AS DateTime), 2.5220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4240, 8, CAST(N'1998-04-01T00:00:00.000' AS DateTime), 2.2210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4241, 8, CAST(N'1998-05-01T00:00:00.000' AS DateTime), 2.1700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4242, 8, CAST(N'1998-06-01T00:00:00.000' AS DateTime), 2.4690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4243, 8, CAST(N'1998-07-01T00:00:00.000' AS DateTime), 1.8440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4244, 8, CAST(N'1998-08-03T00:00:00.000' AS DateTime), 1.7520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4245, 8, CAST(N'1998-09-01T00:00:00.000' AS DateTime), 2.4330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4246, 8, CAST(N'1998-10-01T00:00:00.000' AS DateTime), 2.2750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4247, 8, CAST(N'1998-11-02T00:00:00.000' AS DateTime), 1.9760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4248, 8, CAST(N'1998-12-01T00:00:00.000' AS DateTime), 1.9450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4249, 8, CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1.7770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4250, 8, CAST(N'1999-02-01T00:00:00.000' AS DateTime), 1.6280)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4251, 8, CAST(N'1999-03-01T00:00:00.000' AS DateTime), 2.0130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4252, 8, CAST(N'1999-04-01T00:00:00.000' AS DateTime), 2.2530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4253, 8, CAST(N'1999-05-03T00:00:00.000' AS DateTime), 2.2900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4254, 8, CAST(N'1999-06-01T00:00:00.000' AS DateTime), 2.3940)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4255, 8, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 2.5430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4256, 8, CAST(N'1999-08-02T00:00:00.000' AS DateTime), 2.8250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4257, 8, CAST(N'1999-09-01T00:00:00.000' AS DateTime), 2.7440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4258, 8, CAST(N'1999-10-01T00:00:00.000' AS DateTime), 2.9610)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4259, 8, CAST(N'1999-11-01T00:00:00.000' AS DateTime), 2.3040)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4260, 8, CAST(N'1999-12-01T00:00:00.000' AS DateTime), 2.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4261, 8, CAST(N'2000-01-03T00:00:00.000' AS DateTime), 2.6620)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4262, 8, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 2.7610)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4263, 8, CAST(N'2000-03-01T00:00:00.000' AS DateTime), 2.9450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4264, 8, CAST(N'2000-04-03T00:00:00.000' AS DateTime), 3.1410)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4265, 8, CAST(N'2000-05-01T00:00:00.000' AS DateTime), 4.3560)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4266, 8, CAST(N'2000-06-01T00:00:00.000' AS DateTime), 4.4760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4267, 8, CAST(N'2000-07-03T00:00:00.000' AS DateTime), 3.7740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4268, 8, CAST(N'2000-08-01T00:00:00.000' AS DateTime), 4.7820)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4269, 8, CAST(N'2000-09-01T00:00:00.000' AS DateTime), 5.1860)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4270, 8, CAST(N'2000-10-02T00:00:00.000' AS DateTime), 4.4900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4271, 8, CAST(N'2000-11-01T00:00:00.000' AS DateTime), 6.5890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4272, 8, CAST(N'2000-12-01T00:00:00.000' AS DateTime), 9.7750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4273, 8, CAST(N'2001-01-01T00:00:00.000' AS DateTime), 5.7070)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4274, 8, CAST(N'2001-02-01T00:00:00.000' AS DateTime), 5.2360)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4275, 8, CAST(N'2001-03-01T00:00:00.000' AS DateTime), 5.0250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4276, 8, CAST(N'2001-04-02T00:00:00.000' AS DateTime), 4.6950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4277, 8, CAST(N'2001-05-01T00:00:00.000' AS DateTime), 3.9140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4278, 8, CAST(N'2001-06-01T00:00:00.000' AS DateTime), 3.0960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4279, 8, CAST(N'2001-07-02T00:00:00.000' AS DateTime), 3.2960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4280, 8, CAST(N'2001-08-01T00:00:00.000' AS DateTime), 2.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4281, 8, CAST(N'2001-09-03T00:00:00.000' AS DateTime), 2.2440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4282, 8, CAST(N'2001-10-01T00:00:00.000' AS DateTime), 3.2910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4283, 8, CAST(N'2001-11-01T00:00:00.000' AS DateTime), 2.7010)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4284, 8, CAST(N'2001-12-03T00:00:00.000' AS DateTime), 2.5700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4285, 8, CAST(N'2002-01-01T00:00:00.000' AS DateTime), 2.1380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4286, 8, CAST(N'2002-02-01T00:00:00.000' AS DateTime), 2.3570)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4287, 8, CAST(N'2002-03-01T00:00:00.000' AS DateTime), 3.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4288, 8, CAST(N'2002-04-01T00:00:00.000' AS DateTime), 3.7950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4289, 8, CAST(N'2002-05-01T00:00:00.000' AS DateTime), 3.2170)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4290, 8, CAST(N'2002-06-03T00:00:00.000' AS DateTime), 3.2450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4291, 8, CAST(N'2002-07-01T00:00:00.000' AS DateTime), 2.9540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4292, 8, CAST(N'2002-08-01T00:00:00.000' AS DateTime), 3.2960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4293, 8, CAST(N'2002-09-02T00:00:00.000' AS DateTime), 4.1380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4294, 8, CAST(N'2002-10-01T00:00:00.000' AS DateTime), 4.1560)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4295, 8, CAST(N'2002-11-01T00:00:00.000' AS DateTime), 4.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4296, 8, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 4.7890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4297, 8, CAST(N'2003-01-01T00:00:00.000' AS DateTime), 5.6050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4298, 8, CAST(N'2003-02-03T00:00:00.000' AS DateTime), 8.1010)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4299, 8, CAST(N'2003-03-03T00:00:00.000' AS DateTime), 5.0600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4300, 8, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 5.3850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4301, 8, CAST(N'2003-05-01T00:00:00.000' AS DateTime), 6.2510)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4302, 8, CAST(N'2003-06-02T00:00:00.000' AS DateTime), 5.4110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4303, 8, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 4.7180)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4304, 8, CAST(N'2003-08-01T00:00:00.000' AS DateTime), 4.7310)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4305, 8, CAST(N'2003-09-01T00:00:00.000' AS DateTime), 4.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4306, 8, CAST(N'2003-10-01T00:00:00.000' AS DateTime), 4.8930)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4307, 8, CAST(N'2003-11-03T00:00:00.000' AS DateTime), 4.8600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4308, 8, CAST(N'2003-12-01T00:00:00.000' AS DateTime), 6.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4309, 8, CAST(N'2004-01-01T00:00:00.000' AS DateTime), 5.3970)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4310, 8, CAST(N'2004-02-02T00:00:00.000' AS DateTime), 5.4160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4311, 8, CAST(N'2004-03-01T00:00:00.000' AS DateTime), 5.9330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4312, 8, CAST(N'2004-04-01T00:00:00.000' AS DateTime), 5.8620)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4313, 8, CAST(N'2004-05-03T00:00:00.000' AS DateTime), 6.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4314, 8, CAST(N'2004-06-01T00:00:00.000' AS DateTime), 6.1550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4315, 8, CAST(N'2004-07-01T00:00:00.000' AS DateTime), 6.1120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4316, 8, CAST(N'2004-08-02T00:00:00.000' AS DateTime), 5.0740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4317, 8, CAST(N'2004-09-01T00:00:00.000' AS DateTime), 6.7950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4318, 8, CAST(N'2004-10-01T00:00:00.000' AS DateTime), 8.7250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4319, 8, CAST(N'2004-11-01T00:00:00.000' AS DateTime), 7.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4320, 8, CAST(N'2004-12-01T00:00:00.000' AS DateTime), 6.0200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4321, 8, CAST(N'2005-01-03T00:00:00.000' AS DateTime), 6.3210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4322, 8, CAST(N'2005-02-01T00:00:00.000' AS DateTime), 6.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4323, 8, CAST(N'2005-03-01T00:00:00.000' AS DateTime), 7.6530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4324, 8, CAST(N'2005-04-01T00:00:00.000' AS DateTime), 6.5850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4325, 8, CAST(N'2005-05-02T00:00:00.000' AS DateTime), 6.3790)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4326, 8, CAST(N'2005-06-01T00:00:00.000' AS DateTime), 6.9810)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4327, 8, CAST(N'2005-07-01T00:00:00.000' AS DateTime), 7.8850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4328, 8, CAST(N'2005-08-01T00:00:00.000' AS DateTime), 11.4720)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4329, 8, CAST(N'2005-09-01T00:00:00.000' AS DateTime), 13.9210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4330, 8, CAST(N'2005-10-03T00:00:00.000' AS DateTime), 12.2050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4331, 8, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 12.5870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4332, 8, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 11.2250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4333, 8, CAST(N'2006-01-02T00:00:00.000' AS DateTime), 9.3160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4334, 8, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 6.7140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4335, 8, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 7.2100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4336, 8, CAST(N'2006-04-03T00:00:00.000' AS DateTime), 6.5550)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4337, 8, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 6.3840)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4338, 8, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 6.1040)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4339, 8, CAST(N'2006-07-03T00:00:00.000' AS DateTime), 8.2110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4340, 8, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 6.0480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4341, 8, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 5.6200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4342, 8, CAST(N'2006-10-02T00:00:00.000' AS DateTime), 7.5340)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4343, 8, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 8.8440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4344, 8, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 6.2990)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4345, 8, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 7.6670)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4346, 8, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 7.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4347, 8, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 7.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4348, 8, CAST(N'2007-04-02T00:00:00.000' AS DateTime), 7.8630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4349, 8, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 7.9350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4350, 8, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 6.7730)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4351, 8, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 6.1910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4352, 8, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 5.4680)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4353, 8, CAST(N'2007-09-03T00:00:00.000' AS DateTime), 6.8700)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4354, 8, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 8.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4355, 8, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 7.3020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4356, 8, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 7.4830)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4357, 8, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 8.0740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4358, 8, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 9.3660)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4359, 8, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 10.1010)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4360, 8, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 10.8430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4361, 8, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 11.7030)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4362, 8, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 13.3530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4363, 8, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 9.1190)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4364, 8, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 7.9430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4365, 8, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 7.4380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4366, 8, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 6.7830)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4367, 8, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 6.5100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4368, 8, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 5.6220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4369, 8, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 4.4170)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4370, 8, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 4.1980)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4371, 8, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 3.7760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4372, 8, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 3.3730)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4373, 8, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 3.8350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4374, 8, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 3.8350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4375, 8, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 3.6530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4376, 8, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 2.9770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4377, 8, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 4.8410)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4378, 8, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 5.0450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4379, 8, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 4.8480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4380, 8, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 5.5720)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4381, 8, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 5.1310)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4382, 8, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 4.8130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4383, 8, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 3.8690)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4384, 8, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 3.9200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4385, 8, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 4.3100)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4386, 8, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 4.6160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4387, 8, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 4.9230)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4388, 8, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 3.8160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4389, 8, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 3.8720)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4390, 8, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 4.0380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4391, 8, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 4.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4392, 8, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 4.4050)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4393, 8, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 4.4200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4394, 8, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 4.0370)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4395, 8, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 4.3890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4396, 8, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 4.6980)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4397, 8, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 4.6660)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4398, 8, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 4.3740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4399, 8, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 4.1450)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4400, 8, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 4.0540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4401, 8, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 3.6660)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4402, 8, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 3.9340)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4403, 8, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 3.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4404, 8, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 2.9890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4405, 8, CAST(N'2012-01-02T00:00:00.000' AS DateTime), 2.5030)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4406, 8, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 2.6160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4407, 8, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 2.1260)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4408, 8, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 2.2850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4409, 8, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 2.4220)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4410, 8, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 2.8240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4411, 8, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 3.2090)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4412, 8, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 2.7990)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4413, 8, CAST(N'2012-09-03T00:00:00.000' AS DateTime), 3.3200)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4414, 8, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 3.6920)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4415, 8, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 3.5610)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4416, 8, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 3.3510)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4417, 8, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 3.3390)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4418, 8, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 3.4860)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4419, 8, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 4.0300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4420, 8, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 4.3430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4421, 8, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 3.9840)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4422, 8, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 3.5650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4423, 8, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 3.4460)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4424, 8, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 3.5810)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4425, 8, CAST(N'2013-09-02T00:00:00.000' AS DateTime), 3.5600)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4426, 8, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 3.5810)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4427, 8, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 3.9540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4428, 8, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 4.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4429, 8, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 4.9430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4430, 8, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 4.6090)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4431, 8, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 4.3710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4432, 8, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 4.8150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4433, 8, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 4.5420)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4434, 8, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 4.4610)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4435, 8, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 3.8410)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4436, 8, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 4.0650)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4437, 8, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 4.1210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4438, 8, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 3.8730)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4439, 8, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 4.0880)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4440, 8, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 2.8890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4441, 8, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 2.6910)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4442, 8, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 2.7340)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4443, 8, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 2.6400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4444, 8, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 2.7510)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4445, 8, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 2.6420)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4446, 8, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 2.8320)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4447, 8, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 2.7160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4448, 8, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 2.6890)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4449, 8, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 2.5240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4450, 8, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 2.3210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4451, 8, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 2.2350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4452, 8, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 2.3370)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4453, 8, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 2.2980)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4454, 8, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1.7110)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4455, 8, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1.9590)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4456, 8, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 2.1780)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4457, 8, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 2.2880)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4458, 8, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 2.9240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4459, 8, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 2.8760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4460, 8, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 2.8870)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4461, 8, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 2.9060)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4462, 8, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 3.0260)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4463, 8, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 3.3520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4464, 8, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 3.7240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4465, 8, CAST(N'2017-01-02T00:00:00.000' AS DateTime), 3.1170)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4466, 8, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 2.7740)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4467, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 3.1900)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4468, 8, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 3.2760)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4469, 8, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 3.0710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4470, 8, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 3.0350)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4471, 8, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 2.7940)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4472, 8, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 3.0400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4473, 8, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 3.0070)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4474, 8, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 2.8960)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4475, 8, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 3.0250)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4476, 8, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 2.9530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4477, 8, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 2.9950)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4478, 8, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 2.6670)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4479, 8, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 2.7330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4480, 8, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 2.7630)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4481, 8, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 2.9520)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4482, 8, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 2.9240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4483, 8, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 2.7820)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4484, 8, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 2.9160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4485, 8, CAST(N'2018-09-03T00:00:00.000' AS DateTime), 3.0080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4486, 8, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 3.2610)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4487, 8, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 4.6120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4488, 8, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 2.9400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4489, 8, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 2.8140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4490, 8, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 2.8120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4491, 8, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 2.6620)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4492, 8, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 2.5750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4493, 8, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 2.4540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4494, 8, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 2.3080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4495, 8, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 2.2330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4496, 8, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 2.2850)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4497, 8, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 2.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4498, 8, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 2.6330)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4499, 8, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 2.3144)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4500, 8, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 2.1512)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4501, 8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1.8415)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4502, 8, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 1.8130)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4503, 8, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 1.6480)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4504, 8, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 1.9340)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4505, 8, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1.8390)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4506, 8, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 1.7240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4507, 8, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 1.8140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4508, 8, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 2.6430)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4509, 8, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 2.5560)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4510, 8, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 3.3540)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4511, 8, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 2.8820)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4512, 8, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 2.5390)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4513, 8, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 2.5640)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4514, 8, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 2.7710)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4515, 8, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2.6080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4516, 8, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 2.9310)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4517, 8, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 3.0530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4518, 8, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 3.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4519, 8, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 3.9140)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4520, 8, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 4.3770)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4521, 8, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 5.8670)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4522, 8, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 5.4260)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4523, 8, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 4.5060)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4524, 8, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 3.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4525, 8, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 4.6750)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4526, 8, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 4.4020)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4527, 8, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 5.7010)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4528, 8, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 7.2440)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4529, 8, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 8.1380)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4530, 8, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 5.4240)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4531, 8, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 5.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4532, 9, CAST(N'2009-10-27T00:00:00.000' AS DateTime), 1.0538)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4533, 9, CAST(N'2009-11-02T00:00:00.000' AS DateTime), 1.1400)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4534, 9, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 1.1926)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4535, 9, CAST(N'2010-01-04T00:00:00.000' AS DateTime), 1.3217)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4536, 9, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 1.2881)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4537, 9, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 1.1361)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4538, 9, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 1.1369)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4539, 9, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 1.0748)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4540, 9, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 1.0381)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4541, 9, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 1.0080)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4542, 9, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 1.0692)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4543, 9, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1.1304)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4544, 9, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1.2319)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4545, 9, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1.2517)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4546, 9, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1.2942)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4547, 9, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 1.3617)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4548, 9, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1.4161)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4549, 9, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1.4009)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4550, 9, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1.4487)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4551, 9, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 1.5226)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4552, 9, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1.5210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4553, 9, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1.5252)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4554, 9, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1.5292)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4555, 9, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1.5617)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4556, 9, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 1.4718)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4557, 9, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1.4563)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4558, 9, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1.3953)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4559, 9, CAST(N'2012-01-03T00:00:00.000' AS DateTime), 1.2975)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4560, 9, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1.2212)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4561, 9, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1.2594)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4562, 9, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 1.1946)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4563, 9, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 0.9488)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4564, 9, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 0.7828)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4565, 9, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 0.8748)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4566, 9, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 0.8970)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4567, 9, CAST(N'2012-09-04T00:00:00.000' AS DateTime), 0.9104)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4568, 9, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 0.9632)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4569, 9, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 0.8937)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4570, 9, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 0.8026)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4571, 9, CAST(N'2013-01-02T00:00:00.000' AS DateTime), 0.8374)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4572, 9, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 0.8614)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4573, 9, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 0.8886)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4574, 9, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 0.9370)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4575, 9, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 0.9337)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4576, 9, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 0.8625)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4577, 9, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 0.9193)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4578, 9, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 1.0581)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4579, 9, CAST(N'2013-09-03T00:00:00.000' AS DateTime), 1.1082)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4580, 9, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 1.1332)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4581, 9, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 1.1769)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4582, 9, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 1.2742)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4583, 9, CAST(N'2014-01-02T00:00:00.000' AS DateTime), 1.3962)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4584, 9, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 1.4563)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4585, 9, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 1.0611)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4586, 9, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 1.0988)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4587, 9, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 1.0418)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4588, 9, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 1.0457)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4589, 9, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 1.0361)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4590, 9, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 1.0171)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4591, 9, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 1.0635)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4592, 9, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 0.9401)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4593, 9, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 0.8042)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4594, 9, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 0.5532)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4595, 9, CAST(N'2015-01-05T00:00:00.000' AS DateTime), 0.4785)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4596, 9, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 0.5712)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4597, 9, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 0.5431)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4598, 9, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 0.5476)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4599, 9, CAST(N'2015-05-04T00:00:00.000' AS DateTime), 0.4717)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4600, 9, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 0.3869)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4601, 9, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 0.4106)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4602, 9, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 0.3733)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4603, 9, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 0.4547)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4604, 9, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 0.4503)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4605, 9, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 0.4298)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4606, 9, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 0.3876)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4607, 9, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 0.3362)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4608, 9, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 0.3747)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4609, 9, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 0.4515)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4610, 9, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 0.4552)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4611, 9, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 0.5160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4612, 9, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 0.5033)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4613, 9, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 0.4775)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4614, 9, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 0.4489)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4615, 9, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0.4977)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4616, 9, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 0.5803)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4617, 9, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 0.5375)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4618, 9, CAST(N'2016-12-02T00:00:00.000' AS DateTime), 0.6411)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4619, 9, CAST(N'2017-01-03T00:00:00.000' AS DateTime), 0.7596)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4620, 9, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 0.7670)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4621, 9, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 0.6185)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4622, 9, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 0.6530)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4623, 9, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 0.6398)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4624, 9, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 0.5932)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4625, 9, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 0.6544)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4626, 9, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 0.7579)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4627, 9, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 0.8868)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4628, 9, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 0.9385)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4629, 9, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 0.9824)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4630, 9, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 0.9593)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4631, 9, CAST(N'2018-01-02T00:00:00.000' AS DateTime), 0.9014)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4632, 9, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 0.8393)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4633, 9, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 0.7913)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4634, 9, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 0.8232)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4635, 9, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 0.9160)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4636, 9, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 0.8801)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4637, 9, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 0.9383)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4638, 9, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 0.9749)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4639, 9, CAST(N'2018-09-04T00:00:00.000' AS DateTime), 1.0595)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4640, 9, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 0.9594)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4641, 9, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 0.7471)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4642, 9, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 0.6798)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4643, 9, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 0.6656)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4644, 9, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 0.6719)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4645, 9, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 0.6671)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4646, 9, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 0.6420)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4647, 9, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 0.5765)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4648, 9, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 0.4452)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4649, 9, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 0.4857)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4650, 9, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 0.4027)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4651, 9, CAST(N'2019-09-03T00:00:00.000' AS DateTime), 0.4495)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4652, 9, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 0.4658)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4653, 9, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 0.5299)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4654, 9, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 0.4953)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4655, 9, CAST(N'2020-01-02T00:00:00.000' AS DateTime), 0.4287)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4656, 9, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 0.3944)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4657, 9, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 0.2938)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4658, 9, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 0.3264)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4659, 9, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 0.4120)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4660, 9, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 0.4973)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4661, 9, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 0.4921)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4662, 9, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 0.5057)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4663, 9, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 0.4936)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4664, 9, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 0.5210)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4665, 9, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 0.5463)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4666, 9, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 0.6455)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4667, 9, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 0.8494)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4668, 9, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 0.9134)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4669, 9, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 0.9237)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4670, 9, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 0.8173)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4671, 9, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 0.8246)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4672, 9, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 0.9706)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4673, 9, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 1.0942)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4674, 9, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 1.1134)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4675, 9, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 1.2912)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4676, 9, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 1.4462)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4677, 9, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 1.2592)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4678, 9, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 1.0371)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4679, 9, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 1.1661)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4680, 9, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1.3143)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4681, 9, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1.4385)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4682, 9, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 1.3075)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4683, 9, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1.2328)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4684, 9, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 1.2150)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4685, 9, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1.2158)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4686, 10, CAST(N'1988-01-01T00:00:00.000' AS DateTime), 16.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4687, 10, CAST(N'1988-02-01T00:00:00.000' AS DateTime), 16.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4688, 10, CAST(N'1988-03-01T00:00:00.000' AS DateTime), 15.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4689, 10, CAST(N'1988-04-01T00:00:00.000' AS DateTime), 15.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4690, 10, CAST(N'1988-05-01T00:00:00.000' AS DateTime), 15.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4691, 10, CAST(N'1988-06-01T00:00:00.000' AS DateTime), 15.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4692, 10, CAST(N'1988-07-01T00:00:00.000' AS DateTime), 14.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4693, 10, CAST(N'1988-08-01T00:00:00.000' AS DateTime), 14.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4694, 10, CAST(N'1988-09-01T00:00:00.000' AS DateTime), 13.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4695, 10, CAST(N'1988-10-01T00:00:00.000' AS DateTime), 13.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4696, 10, CAST(N'1988-11-01T00:00:00.000' AS DateTime), 12.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4697, 10, CAST(N'1988-12-01T00:00:00.000' AS DateTime), 11.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4698, 10, CAST(N'1989-01-01T00:00:00.000' AS DateTime), 11.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4699, 10, CAST(N'1989-02-01T00:00:00.000' AS DateTime), 11.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4700, 10, CAST(N'1989-03-01T00:00:00.000' AS DateTime), 10.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4701, 10, CAST(N'1989-04-01T00:00:00.000' AS DateTime), 10.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4702, 10, CAST(N'1989-05-01T00:00:00.000' AS DateTime), 9.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4703, 10, CAST(N'1989-06-01T00:00:00.000' AS DateTime), 9.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4704, 10, CAST(N'1989-07-01T00:00:00.000' AS DateTime), 9.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4705, 10, CAST(N'1989-08-01T00:00:00.000' AS DateTime), 9.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4706, 10, CAST(N'1989-09-01T00:00:00.000' AS DateTime), 9.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4707, 10, CAST(N'1989-10-01T00:00:00.000' AS DateTime), 9.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4708, 10, CAST(N'1989-11-01T00:00:00.000' AS DateTime), 9.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4709, 10, CAST(N'1989-12-01T00:00:00.000' AS DateTime), 9.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4710, 10, CAST(N'1990-01-01T00:00:00.000' AS DateTime), 8.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4711, 10, CAST(N'1990-02-01T00:00:00.000' AS DateTime), 8.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4712, 10, CAST(N'1990-03-01T00:00:00.000' AS DateTime), 8.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4713, 10, CAST(N'1990-04-01T00:00:00.000' AS DateTime), 8.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4714, 10, CAST(N'1990-05-01T00:00:00.000' AS DateTime), 9.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4715, 10, CAST(N'1990-06-01T00:00:00.000' AS DateTime), 11.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4716, 10, CAST(N'1990-07-01T00:00:00.000' AS DateTime), 11.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4717, 10, CAST(N'1990-08-01T00:00:00.000' AS DateTime), 11.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4718, 10, CAST(N'1990-09-01T00:00:00.000' AS DateTime), 10.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4719, 10, CAST(N'1990-10-01T00:00:00.000' AS DateTime), 8.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4720, 10, CAST(N'1990-11-01T00:00:00.000' AS DateTime), 9.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4721, 10, CAST(N'1990-12-01T00:00:00.000' AS DateTime), 9.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4722, 10, CAST(N'1991-01-01T00:00:00.000' AS DateTime), 9.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4723, 10, CAST(N'1991-02-01T00:00:00.000' AS DateTime), 9.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4724, 10, CAST(N'1991-03-01T00:00:00.000' AS DateTime), 9.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4725, 10, CAST(N'1991-04-01T00:00:00.000' AS DateTime), 9.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4726, 10, CAST(N'1991-05-01T00:00:00.000' AS DateTime), 9.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4727, 10, CAST(N'1991-06-01T00:00:00.000' AS DateTime), 9.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4728, 10, CAST(N'1991-07-01T00:00:00.000' AS DateTime), 8.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4729, 10, CAST(N'1991-08-01T00:00:00.000' AS DateTime), 8.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4730, 10, CAST(N'1991-09-01T00:00:00.000' AS DateTime), 8.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4731, 10, CAST(N'1991-10-01T00:00:00.000' AS DateTime), 7.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4732, 10, CAST(N'1991-11-01T00:00:00.000' AS DateTime), 7.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4733, 10, CAST(N'1991-12-01T00:00:00.000' AS DateTime), 8.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4734, 10, CAST(N'1992-01-01T00:00:00.000' AS DateTime), 7.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4735, 10, CAST(N'1992-02-01T00:00:00.000' AS DateTime), 8.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4736, 10, CAST(N'1992-03-01T00:00:00.000' AS DateTime), 7.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4737, 10, CAST(N'1992-04-01T00:00:00.000' AS DateTime), 7.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4738, 10, CAST(N'1992-05-01T00:00:00.000' AS DateTime), 7.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4739, 10, CAST(N'1992-06-01T00:00:00.000' AS DateTime), 7.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4740, 10, CAST(N'1992-07-01T00:00:00.000' AS DateTime), 7.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4741, 10, CAST(N'1992-08-01T00:00:00.000' AS DateTime), 8.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4742, 10, CAST(N'1992-09-01T00:00:00.000' AS DateTime), 8.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4743, 10, CAST(N'1992-10-01T00:00:00.000' AS DateTime), 10.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4744, 10, CAST(N'1992-11-01T00:00:00.000' AS DateTime), 10.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4745, 10, CAST(N'1992-12-01T00:00:00.000' AS DateTime), 9.9800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4746, 10, CAST(N'1993-01-01T00:00:00.000' AS DateTime), 9.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4747, 10, CAST(N'1993-02-01T00:00:00.000' AS DateTime), 10.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4748, 10, CAST(N'1993-03-01T00:00:00.000' AS DateTime), 10.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4749, 10, CAST(N'1993-04-01T00:00:00.000' AS DateTime), 10.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4750, 10, CAST(N'1993-05-01T00:00:00.000' AS DateTime), 10.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4751, 10, CAST(N'1993-06-01T00:00:00.000' AS DateTime), 10.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4752, 10, CAST(N'1993-07-01T00:00:00.000' AS DateTime), 9.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4753, 10, CAST(N'1993-08-01T00:00:00.000' AS DateTime), 10.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4754, 10, CAST(N'1993-09-01T00:00:00.000' AS DateTime), 10.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4755, 10, CAST(N'1993-10-01T00:00:00.000' AS DateTime), 10.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4756, 10, CAST(N'1993-11-01T00:00:00.000' AS DateTime), 9.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4757, 10, CAST(N'1993-12-01T00:00:00.000' AS DateTime), 9.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4758, 10, CAST(N'1994-01-01T00:00:00.000' AS DateTime), 9.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4759, 10, CAST(N'1994-02-01T00:00:00.000' AS DateTime), 9.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4760, 10, CAST(N'1994-03-01T00:00:00.000' AS DateTime), 9.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4761, 10, CAST(N'1994-04-01T00:00:00.000' AS DateTime), 9.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4762, 10, CAST(N'1994-05-01T00:00:00.000' AS DateTime), 9.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4763, 10, CAST(N'1994-06-01T00:00:00.000' AS DateTime), 9.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4764, 10, CAST(N'1994-07-01T00:00:00.000' AS DateTime), 9.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4765, 10, CAST(N'1994-08-01T00:00:00.000' AS DateTime), 9.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4766, 10, CAST(N'1994-09-01T00:00:00.000' AS DateTime), 9.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4767, 10, CAST(N'1994-10-01T00:00:00.000' AS DateTime), 9.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4768, 10, CAST(N'1994-11-01T00:00:00.000' AS DateTime), 9.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4769, 10, CAST(N'1994-12-01T00:00:00.000' AS DateTime), 9.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4770, 10, CAST(N'1995-01-01T00:00:00.000' AS DateTime), 9.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4771, 10, CAST(N'1995-02-01T00:00:00.000' AS DateTime), 10.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4772, 10, CAST(N'1995-03-01T00:00:00.000' AS DateTime), 11.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4773, 10, CAST(N'1995-04-01T00:00:00.000' AS DateTime), 11.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4774, 10, CAST(N'1995-05-01T00:00:00.000' AS DateTime), 11.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4775, 10, CAST(N'1995-06-01T00:00:00.000' AS DateTime), 11.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4776, 10, CAST(N'1995-07-01T00:00:00.000' AS DateTime), 11.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4777, 10, CAST(N'1995-08-01T00:00:00.000' AS DateTime), 11.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4778, 10, CAST(N'1995-09-01T00:00:00.000' AS DateTime), 11.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4779, 10, CAST(N'1995-10-01T00:00:00.000' AS DateTime), 11.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4780, 10, CAST(N'1995-11-01T00:00:00.000' AS DateTime), 11.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4781, 10, CAST(N'1995-12-01T00:00:00.000' AS DateTime), 12.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4782, 10, CAST(N'1996-01-01T00:00:00.000' AS DateTime), 12.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4783, 10, CAST(N'1996-02-01T00:00:00.000' AS DateTime), 15.3300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4784, 10, CAST(N'1996-03-01T00:00:00.000' AS DateTime), 15.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4785, 10, CAST(N'1996-04-01T00:00:00.000' AS DateTime), 16.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4786, 10, CAST(N'1996-05-01T00:00:00.000' AS DateTime), 16.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4787, 10, CAST(N'1996-06-01T00:00:00.000' AS DateTime), 16.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4788, 10, CAST(N'1996-07-01T00:00:00.000' AS DateTime), 16.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4789, 10, CAST(N'1996-08-01T00:00:00.000' AS DateTime), 16.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4790, 10, CAST(N'1996-09-01T00:00:00.000' AS DateTime), 15.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4791, 10, CAST(N'1996-10-01T00:00:00.000' AS DateTime), 15.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4792, 10, CAST(N'1996-11-01T00:00:00.000' AS DateTime), 14.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4793, 10, CAST(N'1996-12-01T00:00:00.000' AS DateTime), 14.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4794, 10, CAST(N'1997-01-01T00:00:00.000' AS DateTime), 14.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4795, 10, CAST(N'1997-02-01T00:00:00.000' AS DateTime), 13.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4796, 10, CAST(N'1997-03-01T00:00:00.000' AS DateTime), 13.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4797, 10, CAST(N'1997-04-01T00:00:00.000' AS DateTime), 12.1800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4798, 10, CAST(N'1997-05-01T00:00:00.000' AS DateTime), 11.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4799, 10, CAST(N'1997-06-01T00:00:00.000' AS DateTime), 10.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4800, 10, CAST(N'1997-07-01T00:00:00.000' AS DateTime), 10.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4801, 10, CAST(N'1997-08-01T00:00:00.000' AS DateTime), 10.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4802, 10, CAST(N'1997-09-01T00:00:00.000' AS DateTime), 10.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4803, 10, CAST(N'1997-10-01T00:00:00.000' AS DateTime), 12.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4804, 10, CAST(N'1997-11-01T00:00:00.000' AS DateTime), 12.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4805, 10, CAST(N'1997-12-01T00:00:00.000' AS DateTime), 12.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4806, 10, CAST(N'1998-01-01T00:00:00.000' AS DateTime), 11.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4807, 10, CAST(N'1998-02-01T00:00:00.000' AS DateTime), 10.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4808, 10, CAST(N'1998-03-01T00:00:00.000' AS DateTime), 10.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4809, 10, CAST(N'1998-04-01T00:00:00.000' AS DateTime), 10.7800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4810, 10, CAST(N'1998-05-01T00:00:00.000' AS DateTime), 10.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4811, 10, CAST(N'1998-06-01T00:00:00.000' AS DateTime), 10.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4812, 10, CAST(N'1998-07-01T00:00:00.000' AS DateTime), 10.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4813, 10, CAST(N'1998-08-01T00:00:00.000' AS DateTime), 10.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4814, 10, CAST(N'1998-09-01T00:00:00.000' AS DateTime), 9.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4815, 10, CAST(N'1998-10-01T00:00:00.000' AS DateTime), 9.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4816, 10, CAST(N'1998-11-01T00:00:00.000' AS DateTime), 8.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4817, 10, CAST(N'1998-12-01T00:00:00.000' AS DateTime), 8.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4818, 10, CAST(N'1999-01-01T00:00:00.000' AS DateTime), 10.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4819, 10, CAST(N'1999-02-01T00:00:00.000' AS DateTime), 10.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4820, 10, CAST(N'1999-03-01T00:00:00.000' AS DateTime), 10.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4821, 10, CAST(N'1999-04-01T00:00:00.000' AS DateTime), 10.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4822, 10, CAST(N'1999-05-01T00:00:00.000' AS DateTime), 10.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4823, 10, CAST(N'1999-06-01T00:00:00.000' AS DateTime), 10.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4824, 10, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 10.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4825, 10, CAST(N'1999-08-01T00:00:00.000' AS DateTime), 10.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4826, 10, CAST(N'1999-09-01T00:00:00.000' AS DateTime), 9.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4827, 10, CAST(N'1999-10-01T00:00:00.000' AS DateTime), 9.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4828, 10, CAST(N'1999-11-01T00:00:00.000' AS DateTime), 9.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4829, 10, CAST(N'1999-12-01T00:00:00.000' AS DateTime), 9.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4830, 10, CAST(N'2000-01-01T00:00:00.000' AS DateTime), 9.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4831, 10, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 9.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4832, 10, CAST(N'2000-03-01T00:00:00.000' AS DateTime), 9.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4833, 10, CAST(N'2000-04-01T00:00:00.000' AS DateTime), 8.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4834, 10, CAST(N'2000-05-01T00:00:00.000' AS DateTime), 8.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4835, 10, CAST(N'2000-06-01T00:00:00.000' AS DateTime), 8.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4836, 10, CAST(N'2000-07-01T00:00:00.000' AS DateTime), 8.0800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4837, 10, CAST(N'2000-08-01T00:00:00.000' AS DateTime), 7.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4838, 10, CAST(N'2000-09-01T00:00:00.000' AS DateTime), 7.4300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4839, 10, CAST(N'2000-10-01T00:00:00.000' AS DateTime), 7.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4840, 10, CAST(N'2000-11-01T00:00:00.000' AS DateTime), 7.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4841, 10, CAST(N'2000-12-01T00:00:00.000' AS DateTime), 7.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4842, 10, CAST(N'2001-01-01T00:00:00.000' AS DateTime), 7.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4843, 10, CAST(N'2001-02-01T00:00:00.000' AS DateTime), 7.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4844, 10, CAST(N'2001-03-01T00:00:00.000' AS DateTime), 8.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4845, 10, CAST(N'2001-04-01T00:00:00.000' AS DateTime), 8.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4846, 10, CAST(N'2001-05-01T00:00:00.000' AS DateTime), 8.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4847, 10, CAST(N'2001-06-01T00:00:00.000' AS DateTime), 8.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4848, 10, CAST(N'2001-07-01T00:00:00.000' AS DateTime), 8.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4849, 10, CAST(N'2001-08-01T00:00:00.000' AS DateTime), 9.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4850, 10, CAST(N'2001-09-01T00:00:00.000' AS DateTime), 9.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4851, 10, CAST(N'2001-10-01T00:00:00.000' AS DateTime), 9.4800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4852, 10, CAST(N'2001-11-01T00:00:00.000' AS DateTime), 9.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4853, 10, CAST(N'2001-12-01T00:00:00.000' AS DateTime), 9.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4854, 10, CAST(N'2002-01-01T00:00:00.000' AS DateTime), 9.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4855, 10, CAST(N'2002-02-01T00:00:00.000' AS DateTime), 9.9300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4856, 10, CAST(N'2002-03-01T00:00:00.000' AS DateTime), 9.8300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4857, 10, CAST(N'2002-04-01T00:00:00.000' AS DateTime), 9.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4858, 10, CAST(N'2002-05-01T00:00:00.000' AS DateTime), 9.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4859, 10, CAST(N'2002-06-01T00:00:00.000' AS DateTime), 9.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4860, 10, CAST(N'2002-07-01T00:00:00.000' AS DateTime), 9.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4861, 10, CAST(N'2002-08-01T00:00:00.000' AS DateTime), 9.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4862, 10, CAST(N'2002-09-01T00:00:00.000' AS DateTime), 9.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4863, 10, CAST(N'2002-10-01T00:00:00.000' AS DateTime), 9.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4864, 10, CAST(N'2002-11-01T00:00:00.000' AS DateTime), 9.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4865, 10, CAST(N'2002-12-01T00:00:00.000' AS DateTime), 10.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4866, 10, CAST(N'2003-01-01T00:00:00.000' AS DateTime), 10.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4867, 10, CAST(N'2003-02-01T00:00:00.000' AS DateTime), 10.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4868, 10, CAST(N'2003-03-01T00:00:00.000' AS DateTime), 10.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4869, 10, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 10.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4870, 10, CAST(N'2003-05-01T00:00:00.000' AS DateTime), 10.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4871, 10, CAST(N'2003-06-01T00:00:00.000' AS DateTime), 10.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4872, 10, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 11.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4873, 10, CAST(N'2003-08-01T00:00:00.000' AS DateTime), 11.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4874, 10, CAST(N'2003-09-01T00:00:00.000' AS DateTime), 12.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4875, 10, CAST(N'2003-10-01T00:00:00.000' AS DateTime), 12.7300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4876, 10, CAST(N'2003-11-01T00:00:00.000' AS DateTime), 13.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4877, 10, CAST(N'2003-12-01T00:00:00.000' AS DateTime), 14.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4878, 10, CAST(N'2004-01-01T00:00:00.000' AS DateTime), 15.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4879, 10, CAST(N'2004-02-01T00:00:00.000' AS DateTime), 16.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4880, 10, CAST(N'2004-03-01T00:00:00.000' AS DateTime), 17.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4881, 10, CAST(N'2004-04-01T00:00:00.000' AS DateTime), 17.6800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4882, 10, CAST(N'2004-05-01T00:00:00.000' AS DateTime), 17.8000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4883, 10, CAST(N'2004-06-01T00:00:00.000' AS DateTime), 18.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4884, 10, CAST(N'2004-07-01T00:00:00.000' AS DateTime), 18.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4885, 10, CAST(N'2004-08-01T00:00:00.000' AS DateTime), 19.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4886, 10, CAST(N'2004-09-01T00:00:00.000' AS DateTime), 20.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4887, 10, CAST(N'2004-10-01T00:00:00.000' AS DateTime), 20.2300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4888, 10, CAST(N'2004-11-01T00:00:00.000' AS DateTime), 20.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4889, 10, CAST(N'2004-12-01T00:00:00.000' AS DateTime), 20.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4890, 10, CAST(N'2005-01-01T00:00:00.000' AS DateTime), 21.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4891, 10, CAST(N'2005-02-01T00:00:00.000' AS DateTime), 21.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4892, 10, CAST(N'2005-03-01T00:00:00.000' AS DateTime), 22.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4893, 10, CAST(N'2005-04-01T00:00:00.000' AS DateTime), 25.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4894, 10, CAST(N'2005-05-01T00:00:00.000' AS DateTime), 29.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4895, 10, CAST(N'2005-06-01T00:00:00.000' AS DateTime), 29.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4896, 10, CAST(N'2005-07-01T00:00:00.000' AS DateTime), 29.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4897, 10, CAST(N'2005-08-01T00:00:00.000' AS DateTime), 30.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4898, 10, CAST(N'2005-09-01T00:00:00.000' AS DateTime), 31.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4899, 10, CAST(N'2005-10-01T00:00:00.000' AS DateTime), 33.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4900, 10, CAST(N'2005-11-01T00:00:00.000' AS DateTime), 34.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4901, 10, CAST(N'2005-12-01T00:00:00.000' AS DateTime), 36.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4902, 10, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 37.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4903, 10, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 38.6300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4904, 10, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 40.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4905, 10, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 41.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4906, 10, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 43.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4907, 10, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 45.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4908, 10, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 47.3800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4909, 10, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 50.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4910, 10, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 54.8800)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4911, 10, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 60.1300)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4912, 10, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 63.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4913, 10, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 72.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4914, 10, CAST(N'2007-05-07T00:00:00.000' AS DateTime), 140.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4915, 10, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 140.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4916, 10, CAST(N'2007-07-02T00:00:00.000' AS DateTime), 120.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4917, 10, CAST(N'2007-11-08T00:00:00.000' AS DateTime), 88.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4918, 10, CAST(N'2007-12-03T00:00:00.000' AS DateTime), 88.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4919, 10, CAST(N'2008-01-02T00:00:00.000' AS DateTime), 78.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4920, 10, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 80.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4921, 10, CAST(N'2008-03-03T00:00:00.000' AS DateTime), 80.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4922, 10, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 68.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4923, 10, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 61.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4924, 10, CAST(N'2008-06-02T00:00:00.000' AS DateTime), 57.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4925, 10, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 66.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4926, 10, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 65.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4927, 10, CAST(N'2008-09-02T00:00:00.000' AS DateTime), 55.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4928, 10, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 45.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4929, 10, CAST(N'2008-11-03T00:00:00.000' AS DateTime), 55.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4930, 10, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 56.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4931, 10, CAST(N'2009-01-02T00:00:00.000' AS DateTime), 50.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4932, 10, CAST(N'2009-02-02T00:00:00.000' AS DateTime), 45.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4933, 10, CAST(N'2009-03-02T00:00:00.000' AS DateTime), 50.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4934, 10, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 44.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4935, 10, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 49.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4936, 10, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 54.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4937, 10, CAST(N'2009-07-28T00:00:00.000' AS DateTime), 47.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4938, 10, CAST(N'2009-08-03T00:00:00.000' AS DateTime), 47.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4939, 10, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 42.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4940, 10, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 49.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4941, 10, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 44.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4942, 10, CAST(N'2010-01-07T00:00:00.000' AS DateTime), 42.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4943, 10, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 40.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4944, 10, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 42.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4945, 10, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 41.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4946, 10, CAST(N'2010-05-03T00:00:00.000' AS DateTime), 40.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4947, 10, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 41.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4948, 10, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 45.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4949, 10, CAST(N'2010-08-02T00:00:00.000' AS DateTime), 45.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4950, 10, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 46.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4951, 10, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 52.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4952, 10, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 61.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4953, 10, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 62.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4954, 10, CAST(N'2011-01-03T00:00:00.000' AS DateTime), 72.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4955, 10, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 67.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4956, 10, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 59.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4957, 10, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 55.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4958, 10, CAST(N'2011-05-02T00:00:00.000' AS DateTime), 57.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4959, 10, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 51.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4960, 10, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 51.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4961, 10, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 49.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4962, 10, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 52.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4963, 10, CAST(N'2011-10-03T00:00:00.000' AS DateTime), 52.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4964, 10, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 51.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4965, 10, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 52.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4966, 10, CAST(N'2012-01-03T00:00:00.000' AS DateTime), 52.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4967, 10, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 52.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4968, 10, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 50.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4969, 10, CAST(N'2012-04-02T00:00:00.000' AS DateTime), 51.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4970, 10, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 51.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4971, 10, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 50.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4972, 10, CAST(N'2012-07-02T00:00:00.000' AS DateTime), 49.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4973, 10, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 48.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4974, 10, CAST(N'2012-09-04T00:00:00.000' AS DateTime), 45.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4975, 10, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 41.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4976, 10, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 42.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4977, 10, CAST(N'2012-12-03T00:00:00.000' AS DateTime), 43.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4978, 10, CAST(N'2013-01-02T00:00:00.000' AS DateTime), 43.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4979, 10, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 42.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4980, 10, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 42.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4981, 10, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 40.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4982, 10, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 40.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4983, 10, CAST(N'2013-06-03T00:00:00.000' AS DateTime), 39.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4984, 10, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 35.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4985, 10, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 34.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4986, 10, CAST(N'2013-09-03T00:00:00.000' AS DateTime), 35.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4987, 10, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 34.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4988, 10, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 36.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4989, 10, CAST(N'2013-12-02T00:00:00.000' AS DateTime), 34.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4990, 10, CAST(N'2014-01-02T00:00:00.000' AS DateTime), 35.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4991, 10, CAST(N'2014-02-03T00:00:00.000' AS DateTime), 35.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4992, 10, CAST(N'2014-03-03T00:00:00.000' AS DateTime), 34.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4993, 10, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 30.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4994, 10, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 28.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4995, 10, CAST(N'2014-06-02T00:00:00.000' AS DateTime), 28.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4996, 10, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 28.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4997, 10, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 32.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4998, 10, CAST(N'2014-09-02T00:00:00.000' AS DateTime), 35.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (4999, 10, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 36.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5000, 10, CAST(N'2014-11-03T00:00:00.000' AS DateTime), 40.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5001, 10, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 35.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5002, 10, CAST(N'2015-01-02T00:00:00.000' AS DateTime), 37.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5003, 10, CAST(N'2015-02-02T00:00:00.000' AS DateTime), 38.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5004, 10, CAST(N'2015-03-02T00:00:00.000' AS DateTime), 39.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5005, 10, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 37.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5006, 10, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 35.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5007, 10, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 35.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5008, 10, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 35.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5009, 10, CAST(N'2015-08-03T00:00:00.000' AS DateTime), 36.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5010, 10, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 36.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5011, 10, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 35.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5012, 10, CAST(N'2015-11-02T00:00:00.000' AS DateTime), 36.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5013, 10, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 34.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5014, 10, CAST(N'2016-01-04T00:00:00.000' AS DateTime), 34.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5015, 10, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 32.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5016, 10, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 28.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5017, 10, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 27.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5018, 10, CAST(N'2016-05-02T00:00:00.000' AS DateTime), 27.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5019, 10, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 26.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5020, 10, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 26.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5021, 10, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 25.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5022, 10, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 22.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5023, 10, CAST(N'2016-10-03T00:00:00.000' AS DateTime), 18.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5024, 10, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 17.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5025, 10, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 20.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5026, 10, CAST(N'2017-01-03T00:00:00.000' AS DateTime), 24.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5027, 10, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 23.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5028, 10, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 23.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5029, 10, CAST(N'2017-04-03T00:00:00.000' AS DateTime), 22.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5030, 10, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 19.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5031, 10, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 20.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5032, 10, CAST(N'2017-07-03T00:00:00.000' AS DateTime), 20.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5033, 10, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 20.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5034, 10, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 20.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5035, 10, CAST(N'2017-10-02T00:00:00.000' AS DateTime), 20.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5036, 10, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 23.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5037, 10, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 23.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5038, 10, CAST(N'2018-01-02T00:00:00.000' AS DateTime), 22.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5039, 10, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 22.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5040, 10, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 21.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5041, 10, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 20.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5042, 10, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 22.5500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5043, 10, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 22.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5044, 10, CAST(N'2018-07-02T00:00:00.000' AS DateTime), 25.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5045, 10, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 26.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5046, 10, CAST(N'2018-09-03T00:00:00.000' AS DateTime), 27.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5047, 10, CAST(N'2018-10-01T00:00:00.000' AS DateTime), 28.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5048, 10, CAST(N'2018-11-01T00:00:00.000' AS DateTime), 28.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5049, 10, CAST(N'2018-12-03T00:00:00.000' AS DateTime), 28.5000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5050, 10, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 28.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5051, 10, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 27.7500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5052, 10, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 24.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5053, 10, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 25.2000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5054, 10, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 23.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5055, 10, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 24.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5056, 10, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 25.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5057, 10, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 25.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5058, 10, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 25.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5059, 10, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 23.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5060, 10, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 25.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5061, 10, CAST(N'2019-12-02T00:00:00.000' AS DateTime), 24.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5062, 10, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 24.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5063, 10, CAST(N'2020-02-03T00:00:00.000' AS DateTime), 24.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5064, 10, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 27.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5065, 10, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 32.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5066, 10, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 33.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5067, 10, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 31.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5068, 10, CAST(N'2020-07-01T00:00:00.000' AS DateTime), 31.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5069, 10, CAST(N'2020-08-03T00:00:00.000' AS DateTime), 30.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5070, 10, CAST(N'2020-09-01T00:00:00.000' AS DateTime), 29.9000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5071, 10, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 29.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5072, 10, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 29.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5073, 10, CAST(N'2020-12-01T00:00:00.000' AS DateTime), 30.7000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5074, 10, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 30.0500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5075, 10, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 28.3500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5076, 10, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 31.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5077, 10, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 29.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5078, 10, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 31.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5079, 10, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 32.4000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5080, 10, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 32.3000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5081, 10, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 34.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5082, 10, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 43.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5083, 10, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 46.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5084, 10, CAST(N'2021-11-01T00:00:00.000' AS DateTime), 47.1500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5085, 10, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 43.6500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5086, 10, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 44.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5087, 10, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 48.9500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5088, 10, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 58.6000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5089, 10, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 53.1000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5090, 10, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 48.4500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5091, 10, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 50.8500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5092, 10, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 51.2500)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5093, 11, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 424.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5094, 11, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 445.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5095, 11, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 440.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5096, 11, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 439.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5097, 11, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 440.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5098, 11, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 437.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5099, 11, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 471.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5100, 11, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 510.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5101, 11, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 497.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5102, 11, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 507.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5103, 11, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5104, 11, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5105, 11, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 599.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5106, 11, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 605.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5107, 11, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 622.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5108, 11, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 710.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5109, 11, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 772.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5110, 11, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 807.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5111, 11, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 811.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5112, 11, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 821.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5113, 11, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5114, 11, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 881.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5115, 11, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 952.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5116, 11, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5117, 11, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1059.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5118, 11, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1178.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5119, 11, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1249.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5120, 11, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 1174.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5121, 11, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1208.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5122, 11, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1213.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5123, 11, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1128.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5124, 11, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 884.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5125, 11, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 771.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5126, 11, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 545.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5127, 11, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 488.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5128, 11, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 503.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5129, 11, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 562.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5130, 11, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 572.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5131, 11, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 598.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5132, 11, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5133, 11, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 801.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5134, 11, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 726.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5135, 11, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 639.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5136, 11, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 723.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5137, 11, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 674.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5138, 11, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5139, 11, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 725.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5140, 11, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 791.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5141, 11, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 795.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5142, 11, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 798.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5143, 11, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 832.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5144, 11, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 830.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5145, 11, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 811.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5146, 11, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 798.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5147, 11, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 807.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5148, 11, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5149, 11, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 912.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5150, 11, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 984.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5151, 11, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1109.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5152, 11, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1229.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5153, 11, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1281.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5154, 11, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1292.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5155, 11, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1180.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5156, 11, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1149.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5157, 11, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1159.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5158, 11, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1133.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5159, 11, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1088.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5160, 11, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1083.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5161, 11, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1068.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5162, 11, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 994.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5163, 11, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1053.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5164, 11, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1026.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5165, 11, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1061.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5166, 11, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1106.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5167, 11, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1152.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5168, 11, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1181.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5169, 11, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1085.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5170, 11, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 998.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5171, 11, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1015.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5172, 11, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 995.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5173, 11, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 973.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5174, 11, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 839.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5175, 11, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 823.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5176, 11, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 776.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5177, 11, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 841.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5178, 11, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 863.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5179, 11, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 854.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5180, 11, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 842.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5181, 11, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 849.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5182, 11, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5183, 11, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 833.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5184, 11, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5185, 11, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 820.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5186, 11, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 859.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5187, 11, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5188, 11, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 912.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5189, 11, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 865.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5190, 11, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 906.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5191, 11, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 961.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5192, 11, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 911.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5193, 11, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5194, 11, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 858.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5195, 11, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 841.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5196, 11, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5197, 11, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5198, 11, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 722.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5199, 11, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 731.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5200, 11, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 693.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5201, 11, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 685.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5202, 11, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 689.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5203, 11, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 672.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5204, 11, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 662.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5205, 11, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 658.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5206, 11, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 671.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5207, 11, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 636.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5208, 11, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 551.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5209, 11, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 538.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5210, 11, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 584.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5211, 11, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 558.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5212, 11, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5213, 11, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 565.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5214, 11, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 640.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5215, 11, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 686.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5216, 11, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 722.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5217, 11, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 706.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5218, 11, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 683.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5219, 11, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 651.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5220, 11, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 736.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5221, 11, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5222, 11, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 716.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5223, 11, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 751.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5224, 11, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5225, 11, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 809.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5226, 11, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 774.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5227, 11, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 736.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5228, 11, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 685.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5229, 11, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 727.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5230, 11, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 677.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5231, 11, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5232, 11, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 674.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5233, 11, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 724.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5234, 11, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 721.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5235, 11, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 716.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5236, 11, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 672.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5237, 11, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 677.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5238, 11, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5239, 11, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 681.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5240, 11, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 664.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5241, 11, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5242, 11, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 634.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5243, 11, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 590.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5244, 11, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 561.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5245, 11, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 551.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5246, 12, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 532.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5247, 12, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 535.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5248, 12, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 539.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5249, 12, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 540.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5250, 12, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 588.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5251, 12, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 601.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5252, 12, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 630.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5253, 12, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 629.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5254, 12, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 602.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5255, 12, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 615.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5256, 12, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 675.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5257, 12, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5258, 12, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5259, 12, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 714.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5260, 12, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 718.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5261, 12, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5262, 12, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5263, 12, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 831.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5264, 12, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 885.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5265, 12, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 909.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5266, 12, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 959.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5267, 12, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1012.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5268, 12, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1139.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5269, 12, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 1164.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5270, 12, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1276.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5271, 12, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1426.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5272, 12, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1476.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5273, 12, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 1425.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5274, 12, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1436.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5275, 12, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1537.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5276, 12, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1511.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5277, 12, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1323.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5278, 12, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 1226.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5279, 12, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5280, 12, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 824.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5281, 12, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 738.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5282, 12, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 791.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5283, 12, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5284, 12, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 727.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5285, 12, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 800.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5286, 12, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5287, 12, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5288, 12, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 836.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5289, 12, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5290, 12, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 846.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5291, 12, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 897.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5292, 12, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 931.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5293, 12, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 933.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5294, 12, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 924.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5295, 12, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5296, 12, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 920.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5297, 12, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 902.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5298, 12, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 865.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5299, 12, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 859.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5300, 12, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5301, 12, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 1002.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5302, 12, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1042.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5303, 12, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1154.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5304, 12, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1141.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5305, 12, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1232.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5306, 12, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1374.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5307, 12, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1365.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5308, 12, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1307.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5309, 12, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1314.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5310, 12, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1294.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5311, 12, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1324.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5312, 12, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1337.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5313, 12, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1330.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5314, 12, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1309.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5315, 12, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1220.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5316, 12, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1217.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5317, 12, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1203.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5318, 12, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1218.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5319, 12, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1255.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5320, 12, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1287.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5321, 12, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1310.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5322, 12, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1218.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5323, 12, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1178.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5324, 12, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1239.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5325, 12, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1249.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5326, 12, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 1288.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5327, 12, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 1175.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5328, 12, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 1140.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5329, 12, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 1163.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5330, 12, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 1190.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5331, 12, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 1175.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5332, 12, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 1116.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5333, 12, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 1095.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5334, 12, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 1074.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5335, 12, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 1043.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5336, 12, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 995.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5337, 12, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 997.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5338, 12, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 1024.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5339, 12, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 987.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5340, 12, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 996.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5341, 12, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 989.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5342, 12, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 943.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5343, 12, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5344, 12, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 1002.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5345, 12, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 999.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5346, 12, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 966.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5347, 12, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 936.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5348, 12, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5349, 12, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 857.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5350, 12, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5351, 12, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5352, 12, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 830.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5353, 12, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 820.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5354, 12, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 799.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5355, 12, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 773.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5356, 12, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5357, 12, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 749.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5358, 12, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5359, 12, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 793.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5360, 12, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 753.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5361, 12, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5362, 12, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 727.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5363, 12, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 742.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5364, 12, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 726.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5365, 12, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5366, 12, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 726.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5367, 12, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 758.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5368, 12, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5369, 12, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 796.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5370, 12, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 791.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5371, 12, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 798.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5372, 12, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 789.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5373, 12, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 814.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5374, 12, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 829.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5375, 12, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 858.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5376, 12, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5377, 12, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5378, 12, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 872.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5379, 12, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5380, 12, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 813.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5381, 12, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 790.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5382, 12, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 827.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5383, 12, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 827.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5384, 12, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 834.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5385, 12, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 855.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5386, 12, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5387, 12, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 867.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5388, 12, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 881.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5389, 12, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 866.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5390, 12, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 864.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5391, 12, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 842.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5392, 12, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 834.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5393, 12, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 827.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5394, 12, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 793.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5395, 12, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 786.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5396, 12, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 775.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5397, 12, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5398, 12, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5399, 13, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5400, 13, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5401, 13, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 902.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5402, 13, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 899.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5403, 13, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5404, 13, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 824.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5405, 13, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5406, 13, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 944.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5407, 13, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 965.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5408, 13, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 1068.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5409, 13, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 1120.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5410, 13, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 1174.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5411, 13, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 1180.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5412, 13, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 1173.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5413, 13, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 1160.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5414, 13, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 1202.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5415, 13, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 1159.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5416, 13, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 1207.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5417, 13, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 1342.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5418, 13, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 1404.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5419, 13, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 1445.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5420, 13, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1463.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5421, 13, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1686.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5422, 13, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 1777.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5423, 13, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5424, 13, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 2000.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5425, 13, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 2203.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5426, 13, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 2200.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5427, 13, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 2318.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5428, 13, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5429, 13, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5430, 13, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 2370.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5431, 13, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 2341.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5432, 13, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 2118.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5433, 13, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 1772.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5434, 13, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 1436.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5435, 13, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 1343.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5436, 13, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 1293.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5437, 13, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 1214.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5438, 13, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 1188.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5439, 13, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 1157.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5440, 13, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 1154.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5441, 13, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 1149.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5442, 13, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 1131.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5443, 13, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 1120.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5444, 13, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 1148.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5445, 13, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 1116.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5446, 13, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 1187.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5447, 13, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 1314.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5448, 13, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 1380.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5449, 13, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 1380.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5450, 13, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 1360.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5451, 13, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 1353.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5452, 13, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 1342.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5453, 13, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 1300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5454, 13, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 1334.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5455, 13, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1262.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5456, 13, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1331.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5457, 13, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1728.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5458, 13, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1753.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5459, 13, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5460, 13, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5461, 13, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5462, 13, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5463, 13, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5464, 13, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1980.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5465, 13, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 2120.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5466, 13, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5467, 13, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5468, 13, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5469, 13, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 2225.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5470, 13, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5471, 13, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5472, 13, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5473, 13, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5474, 13, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5475, 13, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 2555.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5476, 13, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 2520.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5477, 13, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 2468.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5478, 13, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 2553.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5479, 13, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 2408.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5480, 13, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 2375.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5481, 13, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 2316.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5482, 13, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 2216.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5483, 13, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 2100.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5484, 13, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 1982.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5485, 13, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 1924.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5486, 13, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 1899.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5487, 13, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 1867.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5488, 13, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 1813.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5489, 13, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 1758.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5490, 13, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 1685.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5491, 13, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 1638.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5492, 13, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 1575.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5493, 13, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 1543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5494, 13, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 1493.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5495, 13, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 1410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5496, 13, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 1303.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5497, 13, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 1221.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5498, 13, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 1174.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5499, 13, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 1200.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5500, 13, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 1310.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5501, 13, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 1325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5502, 13, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 1350.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5503, 13, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 1360.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5504, 13, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 1365.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5505, 13, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 1365.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5506, 13, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 1370.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5507, 13, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 1391.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5508, 13, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 1366.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5509, 13, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 1356.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5510, 13, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 1348.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5511, 13, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 1345.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5512, 13, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 1345.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5513, 13, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 1345.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5514, 13, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 1331.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5515, 13, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1321.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5516, 13, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 1314.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5517, 13, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 1296.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5518, 13, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1283.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5519, 13, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 1274.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5520, 13, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1271.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5521, 13, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1286.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5522, 13, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1350.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5523, 13, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 1600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5524, 13, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5525, 13, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1673.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5526, 13, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5527, 13, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1620.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5528, 13, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 1575.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5529, 13, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 1525.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5530, 13, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 1504.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5531, 13, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1520.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5532, 13, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1545.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5533, 13, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5534, 13, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 1558.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5535, 13, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1550.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5536, 13, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1518.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5537, 13, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 1498.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5538, 13, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 1478.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5539, 13, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 1433.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5540, 13, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 1410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5541, 13, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 1368.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5542, 13, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 1356.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5543, 13, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1335.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5544, 13, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 1325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5545, 13, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 1325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5546, 13, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 1330.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5547, 13, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 1316.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5548, 13, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 1308.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5549, 13, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1289.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5550, 13, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 1281.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5551, 13, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 1265.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5552, 14, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 591.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5553, 14, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 595.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5554, 14, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 606.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5555, 14, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 659.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5556, 14, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 679.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5557, 14, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 666.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5558, 14, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 647.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5559, 14, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 666.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5560, 14, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 670.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5561, 14, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 666.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5562, 14, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 722.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5563, 14, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5564, 14, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 719.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5565, 14, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5566, 14, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 713.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5567, 14, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 755.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5568, 14, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 831.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5569, 14, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 916.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5570, 14, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 999.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5571, 14, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 1114.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5572, 14, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 1279.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5573, 14, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1358.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5574, 14, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5575, 14, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 1469.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5576, 14, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5577, 14, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1839.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5578, 14, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1863.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5579, 14, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 1838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5580, 14, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1962.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5581, 14, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 2045.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5582, 14, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1692.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5583, 14, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1309.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5584, 14, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 1176.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5585, 14, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5586, 14, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5587, 14, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 759.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5588, 14, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5589, 14, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 805.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5590, 14, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5591, 14, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 842.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5592, 14, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 941.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5593, 14, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5594, 14, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 804.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5595, 14, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 820.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5596, 14, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 809.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5597, 14, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 846.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5598, 14, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5599, 14, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 986.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5600, 14, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 969.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5601, 14, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 948.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5602, 14, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 956.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5603, 14, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 924.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5604, 14, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5605, 14, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5606, 14, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 937.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5607, 14, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 1074.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5608, 14, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1114.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5609, 14, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1277.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5610, 14, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1441.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5611, 14, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1454.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5612, 14, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1492.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5613, 14, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1456.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5614, 14, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1389.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5615, 14, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1405.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5616, 14, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5617, 14, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1461.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5618, 14, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1433.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5619, 14, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1327.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5620, 14, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5621, 14, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 0.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5622, 14, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1248.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5623, 14, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1189.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5624, 14, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1208.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5625, 14, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1249.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5626, 14, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1265.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5627, 14, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1324.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5628, 14, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5629, 14, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1191.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5630, 14, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1258.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5631, 14, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1298.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5632, 14, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 1334.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5633, 14, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 1245.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5634, 14, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 1239.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5635, 14, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 1269.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5636, 14, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 1269.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5637, 14, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 1275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5638, 14, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 1221.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5639, 14, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 1201.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5640, 14, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 1226.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5641, 14, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 1228.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5642, 14, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 1178.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5643, 14, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 959.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5644, 14, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 962.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5645, 14, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 988.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5646, 14, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 998.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5647, 14, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 982.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5648, 14, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5649, 14, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 943.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5650, 14, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 964.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5651, 14, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 941.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5652, 14, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 943.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5653, 14, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 929.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5654, 14, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 887.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5655, 14, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5656, 14, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 823.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5657, 14, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 872.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5658, 14, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 892.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5659, 14, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 877.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5660, 14, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 837.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5661, 14, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 802.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5662, 14, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 801.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5663, 14, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5664, 14, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 904.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5665, 14, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 918.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5666, 14, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 832.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5667, 14, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 814.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5668, 14, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5669, 14, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 883.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5670, 14, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5671, 14, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5672, 14, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 844.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5673, 14, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 869.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5674, 14, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 842.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5675, 14, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 857.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5676, 14, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 868.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5677, 14, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5678, 14, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5679, 14, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5680, 14, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 823.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5681, 14, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 830.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5682, 14, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 830.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5683, 14, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 844.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5684, 14, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5685, 14, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5686, 14, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 784.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5687, 14, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 783.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5688, 14, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 797.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5689, 14, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 780.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5690, 14, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 793.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5691, 14, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 806.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5692, 14, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 811.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5693, 14, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5694, 14, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 795.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5695, 14, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 787.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5696, 14, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 784.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5697, 14, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 794.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5698, 14, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 790.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5699, 14, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 802.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5700, 14, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 782.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5701, 14, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 759.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5702, 14, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 774.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5703, 14, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 740.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5704, 14, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 714.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5705, 15, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 733.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5706, 15, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 723.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5707, 15, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 742.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5708, 15, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 796.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5709, 15, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5710, 15, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 822.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5711, 15, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 822.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5712, 15, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 812.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5713, 15, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 785.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5714, 15, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5715, 15, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 814.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5716, 15, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 856.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5717, 15, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 818.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5718, 15, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5719, 15, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 765.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5720, 15, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 799.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5721, 15, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 825.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5722, 15, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 858.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5723, 15, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 921.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5724, 15, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 955.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5725, 15, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 1051.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5726, 15, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1195.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5727, 15, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1274.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5728, 15, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 1386.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5729, 15, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1428.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5730, 15, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1445.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5731, 15, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1519.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5732, 15, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 1469.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5733, 15, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1510.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5734, 15, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1577.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5735, 15, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1540.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5736, 15, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1367.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5737, 15, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 1238.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5738, 15, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 1053.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5739, 15, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 991.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5740, 15, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 836.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5741, 15, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 817.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5742, 15, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 760.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5743, 15, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5744, 15, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 805.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5745, 15, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5746, 15, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 920.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5747, 15, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 845.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5748, 15, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 887.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5749, 15, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 857.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5750, 15, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5751, 15, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5752, 15, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 945.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5753, 15, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 917.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5754, 15, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5755, 15, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5756, 15, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 909.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5757, 15, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 864.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5758, 15, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5759, 15, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 946.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5760, 15, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 1013.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5761, 15, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1037.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5762, 15, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1154.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5763, 15, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1249.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5764, 15, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1396.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5765, 15, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1447.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5766, 15, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1402.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5767, 15, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1414.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5768, 15, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1450.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5769, 15, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1412.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5770, 15, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5771, 15, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1391.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5772, 15, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1363.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5773, 15, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1316.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5774, 15, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5775, 15, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1290.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5776, 15, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5777, 15, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1257.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5778, 15, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1295.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5779, 15, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1291.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5780, 15, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1305.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5781, 15, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1235.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5782, 15, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1183.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5783, 15, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1212.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5784, 15, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1230.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5785, 15, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 1274.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5786, 15, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 1217.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5787, 15, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 1197.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5788, 15, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 1190.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5789, 15, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 1214.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5790, 15, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 1225.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5791, 15, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 1162.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5792, 15, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 1136.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5793, 15, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 1116.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5794, 15, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 1081.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5795, 15, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 1012.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5796, 15, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 997.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5797, 15, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 994.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5798, 15, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 1011.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5799, 15, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 1025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5800, 15, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 1012.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5801, 15, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5802, 15, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 975.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5803, 15, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 1019.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5804, 15, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 1018.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5805, 15, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 958.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5806, 15, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 923.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5807, 15, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 875.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5808, 15, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 853.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5809, 15, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5810, 15, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5811, 15, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 836.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5812, 15, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 814.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5813, 15, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 773.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5814, 15, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 751.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5815, 15, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 749.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5816, 15, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 742.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5817, 15, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5818, 15, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 806.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5819, 15, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 787.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5820, 15, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5821, 15, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5822, 15, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 802.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5823, 15, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 790.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5824, 15, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 818.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5825, 15, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 776.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5826, 15, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5827, 15, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 768.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5828, 15, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 811.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5829, 15, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5830, 15, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 792.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5831, 15, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 763.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5832, 15, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 819.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5833, 15, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 852.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5834, 15, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5835, 15, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 899.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5836, 15, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 918.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5837, 15, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 917.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5838, 15, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 878.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5839, 15, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5840, 15, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 824.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5841, 15, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 844.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5842, 15, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 813.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5843, 15, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5844, 15, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 875.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5845, 15, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5846, 15, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 889.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5847, 15, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5848, 15, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 879.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5849, 15, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 848.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5850, 15, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 829.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5851, 15, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 798.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5852, 15, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 794.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5853, 15, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 812.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5854, 15, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 816.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5855, 15, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 836.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5856, 15, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 853.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5857, 15, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5858, 16, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5859, 16, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 591.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5860, 16, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 575.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5861, 16, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5862, 16, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5863, 16, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 575.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5864, 16, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5865, 16, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 606.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5866, 16, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 608.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5867, 16, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 626.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5868, 16, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 656.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5869, 16, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 732.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5870, 16, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 731.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5871, 16, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 763.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5872, 16, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 769.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5873, 16, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5874, 16, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5875, 16, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 981.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5876, 16, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 929.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5877, 16, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5878, 16, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5879, 16, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1010.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5880, 16, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1131.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5881, 16, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 1153.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5882, 16, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1285.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5883, 16, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1398.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5884, 16, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1471.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5885, 16, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 1443.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5886, 16, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1502.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5887, 16, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1551.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5888, 16, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1436.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5889, 16, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1189.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5890, 16, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 1110.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5891, 16, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 866.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5892, 16, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 719.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5893, 16, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 740.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5894, 16, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 734.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5895, 16, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 673.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5896, 16, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 625.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5897, 16, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 747.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5898, 16, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 843.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5899, 16, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 747.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5900, 16, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 685.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5901, 16, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 747.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5902, 16, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 701.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5903, 16, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 706.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5904, 16, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 729.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5905, 16, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 767.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5906, 16, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 785.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5907, 16, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 795.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5908, 16, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5909, 16, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 940.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5910, 16, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 932.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5911, 16, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 993.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5912, 16, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 1031.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5913, 16, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 1170.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5914, 16, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5915, 16, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5916, 16, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1512.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5917, 16, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1715.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5918, 16, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 2038.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5919, 16, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 2256.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5920, 16, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1925.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5921, 16, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 2088.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5922, 16, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 2097.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5923, 16, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1803.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5924, 16, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5925, 16, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1454.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5926, 16, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1310.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5927, 16, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1208.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5928, 16, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1479.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5929, 16, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1439.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5930, 16, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1451.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5931, 16, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5932, 16, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5933, 16, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1348.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5934, 16, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1155.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5935, 16, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1056.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5936, 16, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1070.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5937, 16, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1000.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5938, 16, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 969.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5939, 16, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 898.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5940, 16, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 863.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5941, 16, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 785.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5942, 16, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 829.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5943, 16, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5944, 16, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 821.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5945, 16, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 793.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5946, 16, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 826.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5947, 16, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5948, 16, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5949, 16, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 891.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5950, 16, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 982.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5951, 16, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 985.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5952, 16, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 1270.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5953, 16, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 1269.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5954, 16, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 1270.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5955, 16, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 1362.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5956, 16, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 1394.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5957, 16, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 1356.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5958, 16, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 1411.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5959, 16, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 1406.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5960, 16, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 1260.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5961, 16, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 1177.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5962, 16, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 1181.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5963, 16, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 1144.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5964, 16, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 1194.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5965, 16, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 1217.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5966, 16, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 1155.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5967, 16, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 1187.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5968, 16, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 1091.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5969, 16, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 1080.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5970, 16, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 1133.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5971, 16, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 1131.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5972, 16, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 1101.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5973, 16, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 1039.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5974, 16, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1063.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5975, 16, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 1109.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5976, 16, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 1073.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5977, 16, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1147.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5978, 16, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 1155.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5979, 16, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1216.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5980, 16, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1448.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5981, 16, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1586.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5982, 16, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 1445.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5983, 16, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1563.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5984, 16, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1508.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5985, 16, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1529.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5986, 16, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5987, 16, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 1463.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5988, 16, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 1538.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5989, 16, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 1699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5990, 16, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5991, 16, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1703.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5992, 16, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1547.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5993, 16, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 1571.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5994, 16, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1687.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5995, 16, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5996, 16, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 1585.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5997, 16, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 1604.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5998, 16, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 1531.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (5999, 16, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 1485.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6000, 16, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 1549.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6001, 16, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 1456.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6002, 16, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1399.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6003, 16, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 1252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6004, 16, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 1123.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6005, 16, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 1135.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6006, 16, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 1029.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6007, 16, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 935.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6008, 16, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 917.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6009, 16, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 916.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6010, 16, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 904.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6011, 17, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6012, 17, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6013, 17, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 807.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6014, 17, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 840.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6015, 17, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 841.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6016, 17, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 835.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6017, 17, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 824.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6018, 17, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 828.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6019, 17, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 821.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6020, 17, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6021, 17, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 806.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6022, 17, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 820.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6023, 17, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 865.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6024, 17, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6025, 17, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6026, 17, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6027, 17, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 916.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6028, 17, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 893.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6029, 17, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6030, 17, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 938.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6031, 17, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 966.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6032, 17, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 1083.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6033, 17, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 1295.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6034, 17, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 1463.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6035, 17, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 1550.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6036, 17, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1588.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6037, 17, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1719.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6038, 17, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 1800.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6039, 17, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6040, 17, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6041, 17, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6042, 17, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1775.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6043, 17, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 1663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6044, 17, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 1320.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6045, 17, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 1106.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6046, 17, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6047, 17, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6048, 17, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 775.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6049, 17, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 691.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6050, 17, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 620.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6051, 17, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 681.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6052, 17, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 794.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6053, 17, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 792.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6054, 17, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 785.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6055, 17, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 800.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6056, 17, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 815.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6057, 17, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6058, 17, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 924.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6059, 17, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 926.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6060, 17, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6061, 17, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6062, 17, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 1090.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6063, 17, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 1175.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6064, 17, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 981.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6065, 17, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 1015.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6066, 17, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 1100.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6067, 17, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 1175.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6068, 17, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 1238.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6069, 17, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1363.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6070, 17, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1555.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6071, 17, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1725.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6072, 17, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1763.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6073, 17, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1665.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6074, 17, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1267.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6075, 17, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1380.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6076, 17, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1470.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6077, 17, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1525.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6078, 17, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1542.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6079, 17, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1605.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6080, 17, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1525.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6081, 17, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1538.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6082, 17, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1465.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6083, 17, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1506.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6084, 17, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1531.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6085, 17, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1580.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6086, 17, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6087, 17, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1758.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6088, 17, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1894.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6089, 17, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 2050.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6090, 17, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 2055.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6091, 17, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 2056.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6092, 17, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 2025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6093, 17, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 2200.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6094, 17, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 2200.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6095, 17, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 2300.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6096, 17, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 2225.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6097, 17, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 2275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6098, 17, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 2400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6099, 17, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 2380.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6100, 17, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 2125.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6101, 17, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 2100.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6102, 17, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 2090.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6103, 17, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 1800.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6104, 17, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 1600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6105, 17, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 1600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6106, 17, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 1600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6107, 17, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 1631.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6108, 17, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 1800.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6109, 17, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 1938.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6110, 17, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 1950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6111, 17, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 1950.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6112, 17, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 1938.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6113, 17, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 1850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6114, 17, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 1850.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6115, 17, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 1838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6116, 17, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 1875.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6117, 17, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 2338.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6118, 17, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 2167.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6119, 17, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 2138.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6120, 17, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 2038.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6121, 17, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 1925.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6122, 17, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 1880.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6123, 17, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 1744.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6124, 17, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6125, 17, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6126, 17, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6127, 17, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6128, 17, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6129, 17, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6130, 17, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6131, 17, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6132, 17, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6133, 17, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6134, 17, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 1700.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6135, 17, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 1750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6136, 17, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 1740.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6137, 17, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1725.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6138, 17, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 1725.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6139, 17, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 1715.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6140, 17, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 1663.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6141, 17, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 1650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6142, 17, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 1630.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6143, 17, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6144, 17, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1530.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6145, 17, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1350.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6146, 17, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 1325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6147, 17, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1281.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6148, 17, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1200.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6149, 17, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 1275.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6150, 17, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 1410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6151, 17, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 1538.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6152, 17, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 1600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6153, 17, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 1660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6154, 17, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 1938.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6155, 17, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 2038.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6156, 17, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 2163.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6157, 17, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 2100.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6158, 17, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 1825.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6159, 17, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 1530.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6160, 17, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 1263.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6161, 17, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1325.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6162, 17, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 1355.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6163, 17, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 1400.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6164, 18, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 445.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6165, 18, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 430.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6166, 18, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 410.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6167, 18, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 394.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6168, 18, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 408.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6169, 18, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 404.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6170, 18, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 434.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6171, 18, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 462.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6172, 18, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 454.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6173, 18, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 461.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6174, 18, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 516.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6175, 18, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6176, 18, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 570.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6177, 18, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 556.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6178, 18, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 564.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6179, 18, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 628.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6180, 18, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 737.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6181, 18, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 823.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6182, 18, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6183, 18, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 731.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6184, 18, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 736.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6185, 18, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 783.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6186, 18, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 822.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6187, 18, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 758.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6188, 18, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 854.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6189, 18, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 935.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6190, 18, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 1020.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6191, 18, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 990.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6192, 18, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1039.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6193, 18, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1118.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6194, 18, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1137.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6195, 18, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 960.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6196, 18, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 938.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6197, 18, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 708.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6198, 18, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 466.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6199, 18, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 456.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6200, 18, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 585.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6201, 18, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 551.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6202, 18, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 480.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6203, 18, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 600.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6204, 18, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6205, 18, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 743.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6206, 18, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 664.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6207, 18, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6208, 18, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 841.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6209, 18, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 680.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6210, 18, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 733.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6211, 18, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 754.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6212, 18, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 738.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6213, 18, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6214, 18, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6215, 18, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 853.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6216, 18, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6217, 18, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 858.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6218, 18, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 816.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6219, 18, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 838.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6220, 18, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 851.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6221, 18, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 896.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6222, 18, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 1063.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6223, 18, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 1159.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6224, 18, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1223.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6225, 18, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1223.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6226, 18, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1203.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6227, 18, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1252.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6228, 18, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1284.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6229, 18, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1353.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6230, 18, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1363.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6231, 18, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1270.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6232, 18, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1220.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6233, 18, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1161.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6234, 18, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1110.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6235, 18, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1205.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6236, 18, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1145.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6237, 18, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1120.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6238, 18, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1158.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6239, 18, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1159.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6240, 18, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1223.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6241, 18, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1083.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6242, 18, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1085.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6243, 18, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1078.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6244, 18, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 1110.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6245, 18, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 1021.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6246, 18, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 933.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6247, 18, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 933.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6248, 18, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6249, 18, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 1025.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6250, 18, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 1035.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6251, 18, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 1073.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6252, 18, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 1059.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6253, 18, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 1128.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6254, 18, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 1160.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6255, 18, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 1068.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6256, 18, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 1043.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6257, 18, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 888.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6258, 18, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6259, 18, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6260, 18, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 874.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6261, 18, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 836.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6262, 18, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 1040.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6263, 18, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 1058.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6264, 18, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 1103.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6265, 18, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 1097.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6266, 18, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 1033.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6267, 18, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 1002.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6268, 18, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 895.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6269, 18, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 813.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6270, 18, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 885.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6271, 18, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 884.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6272, 18, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 768.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6273, 18, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 757.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6274, 18, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 810.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6275, 18, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 748.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6276, 18, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 770.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6277, 18, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 808.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6278, 18, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 774.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6279, 18, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 770.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6280, 18, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 745.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6281, 18, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 709.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6282, 18, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 561.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6283, 18, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 578.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6284, 18, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 615.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6285, 18, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 749.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6286, 18, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 809.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6287, 18, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 918.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6288, 18, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 886.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6289, 18, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 826.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6290, 18, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 790.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6291, 18, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 765.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6292, 18, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 771.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6293, 18, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 821.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6294, 18, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 866.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6295, 18, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6296, 18, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 905.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6297, 18, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 890.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6298, 18, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 861.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6299, 18, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 833.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6300, 18, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 882.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6301, 18, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 953.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6302, 18, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 915.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6303, 18, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 910.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6304, 18, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 907.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6305, 18, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 824.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6306, 18, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 771.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6307, 18, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 745.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6308, 18, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 751.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6309, 18, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 769.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6310, 18, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 761.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6311, 18, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 724.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6312, 18, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 710.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6313, 18, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 717.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6314, 18, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 735.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6315, 18, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 780.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6316, 18, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 730.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6317, 19, CAST(N'2006-01-01T00:00:00.000' AS DateTime), 407.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6318, 19, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 405.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6319, 19, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 431.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6320, 19, CAST(N'2006-04-01T00:00:00.000' AS DateTime), 437.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6321, 19, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 447.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6322, 19, CAST(N'2006-06-01T00:00:00.000' AS DateTime), 454.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6323, 19, CAST(N'2006-07-01T00:00:00.000' AS DateTime), 484.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6324, 19, CAST(N'2006-08-01T00:00:00.000' AS DateTime), 501.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6325, 19, CAST(N'2006-09-01T00:00:00.000' AS DateTime), 543.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6326, 19, CAST(N'2006-10-01T00:00:00.000' AS DateTime), 659.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6327, 19, CAST(N'2006-11-01T00:00:00.000' AS DateTime), 648.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6328, 19, CAST(N'2006-12-01T00:00:00.000' AS DateTime), 614.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6329, 19, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 583.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6330, 19, CAST(N'2007-02-01T00:00:00.000' AS DateTime), 526.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6331, 19, CAST(N'2007-03-01T00:00:00.000' AS DateTime), 555.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6332, 19, CAST(N'2007-04-01T00:00:00.000' AS DateTime), 560.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6333, 19, CAST(N'2007-05-01T00:00:00.000' AS DateTime), 563.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6334, 19, CAST(N'2007-06-01T00:00:00.000' AS DateTime), 539.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6335, 19, CAST(N'2007-07-01T00:00:00.000' AS DateTime), 569.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6336, 19, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 595.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6337, 19, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6338, 19, CAST(N'2007-10-01T00:00:00.000' AS DateTime), 837.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6339, 19, CAST(N'2007-11-01T00:00:00.000' AS DateTime), 898.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6340, 19, CAST(N'2007-12-01T00:00:00.000' AS DateTime), 898.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6341, 19, CAST(N'2008-01-01T00:00:00.000' AS DateTime), 930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6342, 19, CAST(N'2008-02-01T00:00:00.000' AS DateTime), 903.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6343, 19, CAST(N'2008-03-01T00:00:00.000' AS DateTime), 944.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6344, 19, CAST(N'2008-04-01T00:00:00.000' AS DateTime), 994.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6345, 19, CAST(N'2008-05-01T00:00:00.000' AS DateTime), 1071.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6346, 19, CAST(N'2008-06-01T00:00:00.000' AS DateTime), 1237.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6347, 19, CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1392.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6348, 19, CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1165.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6349, 19, CAST(N'2008-09-01T00:00:00.000' AS DateTime), 1095.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6350, 19, CAST(N'2008-10-01T00:00:00.000' AS DateTime), 1005.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6351, 19, CAST(N'2008-11-01T00:00:00.000' AS DateTime), 786.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6352, 19, CAST(N'2008-12-01T00:00:00.000' AS DateTime), 670.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6353, 19, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 541.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6354, 19, CAST(N'2009-02-01T00:00:00.000' AS DateTime), 529.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6355, 19, CAST(N'2009-03-01T00:00:00.000' AS DateTime), 580.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6356, 19, CAST(N'2009-04-01T00:00:00.000' AS DateTime), 598.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6357, 19, CAST(N'2009-05-01T00:00:00.000' AS DateTime), 645.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6358, 19, CAST(N'2009-06-01T00:00:00.000' AS DateTime), 727.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6359, 19, CAST(N'2009-07-01T00:00:00.000' AS DateTime), 766.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6360, 19, CAST(N'2009-08-01T00:00:00.000' AS DateTime), 788.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6361, 19, CAST(N'2009-09-01T00:00:00.000' AS DateTime), 824.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6362, 19, CAST(N'2009-10-01T00:00:00.000' AS DateTime), 787.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6363, 19, CAST(N'2009-11-01T00:00:00.000' AS DateTime), 848.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6364, 19, CAST(N'2009-12-01T00:00:00.000' AS DateTime), 781.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6365, 19, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 697.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6366, 19, CAST(N'2010-02-01T00:00:00.000' AS DateTime), 670.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6367, 19, CAST(N'2010-03-01T00:00:00.000' AS DateTime), 729.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6368, 19, CAST(N'2010-04-01T00:00:00.000' AS DateTime), 718.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6369, 19, CAST(N'2010-05-01T00:00:00.000' AS DateTime), 699.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6370, 19, CAST(N'2010-06-01T00:00:00.000' AS DateTime), 705.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6371, 19, CAST(N'2010-07-01T00:00:00.000' AS DateTime), 737.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6372, 19, CAST(N'2010-08-01T00:00:00.000' AS DateTime), 771.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6373, 19, CAST(N'2010-09-01T00:00:00.000' AS DateTime), 822.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6374, 19, CAST(N'2010-10-01T00:00:00.000' AS DateTime), 972.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6375, 19, CAST(N'2010-11-01T00:00:00.000' AS DateTime), 954.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6376, 19, CAST(N'2010-12-01T00:00:00.000' AS DateTime), 983.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6377, 19, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1042.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6378, 19, CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1069.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6379, 19, CAST(N'2011-03-01T00:00:00.000' AS DateTime), 1117.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6380, 19, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1148.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6381, 19, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 1139.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6382, 19, CAST(N'2011-06-01T00:00:00.000' AS DateTime), 1134.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6383, 19, CAST(N'2011-07-01T00:00:00.000' AS DateTime), 1172.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6384, 19, CAST(N'2011-08-01T00:00:00.000' AS DateTime), 1238.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6385, 19, CAST(N'2011-09-01T00:00:00.000' AS DateTime), 1193.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6386, 19, CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1145.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6387, 19, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1207.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6388, 19, CAST(N'2011-12-01T00:00:00.000' AS DateTime), 1181.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6389, 19, CAST(N'2012-01-01T00:00:00.000' AS DateTime), 1079.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6390, 19, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 1041.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6391, 19, CAST(N'2012-03-01T00:00:00.000' AS DateTime), 1049.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6392, 19, CAST(N'2012-04-01T00:00:00.000' AS DateTime), 1049.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6393, 19, CAST(N'2012-05-01T00:00:00.000' AS DateTime), 1045.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6394, 19, CAST(N'2012-06-01T00:00:00.000' AS DateTime), 1018.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6395, 19, CAST(N'2012-07-01T00:00:00.000' AS DateTime), 1014.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6396, 19, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1042.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6397, 19, CAST(N'2012-09-01T00:00:00.000' AS DateTime), 1152.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6398, 19, CAST(N'2012-10-01T00:00:00.000' AS DateTime), 1137.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6399, 19, CAST(N'2012-11-01T00:00:00.000' AS DateTime), 1082.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6400, 19, CAST(N'2012-12-01T00:00:00.000' AS DateTime), 1082.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6401, 19, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 963.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6402, 19, CAST(N'2013-02-01T00:00:00.000' AS DateTime), 901.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6403, 19, CAST(N'2013-03-01T00:00:00.000' AS DateTime), 846.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6404, 19, CAST(N'2013-04-01T00:00:00.000' AS DateTime), 859.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6405, 19, CAST(N'2013-05-01T00:00:00.000' AS DateTime), 877.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6406, 19, CAST(N'2013-06-01T00:00:00.000' AS DateTime), 918.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6407, 19, CAST(N'2013-07-01T00:00:00.000' AS DateTime), 919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6408, 19, CAST(N'2013-08-01T00:00:00.000' AS DateTime), 928.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6409, 19, CAST(N'2013-09-01T00:00:00.000' AS DateTime), 930.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6410, 19, CAST(N'2013-10-01T00:00:00.000' AS DateTime), 935.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6411, 19, CAST(N'2013-11-01T00:00:00.000' AS DateTime), 902.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6412, 19, CAST(N'2013-12-01T00:00:00.000' AS DateTime), 922.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6413, 19, CAST(N'2014-01-01T00:00:00.000' AS DateTime), 919.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6414, 19, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 890.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6415, 19, CAST(N'2014-03-01T00:00:00.000' AS DateTime), 914.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6416, 19, CAST(N'2014-04-01T00:00:00.000' AS DateTime), 864.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6417, 19, CAST(N'2014-05-01T00:00:00.000' AS DateTime), 858.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6418, 19, CAST(N'2014-06-01T00:00:00.000' AS DateTime), 846.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6419, 19, CAST(N'2014-07-01T00:00:00.000' AS DateTime), 862.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6420, 19, CAST(N'2014-08-01T00:00:00.000' AS DateTime), 831.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6421, 19, CAST(N'2014-09-01T00:00:00.000' AS DateTime), 780.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6422, 19, CAST(N'2014-10-01T00:00:00.000' AS DateTime), 777.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6423, 19, CAST(N'2014-11-01T00:00:00.000' AS DateTime), 695.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6424, 19, CAST(N'2014-12-01T00:00:00.000' AS DateTime), 683.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6425, 19, CAST(N'2015-01-01T00:00:00.000' AS DateTime), 631.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6426, 19, CAST(N'2015-02-01T00:00:00.000' AS DateTime), 604.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6427, 19, CAST(N'2015-03-01T00:00:00.000' AS DateTime), 557.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6428, 19, CAST(N'2015-04-01T00:00:00.000' AS DateTime), 550.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6429, 19, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 568.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6430, 19, CAST(N'2015-06-01T00:00:00.000' AS DateTime), 593.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6431, 19, CAST(N'2015-07-01T00:00:00.000' AS DateTime), 601.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6432, 19, CAST(N'2015-08-01T00:00:00.000' AS DateTime), 553.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6433, 19, CAST(N'2015-09-01T00:00:00.000' AS DateTime), 640.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6434, 19, CAST(N'2015-10-01T00:00:00.000' AS DateTime), 630.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6435, 19, CAST(N'2015-11-01T00:00:00.000' AS DateTime), 598.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6436, 19, CAST(N'2015-12-01T00:00:00.000' AS DateTime), 611.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6437, 19, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 627.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6438, 19, CAST(N'2016-02-01T00:00:00.000' AS DateTime), 649.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6439, 19, CAST(N'2016-03-01T00:00:00.000' AS DateTime), 650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6440, 19, CAST(N'2016-04-01T00:00:00.000' AS DateTime), 655.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6441, 19, CAST(N'2016-05-01T00:00:00.000' AS DateTime), 664.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6442, 19, CAST(N'2016-06-01T00:00:00.000' AS DateTime), 687.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6443, 19, CAST(N'2016-07-01T00:00:00.000' AS DateTime), 694.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6444, 19, CAST(N'2016-08-01T00:00:00.000' AS DateTime), 688.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6445, 19, CAST(N'2016-09-01T00:00:00.000' AS DateTime), 750.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6446, 19, CAST(N'2016-10-01T00:00:00.000' AS DateTime), 768.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6447, 19, CAST(N'2016-11-01T00:00:00.000' AS DateTime), 762.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6448, 19, CAST(N'2016-12-01T00:00:00.000' AS DateTime), 795.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6449, 19, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 810.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6450, 19, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 821.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6451, 19, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 756.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6452, 19, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 745.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6453, 19, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 720.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6454, 19, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 702.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6455, 19, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 671.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6456, 19, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 660.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6457, 19, CAST(N'2017-09-01T00:00:00.000' AS DateTime), 650.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6458, 19, CAST(N'2017-10-01T00:00:00.000' AS DateTime), 644.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6459, 19, CAST(N'2017-11-01T00:00:00.000' AS DateTime), 640.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6460, 19, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 638.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6461, 19, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 767.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6462, 19, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 745.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6463, 19, CAST(N'2018-03-01T00:00:00.000' AS DateTime), 694.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6464, 19, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 654.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6465, 19, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 617.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6466, 19, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 594.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6467, 19, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 598.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6468, 19, CAST(N'2018-08-01T00:00:00.000' AS DateTime), 607.0000)
GO
INSERT [dbo].[entri] ([id], [id_kontak], [tanggal], [harga]) VALUES (6469, 19, CAST(N'2018-09-01T00:00:00.000' AS DateTime), 679.0000)
GO
SET IDENTITY_INSERT [dbo].[entri] OFF
GO
