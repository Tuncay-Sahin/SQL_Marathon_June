/* ============================================================
Microsoft SQL Foundations
MODÜL 3, LAB 1: SQL Fonksiyonları ile Veri Dönüşümü
HEDEF: String, Matematik, Tarih ve Aggregation Fonksiyonları
============================================================
*/

-- TASK 1: String Fonksiyonları (Sanatçı İsimlerini Standartlaştırma)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT ArtistID, UPPER(Name) AS UpperCaseArtistName
FROM Artist;

-- [Analist Notu]: Veri girişindeki karmaşıklığı (büyük/küçük harf hataları) 
-- temizlemek için UPPER veya LOWER fonksiyonları hayati önem taşır.


-- TASK 2: Matematiksel Fonksiyonlar (Ortalama Süre Hesaplama)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT ROUND(AVG(Milliseconds) / 60000.0, 2) AS AvgTrackLengthInMinutes
FROM Track;

-- [Analist Varyasyonu]: Tam 2 ondalık basamak garanti etmek için (CAST kullanımı)
-- SELECT CAST(AVG(Milliseconds) / 60000.0 AS DECIMAL(10,2)) AS FixedAvgLength FROM Track;

/* KRİTİK NOT: Bölme işleminde tam sayı (integer) hatası almamak için 
   60000 yerine 60000.0 yazmak, SQL'in sonucu ondalıklı hesaplamasını sağlar. */


-- TASK 3: Tarih Fonksiyonları (Fatura Tarihi Formatlama)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT InvoiceId, 
FORMAT(InvoiceDate, 'MM/dd/yyyy') AS FormattedInvoiceDate
FROM Invoice;

-- [Analist Varyasyonu]: Sadece yıl bazlı raporlama yapmak için
-- SELECT InvoiceId, YEAR(InvoiceDate) AS InvoiceYear FROM Invoice;


-- TASK 4: Toplama ve Gruplama (Ülke Bazlı Ciro Analizi)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT BillingCountry,
SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC;

-- [Analist Notu]: GROUP BY kullanırken kural basittir: 
-- SELECT kısmında bir toplama fonksiyonu (SUM, AVG) dışında kalan 
-- her sütun GROUP BY içinde yer almalıdır.



/* ============================================================
MODÜL 3, LAB 2: Simplifying Queries Using Aliases
HEDEF: Column & Table Aliases, String Concatenation, 
       ve Çoklu Tablo Yönetimi.
============================================================
*/

-- TASK 1: Column Aliases & String Concatenation
-- ---------------------------------------------------------
-- [Altın Standart]:
-- İpucu: CONCAT fonksiyonu veya '+' operatörü kullanılabilir.
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Email
FROM Customer;

-- [Analist Notu]: 'AS' anahtar kelimesi opsiyonel olsa da 
-- okunabilirlik için her zaman kullanılması best practice'dir.


-- TASK 2: Table Aliases in Joins
-- ---------------------------------------------------------
-- [Altın Standart]:
-- İpucu: Tablo isimlerinden sonra boşluk bırakıp 't' veya 'al' yazmak yeterlidir.
SELECT 
    t.Name AS TrackName,
    al.Title AS AlbumTitle,
    t.Composer
FROM Track AS t
JOIN Album AS al ON t.AlbumId = al.AlbumId;


-- TASK 3: Combining Functions with Aliases (Customer & Invoice)
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    i.InvoiceDate,
    i.Total AS InvoiceTotal
FROM Customer AS c
JOIN Invoice AS i ON c.CustomerId = i.CustomerId;


-- TASK 4: Advanced Aggregation with Joins & Aliases
-- ---------------------------------------------------------
-- [Altın Standart]:
SELECT 
    m.Name AS MediaType,
    ROUND(AVG(t.Milliseconds) / 60000.0, 2) AS AvgTrackLengthInMinutes
FROM Track AS t
JOIN MediaType AS m ON t.MediaTypeId = m.MediaTypeId
GROUP BY m.Name;

-- TASK 1: Harcaması 40$'dan fazla olan müşteriler
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.FirstName, c.LastName
-- [Buraya HAVING gelecek]
ORDER BY TotalSpent DESC;

-- TASK 2: Rock türünde en çok şarkısı olan sanatçılar
SELECT 
    ar.Name AS ArtistName,
    COUNT(t.TrackId) AS RockTrackCount
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY ar.Name
ORDER BY RockTrackCount DESC;

-- TASK 3: Satışlara göre En İyi 10 Albüm (Top 10)
SELECT TOP 10 
    al.Title AS AlbumTitle,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Album al
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY al.Title
ORDER BY TotalSales DESC;

