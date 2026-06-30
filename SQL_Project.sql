create database SupermarketProject;
use SupermarketProject;

-- customer table 
create table customers (
               customer_id int auto_increment primary key,
               name varchar(100) not null,
               phone int(10) unique,
               city varchar(30)
               );
               
-- categories Table              
create table Categories (
               Category_ID int auto_increment primary key,
               Category_Name varchar(100) not null
               );
   
-- Products Table
create table Products (
			  Product_ID int auto_increment primary key,
              Product_Name varchar(100) not null,
              Category_ID int,
              Price decimal(10,2) not null,
              Stock int default 0,
			  foreign key(Category_ID) references Categories(Category_ID)
              );
              
              
-- Employees Table
create table Employees (
             Employee_ID int auto_increment primary key,
			 Name varchar(100) not null,
             Role varchar(50),
			 Email varchar(100) unique,
             Phone varchar(15) unique,
             Salary decimal(10,2)
             );
             
 --  Orders Table
create table Orders (
             Order_ID int auto_increment primary key,
			 Customer_ID int,
			 Employee_ID int,
             Order_Date date,
             Total_Amount decimal(10,2),
             foreign key (Customer_ID) references Customers(Customer_ID),
             foreign key (Employee_ID) references Employees(Employee_ID)
             );
             
    
--  Order_Details Table
create table Order_Details (
             Order_Detail_ID int auto_increment primary key,
             Order_ID int,
             Product_ID int,
			 Quantity int not null,
             Subtotal decimal(10,2),
             foreign key (Order_ID) references Orders(Order_ID),
             foreign key (Product_ID) references Products(Product_ID)
             );       
	
alter table customers modify phone varchar(10);   
insert into Customers (name, phone, city) values
('Amit Sharma', 9876543210, 'Vashi'),
('Neha Patel', 9123456780, 'Nerul'),
('Rahul Verma',9988776655, 'Belapur'),
('Sneha Iyer',9012345678, 'Vashi'),
('Rohit Mehta',9090909090, 'Panvel'),
('Pooja Singh',9871234567, 'Belapur'),
('Karan Shah',9765432109, 'Seawoods'),
('Neha Desai',9654321098, 'Nerul'),
('Vikas Nair',9543210987, 'Sanpada'),
('Priya Kapoor',9432109876, 'Belapur'),
('Sanjay Gupta', 9321456780, 'Vashi'),
('Pooja Joshi', 9213456789, 'Nerul'),
('Karan Reddy', 9898989898, 'Belapur'),
('Kavita Sharma', 9789012345, 'Seawoods'),
('Deepak Yadav', 9678901234, 'Panvel'),
('Karan Agarwal', 9567890123, 'Airoli'),
('Manish Jain', 9456789012, 'Belapur'),
('Nikita Singh', 9345678901, 'Panvel'),
('Suresh Pillai', 9234567890, 'Sanpada'),
('Pallavi Deshmukh', 9123987654, 'Panvel');

select * from customers; 

insert into categories (category_name) values
 ('Beverages'),
 ('Snacks'),
 ('Dairy'),
 ('Fruits'),
 ('Vegetable');

select * from categories;

insert into Products (Product_Name, Category_ID, Price, Stock) VALUES
-- Beverages (1)
('Coca Cola', 1, 40.00, 100),
('Pepsi', 1, 20.00, 120),
('Frooti', 1, 10.00, 50),

-- Snacks (2)
('Lays Chips', 2, 20.00, 150),
('Kurkure', 2, 30.00, 130),
('Bingo', 2, 10.00, 150),

-- Dairy (3)
('Amul Milk', 3, 60.00, 80),
('Butter', 3, 120.00, 50),

-- Fruits (4)
('Apple', 4, 150.00, 60),
('Mango', 4, 40.00, 90),
('Banana', 4, 30.00, 30),

-- Vegetable (5)
('Tomato', 5, 40.00, 80),
('Bhindi', 5, 35.00, 90);

select * from products;

insert into Employees (Name, Role, Email, Phone, Salary) values
-- Cashier (2 employees)
('Rakesh Kumar', 'Cashier', 'rakesh.kumar@gmail.com', '9876543211', 20000.00),
('Pooja Mehta', 'Cashier', 'pooja.mehta@gmail.com', '9123456781', 21000.00),

-- Sales Executive (3 employees)
('Amit Patel', 'Sales Executive', 'amit.patel@gmail.com', '9988776656', 18000.00),
('Neha Singh', 'Sales Executive', 'neha.singh@gmail.com', '9012345679', 19000.00),
('Karan Shah', 'Sales Executive', 'karan.shah@gmail.com', '9765432101', 18500.00),

-- Inventory Manager (2 employees)
('Vikas Nair', 'Inventory Manager', 'vikas.nair@gmail.com', '9543210988', 25000.00),
('Sneha Iyer', 'Inventory Manager', 'sneha.iyer@gmail.com', '9432109877', 24000.00),

-- Store Manager (1 employee)
('Priya Sharma', 'Store Manager', 'priya.sharma@gmail.com', '9898989899', 30000.00),

-- Store Assistant (1 employees)
('Manish Jain', 'Store Assistant', 'manish.jain@gmail.com', '9456789013', 17000.00);

select * from employees;

insert into Orders (Customer_ID, Employee_ID, Order_Date, Total_Amount) values
-- AUGUST
(1, 1, '2024-08-02', 80.00),
(2, 2, '2024-08-05', 120.00),
(3, 1, '2024-08-08', 60.00),
(4, 2, '2024-08-10', 150.00),
(5, 1, '2024-08-12', 90.00),
(6, 2, '2024-08-15', 200.00),
(7, 1, '2024-08-18', 75.00),

-- SEPTEMBER
(8, 2, '2024-09-02', 130.00),
(9, 1, '2024-09-05', 110.00),
(10, 2, '2024-09-08', 95.00),
(11, 1, '2024-09-12', 140.00),
(12, 2, '2024-09-15', 60.00),
(13, 1, '2024-09-18', 180.00),
(14, 2, '2024-09-20', 220.00),

-- OCTOBER
(15, 1, '2024-10-02', 100.00),
(16, 2, '2024-10-05', 85.00),
(17, 1, '2024-10-08', 160.00),
(18, 2, '2024-10-12', 70.00),
(19, 1, '2024-10-15', 190.00),
(20, 2, '2024-10-18', 210.00);

select * from orders;

INSERT INTO Order_Details (Order_ID, Product_ID, Quantity, Subtotal) VALUES
-- AUGUST
(1, 1, 2, 80.00),
(2, 2, 3, 60.00),
(3, 3, 2, 20.00),
(4, 4, 3, 60.00),
(5, 5, 3, 90.00),
(6, 6, 4, 40.00),
(7, 7, 1, 60.00),
-- SEPTEMBER
(8, 8, 2, 240.00),
(9, 1, 3, 120.00),   -- Coca Cola 🔁
(10, 2, 2, 40.00),
(11, 3, 3, 30.00),
(12, 4, 2, 40.00),
(13, 5, 2, 60.00),
(14, 6, 3, 30.00),
-- OCTOBER
(15, 7, 2, 120.00),
(16, 8, 1, 120.00),
(17, 1, 4, 160.00),   -- Coca Cola
(18, 2, 2, 40.00),
(19, 3, 3, 30.00),
(20, 1, 3, 120.00);   -- Coca Cola 

select * from Order_Details;
	

