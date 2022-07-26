SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
SELECT * FROM Product;
SELECT * FROM Supplier;

--write a query to display the orders placed by customer with phone number 1300123192

SELECT o.*,c.FirstName,c.LastName
FROM Customer c 
JOIN Orders o ON c.ID = o.CustomerID
WHERE c.Phone = '1300123192';


ALTER TABLE Product
ADD Category nvarchar(40);

UPDATE Product
SET Category = 'Seafood'
WHERE ID = 8;


--  fetching all the products which are available under Category �Seafood�.

SELECT * FROM Product
WHERE Category = 'Seafood';

--Display the orders placed by customers not in London

SELECT o.* FROM Orders o
JOIN Customer c ON o.CustomerID = c.ID
WHERE c.City != 'London';


--selects all the order which are placed for the product Chai.

SELECT o.* FROM Orders o
JOIN OrderItem oi ON o.ID = oi.OrderID
JOIN Product p ON oi.ProductID = p.ID
WHERE p.ProductName = 'Chai';


