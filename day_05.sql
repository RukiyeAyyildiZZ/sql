/*--------------------ON DELETE CASCADE---------------------------------------------
ON DELETE CASCADE komutu sayesinde;
 
Direk parent tablodaki veriyi silebiliyoruz
Ayrıca,
Direk parent tabloyu silebiliyoruz
Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutu yazmamız yeterli
-------------------------------------------------------------------------------------*/

CREATE TABLE parent (
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO parent VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent VALUES (104, 'Apple', 'Mick Jackson');


CREATE TABLE child(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
ON DELETE CASCADE
);    
    
INSERT INTO child VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child VALUES(104, 1007,'Kamera', 'Eymen Ozden');

select * from parent;
select * from child;

--Soru 1: parent tablosundaki tum verileri siliniz

delete from parent;

--ON DELETE CASCADE sayesinde
--Child tablodaki veri silinmeden Parent tablodaki veri silinmeye calisildiginda PgAdmin error vermez
--parent tablodaki veriyi siler.
--Fakat bu durumda Child tablodaki veri de silinir

--Soru 2: parent tablosunu siliniz

drop table parent cascade;

--Soru 3 : child tablosunu siliniz

drop table child;

/*
FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILMAZSA
1-) Child tablo silinmeden Parent tablo silinmeye çalışıldıgında PgAdmin Eror verir.
yani Child tablo silinmeden Parent tablo silinemez
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında Pg Admin Eror verir.
yani Child tablodaki veri silinmeden Parent tablodaki veri silinemez


FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILIRSA
1-) Child tablo silinmeden Parent tablo silinebilir.
PgAdmin Eror vermez
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında PgAdmin Eror vermez
Parent tablodaki veriyi siler.
Fakat bu durumda Child tablodaki veride silinir.
*/


/*------------ AGGREGATE METHOD KULLANIMI ---------------------------
AGGREGATE METHODLARI:  Tek bir deger elde etmek istedigimizde kullanılır.
sum() ==>   Verilerin toplamını alır.
count() ==> Verilerin sayisini alır.
min() ==>   Verilerden en kücük degeri alır.
max() ==>   Verilerden en büyük degeri alır.
avg() ==>   Verilerin ortalamasını alır.
--------------------------------------------------------------------*/


create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--Soru 1: arac tablosundaki en yuksek fiyat'i listele

select max(fiyat) as max_fiyat from arac;

--Soru 2: arac tablosundaki en dusuk fiyat'i listele

select min(fiyat) as min_fiyat from arac;

--Soru 3: arac tablosundaki fiyatlarin toplamini listele

select sum(fiyat) as toplam_fiyat from arac;

--Soru 4: arac tablosundaki fiyat ortalamalarini listele

select round(avg(fiyat),2) ortalama_fiyat from arac;

--round ==> ondalikli kisimdan kurtulmak icin kullanilan bir komuttur

--Soru 5: arac tablosunda kac tane arac oldugunu listele

select count(id) as arac_sayisi from arac;

--2.yol
select count(*) as arac_sayisi from arac;

/*============================SUBQUERY==============================
 SUBQUERY:  Sorgu içinde çalışan sorguya denir.
==========================================================================*/

CREATE TABLE malzemeler    
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25)
);    
    
INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
    
CREATE TABLE toptancilar    
(
vergi_no int,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

select * from malzemeler;

--Soru 1: Malzemeler tablosundaki musteri_isim'i 'Ali Can' olanın malzeme_isim'ini,
--toptancilar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.





















