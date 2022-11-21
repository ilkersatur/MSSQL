--Açýklama satýrý
/*
 Veritabanlarý bilgi veya verilerin depolandýðý alanlardýr.

 Database ile wind, web ve console uygulamalarýyla verilerle iþlem yaparýz

 
 RDBMS (relation database management systems) iliþkisel veri tabaný yönetim sistemi --- 1960
 3 çeþit iliþki vardýr
 1-1
 1-m
 m-m
 
 DATA   !=   OOP
 veri      kodlama 
 RDBMS
 
RDMS göre çalýþan veritabaný programlarý
SAP
Oracle
MYSQL
Access
SQL Server
DB2

SQL---Yapýsal sorgulama dili (Structured Query Language)

BTree-Balans tree

T-SQL  
4+3 e göre yazýlýr

  4          
DML (data manipulation lang.)
crud operations
          
select
insert into
update
delete

  +

  3
DDL(data definition lang.)
Create
Alter
Drop


 */
-- DML (Komutlar)
--Select
--Update
-- Inser Into
--Delete

--USE : aktif veritabanýný seçmek için kullanýlýr
USE Calisma
--Diðer yol ComboBox tan deðiþtir

--Select Cümlesi
SELECT * FROM Personeller --Select cümleleri genellikle büyük harfle yazýlýr
--F5 dersek tüm kodu çalýþtýtýr ama kod satýrýný seçip execute edersek sadece satýrý çalýþtýrýr.
-- * joker demek , herþeyi seç anlamýnda

--Personellerin sadece Id , Ad, Soyad, Adres bilgileri gelsin
SELECT PerID, Ad, Soyad, Adres
FROM Personeller -- ilk önce tablo ismini yaz

--PerID, ID olarak gözüksün, adres de ilçe olsun
--AS kullanýmý,istenilen sütunun ismini deðiþtirmek için kullanýr (geçici), deðiþecek isimler arasýnda boþluk býrakýlarak da yapýlabilir.
--Veri tabanýnda deðiþmez , sadece sorguda sütün adý deðiþir
SELECT PerID AS ID, Ad, Soyad, Adres  Semt
FROM Personeller

--Sýralama Ýþlemleri
--Personelleri ada göre listele
SELECT * FROM Personeller
ORDER BY Ad ASC -- hiçbirþey yazmazsak varsayýlan A-Z , DESC yazarsak Z-A 

SELECT * 
FROM Personeller
ORDER BY Ad 

--Z-A
SELECT *
FROM Personeller
ORDER BY Ad  DESC

--Önce cinsiyete göre, sonra ada göre sýrala
SELECT * 
FROM Personeller
ORDER BY Cinsiyet, Ad

SELECT * 
FROM Personeller
ORDER BY Cinsiyet DESC, Ad

--Maaþa göre sýralama
SELECT * FROM Personeller
ORDER BY Maas DESC

--En yüksek maaþ alaný çaðýrma
--TOP kullanýmý(en üstten bir kayýt gelir, parantez içine kaç adet gelmesini seçeriz)
SELECT TOP(1)* 
FROM Personeller
ORDER BY Maas DESC

--Filtreleme
SELECT * 
FROM Personeller 
WHERE PerID=3

--Ada Göre Filtreleme
SELECT * 
FROM Personeller 
WHERE Ad='Cevdet' -- Tek týrnak olmasýnýn nedeni c# ta "select*from" çift týrnak içinde kullanýlýr

--Cinsiyete Göre Filtreleme
SELECT * 
FROM Personeller 
WHERE Cinsiyet='E'

--Maaþý 1000den büyük 7000binden küçük olanlar
SELECT *
FROM Personeller
WHERE Maas>1000 AND Maas<8000

SELECT *
FROM Personeller
WHERE Maas BETWEEN 1000 AND 8000 -- between> küçük eþit, büyük eþit 

SELECT *
FROM Personeller
WHERE Adres = 'Kadýköy' AND Soyad = 'Korkmaz'

--LIKE kullanýmý
--Adýnda er geçen isimler
SELECT *
FROM Personeller
WHERE Ad LIKE '%er%' -- içinde ara demek

--A ile baþlayan isimler
SELECT *
FROM Personeller
WHERE Ad LIKE 'A%'

--A ile biten isimler
SELECT *
FROM Personeller
WHERE Ad LIKE '%A'

--2. Harfi e olanlar
SELECT *
FROM Personeller
WHERE Ad LIKE '_e%' --ilk harfi " _ " kullanarak atladýk

--Gruplama Iþlemleri - Özet veri istendiði durumlarda kullanýlýr
--1) Basit Gruplama (DISTINCT, GROUP BY)
SELECT Adres FROM Personeller -- herþeyi tek tek getirir
SELECT DISTINCT Adres FROM Personeller --ayný olanlar bir kere geldi

SELECT Adres FROM Personeller --GROUP BY yazarken * yerine getirelecek sütun adi ya da AGGREGATÝON FUNC yazýlmalýdýr
GROUP BY Adres

--AGREGATÝON FUNCTÝON
--Personel tablosundaki kayýtlar
SELECT Count(*) AS KayýtSayýsý FROM Personeller
--Toplama
SELECT Sum(Maas) AS ToplamMaas FROM Personeller
--Ortalama
SELECT AVG(Maas) AS Ortalama FROM Personeller
-- MAX MIN deðerler
SELECT MAX(Maas) AS EnYüksekMaas FROM Personeller
SELECT MIN(Maas) AS EnDüþükMaas FROM Personeller

--2) Detaylý Gruplama (GROUP BY)
SELECT Adres,Count(*) AS KiþiSayýsý FROM Personeller
GROUP BY Adres

SELECT Cinsiyet,Count(*) AS KiþiSayýsý FROM Personeller
GROUP BY Cinsiyet

--INSER INTO
--Tabloya veri eklemek için kullanýlýr

--tüm sütunlara veri göndermek için kullanýlýr
INSERT INTO Personeller 
VALUES(6, 'Esin' , 'Çelebi' , 'K',   6400 , 'Çorlu')

--sadece istenilen sütunlara veri göndermek için kullanýlýr
INSERT INTO Personeller(Ad, Soyad, Cinsiyet, Maas)
VALUES('Nergis' , 'Caferoðlu' , 'K',   6400 )

--tek seferde birden fazla deðer göndermek için
INSERT INTO Personeller
VALUES(8, 'Arda' , 'Oran' , 'E',   6300 , 'Florya'),
			  (9, 'Doðukan' , 'Akdoðan' , 'E',   6600 , 'Bakýrköy'),
			  (10, 'Umut' , 'Kara' , 'E',   6700 , 'Gelibolu')
SELECT *
FROM Personeller

--UPDATE ve DELETE
--UPDATE Personeller SET Maas=3000 WHERE PerID=3
--DELETE FROM Personeller