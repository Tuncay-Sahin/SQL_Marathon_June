/*******************************************************************************
MODULE 4: AI-ASSISTED SQL GENERATION & VALIDATION
Scenario: Enhancing Query Efficiency using GitHub Copilot
Objective: Validate AI-generated subqueries, temporal sorting, and complex aggregations.
*******************************************************************************/

-- TASK 1: Evaluating AI Subquery Usage
-- AI choice: Using a nested SELECT instead of an INNER JOIN for single-value filtering.
SELECT Name AS TrackName
FROM Track
WHERE GenreId = (
    SELECT GenreId
    FROM Genre
    WHERE Name = 'Rock'
);
GO

-- TASK 2: Temporal Sorting and Threshold Filtering
-- AI choice: Implementing a minimum transaction threshold and chronological ordering.
SELECT
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total AS InvoiceTotal
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.Total > 10 
ORDER BY i.InvoiceDate DESC;
GO

-- TASK 3: Complex Revenue Aggregation (Financial Report)
-- AI choice: Multi-table relational join and dynamic revenue calculation.
SELECT
    ar.Name AS ArtistName,
    al.Title AS AlbumTitle,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.Name, al.Title
ORDER BY TotalSales DESC;
GO