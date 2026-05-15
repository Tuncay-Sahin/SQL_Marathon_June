/*******************************************************************************
MODULE 4: AI-ASSISTED SQL GENERATION (GitHub Copilot)
Scenario: Advanced Financial Filtering and Performance Optimization
Objective: Benchmarking individual invoices against regional averages (USA).
*******************************************************************************/

-- 1. ADIM: TEMEL FİLTRELEME (Time-Series Filtering)
-- Belirli bir tarih aralığındaki (Zaman Serisi) çalışanları analiz ediyoruz.
-- DESC kullanarak en yeni işe alımdan en eski olana sıralıyoruz.

SELECT * 
FROM Employee
WHERE HireDate BETWEEN '2002-08-14' AND '2004-01-02'
ORDER BY HireDate DESC;


-- 2. ADIM: KARMAŞIK ALT SORGU (Subquery) ANALİZİ
-- Görev: ABD'deki müşterilerin ortalama harcamasından (Benchmark) daha fazla
-- harcama yapan müşterileri ve faturalarını bul.

-- Bu sorgu 'Hard-coded' bir eşik yerine, dinamik bir 'Subquery' kullanır.
SELECT c.FirstName, c.LastName, c.Email, inv.Total
FROM Customer c
JOIN Invoice inv ON c.CustomerId = inv.CustomerId
WHERE inv.Total > (
    -- SUBQUERY: USA ortalama harcamasını (Mean) hesaplar.
    SELECT AVG(i.Total)
    FROM Invoice i
    JOIN Customer cu ON i.CustomerId = cu.CustomerId
    WHERE cu.Country = 'USA'
)
ORDER BY inv.Total DESC;


-- 3. ADIM: OPTİMİZASYON VE OKUNABİLİRLİK (Best Practices)
-- Copilot kullanarak alias (takma ad) ve net isimlendirmelerle sorguyu revize ediyoruz.

SELECT
    t.Name AS TrackName,
    al.Title AS AlbumTitle,
    t.Composer
FROM Track t
JOIN Album al ON t.AlbumID = al.AlbumID;
