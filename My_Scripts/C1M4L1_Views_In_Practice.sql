-- Müşteri harcamalarını özetleyen bir 'View' oluşturuyoruz.
CREATE VIEW View_CustomerInvoices AS
SELECT 
    c.FirstName AS CustomerFirstName, -- Alias kullanarak raporu okunabilir kılıyoruz.
    c.LastName AS CustomerLastName,
    COUNT(i.InvoiceId) AS TotalInvoices, -- Fatura adetlerini sayıyoruz.
    SUM(i.Total) AS TotalAmountSpent    -- Toplam ciro hesabı.
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.FirstName, c.LastName;
GO
-- Fatura detaylarını kapsülleyen View.
CREATE VIEW View_InvoiceDetails AS
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    i.BillingCountry,
    il.TrackId,
    il.UnitPrice,
    il.Quantity,
    (il.UnitPrice * il.Quantity) AS LineTotal -- Satır bazlı toplam maliyet hesabı.
FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId;
GO
-- View üzerinden en çok harcama yapan 'Top 10' müşteriyi çekiyoruz.
SELECT TOP 10 CustomerFirstName, CustomerLastName, TotalAmountSpent
FROM View_CustomerInvoices
ORDER BY TotalAmountSpent DESC;
-- Detay View'ı üzerinden ülke bazlı toplam satışı analiz ediyoruz.
SELECT BillingCountry, SUM(LineTotal) AS TotalSpending
FROM View_InvoiceDetails
GROUP BY BillingCountry
ORDER BY TotalSpending DESC;