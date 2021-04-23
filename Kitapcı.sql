CREATE DATABASE Kitapc�
USE Kitapc�
CREATE TABLE kitaplar (
ISBN_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
fiyat NVARCHAR(10) NOT NULL,
kitp_ism NVARCHAR(20) NOT NULL,
yayin_tarihi datetime NOT NULL
)

CREATE TABLE yazarlar (
yazr_id int IDENTITY(1,1) NOT NULL primary key,
Yazar_ismi NVARCHAR(20) NOT NULL,
adresi NVARCHAR(20) NOT NULL,
tel NVARCHAR(11) not null
)

CREATE TABLE m�steriler (
m��tr_id int IDENTITY(1,1) not null primary key,
M��teri_ismi NVARCHAR(10) not null,
adres NVARCHAR(20) not null, 
telefon NVARCHAR(10) not null,
e_mail NVARCHAR(15) not null
)
CREATE TABLE depolar(
depo_kod int NOT NULL PRIMARY KEY, 
depo_nmr NVARCHAR(20) not null, 
stok NVARCHAR(20) not null, 
depo_adres NVARCHAR(20) not null,
)
CREATE TABLE sipari�ler(
spr��r�n_id int not null primary key,
kitp_ism nvarchar(20)not null,
m��tr_id int,
)

CREATE TABLE sat��lar(
st�_id int IDENTITY(2,2) not null primary key,
m��tr_id int ,
depo_kod int,
adet int,
tarh int,
)

INSERT INTO kitaplar(fiyat, kitp_ism, yayin_tarihi)values('20','ince memet','12.05.1995')
INSERT INTO kitaplar(fiyat, kitp_ism, yayin_tarihi)values('25','�al�ku�u','16.11.2005')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('24','simyac�','4.10.2011')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('23','eyl�l','12.01.1997')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('22','d�n���m','9.03.2001')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('23','son ada','5.8.2017')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('21','korku','08.03.1987')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('10','20','santran�','11.11.1999')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('10','26','dava','06.04.2003')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('10','25','serenad','24.05.1897')

INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Ya�ar Kemal','Ankara','258')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Re�at Nuri G�ntekin','mara�','147')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Poulo Coelho','ingiltere','898')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Mehmet Rauf','izmir',' 658')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Franz Kafka','fransa','364')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Z�lf� Livaneli','mersin','564')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Stefan Zweig','fransa','324')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Anton �ehov','ingiltre','468')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Orhan Pamuk	','istanbul','167')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Z�lf� Livaneli','mersin','564')

INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Ahmet A','istanbul','416','ahmet@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Mehmet B','izmir','216','memet@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Bahar C','ankara','564','bhr@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Deniz D','mersin','784','dnz@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('D�nya E','urfa','542','dnya@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Ada F	','konya','123','ada@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Nur G	','antep','654','ndhft@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('Haydar K','batman','152','nrdjh@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('mert H ','mu�','845','mrtyu@.com')
INSERT INTO m�steriler(M��teri_ismi,adres,telefon,e_mail) VALUES('yusuf S','tekirda�','147','ysfcm@.com')


ALTER TABLE  sat��lar ADD CONSTRAINT yazr_id FOREIGN KEY  (yazr_id) REFERENCES yazarlar(yazr_id)
ALTER TABLE sat��lar  ADD CONSTRAINT m��tr_id FOREIGN KEY (m��tr_id) REFERENCES m�steriler(m��tr_id)
 

select * from sat��lar s

inner join m�steriler m

on

s.m��tr_id = m.m��tr_id

select * from sat��lar s

inner join  m�steriler m

on
s.m��tr_id = m.m��tr_id


select s.st�_id,m.m��tr_id ,s.adet,s.tarh,s.fiyat from sat��lar s

inner join m�steriler m

on
s.m��tr_id = m.m��tr_id











SELECT spr��r�n_id,sum(fiyat*adet) as TUTAR FROM  sipari�ler GROUP BY spr��r�n_id

select *from kitaplar order by kitp_ism

use Kitapc�
SELECT *FROM m�steriler
SELECT *FROM sat��lar
SELECT * FROM kitaplar 
SELECT *FROM yazarlar



use Kitapc�
 SELECT * FROM kitaplar WHERE yayin_tarihi BETWEEN '01.01.2015 'AND' 01.01.2020'
 use Kitapc�
 SELECT * FROM kitaplar WHERE ISBN_id BETWEEN 17 AND 26


CREATE TRIGGER  Sat��Gir_StokG�ncelle 
ON sat��la
FOR INSERT
as
DECLARE @Say int
select @SAY=COUNT(i.m��tr_id)
FROM depolar u INNER JOIN inserted i ON u.stok=i.st�_id
where (i.adet>u.stok) IF @Say>0 
BEGIN 
ROLLBACK TRANSACTION 
RAISERROR ('girilen �r�nlerden biri stoktan fazla',16,1)
end else
update kitaplar set stok =u.stok-i.adet
from kitaplar u INNER JOIN inserted i ON u.ISBN_id =i.st�_id

USE Kitapc�
GO
EXEC sat��Gir_StokG�ncelle



use Kitapc�

CREATE TRIGGER sp_maksimum_sat��lar ON sat��lar 
AS
DECLARE @max int, @i int, @pno int, @maxpno int;
DECLARE @M��teri_ism nVARCHAR(10);
DECLARE @sat�� decimal(15,2), @maxsatis decimal(15,2);
SET @sat��=0;
SET @maxsatis=0;
 
SELECT @max= MAX( m��tr_id) FROM m�steriler;
SELECT @i= MIN(m��tr_id) FROM m�steriler;
 
WHILE (@i<=@max)
BEGIN
SELECT @sat��=SUM(adet),@pno=m��tr_id from sat��lar WHERE m��tr_id=@i GROUP BY m��tr_id;
if (@sat��>0)
BEGIN
if (@sat��> @maxsatis)
BEGIN
SET @maxsatis=@sat��;
SET @maxpno= @pno;
 
END
 
END
SET @i=@i+1;
END
 
SELECT @M��teri_ism = M��teri_ismi FROM m�steriler WHERE m��tr_id=@maxpno;
PRINT @M��teri_ism+' '+''+ convert(nvarchar, @maxsatis);
 
END

use Kitapc�
go
exec sp_maksimum_sat��lar