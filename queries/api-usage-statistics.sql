/*
Case:
API client product usage analysis
*/

SELECT
    ClientName,
    ProductType,
    COUNT(*) AS RequestsCount
FROM ApiRequests
GROUP BY
    ClientName,
    ProductType
ORDER BY
    RequestsCount DESC;