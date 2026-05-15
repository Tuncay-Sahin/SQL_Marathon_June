/*
Microsoft SQL Foundations
MODÜL 2: Veri Filtreleme Uygulaması
LAB 2: WHERE, Karşılaştırma ve Mantıksal Operatörler
*/

-- TASK 1: Berlin'de yaşayan müşteriler
-- TASK 2: Birim fiyatı 0.99'dan yüksek olan parçalar
-- TASK 3: Paris veya Roma'daki müşteriler
-- TASK 4: Toronto'da 5$ ile 10$ arasındaki faturalar
/* LAB: Veri Filtreleme Uygulaması
-----------------------------------------------------------
GÖREV 1: Şehir Bazlı Filtreleme
*/
-- Kurs Çözümü:
SELECT FirstName, LastName, City FROM Customer WHERE City = 'Berlin';

-- Analist Varyasyonu: Berlin'de OLMAYAN tüm müşteriler (Farklılık analizi için)
-- SELECT FirstName, LastName, City FROM Customer WHERE City <> 'Berlin';


/*
GÖREV 2: Karşılaştırma Operatörleri
*/
-- Kurs Çözümü: 0.99'dan pahalı parçalar
SELECT Name, UnitPrice FROM Track WHERE UnitPrice > 0.99;

-- Analist Varyasyonu: Tam olarak 0.99 olanları bulmak (Standart fiyat kontrolü)
-- SELECT Name, UnitPrice FROM Track WHERE UnitPrice = 0.99;


/*
GÖREV 3: Mantıksal OR Operatörü
*/
-- Kurs Çözümü: Paris veya Roma
SELECT FirstName, LastName, City FROM Customer WHERE City = 'Paris' OR City = 'Roma';

-- Profesyonel İpucu: Çoklu şehir varsa "IN" kullanmak daha şıktır (Daha okunabilir)
-- SELECT FirstName, LastName, City FROM Customer WHERE City IN ('Paris', 'Roma', 'Berlin', 'London');


/*
GÖREV 4: BETWEEN ve AND (Toronto 5$-10$ arası)
*/
-- Kurs Çözümü:
SELECT * FROM Invoice WHERE City = 'Toronto' AND Total BETWEEN 5 AND 10;

-- Analist Varyasyonu: Toronto'daki EN YÜKSEK faturaları bulmak (10$'dan büyük)
-- SELECT * FROM Invoice WHERE City = 'Toronto' AND Total > 10 ORDER BY Total DESC;

