/* LAB: SELECT, WHERE ve ORDER BY Kullanımı
VERİTABANI: Chinook
*/

-- Task 1: Müşterilerin isim ve e-posta bilgilerini çekme
SELECT FirstName, LastName, Email
FROM Customer;

-- Task 2: Almanya'daki müşterileri filtreleme
-- SQL'de metin değerleri her zaman 'Tek Tırnak' içine alınır.
SELECT FirstName, LastName, City
FROM Customer
WHERE Country = 'Germany';

-- Task 3: Tüm parçaları isme göre A'dan Z'ye sıralama
SELECT Name
FROM Track
ORDER BY Name ASC;

-- Task 4: Rock türündeki (GenreId = 1) parçaları filtrele ve isme göre sıralama
-- Önce filtreleme (WHERE), sonra sıralama (ORDER BY) yapılır.
SELECT Name
FROM Track
WHERE GenreId = 1
ORDER BY Name ASC;