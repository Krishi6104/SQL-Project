# 🛒 Supermarket Management System using SQL

## Project Overview

The **Supermarket Management System** is a database project developed using **SQL** to manage daily supermarket operations efficiently. The system helps store and organize information related to customers, products, employees, categories, orders, and order details.

The main purpose of this project is to reduce manual work, maintain proper records, and improve management of supermarket transactions.

---

## Problem Statement

In many supermarkets, managing customer purchases, product stock, employee details, and order records manually can lead to errors and inefficient operations.

This project solves that problem by building a structured relational database system that:

* Stores customer details
* Manages product inventory
* Tracks orders placed by customers
* Stores employee information
* Maintains order transaction records
* Helps generate reports for business decisions

---

## Objectives of the Project

The objectives of this project are:

* To design a database for supermarket management
* To maintain customer information securely
* To store product details with category and stock quantity
* To track customer orders and purchase history
* To maintain employee records
* To create relationships between multiple database tables using foreign keys

---

## Database Design

The project consists of **6 main tables**.

### 1. Customers Table

Stores customer information.

```sql
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(10) UNIQUE,
    City VARCHAR(30)
);
```

Fields:

* Customer_ID → Unique customer identification
* Name → Customer name
* Phone → Contact number
* City → Customer city

---

### 2. Categories Table

Stores product categories.

```sql
CREATE TABLE Categories (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL
);
```

Examples:

* Beverages
* Snacks
* Dairy
* Fruits
* Vegetable

---

### 3. Products Table

Stores product inventory information.

```sql
CREATE TABLE Products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category_ID INT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    FOREIGN KEY(Category_ID) REFERENCES Categories(Category_ID)
);
```

Purpose:

* Stores available products
* Maintains stock quantity
* Links products with category

---

### 4. Employees Table

Stores supermarket employee details.

```sql
CREATE TABLE Employees (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    Salary DECIMAL(10,2)
);
```

Roles:

* Cashier
* Sales Executive
* Inventory Manager
* Store Manager
* Store Assistant

---

### 5. Orders Table

Stores customer purchase orders.

```sql
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Employee_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);
```

Purpose:

* Track customer purchases
* Store order amount
* Identify employee handling order

---

### 6. Order Details Table

Stores detailed information about purchased products.

```sql
CREATE TABLE Order_Details (
    Order_Detail_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
```

Purpose:

* Stores products inside each order
* Tracks quantity purchased
* Calculates subtotal

---

## Entity Relationship Structure

The relationship between tables is:

Customers → Orders
Employees → Orders
Orders → Order_Details
Products → Order_Details
Categories → Products

This creates a proper relational database system.

---

## Sample Data Added

The project contains sample data:

* 20 Customers
* 5 Categories
* 13 Products
* 9 Employees
* 20 Orders
* 20 Order Details

This makes the project realistic and suitable for testing.

---

## SQL Operations Performed

### Insert Operations

Used INSERT statements to add records.

```sql
INSERT INTO Customers (Name, Phone, City)
VALUES ('Amit Sharma',9876543210,'Vashi');
```

---

### Select Queries

Display stored data.

```sql
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Employees;
```

---

## Example Analysis Queries

### 1. Display all customers

```sql
SELECT * FROM Customers;
```

---

### 2. Show all products with category

```sql
SELECT p.Product_Name, c.Category_Name, p.Price
FROM Products p
JOIN Categories c
ON p.Category_ID = c.Category_ID;
```

---

### 3. Find total sales

```sql
SELECT SUM(Total_Amount) AS Total_Sales
FROM Orders;
```

---

### 4. Find top selling product

```sql
SELECT Product_ID, SUM(Quantity) AS Total_Sold
FROM Order_Details
GROUP BY Product_ID
ORDER BY Total_Sold DESC;
```

---

### 5. Show employee handling orders

```sql
SELECT e.Name, COUNT(o.Order_ID) AS Orders_Handled
FROM Employees e
JOIN Orders o
ON e.Employee_ID = o.Employee_ID
GROUP BY e.Name;
```

---

## Case Study Analysis

This project simulates how a real supermarket database works.

Example workflow:

1. Customer enters supermarket
2. Customer selects products
3. Cashier processes order
4. Order stored in Orders table
5. Purchased products stored in Order_Details
6. Product stock is monitored
7. Employees are assigned responsibilities
8. Sales records are maintained for future reporting

The database ensures smooth management of supermarket operations.

---

## Technologies Used

* SQL
* MySQL Database
* Relational Database Design
* Primary Keys
* Foreign Keys
* CRUD Operations
* Joins
* Aggregate Functions

---

## Learning Outcomes

Through this project I learned:

* Database schema design
* Table creation using SQL
* Primary key and foreign key relationships
* Data insertion and retrieval
* SQL joins
* Aggregate functions
* Query optimization
* Real world database management system design

---

## Conclusion

The Supermarket Management System project successfully demonstrates how SQL can be used to manage business operations in a supermarket.

It provides an efficient way to manage customers, employees, products, categories, and order transactions while maintaining proper relationships between multiple tables.

This project helped in understanding real world implementation of Database Management Systems and practical SQL usage.

---

## Author

Developed as an academic SQL project for learning Database Management System concepts.

