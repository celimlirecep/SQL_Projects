USE WEB_6_SQL_Refresh

SELECT AdSoyad,UrunAdi,(SatisFiyati-AlisFiyati)*Adet AS 'KAR',SatisTarihi,Musteri FROM viwKar