SET FOREIGN_KEY_CHECKS=0;
use datagrokrpvt;

#LoadingCategory
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/categories.csv'
into table categories
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingCustomer
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
into table customers
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingEmployees
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employees.csv'
into table employees
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingEmployeeTerritories
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employee-territories.csv'
into table employeeterritories
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingOrderDetails
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order-details.csv'
into table orderdetails
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingOrders
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
into table orders
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#loadingProducts
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
into table products
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#loadingRegion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/regions.csv'
into table region
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingShippers
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shippers.csv'
into table shippers
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingSuppliers
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suppliers.csv'
into table suppliers
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;

#LoadingTerritories
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/territories.csv'
into table territories
fields terminated by ',' 
lines terminated by '\n'
ignore 1 rows;