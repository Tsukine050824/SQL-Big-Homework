Create Database PhoneSeller
GO

Create Table Category1(
 CategoryID bigint primary key,
 CategoryName varchar,
 Description text
)
GO

Create Table Custormers (
  CustomersID integer primary key,
  CustomersName varchar,
  CustomersAddress varchar,
  City varchar,
  Region varchar,
  Mobile varchar(15),
  Email varchar,
  RegisteredAT datetime
)

Create Table Product1 (
  ProductID integer primary key,
  ProductName varchar,
  CategoryID bigint Foreign Key References Category1(CategoryID),
  UnitPrice integer,
  ShopID integer,
  Color varchar,
  Discount float,
  RAM varchar,
  Demand varchar,
  PhoneScreen varchar,
  Capacity varchar,
  ChargeAbility varchar,
  Special varchar,
  TotalAmount varchar
)

Create Table Shop (
  ShopID integer primary key,
  ShopName NVARCHAR(50),
  Address varchar,
  PhoneNumber varchar(15),
  Voted integer,
)
Go

Create Table Ordered (
  OrderID integer primary key,
  CustomersID integer Foreign Key REFERENCES Custormers(CustomersID),
  ProductID integer Foreign Key References Product1(ProductID),
  ProductName varchar,
  Color varchar,
  Quantity int,
  Promotion int,
  ShipperID integer,
  FOREIGN KEY (ShipperID) REFERENCES [dbo].[Shipper]([ShipperID]
)
Go

Create Table Shipper (
  ShipperID integer primary key Foreign Key REFERENCES ShipCompany(CompanyID),
  ShipperName varchar,
  ShipCompanyID integer,
  PhoneNumber varchar(15)
)
Go

Create Table ShipCompany (
  CompanyID integer primary key,
  CompanyName varchar,
  PhoneNumber varchar(15),
  Address varchar,
  Country varchar
)

Create Table Cart(
  ProductID integer primary key FOREIGN KEY REFERENCES Product1(ProductID),
  ProductName varchar,
  Gender varchar,
  CustormersID integer FOREIGN KEY REFERENCES Custormers(CustomersID),
  PhoneNumber varchar,
  ReceivedMethods varchar,
  Adddress varchar,
  Discount varchar
)
Go

INSERT INTO [dbo].[Category1](CategoryID, CategoryName, Description) VALUES 
(1, 'Iphone', 'Apple smartphone'),
(2, 'Xiaomi', 'Android Phone'),
(3, 'Oppo', 'Another Android Phone');
Go

INSERT INTO Custormers (CustomersID, CustomersName, CustomersAddress, City, Region, Mobile, Email, RegisteredAT) VALUES 
(1, 'John Doe', '123 Main St', 'Anytown', 'Anystate', '123-456-7890', 'johndoe@example.com', '2023-01-01 10:00:00'),
(2, 'Jane Smith', '456 Elm St', 'Othertown', 'Otherstate', '234-567-8901', 'janesmith@example.com', '2023-02-01 11:00:00'),
(3, 'Jim Brown', '789 Oak St', 'Sometown', 'Somestate', '345-678-9012', 'jimbrown@example.com', '2023-03-01 12:00:00');
Go

INSERT INTO Product1(ProductID, ProductName, CategoryID, UnitPrice, ShopID, Color, Discount, RAM, Demand, PhoneScreen, Capacity, ChargeAbility, Special, TotalAmount) VALUES 
(1, 'IphoneX', 1, 699, 1, 'Black', 0.1, '8GB', 'High', '6.1 inch', '128GB', 'Fast Charging', '5G', '500'),
(2, 'Xiaomi Bluetooth', 2, 999, 2, 'Silver', 0.15, '16GB', 'Medium', '15.6 inch', '512GB', 'Standard Charging', 'Lightweight', '300'),
(3, ' Samsung Galaxy A55', 3, 150, 3, 'White', 0.05, '16GB', 'Low', '15 inch', '256GB', 'Standard', 'Compact', '200')
Go

INSERT INTO Shop (ShopID, ShopName, Address, PhoneNumber, Voted) VALUES 
(1, 'Tech Store', '100 Tech Rd', '111-222-3333', 100),
(2, 'Gadget Shop', '200 Gadget St', '222-333-4444', 150),
(3, 'Home Appliance Store', '300 Appliance Ave', '333-444-5555', 120);
Go

INSERT INTO Shipper (ShipperID, [ShipperName], ShipCompanyID, PhoneNumber) VALUES 
(1, 'Nguyen Van A', '1', '444-555-6666'),
(2, 'Tran Van B', '2', '555-666-7777'),
(3, 'Pham Thi C', '3', '666-777-8888');

INSERT INTO ShipCompany (CompanyID, CompanyName, PhoneNumber, Address, Country) VALUES 
(1, 'Fast Shipping Co', '444-555-6666', '10 Speedy Ln', 'USA'),
(2, 'Reliable Shipping Inc', '555-666-7777', '20 Dependable Blvd', 'USA'),
(3, 'Global Shipping LLC', '666-777-8888', '30 Worldwide Way', 'USA');

INSERT INTO Cart (ProductID, ProductName, Gender, [CustormersID] , PhoneNumber, ReceivedMethods, Adddress, Discount) VALUES 
(1, 'IphoneX', 'Male', '1', '123-456-7890', 'Delivery', '123 Main St', '10%'),
(2, 'Xiaomi Bluetooth', 'Female', '2', '234-567-8901', 'Pickup', '456 Elm St', '15%'),
(3, 'Samsung Galaxy A55', 'Male', '3', '3[CustormersID]45-678-9012', 'Delivery', '789 Oak St', '5')
GO

Select [ProductName] From [dbo].[Cart]
Where [ProductID] <= 3


Select [ReceivedMethods] From [dbo].[Cart]
Where [CustormersID] = 3
Go

SELECT [ProductName] FROM [dbo].[Product1]
Where [Color] = 'Black'
SELECT [ProductName] FROM [dbo].[Product1]
Where [RAM] = '8GB'
Go

