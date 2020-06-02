create database if not exists datagrokrpvt;
use datagrokrpvt;
create table if not exists Employees(EmployeeID INT(12) primary key, LastName varchar(20) NOT NULL,FirstName varchar(10),
                                     Title varchar(30),Titleofcourtesy varchar(25),BirthDate datetime,HireDate datetime,Address varchar(60),
                                     City varchar(15), Region varchar(15), PostalCode varchar(10),Country varchar(15), HomePhone varchar(24),
                                     Extension varchar(4), Notes mediumtext not null, ReportsTo int(12) references Employees(EmployeeID),PhotoPath
                                      varchar(255),Salary float);
create table if not exists Customers(CustomerID INT(12) primary key,CompanyName varchar(40) NOT NULL UNIQUE,ContactName varchar(30),
                ContactTitle varchar(30),Address varchar(60),City varchar(15), Region varchar(15), PostalCode varchar(10),
                Country varchar(15),Phone varchar(24),Fax varchar(24));
alter table Customers modify column CustomerID varchar(5);
create table if not exists Orders(OrderID INT(11) primary key, CustomerID varchar(5) references Customer(CustomerID),
               EmployeeID int(11) references Employee(EmployeeID),OrderDate datetime,RequiredDate datetime,ShippedDate datetime,
               ShipVia int(11) references Shippers(ShipperID),Freight decimal(10,4),ShipName varchar(40),ShipAddress varchar(60),
               ShipCity varchar(15),ShipRegion varchar(15),ShipPostalCode varchar(10),ShipCountry varchar(15));
create table if not exists Region(RegionID INT(11) primary key,RegionDescription varchar(50) not null);
create table if not exists Territories(TerritoryID varchar(20) primary key,TerritoryDescription varchar(50) not null,
              RegionID INT(11) not null references Region(RegionID));
create table if not exists EmployeeTerritories(EmployeeID INT(11),TerritoryID varchar(20),
                primary key(EmployeeID,TerritoryID));
create table if not exists Category(CategoryID INT(11) primary key,CategoryName varchar(15) not null,Description mediumtext);
rename table Category to Categories;
create table if not exists Suppliers(SupplierID INT(11) primary key, CompanyNameName varchar(40) not null,ContactName
               varchar(30),ContactTitle varchar(30),Address varchar(60),City varchar(15),Region varchar(15),PostalCode varchar(10)
               ,Country varchar(15),Phone varchar(24),Fax varchar(24),HomePage MediumText);
alter table suppliers rename column CompanyNameName to CompanyName;
create table if not exists Products(ProductID int(11) primary key,ProductName varchar(40) not null, SupplierID INT(11)
              references Suppliers(SupplierID),CategoryID INT(11) references Category(CategoryID),QuantityPerUnit varchar(20),
              UnitPrice Decimal(10,4),UnitsInStock smallint(2),UnitsOnOrder smallint(2),ReorderLevel smallint(2),Discontinued BIT(1)
              not null);
create table if not exists OrderDetails(OrderID INT(11),ProductID INT(11),UnitPrice decimal(10,4) not null,Quantity 
             smallint(2) not null,Discount Double(8,0) not null,primary key(OrderID, ProductID));
create table if not exists CustomerDemographics(CustomerTypeID varchar(10) primary key,CustomerDesc mediumtext);
create table if not exists CustomerCustomerDemo(CustomerID varchar(5),CustomerTypeID varchar(10),primary key(CustomerID
    ,CustomerTypeID));
create table if not exists Shippers(ShipperID INT(11) primary key,CompanyName varchar(40) NOT NULL UNIQUE,
               Phone varchar(24));