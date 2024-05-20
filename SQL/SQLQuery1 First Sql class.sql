-- Created a database called CoHort_5
Create DATABASE CoHort_5;

-- making use of the created database 

Use CoHort_5
--creating an employee's table

Create TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR (50),
	LastName VARCHAR (50),
	Department VARCHAR (50),
	Salary DECIMAL (10,2), 
)
Select * FROM Employee

--Inserting data/rolls into the Employee's table
Insert Into Employee(EmployeeID, FirstName, LastName, Department, Salary)
Values	(1, 'John', 'Doe', 'HR', 55000.00),
		(2, 'Jane', 'Smith', 'Marketing', 60000.00),
		(3, 'Opemipo', 'Ajifola', 'AgbaCEO', 1000000.00),
		(4, 'Simi', 'Ajix', 'Security', 2000.00);

		-- Using Where statement, for retreiving data 

	Select * From Employee
	-- * represents the columns on the table 
	Where Department = 'HR'
	

		Select Lastname From Employee
	-- * represents the columns on the table 
	Where Department = 'HR'
	-- The Where can also be used with conditional logic (<,>,<=,=>or >=, !=,<>)
	Select * From Employee
	Where Salary > 30000;

	Select * From Employee
	Where Salary < 30000;

	-- Updating the columns in a table
	UPDATE Employee
	SET Salary = 25000.00
	Where EmployeeID = 2;
	SELECT * FROM Employee

	
	-- Insert into function to add an extra column into the table 

	INSERT INTO Employee(EmployeeID, FirstName, LastName, Department, Salary)
	values (5, 'Faith', 'Jones', 'Admin', 45000.00);

	--ALTER TABLE table_name RENAME COLUMN old_column_name to new_column_name;
	--ALTER TABLE Employee
	--Rename Column Emplyee To EmployeeID;
	--SP_RENAME 'Employee.EmployeeID', 'EmployeeeeeID'

	-- Learning how to delete a record from table 
	DELETE FROM Employee
	WHERE EmployeeID = 2;

	--joins

	CREATE TABLE Department (
	DepartmentID INT PRIMARY KEY, 
	DepartmentName VARCHAR (50)
	);
	SELECT * FROM Department;
-- Inserting records into the department table
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (1, 'HR'),
		(2, 'Marketing'),
		(3, 'Security'),
		(4, 'Admin'),
		(5, 'IT');
SELECT * FROM Employee
SELECT * FROM Department

-- Join ( THis command joins two tables together based on common column)
-- . (Used for referencing commonest in columns)
-- = (links the two commoness together)
SELECT * FROM Employee
INNER JOIN Department
ON Employee.Department = Department.DepartmentName

SELECT * FROM Department
RIGHT JOIN Employee -- interchange the column names for the right join
ON Employee.Department = Department.DepartmentName

SELECT * FROM Employee
LEFT JOIN Department
ON Employee.Department = Department.DepartmentName

INSERT INTO Employee(EmployeeID, FirstName, LastName, Department, Salary)
	values (6, 'Esther', 'Adeyeni', 'Anatomy', 45000.00),
			(7, 'Watchman', 'Oscar', 'Software', 100000);


-- Using FUll join
SELECT * FROM Department
FULL JOIN Employee
ON Employee.Department = Department.DepartmentName


--Aggregate functions: these functions summareise the  data in our table
-- SUM, COUNT, MIN, MAX, DISTINCT, GROUP BY, ORDER BY, AVERAGE (AVG)

SELECT AVG(SALARY) AS AVERAGE_SALARY
FROM Employee;

SELECT MIN(SALARY) AS MINIMUM_SALARY
FROM Employee

SELECT MAX(SALARY) AS MAXIMUM_SALARY
FROM Employee
SELECT MIN(FirstName) AS MINIMUM_FIRSTNAME
FROM Employee

SELECT COUNT(EmployeeID) AS Number_of_employees, SUM(Salary) AS Total_salary
FROM Employee

SELECT AVG (Salary) AS Average_HR
FROM Employee
Where Department ='HR';

SELECT * FROM house_pricing_dataset;
 SELECT MIN (DATE) AS Earliest_date, MAX (DATE) AS LATEST_DATE
 FROM house_pricing_dataset;

 SELECT * FROM house_pricing_dataset;

 -- Subqueries: IS A QUERY INSIDE ANOTHer querY 
 SELECT * from Employee
 WHERE Salary >
 (SELECT AVG(Salary) FROM Employee);

 -- constraint
 SELECT * FROM Employee;
 --creating customer table
 CREATE TABLE CUSTOMERS(
		customerid INT PRIMARY KEY,
		CustomerFirstName VARCHAR (100),
		CustomerLastName VARCHAR (100),
)
SELECT * FROM CUSTOMERS
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate Date,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
	)

	DROP TABLE Orders;
	Drop table CUSTOMERS;
--Unique constraints
CREATE TABLE Products(
	ProductID INT UNIQUE,
	ProductName VARCHAR (100),
);
-- Check constraint
CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	Age INT,
	Check (Age >=18),
) 
--NOT NULL: This constraint ensure that a column doesn't have a NULL column 

ALTER TABLE Orders
ALTER Column OrderID INT NOT NULL;

SP_HELP Orders

--the default constraint

ALTER TABLE Orders
ADD CONSTRAINT Order_Default 
DEFAULT GETDATE() For Orderdate;

SELECT * FROM Customers
SELECT * FROM Orders

INSERT INTO Customers(CustomerID, CustomerFirstName, CustomerLastName)
Values (1, 'Simi', 'Ajix'),
		(2, 'Ope', 'Ajifola'),
		(3, 'Faith', 'Owolabi')
INSERT INTO Orders(OrderID, CustomerID)
VALUES (001, 1)

CREATE TABLE Class_talkatives(
		student_ID INT,
		student_name VARCHAR(100),
		concentration_level INT,
		);
INSERT INTO Class_talkatives(student_ID, student_name, concentration_level)
VALUES (1, 'Simi Ajix', 0.001);

--adding a constraint to an already existing table
ALTER TABLE Class_talkatives
ADD CONSTRAINT student_ID PRIMARY KEY (student_ID);
--Added a not null constraint on the student_ID column first so it can accept the pry key cos pry key doesn't accept null value 
ALTER TABLE Class_talkatives
ALTER COLUMN Student_ID INT NOT NULL;



--Logical operators
--Example of the use of ADD operator
SELECT * FROM Employee
WHERE Salary >= 50000 AND Department = 'HR'

--Example of the OR operator
SELECT * FROM Products

INSERT INTO Products(ProductID, ProductName)
VALUES (1, 'LAPTOP'),
		(2, 'PHONES'),
		(3, 'AIRPODS'),
		(4, 'POUCHE'),
		(5, 'TELEVISION')

	
SELECT * FROM Employee
WHERE Salary >= 50000 OR Department = 'HR'
 
SELECT * FROM house_pricing_dataset
WHERE bedrooms > 1 AND city = 'KENT'


SELECT * FROM house_pricing_dataset
WHERE bedrooms = 1 AND city = 'SEATTLE' 


-- The NOT LOGIC OPERATOR
SELECT * FROM house_pricing_dataset
WHERE NOT city='SEATTLE'
--IN LOGIC OPERATOR IS USED WITH A BRACKET AND ON DATA ON THE SAME COLUMN
SELECT * FROM house_pricing_dataset
WHERE city IN('SEATTLE','KENT')

SELECT * FROM house_pricing_dataset
WHERE NOT city IN('SEATTLE','KENT')

--BETWEEN OPERATOR
SELECT * 
FROM house_pricing_dataset
WHERE price BETWEEN 250000 AND 500000 AND city IN ('SEATTLE', 'KENT')

--6'6/24
--THE LIKE OPERATOR
SELECT TOP (10) * FROM
house_pricing_dataset
WHERE street LIKE '%2';


SELECT TOP (10) * FROM
house_pricing_dataset
WHERE city LIKE '%S';
-- % IN FRONT BRINGS CHARACTER THAT ENDS WITH 'S' AND VISE VESAR


SELECT * FROM
house_pricing_dataset
WHERE NOT city LIKE 'S%';



-- CASE STATEMENT works inside the select statement 
SELECT price, street, YR_RENOVATED,
	CASE 
		WHEN PRICE > 7800 AND PRICE <= 15000 THEN 'AFFORDABLE'
		WHEN PRICE > 15000 AND PRICE <= 100000 THEN 'WORKING CLASS'
		WHEN PRICE > 100000 AND PRICE <= 800000 THEN 'RICH'
		WHEN PRICE > 800000 AND PRICE <= 2000000 THEN 'VERY RICH'
		WHEN PRICE > 2000000 AND PRICE <= 10000000 THEN 'BALLER'
		WHEN PRICE > 10000000 THEN 'WEALTHY'

	ELSE 'GET A JOB'
	END AS CLASS
	
	CASE
		WHEN 


 FROM house_pricing_dataset
 ORDER BY PRICE;
 -- ORDER BY 'THE COLMUN YOU WANT TO SELECT  
 -- DESC MEANS DESCENDING ORDER

 --ADVANCE USAGE OF THE CASE STATEMANT
 SELECT * FROM Employee;
 UPDATE Employee
 SET Salary=
	CASE 
		WHEN Department = 'HR' THEN		Salary *  1.1 
		WHEN Department = 'MARKETING' THEN Salary * 1.15
		WHEN Department = 'ADMIN' THEN  Salary * 2.3
		WHEN Department = 'SECURITY' THEN SALARY * 7.4
		ELSE Salary
	END;

-- GROUP BY 

-- GROUP BASED ON AGGREGATE FUNCTION LIKE MIN MAX SUM COUNT AVG
SELECT CITY, [view], AVG (price) AS AVG_PRICE
FROM house_pricing_dataset
WHERE price > 1000000
GROUP BY CITY, [view] 
ORDER BY AVG_PRICE;

--7/5/24
-- count the number of cities according to year renovated 
SELECT COUNT (*) AS TOTAL_count
 FROM house_pricing_dataset

 SELECT COUNT(PRICE) COUNT_OF_PRICE, COUNT (STREET) COUNT_OF_STREET
 FROM house_pricing_dataset
 
 SELECT TOP (10) * FROM house_pricing_dataset


 SELECT  ROUND (AVG(PRICE),2) AS AVERAGE_PRICE ,
	CASE 
		WHEN PRICE > 7800 AND PRICE <= 15000 THEN 'AFFORDABLE'
		WHEN PRICE > 15000 AND PRICE <= 100000 THEN 'WORKING CLASS'
		WHEN PRICE > 100000 AND PRICE <= 800000 THEN 'RICH'
		WHEN PRICE > 800000 AND PRICE <= 2000000 THEN 'VERY RICH'
		WHEN PRICE > 2000000 AND PRICE <= 10000000 THEN 'BALLER'
		WHEN PRICE > 10000000 THEN 'WEALTHY'

	ELSE 'GET A JOB'
	END AS CLASS
FROM house_pricing_dataset
	GROUP BY
		CASE 
		WHEN PRICE > 7800 AND PRICE <= 15000 THEN 'AFFORDABLE'
		WHEN PRICE > 15000 AND PRICE <= 100000 THEN 'WORKING CLASS'
		WHEN PRICE > 100000 AND PRICE <= 800000 THEN 'RICH'
		WHEN PRICE > 800000 AND PRICE <= 2000000 THEN 'VERY RICH'
		WHEN PRICE > 2000000 AND PRICE <= 10000000 THEN 'BALLER'
		WHEN PRICE > 10000000 THEN 'WEALTHY'
	ELSE 'GET A JOB'
	END;

--ALTER COLUMN
ALTER TABLE TABLE_NAME
ALTER COLUMN COLUMN_NAME INT; 



--SETS OPERATORS
SELECT * FROM CUSTOMERS
SELECT * FROM Products
SELECT * FROM ORDERS 

SELECT * FROM Employee
 SELECT * FROM Department


-- USING THE UNION FUNCTION
ALTER TABLE EMPLOYEE
DROP COLUMN DEPARTMENT
ALTER TABLE EMPLOYEE
DROP COLUMN Salary, LASTNAME

SELECT * FROM Employee
UNION 
SELECT * FROM Department

SELECT * FROM Employee
INTERSECT 
SELECT * FROM Department


