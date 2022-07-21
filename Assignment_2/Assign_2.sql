--Display details from customer table who is from country Australia

SELECT * FROM Customer
WHERE Country = 'Australia';



--displaying fullname of customers

SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Customer;


--Display customer detals who has fax number

SELECT * FROM Customer
WHERE Fax LIKE '%';


--Display customer details whose name holds second letter U

SELECT * FROM Customer
WHERE FirstName LIKE '_u%';

INSERT INTO Customer
VALUES (8,'Suzen','Welson','Calgary','Canada','+63 231453212',NULL);


--Displaying order details where unit price is between 10 and 20
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM OrderItem;
SELECT * FROM Supplier;

SELECT o.* FROM Orders o
JOIN OrderItem oi ON o.ID = oi.OrderID
WHERE oi.UnitPrice BETWEEN 10 AND 20
ORDER BY o.OrderNumber;


--print orders shipped by shipname 'la corne d'abondance' between 2 dates

SELECT * FROM Orders
WHERE ShipName = 'Lacorne d"abondance' AND ShippedDate BETWEEN '2020-03-07' AND '2022-05-09';


--Print Products Supplied by Exotic Liquids

SELECT p.* FROM Product p
JOIN Supplier s ON p.SupplierID = s.ID
WHERE s.CompanyName = 'Exotic Liquids';


INSERT INTO OrderItem
VALUES (107,103,8,168.00,6),
		(108,102,2,20.00,19),
		(109,105,6,188.00,11);


--Average quantity ordered for every product

SELECT p.ID,AVG(oi.Quantity),p.ProductName as average_quantity
FROM OrderItem oi 
JOIN Product p ON oi.ProductID = p.ID
GROUP BY p.ID;


--Print all shipping company name and ship names if they operational

SELECT s.CompanyName,o.ShipName
FROM Supplier s
JOIN Product p ON s.ID = p.SupplierID
JOIN OrderItem oi ON oi.ProductID = p.ID
JOIN Orders o ON oi.OrderID = o.ID
WHERE p.IsDiscontinued = 1
GROUP BY s.CompanyName,o.ShipName;

SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM OrderItem;
SELECT * FROM Supplier;

--Print TotalPrice of orders which have the products supplied by 'Exotic Liquid' if the price is > 1699 and also print by its shipping name

SELECT o.ID AS OrderID,p.ProductName ,oi.ID AS OrderItem_ID, o.TotalAmount,s.CompanyName
FROM Orders o
JOIN OrderItem oi ON o.ID = oi.OrderID
JOIN Product p ON oi.ProductID = p.ID
JOIN Supplier s ON p.SupplierID = s.ID
WHERE s.CompanyName = 'Exotic Liquids' AND o.TotalAmount > 1699.00;


