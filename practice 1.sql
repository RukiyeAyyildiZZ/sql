--students isimli bir table olusturunuz

create table students(
id smallint,
isim varchar(30),
adres varchar(100),
sinav_notu smallint	
);

select * from students;

--insert : veri tabanina yeni veri ekler

insert into students values(120,'Ali Can','Ankara', 65);
insert into students values('121','Veli Han','Trabzon','75');
--Integer sutunlara tek tirnak icinde ya da yalin deger girilebilir
insert into students values('122','Ayse Tan','Bursa','85');
insert into students values(123,'Mary Star','Istanbul',95);
insert into students values(124,'Terry Star','Ankara',95);
insert into students values(125,'Hery Otar','Hatay',95);
insert into students values(126,'Sally Young','Isparta',100);

--Soru 1: students tablosundaki id ve isim sutunlarini cagiriniz.

select id,isim from students;

--Soru 2:Notu 85 uzeri olan ogrenci bilgilerinin tamamini cagiriniz

select * from students where sinav_notu>85; 

--Soru 3:Adresi Ankara olan ogrencilerin isimlerini cagiriniz

select isim from students where adres='Ankara';

--Soru 4:Notu 85 uzeri ve adresi Ankara olan ogrenci isimlerini cagiriniz

select isim from students where sinav_notu>85 and adres='Ankara';

--Soru 5: Sinav notu 95 veya 65 olan ogrencilerin tum bilgilerini cagiriniz

--1.Yol:
select * from students where sinav_notu=65 or sinav_notu=95;

--2.Yol:
select * from students where sinav_notu in(65,95);

--Soru 6:Sinav notu 75 ve 95 arasında olan ogrencilerin isimlerini cagiriniz

--1.Yol:
select isim from students  where sinav_notu>=75 and sinav_notu<=95;

--2.Yol:
select isim from students where sinav_notu between 75 and 95; --75 ve 95 dahil

--Soru 7: id'si 122 ve 125 arasinda olmayan ogrencilerin adreslerini yazdiriniz

--1.Yol:
select adres from students where id<122 or id>125;

--2.Yol:
select adres from students where id not between 122 and 125;

--3.Yol:
select adres from students where id not in(122,123,124,125);

--Soru 8:adresi 'Hatay' olan satiri siliniz

delete from students where adres='Hatay';

--Soru 9: isim'i 'Ali Can' ve 'Veli Han' olan satirlari(record/row) siliniz

--1.Yol
delete from students where isim='Ali Can' or isim='Veli Han';

--2.Yol:
delete from students where isim in('Ali Can','Veli Han');

--Tum satirlari sil
delete from students;

--Veriler geri gelmeyecek sekilde silinir, Where ili kullanilamaz
truncate students; 

--students table'ini siliniz
drop table students;



