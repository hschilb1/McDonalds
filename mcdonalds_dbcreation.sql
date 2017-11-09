/* Hunter Schilb */

CREATE DATABASE McDonalds;
GO

USE McDonalds;
GO

CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  StoreType varchar(50) NOT NULL,
  Country varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  CityTown varchar(50) NOT NULL,
  ZipCode varchar(50) NOT NULL,
  Phone varchar(50) NOT NULL,
  YearEstablished bigint NOT NULL);

CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  StoreID bigint NOT NULL,
  IsStoreManager bit NOT NULL,
  Position varchar(50) NOT NULL);

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  CustomerAddress varchar(50) NOT NULL,
  ZipCode bigint NOT NULL,
  CreditCardID bigint NULL);

CREATE TABLE OrderHeader(
  OrderID bigint NOT NULL PRIMARY KEY,
  SubTotal bigint NOT NULL,
  TaxAmt bigint NOT NULL,
  TotalDue bigint NOT NULL,
  PaymentType varchar(50) NOT NULL,
  EmployeeID bigint NOT NULL,
  StoreID bigint NOT NULL,
  CreditCardID bigint NULL);


CREATE TABLE OrderDetail(
  OrderID bigint NOT NULL,
  OrderDetailID bigint NOT NULL PRIMARY KEY,
  MenuItemID bigint NOT NULL,
  Quantity bigint NOT NULL,
  LineTotal bigint NOT NULL);


CREATE TABLE CreditCard(
  CreditCardID bigint NOT NULL PRIMARY KEY,
  Provider varchar(50) NOT NULL,
  ExpirationDate varchar(50) NOT NULL,
  LastFour int NOT NULL);


CREATE TABLE SeasonalMenu(
  SeasonalID bigint NOT NULL PRIMARY KEY,
  Season varchar(50) NOT NULL,
  MenuItemID bigint NOT NULL);


CREATE TABLE FoodMenu(
  FoodID bigint NOT NULL PRIMARY KEY,
  FoodName varchar(50) NOT NULL,
  FoodCategory varchar(50) NOT NULL,
  FoodCalories varchar(50) NOT NULL,
  isSeasonal bit NOT NULL,
  SeasonalCode varchar(50) NULL,
  MenuItemID bigint NOT NULL,
  IsMadeInStore bit NOT NULL,
  UnitPrice varchar(50) NOT NULL);

  
CREATE TABLE DrinkMenu(
  DrinkID bigint NOT NULL PRIMARY KEY,
  DrinkName varchar(50) NOT NULL,
  DrinkCalories int NOT NULL,
  DrinkCategory varchar(50) NOT NULL,
  IsSeasonal bit NOT NULL,
  SeasonalCode varchar(50) NULL,
  MenuItemID bigint NOT NULL,
  IsMadeInStore bit NOT NULL,
  SmallPrice int NULL,
  MediumPrice int NULL,
  LargePrice int NULL);


CREATE TABLE MenuItem(
  MenuItemID bigint NOT NULL PRIMARY KEY,
  IsDrink bit NOT NULL,
  IsSeasonal bit NOT NULL); 

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Store
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE OrderHeader ADD CONSTRAINT FK_OrderHeader_Employee
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);
GO

ALTER TABLE OrderHeader ADD CONSTRAINT FK_OrderHeader_Store
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE OrderHeader ADD CONSTRAINT FK_OrderHeader_CreditCard
FOREIGN KEY (CreditCardID) REFERENCES CreditCard(CreditCardID);
GO

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Order
FOREIGN KEY (OrderID) REFERENCES OrderHeader(OrderID);
GO

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_MenuItem
FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID);
GO

ALTER TABLE DrinkMenu ADD CONSTRAINT FK_DrinkMenu_MenuItem
FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID);
GO

ALTER TABLE FoodMenu ADD CONSTRAINT FK_FoodMenu_MenuItem
FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID);
GO

ALTER TABLE SeasonalMenu ADD CONSTRAINT FK_SeasonalMenu_MenuItem
FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID);
GO

ALTER TABLE Customer ADD CONSTRAINT FK_Customer_CreditCard
FOREIGN KEY (CreditCardID) REFERENCES CreditCard(CreditCardID);
GO

INSERT INTO Store(StoreID, Name, StoreType, Country, State, CityTown, ZipCode, Phone, YearEstablished) VALUES
(10001, 'Chestnut St', 'Regular', 'U.S.', 'Massachusetts', 'Needham', 02492, 781-444-8592, 2000),
(10002, 'Natick Mall', 'Mall', 'U.S.', 'Massachusetts', 'Natick', 01760, 508-545-0762, 2009),
(10003, 'Massachusetts Ave', 'Regular', 'U.S.', 'Massachusetts', 'Boston', 02118, 617-442-4349, 2006),
(10004, 'Circumferential Hwy', 'Regular', 'U.S.', 'Massachusetts', 'Newton', 02462, 617-332-1771, 2015),
(10005, 'VFW Pkwy', 'DriveThru', 'U.S.', 'Massachusetts', 'West Roxbury', 02132, 617-325-2709, 2002),
(10006, 'Massachusetts Ave', 'DriveThru', 'U.S.', 'Massachusetts', 'Cambridge', 02139, 617-497-3926, 2004),
(10007, 'Main Street', 'DriveThru', 'U.S.', 'Massachusetts', 'Waltham', 02451, 781-893-6640, 2001),
(10008, 'Commonwealth Ave', 'DriveThru', 'U.S.', 'Massachusetts', 'Allston', 02134, 617-562-1313, 2004),
(10009, 'Marrett Rd', 'DriveThru', 'U.S.', 'Massachusetts', 'Lexington', 02421, 781-861-1144, 2011),
(10010, 'Cochituate Rd', 'Regular', 'U.S.', 'Massachusetts', 'Framingham', 01701, 508-879-1650, 2010);

INSERT INTO Employee(EmployeeID, FirstName, LastName, StoreID, IsStoreManager, Position) VALUES
(5001, 'Luke', 'Short', 10001, 1, 'Manager'),
(5002, 'Evan', 'Parsons', 10001, 0, 'Cashier'),
(5003, 'Brian', 'Butler', 10002, 0, 'Cashier'),
(5004, 'Sebastian', 'Watson', 10002, 1, 'Manager'),
(5005, 'Anna', 'Davies', 10001, 0, 'Server'),
(5006, 'Kylie', 'Gibson', 10003, 1, 'Manager'),
(5007, 'Joseph', 'Coleman', 10003, 0, 'Server'),
(5008, 'Charles', 'Underwood', 10004, 0, 'Cashier'),
(5009, 'Eric', 'Baker', 10004, 1, 'Manager'),
(5010, 'Molly', 'Henderson', 10004, 0, 'Server'),
(5011, 'Melanie', 'Wallace', 10005, 0, 'Cashier'),
(5012, 'Kevin', 'MacLeod', 10005, 1, 'Manager'),
(5013, 'Jake', 'McDonald', 10005, 0, 'Cashier'),
(5014, 'Keith', 'Sanderson', 10006, 1, 'Manager'),
(5015, 'Irene', 'Mathis', 10006, 0, 'Server'),
(5016, 'Phil', 'Mackay', 10007, 1, 'Manager'),
(5017, 'Sally', 'Cornish', 10007, 0, 'Server'),
(5018, 'Cameron', 'Ross', 10007, 0, 'Cashier'),
(5019, 'Piers', 'Peters', 10008, 1, 'Manager'),
(5020, 'Gavin', 'Oliver', 10008, 0, 'Server'),
(5021, 'Lillian', 'Brown', 10008, 0, 'Cashier'),
(5022, 'Jake', 'Gill', 10009, 1, 'Manager'),
(5023, 'Alexander', 'Avery', 10009, 0, 'Cashier'),
(5024, 'Sally', 'Slater', 10010, 1, 'Manager'),
(5025, 'Leah', 'Down', 10010, 0, 'Cashier'),
(5026, 'Michelle', 'Bottomfield', 10010, 0, 'Server');

INSERT INTO CreditCard(CreditCardID, Provider, ExpirationDate, LastFour) VALUES
(7001, 'Mastercard', '03/22', 0422),
(7002, 'American Express', '04/18', 6969),
(7003, 'Visa', '12/24', 1357),
(7004, 'Mastercard', '08/19', 1738),
(7005, 'Visa', '05/20', 0204),
(7006, 'American Express', '11/17', 6767),
(7007, 'Mastercard', '07/21', 7664),
(7008, 'Visa', '01/19', 8537),
(7009, 'Mastercard', '06/18', 9483),
(7010, 'American Express', '09/22', 8371);

INSERT INTO Customer(CustomerID, FirstName, LastName, Email, CustomerAddress, ZipCode, CreditCardID) VALUES
(1001, 'Carl', 'Poole', 'cpoole@gmail.com', '3 Bouder Glen Road', 02043, 7008),
(1002, 'Colin', 'James', 'cjames@gmail.com', '67 Martins Lane', 02043, 7001),
(1003, 'Justin', 'Scott', 'justin.scott@verizon.net', '17 Porters Cove Road', 01001, 7009),
(1004, 'Vanessa', 'Baker', 'vbaker@verizon.net', '22 Spooner Street', 01243, NULL),
(1005, 'Maria', 'Vance', 'mvance@gmail.com', '8 Seal Cove Road', 02065, 7010),
(1006, 'Simon', 'Anderson', 'simon.anderson@yahoo.com', '12 Main Street', 02743, 7005),
(1007, 'Nicola', 'Reid', 'nreid@hotmail.com', '156 Jerusalem Road', 02493, 7004),
(1008, 'Molly', 'Arnold', 'marnold@gmail.com', '187 West Jenkins Street', 02456, 7003),
(1009, 'Eric', 'Ross', 'eric.ross@yahoo.com', '28 Drumlin Road', 02211, 7006),
(1010, 'Adam', 'Gill', 'agill@babson.edu', '44 Thomas Street', 02044, 7007),
(1011, 'Max', 'Kerr', 'mkerr@gmail.com', '13 Pleasant Street', 02021, 7002);

INSERT INTO OrderHeader(OrderID, SubTotal, TaxAmt, TotalDue, PaymentType, EmployeeID, StoreID, CreditCardID) VALUES
(100001, 17.38, 2.95, 20.33, 'Cash', 5001, 10001, NULL),
(100002, 4.50, 0.77, 2.43, 'Cash', 5001, 10001, NULL),
(100003, 7.89, 1.34, 9.23, 'Credit', 5001, 10001, 7005),
(100004, 18.56, 3.16, 21.72, 'Cash', 5004, 10002, NULL),
(100005, 14.32, 2.43, 16.75, 'Credit', 5004, 10002, 7001),
(100006, 2.86, 0.49, 3.35, 'Credit', 5004, 10002, 7010),
(100007, 5.32, 0.90, 6.22, 'Credit', 5006, 10003, 7002),
(100008, 14.45, 2.46, 16.91, 'Credit', 5006, 10003, 7003),
(100009, 12.76, 2.17, 14.93, 'Cash', 5006, 10003, NULL),
(100010, 10.07, 1.71, 11.78, 'Credit', 5008, 10004, 7005),
(100011, 26.33, 4.48, 30.81, 'Cash', 5008, 10004, NULL),
(100012, 16.49, 2.80, 19.29, 'Cash', 5008, 10004, NULL),
(100013, 8.72, 1.48, 10.20, 'Credit', 5008, 10004, 7007),
(100014, 13.29, 2.26, 15.55, 'Credit', 5011, 10005, 7006),
(100015, 4.45, 0.76, 5.21, 'Cash', 5011, 10005, NULL),
(100016, 6.30, 1.07, 7.37, 'Credit', 5013, 10005, 7004),
(100017, 5.49, 0.93, 6.42, 'Credit', 5011, 10005, 7009),
(100018, 9.99, 1.70, 11.69, 'Credit', 5015, 10006, 7008),
(100019, 10.55, 1.79, 12.34, 'Cash', 5015, 10006, NULL),
(100020, 18.13, 3.08, 21.21, 'Cash', 5015, 10006, NULL),
(100021, 26.43, 4.49, 30.29, 'Credit', 5018, 10007, 7005),
(100022, 14.78, 2.51, 17.29, 'Credit', 5021, 10008, 7010),
(100023, 8.23, 1.40, 9.63, 'Cash', 5021, 10008, NULL),
(100024, 1.99, 0.34, 2.33, 'Cash', 5023, 10009, NULL),
(100025, 2.99, 0.51, 3.50, 'Cash', 5023, 10009, NULL),
(100026, 4.07, 0.69, 4.76, 'Credit', 5023, 10009, 7001),
(100027, 14.44, 2.45, 16.89, 'Credit', 5025, 10010, 7005),
(100028, 6.76, 1.15, 7.91, 'Credit', 5025, 10010, 7004),
(100029, 7.20, 1.22, 8.42, 'Cash', 5026, 10010, NULL);

/* We decided to randomize the information below as it was too time consuming to hand 
calculate menu items, their prices and make them match with our numbers above */
INSERT INTO OrderDetail(OrderID, OrderDetailID, MenuItemID, Quantity, LineTotal) VALUES
(100001, 200001, 106, 2, 4.14),
(100001, 200002, 205, 12, 7.00),
(100002, 200003, 201, 2, 1.20),
(100003, 200004, 204, 1, 0.59),
(100004, 200005, 107, 1, 2.79),
(100005, 200006, 103, 1, 1.49),
(100006, 200007, 203, 2, 2.40),
(100007, 200008, 202, 1, 1.20),
(100008, 200009, 106, 1, 2.07),
(100009, 200010, 104, 1, 1.49),
(100010, 200011, 206, 1, 2.50),
(100010, 200012, 207, 2, 7.00),
(100010, 200013, 102, 1, 2.07),
(100011, 200014, 107, 1, 2.29),
(100011, 200015, 104, 1, 1.49),
(100012, 200016, 203, 1, 1.20),
(100012, 200017, 106, 3, 6.21),
(100013, 200018, 105, 1, 1.49),
(100014, 200019, 101, 1, 2.79),
(100015, 200020, 203, 6, 6.00),
(100016, 200021, 107, 1, 2.29),
(100017, 200022, 103, 1, 1.49),
(100018, 200023, 207, 1, 3.50),
(100019, 200024, 107, 2, 3.38),
(100020, 200025, 205, 6, 4.00),
(100021, 200026, 106, 1, 2.07),
(100022, 200027, 206, 1, 2.50),
(100023, 200028, 206, 2, 5.00),
(100024, 200029, 107, 1, 2.79),
(100025, 200030, 207, 1, 3.50),
(100026, 200031, 107, 1, 2.29),
(100027, 200032, 205, 6, 4.00),
(100028, 200033, 104, 1, 2.07);

INSERT INTO SeasonalMenu(SeasonalID, Season, MenuItemID) VALUES
(2115, 'Spring', 215);


INSERT INTO DrinkMenu(DrinkID, DrinkName, DrinkCalories, DrinkCategory, IsSeasonal, SeasonalCode, MenuItemID, IsMadeInStore, SmallPrice, MediumPrice, LargePrice) VALUES
(1001, 'Premium Roast Coffee', 50, 'hot', 0, NULL, 101, 1, 1.00, 1.29,1.99),
(1002, 'Tea', 20, 'hot', 0, NULL, 102, 1,.99, 1.29,1.98),
(1003, 'Espresso', 10, 'hot', 0,NULL, 103, 1,2.39, NULL,3.39),
(1004, 'Water', 0, 'cold', 0,NULL, 104, 1,NULL, 1.49,NULL),
(1005, 'Soft Drink', 350, 'cold', 0, NULL, 105,1,1.00, 1.50,2.00),
(1006, 'Iced Coffee', 50, 'cold', 0,NULL, 106,1,1.39, NULL,1.99),
(1007, 'Orange Juice', 250, 'cold', 0,NULL, 107,1,NULL, 1.89,NULL)


INSERT INTO FoodMenu(FoodID, FoodName, FoodCalories, FoodCategory, IsSeasonal, SeasonalCode, MenuItemID, IsMadeInStore, UnitPrice) VALUES
(2001, 'Big Mac', 1000, 'Burgers and Sandwhiches', 0,NULL, 201, 1,3.99,),
(2002, 'Angus Chipotle BBQ Bacon', 800, 'Burgers and Sandwhiches', 0,NULL, 202, 1, 4.49),
(2003, 'Quarter Pounder', 750, 'Burgers and Sandwhiches', 0, NULL, 203,1, 3.79,),
(2004, 'Cheeseburger', 500, 'Burgers and Sanwhiches', 0, NULL, 204,1, .99),
(2005, 'Chicken Nuggets', 250, 'Chicken', 0, NULL, 205, 1, 0.75),
(2006, 'Premium Crispy Chicken Classic Sandwhich', 475,'Chicken',0,NULL, 206,1,4.39),
(2007, 'Chipotle BBQ Snack Wrap', 450, 'Chicken', 0, NULL, 207,1,3.79),
(2008, 'Premium Caesar Salad with Grilled Chicken', 300, 'Chicken', 0,NULL, 208,1,4.59),
(2009, 'World Famous Fries', 200, 'Snacks & Sides', 0, NULL, 209,1,1.69),
(2010, 'Apple Dippers', 150, 'Snacks & Sides',0,NULL, 210,1, 1.00),
(2011, 'Fruits & Walnuts', 100, 'Snacks & Sides',0, NULL,211,1,1.00),
(2012, 'Honey Mustard Snack Wrap',450, 'Snacks & Sides',0,NULL,212,1,1.69),
(2013, 'Fruit and Yogurt Parfait', 300,'Snacks & Slides',0,NULL,213,1,1.00),
(2014, 'Mcflurry',525,'Desserts & Shakes',0,NULL,214,1,2.39),
(2015, 'Shamrock Shake', 485,'Desserts & Shakes',1,4,215,1,2.19);


INSERT INTO MenuItem(MenuItemID, IsDrink, IsSeasonal) VALUES
(101, 1, 0),
(102, 1, 0),
(103, 1, 0),
(104, 1, 0),
(105, 1, 0),
(106, 1, 0),
(107, 1, 0),
(201, 0, 0),
(202, 0, 0),
(203, 0, 0),
(204, 0, 0),
(205, 0, 0),
(206, 0, 0),
(207, 0, 0),
(208, 0, 0),
(209, 0, 0),
(210, 0, 0),
(211, 0, 0),
(212, 0, 0),
(213, 0, 0),
(214, 0, 0),
(215, 0, 1);
