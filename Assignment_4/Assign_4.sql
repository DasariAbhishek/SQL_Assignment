--	Write a query to get most expense and least expensive Product list (name and unit price).

SELECT ProductName, UnitPrice
FROM Product
ORDER BY UnitPrice DESC;


--	Display the list of products that are out of stock
SELECT * FROM Product;
SELECT ProductName, UnitsInStock, UnitsOnOrder
FROM Product
WHERE ((IsDiscontinued = 0) AND ((UnitsInStock)<UnitsOnOrder));


--	Display the list of products whose unitinstock is less than unitonorder

SELECT ProductName, UnitsInStock, UnitsOnOrder
FROM Product
WHERE(UnitsInStock < UnitsOnOrder);


--	Display list of categories and suppliers who supply products within those categories

SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
SELECT * FROM Product;
SELECT * FROM Supplier;

SELECT p.Category, s.CompanyName 
FROM Product p
JOIN Supplier s ON p.SupplierID = s.ID
GROUP BY s.ID,p.Category,s.CompanyName;


--	Display complete list of customers, the OrderID and date of any orders they have made

SELECT * FROM Customer;
SELECT * FROM Orders;

SELECT c.FirstName, c.LastName, o.ID, o.OrderDate
FROM Customer c
JOIN Orders o ON c.ID = o.CustomerID
WHERE o.OrderNumber = 14;

--	Write  query that determines the customer who has placed the maximum number of orders

SELECT c.*,o.*
FROM Customer c 
JOIN Orders o ON c.ID = o.CustomerID
WHERE c.ID IN (SELECT CustomerID FROM Orders
				GROUP BY CustomerID
				HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM Orders GROUP BY CustomerID)
			);

--	Display the customerid whose name has substring �EN�

SELECT ID,FirstName FROM Customer
WHERE FirstName LIKE '%en%';


-- Display the first word of all the company name

--SELECT SUBSTRING(CompanyName,CHARINDEX(' ',CompanyName + ' ') + 1, LEN(CompanyName) - CHARINDEX(' ',CompanyName)) AS ShortName
--FROM Supplier;

SELECT SUBSTRING(LTRIM(CompanyName),1,(CHARINDEX(' ',LTRIM(CompanyName) + ' ')-1)) AS ShortName
FROM Supplier;