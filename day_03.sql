


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

create table film
(
film_no int,
film_ismi varchar(30),
film_turu varchar(30)
);
insert into film values (100, 'Eyvah Eyvah', 'Komedi');
insert into film values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into film values (300, 'Eltilerin Savasi', 'Komedi');
insert into film values (400, 'Aile Arasinda', 'Komedi');
insert into film values (500, 'GORA', 'Bilim Kurgu');
insert into film values (600, 'Organize Isler', 'Komedi');
insert into film values (700, 'Babam ve Oglum', 'Dram');

select * from film;

--Soru 1: film_no'su 300 olan filmin film_ismi'ni 'Recep İvedik' olarak guncelleyiniz

update film set film_ismi='Recep İvedik' where film_no=300;

--Soru 2:film tablosundaki tum film_turu'nu 'Aksiyon' olarak guncelleyiniz

update film set film_turu='Aksiyon';

--Soru 3: film_no'su 100 olan filmin film_ismi'ni 'Cakallarla Dans', film_turu'nu 'Komedi' olarak guncelleyiniz

update film set film_ismi='Cakallarla Dans',film_turu='Komedi' where film_no=100;

--Soru 4: film_ismi 'Babam ve Oglum' olan filmin film_turu'nu 'Dram' olarak guncelleyiniz

update film set film_turu='Dram' where film_ismi='Babam ve Oglum';

select * from film;

--Soru 5: film tablosundaki 'GORA' olan degeri, 'AROG' olarak guncelleyiniz

update film set film_ismi='AROG' where film_ismi='GORA';

--Soru 6: film tablosundaki film_no degeri 300'den buyuk olanlarin, film_no'sunu 1 artirarak guncelleyiniz

update film set film_no=film_no+1 where film_no>300;


/*============================ALTER==================================
DDL Grubundan==> ALTER komutu tabloyu günceller.
add column ==> yeni sutun ekleyerek tabloda güncellemeler yapar
drop column ==> mevcut olan sutunu silerek tabloda güncellemeler yapar
rename column ==> sutunun ismini degistirerek tabloda güncellemeler yapar       
rename ==> tablonun ismini degistirerek tabloda güncellemeler yapar 
Syntax:
-------
alter table tablo_adi güncelleme;
=====================================================================*/

create table arabalar
(
id int,
marka varchar(20),
model varchar(20),
vites varchar(20),
fiyat int
);
insert into arabalar values(1,'Mercedes','C180','Otomatik',900000);
insert into arabalar values(2,'Toyota','Corolla','Otomatik',400000);
insert into arabalar values(3,'Honda','Civic','Otomatik',500000);
insert into arabalar values(4,'Citroen','C3','Manuel',450000);

select * from arabalar;

--Soru 1: arabalar tablosuna kilometre varchar(10) seklinde yeni sutun ekleyiniz

alter table arabalar add column kilometre varchar(10);

--Soru 2: arabalar tablosuna yas int seklinde yeni sutun ekleyiniz

alter table arabalar add column yas int;

--Soru 3: arabalar tablosuna airbag varchar(10) seklinde yeni sutun ekleyiniz default degeri 'mevcut' olsun

alter table arabalar add column airbag varchar(10) default 'mevcut';

--Soru 4: arabalar tablosundan vites sutununu siliniz

alter table arabalar drop column vites;

--Soru 5: arabalar tablosundaki fiyat sutununun ismini bedel olarak guncelleyiniz

alter table arabalar rename column fiyat to bedel;

select * from arabalar;

--Soru 6:arabalar tablosunun ismini galeri olarak guncelleyiniz

alter table arabalar rename to galeri;

--Soru 7: Galeri tablosunun ismini arabalar olarak guncelleyiniz

alter table galeri rename to arabalar;


/*========================CONSTRANINT -- KISITLAMALAR=======================================================
1) UNIQUE -->  Bir sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)
2) NOT NULL --> Bir sütunun NULL içermemesini sağlar
   (NOT NULL kısıtlaması veri türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   
3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sutunun birlesiminden bir Primary Key oluşturulmasına ise Composite Primary Key denir.
4) CHECK --> Bir sütunun değer aralığını sınırlamak için kullanılır.
5) FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
============================================================================================================*/



/*
SORU1: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas, mezuniyet sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun.
mezuniyet sutununun data tipi varchar(25) olsun. NOT NULL kısıtlaması olsun.    
*/

create table memurlar(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK(maas>5000),
mezuniyet varchar(25) NOT NULL
)

insert into memurlar values(1,'Ali',10000,'Lisans');
insert into memurlar values(2,'Ahmet',15000,'Yuksek Lisans');
insert into memurlar values(3,'Altug',20000,'Lisans');
insert into memurlar values(4,'Elif',18000,'Lisans');


insert into memurlar values(1,'Zulal',20000,'Lise');  -->PRIMARY KEY SEBEBIYLE ERROR VERDI
insert into memurlar values(5,'Altug',25000,'Yuksek Lisans');  -->UNIQUE SEBEBIYLE ERROR VERDI
insert into memurlar values(6,'Hayri',4000,'Lisans'); -->CHECK SEBEBIYLE ERROR VERDI
insert into memurlar values(7,'Burak',30000,null); -->NOT NULL SEBEBIYLE ERROR VERDI


