CREATE DATABASE CompanyDB;
GO

USE CompanyDB;
GO

-- Step 2: Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);
GO

-- Step 3: Create the Employees table with auto-generated EmployeeID
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

-- Step 4: Insert sample departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
(205, 'Finance'),
(206, 'HR'),
(207, 'Sales'),
(208, 'Marketing'),
(209, 'IT');
GO

-- Step 5: Insert sample employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES
('Nikhil', 'Raman', 205, 90000.00),
('Priya', 'Sharma', 209, 60000.00),
('Amit', 'Verma', 208, 48000.00),
('Anita', 'Joseph', 206, 53000.00),
('Vikas', 'Mehta', 207, 69000.00);
GO
-- Step 6: check the tables
Select* FROM Departments, Employees;
-- Step 7: Retrieve employee details with department names using JOIN
SELECT E.EmployeeID, E.FirstName, E.LastName,  D.DepartmentName,
    E.Salary
FROM Employees E
JOIN Departments D on E.DepartmentID = D.DepartmentID;
--Step 8: Skipping and fetching the rows using OFFSET and FETCH
SELECT EmployeeID, FirstName, Lastname, Salary FROM Employees Order By EmployeeID OFFSET 0 Rows FETCH Next 2 Rows ONLY;
--Step 9: Create VIEW by whwre filter
CREATE VIEW HighSalaryEmployees As
SELECT  EmployeeID, FirstName, Lastname, Salary FROM Employees Where Salary > 50000;
--Step 10: Create a function to calculate annual salary
CREATE FUNCTION dbo.fn_GetAnnualSalary (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 12;
END;
GO
SELECT 
    FirstName,
    Salary,
    dbo.fn_GetAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
--Step 11: Create stored procedure to avoid rewritting the query and saves time
CREATE PROCEDURE sp_InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN

    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
    VALUES ('@FirstName', '@LastName', @DepartmentID, @Salary);
END;
DROP PROCEDURE IF EXISTS sp_InsertEmployee;
GO
CREATE PROCEDURE sp_InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary);
END;
GO
EXEC sp_InsertEmployee 'Sneha', 'Kumar', 206, 75000.00;
--Step 12: Create a role to allow read-only access to employee and department data
CREATE ROLE DATAVIEWER;
GRANT SELECT ON Employees TO DATAVIEWER;
GRANT SELECT ON Departments TO DATAVIEWER;
REVOKE SELECT ON Employees TO DATAVIEWER;
GRANT SELECT ON Employees TO DATAVIEWER;
-- Step 13: Add a new user and assign to DataViewer role
CREATE LOGIN Sneha WITH PASSWORD = 'StrongPassword@123';
USE CompanyDB;
CREATE USER Sneha FOR LOGIN Sneha;
ALTER ROLE DataViewer ADD MEMBER Sneha;







