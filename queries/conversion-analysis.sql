/*
Case:
Conversion funnel analysis for insurance application workflow.

Demonstrates:
- CTE usage
- temp tables
- funnel analytics
- state tracking
- aggregation
*/

DECLARE @ApiClientId UNIQUEIDENTIFIER = 'CLIENT_ID';
DECLARE @ProviderId UNIQUEIDENTIFIER = 'PROVIDER_ID';

DECLARE @StartDate DATE = '2026-01-01';
DECLARE @EndDate DATE = '2026-02-01';

WITH ApplicationFlow AS (
    SELECT
        a.ApplicationId,
        a.CreatedAt,
        a.CurrentState,
        COUNT(o.OfferId) AS OfferCount
    FROM Applications a
    LEFT JOIN Offers o ON o.ApplicationId = a.ApplicationId
    WHERE
        a.ApiClientId = @ApiClientId
        AND a.CreatedAt BETWEEN @StartDate AND @EndDate
    GROUP BY
        a.ApplicationId,
        a.CreatedAt,
        a.CurrentState
)

SELECT
    CAST(CreatedAt AS DATE) AS ReportDate,
    COUNT(*) AS TotalApplications,
    SUM(CASE WHEN CurrentState = 'Authorized' THEN 1 ELSE 0 END) AS Authorized,
    SUM(CASE WHEN CurrentState = 'OfferReceived' THEN 1 ELSE 0 END) AS OfferReceived,
    SUM(CASE WHEN CurrentState = 'Paid' THEN 1 ELSE 0 END) AS Paid
FROM ApplicationFlow
GROUP BY CAST(CreatedAt AS DATE)
ORDER BY ReportDate;