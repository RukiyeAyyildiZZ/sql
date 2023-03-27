


*==========================DELETE==================================


DML Grubundan ==> DELETE komutu Tablodaki Verileri Siler.


Syntax:
------

delete from tablo_adi where şart;

=====================================================================*/

create table kursiyerler
(
id int,
isim varchar(20),
adres varchar(15),
sinav_notu int
);


insert into kursiyerler values(10, 'Arif Can', 'Burdur', 75);
insert into kursiyerler values(11, 'Vural Tur', 'Trabzon', 95);
insert into kursiyerler values(12, 'Aylin Tan', 'Bursa', 90);
insert into kursiyerler values(13, 'Derya Soylu', 'Istanbul', 80);
insert into kursiyerler values(14, 'Yavuz Bal', 'Ankara', 85);
insert into kursiyerler values(15, 'Eren Tan', 'Hatay', 90);
insert into kursiyerler values(16, 'Harun Reşit', 'Isparta', 100);
insert into kursiyerler values(17, 'Behlül Dana', 'Afyon', 100);

select * from kursiyerler;

--Soru 1: kursiyerler tablosundaki sinav_notu 75 olan satiri siliniz.

delete from kursiyerler where sinav_notu=75;

--Soru 2: kursiyerler tablosundaki adres'i 'Trabzon' olan satiri siliniz

delete from kursiyerler where adres='Trabzon';

--Soru 3: kursiyerler tablosundaki isim'i 'Derya Soylu' veya 'Yavuz Bal' olan satirlari siliniz
--1.Yol:
delete from kursiyerler where isim='Derya Soylu' or isim='Yavuz Bal';
--2.Yol:
delete from kursiyerler where isim in('Derya Soylu','Yavuz Bal');

--Soru 4: kursiyerler tablosundaki sinav_notu 100'den kucuk olan satirlari siliniz

delete from kursiyerler where sinav_notu<100;

--Soru 5: kursiyerler tablosundaki tum verileri siliniz

delete from kursiyerler;

--Soru 6: kursiyerler tablosunu siliniz

drop table kursiyerler;




/*==========================UPDATE===========================


DML Grubundan ==> UPDATE komutu Tablodaki Verileri Günceller


Syntax:
------

update tablo_adi set sutun_adi=yeni_deger where şart;


==============================================================*/














































































insert into kursiyerler values(16, 'Harun Reşit', 'Isparta', 100);
insert into kursiyerler values(17, 'Behlül Dana', 'Afyon', 100);