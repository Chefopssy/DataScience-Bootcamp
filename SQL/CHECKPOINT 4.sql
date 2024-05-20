
CREATE DATABASE CHECKPOINT4;
USE CHECKPOINT4;

CREATE TABLE CUSTOMERS(
		customer_id INT PRIMARY KEY,
		FirstName VARCHAR (30),
		LastName VARCHAR (30),
		Address VARCHAR (120),
)

CREATE TABLE PRODUCTS (
		product_id INT PRIMARY KEY,
		NAME VARCHAR (120),
		PRICE DECIMAL (20,2),
)

CREATE TABLE ORDERS (
		order_id INT PRIMARY KEY,
		customer_id	INT FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
		product_id INT FOREIGN KEY (product_id) REFERENCES Products (product_id),
		quantity INT,		
		Order_date DATE DEFAULT GETDATE(),
)