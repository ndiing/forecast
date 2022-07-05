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