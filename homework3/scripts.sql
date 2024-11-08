/* 1. Просчитать средний чек заказа */ SELECT AVG(p.Price * od.Quantity) FROM OrderDetails od JOIN Products p ON p.ProductID = od.ProductID ; /*
 * 2. Просчитать сколько заказов доставляет в месяц каждая служба доставки
 * Определите сколько заказов доставила United Package в декабре 2023 году
 */

 SELECT s.ShipperID , s.ShipperName, STRFTIME(o.OrderDate, '%m - %Y') AS mount, COUNT(o.OrderID) AS order_cnt
 FROM Shippers s
 LEFT JOIN Orders o ON s.ShipperID = o.ShipperID
 GROUP BY s.ShipperID, mount HAVING s.ShipperName = 'United Package';

 /* 3. Определить средний LTV покупателя
 * (сколько денег покупатели в среднем тратят в магазине за весь период)
 */
 SELECT AVG(p.Price * od.Quantity)
 FROM OrderDetails od
     JOIN Orders o ON od.OrderID = o.OrderID
     JOIN Products p ON p.ProductID = od.ProductID ;