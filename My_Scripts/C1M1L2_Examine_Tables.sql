/*
Microsoft SQL Foundations
MODÜL 1: SQL Temelleri
LAB 2: Örnek Veritabanındaki Tabloları İnceleme
AMAC: Veritabanı hiyerarşisini ve tablo yapılarını anlamak.
*/

-- 1. ADIM: Coursera Lab ortamında çalıştırdığın sorguları buraya kopyala.
-- 2. ADIM: Her sorgunun ne işe yaradığını yorum satırı (--) ile açıkla.

/* LAB GÖREVİ ÖZETİ:
Employee tablosundaki 'ReportsTo' sütunu bir "Self-Join" imkanı sunar.
Yani bir çalışan, başka bir çalışana rapor verir. 
Bu, organizasyon şemasını SQL ile modellemek demektir.
*/

-- Employee tablosunun yapısını görmek için (Lab ortamında dene):
-- SELECT * FROM Employee;

-- Hangi sütunların olduğunu ve tiplerini görmek için bu .sql dosyasındaki 
-- "CREATE TABLE [Employee]" kısmını inceleyebilirsin (Satır 38 civarı başlar).
