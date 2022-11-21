--A��klama sat�r�
/*
 Veritabanlar� bilgi veya verilerin depoland��� alanlard�r.

 Database ile wind, web ve console uygulamalar�yla verilerle i�lem yapar�z

 
 RDBMS (relation database management systems) ili�kisel veri taban� y�netim sistemi --- 1960
 3 �e�it ili�ki vard�r
 1-1
 1-m
 m-m
 
 DATA   !=   OOP
 veri      kodlama 
 RDBMS
 
RDMS g�re �al��an veritaban� programlar�
SAP
Oracle
MYSQL
Access
SQL Server
DB2

SQL---Yap�sal sorgulama dili (Structured Query Language)

BTree-Balans tree

T-SQL  
4+3 e g�re yaz�l�r

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

--USE : aktif veritaban�n� se�mek i�in kullan�l�r
USE Calisma
--Di�er yol ComboBox tan de�i�tir

--Select C�mlesi
SELECT * FROM Personeller --Select c�mleleri genellikle b�y�k harfle yaz�l�r
--F5 dersek t�m kodu �al��t�t�r ama kod sat�r�n� se�ip execute edersek sadece sat�r� �al��t�r�r.
-- * joker demek , her�eyi se� anlam�nda

--Personellerin sadece Id , Ad, Soyad, Adres bilgileri gelsin
SELECT PerID, Ad, Soyad, Adres
FROM Personeller -- ilk �nce tablo ismini yaz

--PerID, ID olarak g�z�ks�n, adres de il�e olsun
--AS kullan�m�,istenilen s�tunun ismini de�i�tirmek i�in kullan�r (ge�ici), de�i�ecek isimler aras�nda bo�luk b�rak�larak da yap�labilir.
--Veri taban�nda de�i�mez , sadece sorguda s�t�n ad� de�i�ir
SELECT PerID AS ID, Ad, Soyad, Adres  Semt
FROM Personeller

--S�ralama ��lemleri
--Personelleri ada g�re listele
SELECT * FROM Personeller
ORDER BY Ad ASC -- hi�bir�ey yazmazsak varsay�lan A-Z , DESC yazarsak Z-A 

SELECT * 
FROM Personeller
ORDER BY Ad 

--Z-A
SELECT *
FROM Personeller
ORDER BY Ad  DESC

--�nce cinsiyete g�re, sonra ada g�re s�rala
SELECT * 
FROM Personeller
ORDER BY Cinsiyet, Ad

SELECT * 
FROM Personeller
ORDER BY Cinsiyet DESC, Ad

--Maa�a g�re s�ralama
SELECT * FROM Personeller
ORDER BY Maas DESC

--En y�ksek maa� alan� �a��rma
--TOP kullan�m�(en �stten bir kay�t gelir, parantez i�ine ka� adet gelmesini se�eriz)
SELECT TOP(1)* 
FROM Personeller
ORDER BY Maas DESC

--Filtreleme
SELECT * 
FROM Personeller 
WHERE PerID=3

--Ada G�re Filtreleme
SELECT * 
FROM Personeller 
WHERE Ad='Cevdet' -- Tek t�rnak olmas�n�n nedeni c# ta "select*from" �ift t�rnak i�inde kullan�l�r

--Cinsiyete G�re Filtreleme
SELECT * 
FROM Personeller 
WHERE Cinsiyet='E'

--Maa�� 1000den b�y�k 7000binden k���k olanlar
SELECT *
FROM Personeller
WHERE Maas>1000 AND Maas<8000

SELECT *
FROM Personeller
WHERE Maas BETWEEN 1000 AND 8000 -- between> k���k e�it, b�y�k e�it 

SELECT *
FROM Personeller
WHERE Adres = 'Kad�k�y' AND Soyad = 'Korkmaz'

--LIKE kullan�m�
--Ad�nda er ge�en isimler
SELECT *
FROM Personeller
WHERE Ad LIKE '%er%' -- i�inde ara demek

--A ile ba�layan isimler
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
WHERE Ad LIKE '_e%' --ilk harfi " _ " kullanarak atlad�k

--Gruplama I�lemleri - �zet veri istendi�i durumlarda kullan�l�r
--1) Basit Gruplama (DISTINCT, GROUP BY)
SELECT Adres FROM Personeller -- her�eyi tek tek getirir
SELECT DISTINCT Adres FROM Personeller --ayn� olanlar bir kere geldi

SELECT Adres FROM Personeller --GROUP BY yazarken * yerine getirelecek s�tun adi ya da AGGREGAT�ON FUNC yaz�lmal�d�r
GROUP BY Adres

--AGREGAT�ON FUNCT�ON
--Personel tablosundaki kay�tlar
SELECT Count(*) AS Kay�tSay�s� FROM Personeller
--Toplama
SELECT Sum(Maas) AS ToplamMaas FROM Personeller
--Ortalama
SELECT AVG(Maas) AS Ortalama FROM Personeller
-- MAX MIN de�erler
SELECT MAX(Maas) AS EnY�ksekMaas FROM Personeller
SELECT MIN(Maas) AS EnD���kMaas FROM Personeller

--2) Detayl� Gruplama (GROUP BY)
SELECT Adres,Count(*) AS Ki�iSay�s� FROM Personeller
GROUP BY Adres

SELECT Cinsiyet,Count(*) AS Ki�iSay�s� FROM Personeller
GROUP BY Cinsiyet

--INSER INTO
--Tabloya veri eklemek i�in kullan�l�r

--t�m s�tunlara veri g�ndermek i�in kullan�l�r
INSERT INTO Personeller 
VALUES(6, 'Esin' , '�elebi' , 'K',   6400 , '�orlu')

--sadece istenilen s�tunlara veri g�ndermek i�in kullan�l�r
INSERT INTO Personeller(Ad, Soyad, Cinsiyet, Maas)
VALUES('Nergis' , 'Cafero�lu' , 'K',   6400 )

--tek seferde birden fazla de�er g�ndermek i�in
INSERT INTO Personeller
VALUES(8, 'Arda' , 'Oran' , 'E',   6300 , 'Florya'),
			  (9, 'Do�ukan' , 'Akdo�an' , 'E',   6600 , 'Bak�rk�y'),
			  (10, 'Umut' , 'Kara' , 'E',   6700 , 'Gelibolu')
SELECT *
FROM Personeller

--UPDATE ve DELETE
--UPDATE Personeller SET Maas=3000 WHERE PerID=3
--DELETE FROM Personeller