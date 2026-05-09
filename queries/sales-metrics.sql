/*
Case:
Daily sales metrics aggregation
*/

SELECT
    CAST(CreatedAt AS DATE) AS SaleDate,
    COUNT(*) AS PoliciesSold,
    SUM(PremiumAmount) AS TotalPremium,
    AVG(PremiumAmount) AS AveragePremium
FROM Policies
WHERE
    Status = 'Paid'
    AND CreatedAt >= '2026-01-01'
GROUP BY CAST(CreatedAt AS DATE)
ORDER BY SaleDate;