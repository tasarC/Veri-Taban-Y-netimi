CREATE DATABASE K�TAP�I
USE Kitapc�
CREATE TABLE kitaplr (
ISBN_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
yzr_id int,
stk_id int,
fiyat NVARCHAR(5) NOT NULL,
kitp_ad NVARCHAR(20) NOT NULL,
y_tarihi datetime NOT NULL,
)
CREATE TABLE yazarlr (
yzr_id int IDENTITY(1,1) NOT NULL primary key,
Yzr_ad NVARCHAR(20) NOT NULL,
adresi NVARCHAR(20) NOT NULL,
tel NVARCHAR(11) not null,
)
CREATE TABLE m�sterilr (
m��tr_id int IDENTITY(1,1) not null primary key,
m��tr_ad NVARCHAR(10) not null,
adres NVARCHAR(20) not null, 
telfn NVARCHAR(10) not null,
e_mail NVARCHAR(15) not null
)
CREATE TABLE depo_stok(
stk_id int IDENTITY(1,1) not null primary key,
depo_adrs NVARCHAR(20) not null,
adet NVARCHAR(10) not null,
)

CREATE TABLE sepete_ekle(
spt_id int IDENTITY(1,1) not null primary key,
m��tr_id int,
ISBN_id int,
)

CREATE TABLE sipari�ver(
spr�_id int IDENTITY(1,1) not null primary key,
m��tr_id int,
spt_id int,
�r�n_ad nvarchar(20),
fiyat nvarchar(20),
ISBN_id int,
s_trhi nvarchar(20)not null,
)
INSERT INTO kitaplr(fiyat, kitp_ad, y_tarihi)values('20','ince memet','12.05.1995') 
INSERT INTO kitaplr(fiyat, kitp_ad, y_tarihi)values('25','�al�ku�u','1.11.2019')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('24','simyac�','4.10.2011')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('23','eyl�l','12.01.1997')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('22','d�n���m','9.03.2001')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('23','son ada','5.8.2017')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('21','korku','08.03.1987')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('20','santran�','11.11.2015')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('26','dava','06.04.2003')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('25','serenad','4.05.2020')
select*from kitaplr
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Ya�ar Kemal','Ankara','258')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('R.Nuri G�ntekin','mara�','147')
INSERT INTO yazarlr (Yzr_ad,adresi,tel) values('Poulo Coelho','ingiltere','898')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Mehmet Rauf','izmir',' 658')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Franz Kafka','fransa','364')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Z�lf� Livaneli','mersin','564')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Stefan Zweig','fransa','324')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Anton �ehov','ingiltre','468')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Orhan Pamuk','istanbul','167')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Z�lf� Livaneli','mersin','564')
select *from yazarlr
SET IDENTITY_INSERT yazarlr ON; INSERT INTO dbo.yazarlr(Yzr_ad,adresi,tel) VALUES ('R.Nuri G�ntekin','mara�','147') SET IDENTITY_INSERT yazarlr OFF;

INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Ahmet A','istanbul','416','ahmet@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Mehmet B','izmir','216','memet@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Bahar C','ankara','564','bhr@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Deniz D','mersin','784','dnz@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('D�nya E','urfa','542','dnya@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Ada F	','konya','123','ada@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Nur G	','antep','654','ndhft@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('Haydar K','batman','152','nrdjh@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('mert H ','mu�','845','mrtyu@.com')
INSERT INTO m�sterilr(m��tr_ad,adres,telfn,e_mail) VALUES('yusuf S','tekirda�','147','ysfcm@.com')

INSERT INTO depo_stok (depo_adrs,adet)VALUES ('A','10')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('B','15')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('C','13')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('D','17')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('E','10')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('F','12')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('G','14')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('H','16')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('K','18')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('L','17')
SELECT  
       kitaplr.ISBN_id,kitaplr.stk_id,kitaplr.yzr_id,kitaplr.kitp_ad,kitaplr.fiyat,kitaplr.y_tarihi,
	   sepete_ekle.ISBN_id,sepete_ekle.m��tr_id,sepete_ekle.spt_id,
	   sipari�ver.ISBN_id,sipari�ver.m��tr_id,sipari�ver.spt_id
FROM  kitaplr,sepete_ekle,sipari�ver,yazarlr
 WHERE  kitaplr.ISBN_id= sepete_ekle.ISBN_id  AND sepete_ekle.ISBN_id  =sipari�ver.ISBN_id 



select m��tr_id,fiyat,kitp_ad,y_tarihi from kitaplr k inner join m�sterilr m on  k.ISBN_id=m.m��tr_id

select*  from kitaplr k inner join yazarlr y on  k.yzr_id=y.yzr_id 
select kitp_ad,y_tarihi from kitaplr k inner join sipari�ver s on  k.ISBN_id=s.ISBN_id
select  m��tr_id, spt_id,ISBN_id,s_trhi from sipari�ver s inner join yazarlr y on s.spr�_id=y.yzr_id

 
select k.kitp_ad,y.Yzr_ad from kitaplr k
inner join yazarlr y
on
k.yzr_id = y.yzr_id

select k.ISBN_id,y.Yzr_ad,d.adet from kitaplr k
inner join yazarlr y
on
k.yzr_id = y.yzr_id
inner join depo_stok d
on
k.stk_id= d.stk_id
create trigger deneme_g�ncel
on sipari�ler

use K�TAP�I
GO
CREATE TRIGGER trg_stk_g�ncel
ON sipari�ver
 after insert
 as 
 begin 
 select 
 select sipari�ver.ISBN_id,sipari�ver. from sipari�ver where koltuk_durum='BO�' ,
'bo� koltuk i�in yeni rezervasyon iste�i (yeni kay�t yap�ld�)'



AFTER INSERT
AS 
DECLARE @ISBN_id int
select @ISBN_id=COUNT(i.spt_id)
FROM depo_stok d INNER JOIN inserted i ON d.stk_id=i.spt_id
where (d.adet>i.spt_id) IF @ISBN_id>0 
BEGIN 
ROLLBACK TRANSACTION 
RAISERROR ('girilen �r�nlerden biri stoktan fazla',16,1)
end else
update depo_stok set adet=d.adet-i.spt_id
FROM depo_stok d INNER JOIN inserted i ON d.adet=i.spt_id


CREATE TRIGGER sprsil_stokg�ncelle on depo_sk e
AFTER delete
as
update depo_stok set adet=e.adet-i.spt_id
FROM depo_stok e INNER JOIN deleted i ON e.adet=i.spt_id

select * from sipari�ver delete from sipari�ver where spr�_id=''
select max(fiyat) from sipari�ver


CREATE TRIGGER sp_mak_sat��lar 
AFTER INSERT
AS 
DECLARE @max int, @i int, @pno int, @maxpno int;
DECLARE @M��tr_ad nVARCHAR(10);
DECLARE @sat�� decimal(15,2), @maxsatis decimal(15,2);
SET @sat��=0;
SET @maxsatis=0;
 
SELECT @max= MAX( m��tr_id) FROM m�sterilr;
SELECT @i= MIN(m��tr_id) FROM sipari�ver;
 
WHILE (@i<=@max)
BEGIN
SELECT @sat��=SUM(fiyat*adet),@pno=m��tr_id from sipari�ver WHERE stk_id=@i GROUP BY m��tr_id;
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
 
SELECT @M��tr_ad = @M��tr_ad FROM m�sterilr WHERE m��tr_id=@maxpno;
PRINT  @M��tr_ad+' '+''+ convert(nvarchar, @maxsatis);
 
END

Select distinct m�sterilr.* from m�sterilr
join yazarlr on m�sterilr.m��tr_id = yazarlr.yzr_id
join kitaplr on kitaplr.ISBN_id = m�sterilr.m��tr_id
where yazarlr.Yzr_ad = 'Ya�ar kemal' 

Select count(distinct yazarlr) from m�sterilr
join sipari�ver on m�sterilr.m��tr_id = sipari�ver.m��tr_id
join kitaplr on kitaplr.ISBN_id = sipari�ver.ISBN_id 
where m�sterilr.m��tr_ad= '',

Select count(*) from kitaplr



Select count(*) kitapsay�s�
from m�sterilr
join kitaplr  on kitaplr.ISBN_id=m�sterilr.m��tr_id
group by m�sterilr.m��tr_ad,m�sterilr.telfn
order by m��tr_ad desc



Select count(*) from kitaplr
join yazarlr on yazarlr.yzr_id=kitaplr.ISBN_id
where yazarlr.yzr_id = '8' 


