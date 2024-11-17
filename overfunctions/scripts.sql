WITH TotalSales AS (SELECT
                        p.CategoryID,
                        p.ProductName,
                        SUM(p.Price * od.Quantity) OVER( PARTITION BY p.CategoryID) AS total
                    FROM Products p
                             JOIN OrderDetails od ON od.ProductID = p.ProductID)
SELECT DISTINCT
    CategoryID,
    total,
    RANK() OVER(ORDER BY total)
FROM TotalSales;


WITH month_analytic AS (SELECT
                            SUM(c.credit_amount) OVER(PARTITION BY c.month) AS OverallAvgCreditAmount,
                            c.cluster
                        FROM Clusters c)
SELECT DISTINCT
    cluster,
    AVG(OverallAvgCreditAmount) OVER(PARTITION BY cluster) AS AvgCreditAmount
FROM month_analytic;

SELECT
    cluster,
    month,
    FIRST_VALUE(SUM(credit_amount)) OVER(PARTITION BY cluster, MONTH) AS FirstCumulativeSum,
    SUM(credit_amount) OVER(PARTITION BY cluster, MONTH) AS CumulativeSum,
    credit_amount
FROM Clusters c