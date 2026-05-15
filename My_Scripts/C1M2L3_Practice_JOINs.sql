/* ============================================================
Microsoft SQL Foundations
MODÜL 2, LAB 3: JOIN Sorguları ile Veri Birleştirme
HEDEF: INNER, LEFT, RIGHT ve FULL JOIN farklarını anlamak
============================================================
*/

-- TASK 1: INNER JOIN (Sadece tam eşleşenleri getirir)
-- ---------------------------------------------------------
-- [Altın Standart]: #Records = 384 / NULL = Hayır
SELECT
    Customer.CustomerId,
    Customer.LastName,
    Invoice.InvoiceId
FROM Customer
JOIN Invoice ON Customer.PostalCode = Invoice.BillingPostalCode;

-- [Analist Notu]: INNER JOIN "elitisttir". Sadece her iki tabloda da 
-- ortak posta kodu olan satırları getirir. Eşleşmeyenleri siler.


-- TASK 2: LEFT JOIN (Sol tabloyu -Customer- korur)
-- ---------------------------------------------------------
-- [Altın Standart]: #Records = 388 / NULL = Evet (InvoiceId kısmında)
SELECT
    Customer.CustomerId,
    Customer.LastName,
    Invoice.InvoiceId
FROM Customer
LEFT JOIN Invoice ON Customer.PostalCode = Invoice.BillingPostalCode;

-- [Analist Varyasyonu]: Hiç sipariş vermemiş müşterileri bulmak (Analiz)
-- SELECT Customer.LastName FROM Customer 
-- LEFT JOIN Invoice ON Customer.PostalCode = Invoice.BillingPostalCode
-- WHERE Invoice.InvoiceId IS NULL;


-- TASK 3: RIGHT JOIN (Sağ tabloyu -Invoice- korur)
-- ---------------------------------------------------------
-- [Altın Standart]: #Records = 412 / NULL = Evet (CustomerId, LastName kısmında)
SELECT
    Customer.CustomerId,
    Customer.LastName,
    Invoice.InvoiceId
FROM Customer
RIGHT JOIN Invoice ON Customer.PostalCode = Invoice.BillingPostalCode;

-- [Analist Notu]: Müşterisi olmayan veya posta kodu müşteriyle 
-- eşleşmeyen tüm faturaları da listeye dahil eder.


-- TASK 4: FULL OUTER JOIN (Her iki taraftaki tüm verileri getirir)
-- ---------------------------------------------------------
-- [Altın Standart]: #Records = 416 / NULL = Evet (Her iki tarafta olabilir)
SELECT
    Customer.CustomerId,
    Customer.LastName,
    Invoice.InvoiceId
FROM Customer
FULL OUTER JOIN Invoice ON Customer.PostalCode = Invoice.BillingPostalCode;

-- [Analist Notu]: En kapsamlı birleştirmedir. 
-- "Eşleşse de eşleşmese de her şeyi masaya dök" demektir.