/*
1) Вам необходимо проверить влияние семейного
положения (family_status) на средний	доход
клиентов (income) и запрашиваемый кредит
(credit_amount)
 */



 SELECT family_status, AVG(income) AS avg_income, credit_amount FROM Clusters
 GROUP BY family_status, credit_amount
 ORDER BY avg_income, family_status;
/*
 По мере увеличениии среднего дохода встречаются разные семейные статусы,
 следовательно, скорее всего, семейный статус не влияет на доход(простыми законами)
 */
SELECT family_status, AVG(income) AS avg_income, credit_amount FROM Clusters
GROUP BY family_status, credit_amount
ORDER BY credit_amount, family_status;
/*
 тоже самое для семейного статуса и сумме кредита
 */
SELECT AVG(income) AS avg_income, credit_amount FROM Clusters
GROUP BY credit_amount
ORDER BY credit_amount, avg_income;
/*
 Средний доход по сумме средита зачастую такого же порятка как и сумма средита,
 но средняя сумма кредида зачастую больше среднего дохода по сумме кредита
 */


-- 2) Сколько товаров в категории Meat/Poultry
SELECT COUNT(*) AS 'Количество товаров категории Meat/Poultry' FROM Products
WHERE CategoryID in (SELECT CategoryID FROM Categories WHERE CategoryName = 'Meat/Poultry');
--6

/*
3) Какой товар (название) заказывали в сумме в
самом большом количестве (sum(Quantity) в
таблице OrderDetails)
 */

SELECT ProductName FROM Products
WHERE ProductID IN (SELECT ProductID FROM OrderDetails
                    GROUP BY ProductID
                    ORDER BY SUM(Quantity) DESC
                    LIMIT 1);
--Gorgonzola Telino

