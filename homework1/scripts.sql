/*
 1 В каких странах проживают наши клиенты(Таблица Customers)
 Скольких уникальных стран в ответе?
 */
SELECT COUNT(DISTINCT Country) AS country_count FROM Customers;
-- 21

-- 2. Сколько клиентов проживает в Argentina?
SELECT COUNT(*) FROM Customers
WHERE Country = 'Argentina';
--3

-- 3. Посчитайте среднюю цену и количество товаров в 8 категории (таблица Products )
SELECT CategoryID, AVG(Price), COUNT(*)  FROM Products
GROUP BY CategoryID
ORDER BY CategoryID;

-- Посчитайте средний возраст работников (таблица Employees)
-- нет поля возраста

/*
 Вам необходимо получить заказы, которые сделаны в течении 35 дней до даты 2023-10-10 (то есть с 5
сентября до 10 октября включительно). Использовать функцию DATEDIFF, определить переменные для
даты и диапазона.
DATEDIFF NOT IN sqlite
 */

SELECT OrderID FROM Orders
WHERE OrderDate BETWEEN '2023-09-5' AND '2023-10-10' LIMIT 1;

/*
 Вам необходимо получить количество заказов за сентябрь месяц (тремя способами, через LIKE, с
помощью YEAR и MONTH и сравнение начальной и конечной даты).
 */
SELECT COUNT(*) FROM Orders
WHERE OrderDate LIKE '2023-09-%';

SELECT COUNT(*) FROM Orders
WHERE OrderDate BETWEEN '2023-09-01' AND date('2023-10-01', '-1 days');