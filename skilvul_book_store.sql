skilvul_book_store.sql

--CREATE database bernama skilvulbookstore--
 create database skilvulbookstore;

 --Buatlah table bernama penerbit--
 create table penerbit(
    -> id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> nama VARCHAR(50),
    -> kota VARCHAR(50)
    -> );

--Buatlah table bernama penulis--
create table penulis(
    -> id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> nama VARCHAR(50),
    -> kota VARCHAR(50)
    -> );

--1 penerbit dapat memiliki banyak buku--
--1 buku hanya memiliki 1 penulis--
--Buatlah table bernama buku lengkap dengan relasi terhadap penulis dan penerbit--
 create table buku(
    -> id INT(10) NOT NULL AUTO_INCREMENT,
    -> ISBN VARCHAR(50),
    -> judul VARCHAR(50),
    -> harga INT(10),
    -> stock INT(10),
    -> penulis INT(50),
    -> penerbit INT(10),
    -> FOREIGN KEY (penulis) references penulis(id),
    -> FOREIGN KEY (penerbit) references penerbit(id),
    -> constraint pk_buku PRIMARY KEY(id)
    -> );

--insert--
 INSERT INTO penerbit(nama,kota) VALUES ('lala', 'palembang');
 INSERT INTO penerbit(nama,kota) VALUES ('lili', 'bengkulu');
 INSERT INTO penerbit(nama,kota) VALUES ('lulu', 'medan');
 INSERT INTO penulis(nama,kota) VALUES ('sisi', 'bangka');
 INSERT INTO penulis(nama,kota) VALUES ('lata', 'surabaya');
 INSERT INTO penulis(nama,kota) VALUES ('tari', 'padang');
 INSERT INTO buku (ISBN, judul,harga, stock, penulis, penerbit) VALUES ('12345', 'andaikan selalu', '50000', '100', '1', '2');
 INSERT INTO buku (ISBN, judul,harga, stock, penulis, penerbit) VALUES ('12245', 'apa aja oke', '45000', '100', '2', '3');
 INSERT INTO buku (ISBN, judul,harga, stock, penulis, penerbit) VALUES ('12246', 'selalu bahagia', '45000', '100', '3', '1');

--INNER JOIN dari table buku terhadap table penerbit--
SELECT * FROM buku INNER JOIN penerbit ON buku.penerbit = penerbit.id;

--LEFT JOIN dari table buku terhadap table penerbit--
SELECT * FROM buku LEFT JOIN penerbit ON buku.penerbit.id;

--RIGHT JOIN dari table buku terhadap table penerbit--
SELECT * FROM buku RIGHT JOIN penerbit ON buku.penerbit.id;

--Cek nilai MAX dari column harga pada table book yang memiliki jumlah stok buku di bawah 10--
SELECT MAX (harga) FROM buku WHERE stock < 10;

--Cek nilai MIN dari column harga pada table book--
SELECT MIN (harga) FROM buku;

--COUNT untuk melihat list data dengan kondisi harga buku di bawah 100000--
SELECT COUNT (harga) FROM buku WHERE harga < 100000;