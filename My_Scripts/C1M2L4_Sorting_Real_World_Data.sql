/* ============================================================
Microsoft SQL Foundations
MODÜL 2, LAB 4: Gerçek Dünya Veri Setinde Sıralama (Sorting)
HEDEF: ORDER BY, DESC, ASC ve Çok Sütunlu Sıralama
============================================================
*/

-- TASK 1: Müşterileri Soyadına Göre Alfabetik Sıralama
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT FirstName, LastName
FROM Customer
ORDER BY LastName ASC;

-- [Analist Notu]: ASC varsayılandır, ancak kodun okunabilirliği için 
-- yazmak her zaman daha iyi bir pratiktir.


-- TASK 2: En Pahalı Parçadan En Ucuza Sıralama (Finansal Öncelik)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT Name, UnitPrice
FROM Track
ORDER BY UnitPrice DESC;

-- [Analist Varyasyonu]: Sadece en pahalı 10 ürünü gör (Fiyat Analizi)
-- SELECT TOP 10 Name, UnitPrice FROM Track ORDER BY UnitPrice DESC;


-- TASK 3: Almanya'daki Faturaları Tutara Göre Sıralama (Filtre + Sıra)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT InvoiceId, CustomerId, Total
FROM Invoice
WHERE BillingCountry = 'Germany'
ORDER BY Total DESC;

-- [Analist Notu]: Unutma; önce filtreleriz (WHERE), sonra sıralarız (ORDER BY).
-- Bu sorgu, Almanya pazarındaki "En Değerli İşlemleri" bulmamızı sağlar.


-- TASK 4: Çok Düzeyli Sıralama (Media Type + İsim)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT Name, MediaTypeId
FROM Track
ORDER BY MediaTypeId ASC, Name ASC;

-- [Analist Varyasyonu]: Önce fiyata göre (Pahalıdan ucuza), 
-- fiyatlar aynıysa isme göre sırala.
-- SELECT Name, UnitPrice FROM Track ORDER BY UnitPrice DESC, Name ASC;

/* ANALİST NOTU: 
Çok düzeyli sıralama, veri setindeki hiyerarşiyi korur. 
Önce MediaTypeId gruplanır, o grubun kendi içinde isimler A'dan Z'ye dizilir.
*/