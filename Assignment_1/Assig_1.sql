CREATE TABLE Customer
(
	ID INT PRIMARY KEY,
	FirstName nvarchar(40) NOT NULL,
	LastName nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
	Phone nvarchar(20),
	Fax nvarchar(40) DEFAULT NULL,
)

CREATE TABLE Orders
(
	ID INT PRIMARY KEY,
	OrderDate datetime NOT NULL,
	OrderNumber nvarchar(40),
	CustomerID INT,
	TotalAmount decimal(12,2),
	ShippedDate DATETIME NOT NULL,
	ShipName nvarchar(40),
	FOREIGN KEY(CustomerID) REFERENCES Customer(ID) ON DELETE CASCADE,
)

CREATE TABLE Product
(
	ID INT PRIMARY KEY,
	ProductName nvarchar(50),
	UnitPrice decimal(12,2),
	IsDiscontinued bit,
	SupplierID INT,
	UnitsInStock INT,
	UnitsOnOrder INT,
	FOREIGN KEY(SupplierID) REFERENCES Supplier(ID) ON DELETE CASCADE,
)

CREATE TABLE Supplier
(
	ID INT PRIMARY KEY NOT NULL,
	CompanyName nvarchar(40),
	ContactName nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
	Phone nvarchar(40),
);

CREATE TABLE OrderItem
(
	ID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	UnitPrice decimal(12,2),
	Quantity INT,
	FOREIGN KEY (OrderID) REFERENCES Orders (ID) ON DELETE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES Product (ID) ON DELETE CASCADE,
)

CREATE INDEX IndexCustomerName ON Customer(FirstName, LastName);

CREATE INDEX IndexOrderCustomerID ON Orders(CustomerID);
CREATE INDEX IndexOrderOrderDate ON Orders(OrderDate);

CREATE INDEX IndexOrderItemOrderID ON OrderItem(OrderID);
CREATE INDEX IndexOrderItemProductID ON OrderItem(ProductID);

CREATE INDEX IndexProductSupplierID ON Product(ID);
CREATE INDEX IndexProductName ON Product(ProductName);

INSERT INTO Customer 
VALUES (1,'Rohit','Sharma','Nagpur','India','9812348321',NULL),
      (2,'Ben','Stokes','London','England','1300123192','(313) 555-3349'),
      (3,'Adam','Zampa','Melbourne','Australia','6430012783',NULL),
      (4,'Martin','Guptil','Hamilton','NewZealand','9812555321',NULL),
      (5,'Ishan','Kishan','Mumbai','India','981232131','(03) 444-6588'),
	  (6,'Kein','Williamson','Wellington','NewZealand','6434976543',NULL),
	  (7,'Shikhar','Dhawan','Navi Mumbai','India','9987456273','(617) 555-3389');

SELECT * FROM OrderItem;

INSERT INTO Orders
VALUES(101,'2022-03-04 12:15:30','11',4,1800.50,'2020-03-07 12:20:30','Merchant Shipping'),
      (102,'2022-02-12 12:16:31','02',2,2060.50,'2022-03-02 12:45:00','Lacorne d"abondance'),
      (103,'2022-07-11 12:17:32','09',4,2499.50,'2019-07-12 11:00:00','Global e-trender'),
      (104,'2022-07-07 12:18:33','14',3,1499.00,'2022-07-10 10:20:30','LTL & International'),
      (105,'2022-01-02 12:19:34','01',1,499.50,'2022-02-04 11:40:00','Cofee Board'),
	  (106,'2022-05-05 10:30:00','10',3,999.99,'2018-05-10 10:20:24','Shiprocket X'),
	  (107,'2022-10-09 11:40:41','05',7,2999.00,'2021-10-11 12:45:43','Caribbean Cargo');

INSERT INTO Supplier
VALUES (1,'Exotic Liquids','Charlotte Cooper','Lasi','UK','(111) 444-2222'),
		(2,'Tokyo Traders','Yoshi Nagase','Tokyo','Japan','(03) 8888-5011'),
		(3,'Specialty Biscuits, Ltd.','Peter Wilson','Manchester','UK','(161) 555-4448'),
		(4,'Formaggi Fortini s.r.l.','Elio Rossi','Ravenna','Italy','(0544) 60323'),
		(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Oviedo','Spain','(98) 598 76 54'),
		(6,'Bigfoot Breweries','Cheryl Saylor','Bend','USA','(503) 555-9931'),
		(7,'Ma Maison','Jean-Guy Lauzon','Montréal','Canada','(514) 555-9022'),
		(8,'DTDC','Harish Naidu','Mumbai','India','(+91) 9921321821');

INSERT INTO Product 
VALUES (1,'Chai',16.00,1,8,15,2),
		(2,'Aniseed Syrup',19.00,1,1,4,10),
		(3,'Teatime Chocolate Biscuits',128.75,1,3,25,30),
		(4,'Geitost',12.00,0,5,33,0),
		(5,'Carnarvon Tigers',54.00,1,2,19,14),
		(6,'Ipoh Coffee',199.99,0,6,43,11),
		(7,'Chocolade',213.45,1,4,0,13),
		(8,'Steeleye Stout',155.00,1,1,65,25);

INSERT INTO OrderItem
VALUES (101,104,8,177.00,7),
		(102,105,5,57.00,18),
		(103,102,1,18.50,20),
		(104,104,7,200.00,15),
		(105,101,4,15.00,20),
		(106,107,2,21.00,14);


--Display All Customer Details

SELECT * FROM Customer;

--Displaying country whose name starts with A or I

SELECT DISTINCT Country FROM Customer
WHERE Country LIKE 'A%' OR Country LIKE 'I%';



--display whose name of customer whose third character is i

SELECT * FROM Customer
WHERE FirstName LIKE '__i%';



