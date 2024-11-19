-- на MariaDB

/*
 1) Создайте таблицу EmployeeDetails для хранения информации о
сотрудниках. Таблица должна содержать следующие столбцы:
● EmployeeID (INTEGER, PRIMARY KEY)
● EmployeeName (TEXT)
● Position (TEXT)
● HireDate (DATE)
● Salary (NUMERIC)
 */
CREATE TABLE EmployeeDetails(
    EmployeeID INTEGER PRIMARY KEY,
    EmployeeName TEXT,
    Position TEXT,
    HireDate DATE,
    Salary FLOAT
);

INSERT INTO EmployeeDetails(EmployeeID, EmployeeName, Position, HireDate, Salary) VALUES
    (1, 'John Smith', 'Sales Manager', '2022-01-15', 55000),
    (2, 'Jane Doe', 'Marketing Specialist', '2021-06-30', 48000),
    (3, 'Emily Johnson', 'Software Engineer','2023-03-22', 65000);

/*
 2) Создайте представление HighValueOrders для отображения всех заказов,
сумма которых превышает 10000. В представлении должны быть следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● TotalAmount (общая сумма заказа, вычисленная как сумма всех Quantity *
Price).
Используйте таблицы Orders, OrderDetails и Products.
Подсказки:
1. Используйте JOIN для объединения таблиц.
2. Используйте функцию SUM() для вычисления общей суммы заказа.
 */

CREATE VIEW HighValueOrders AS
SELECT
    o.OrderID,
    o.OrderDate,
    SUM(p.Price * od.Quantity) AS TotalAmount
FROM Orders AS o
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
JOIN Products AS p ON p.ProductID = od.ProductID
GROUP BY o.OrderID
HAVING TotalAmount > 10000;

# result is 4 rows

/*
3) Удалите все записи из таблицы EmployeeDetails, где Salary меньше
50000. Затем удалите таблицу EmployeeDetails из базы данных.
 */

DELETE FROM EmployeeDetails WHERE Salary < 50000;
DROP TABLE EmployeeDetails;


/*
Создайте хранимую процедуру GetProductSales с одним параметром
ProductID. Эта процедура должна возвращать список всех заказов, в которых
участвует продукт с заданным ProductID, включая следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● CustomerID (идентификатор клиента).
 */
DROP PROCEDURE IF EXISTS GetProductSales;

DELIMITER $$
$$
CREATE PROCEDURE GetProductSales(IN p_ProductID INT)
BEGIN
    SELECT
        o.OrderID,
        o.OrderDate,
        o.CustomerID
    FROM Orders AS o
             JOIN OrderDetails AS od ON o.OrderID = od.OrderID
    WHERE od.ProductID = p_ProductID;
END $$
DELIMITER ;