-- TASK 1: Başlangıç Katmanı (View_CustomerInvoices Oluşturma)
-- Analiz: Önce bireysel müşteri fatura hareketlerini kapsülleyen temel bir raporlama katmanı inşa ediyoruz.

-- 1. 'View_CustomerInvoices' adında, müşteri faturalarını özetleyen bir View oluşturuyoruz.
CREATE VIEW View_CustomerInvoices AS
SELECT 
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    COUNT(i.InvoiceId) AS TotalInvoices,
    SUM(i.Total) AS TotalAmountSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.FirstName, c.LastName;
GO

-- Onay Testi: Veriyi isim ve soyisme göre sıralayarak çekiyoruz.
SELECT * FROM View_CustomerInvoices
ORDER BY CustomerFirstName, CustomerLastName;
GO

-- TASK 2: Raporun Pivot Edilmesi (ALTER VIEW ile Kurumsal Odak)
-- Analiz: Kurumsal strateji değişti. Bireysel verileri eleyip (Filtering NULLs) tamamen şirket bazlı (B2B Focus) bir ciro analizine geçiş yapıyoruz.
-- 2. Mevcut View'ı, sadece kurumsal firmalara odaklanacak şekilde güncelliyoruz (ALTER).
ALTER VIEW View_CustomerInvoices AS
SELECT 
    c.Company, -- Artık grup bazlı analiz şirket ismi üzerinden yapılıyor.
    COUNT(i.InvoiceId) AS TotalInvoices,
    SUM(i.Total) AS TotalAmountSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Company IS NOT NULL -- Şirket bilgisi boş (NULL) olan bireysel müşterileri eliyoruz.
GROUP BY c.Company;
GO

-- Onay Testi: En yüksek harcama yapan şirketi (Top Spender) en üstte görüyoruz.
SELECT * FROM View_CustomerInvoices
ORDER BY TotalAmountSpent DESC;
GO

-- TASK 3: Veritabanı Hijyeni (DROP VIEW)
-- Analiz: İhtiyaç kalmayan nesneleri silmek, veritabanı performansını ve güvenliğini korur. Bu, Database Maintenance (Bakım) protokolünün bir parçasıdır.
-- 3. Artık ihtiyaç duyulmayan View'ı veritabanından kaldırıyoruz.
DROP VIEW View_CustomerInvoices;
GO
-- Onay Testi: Bu sorgunun hata vermesi nesnenin başarıyla silindiğini kanıtlar.
-- SELECT * FROM View_CustomerInvoices;