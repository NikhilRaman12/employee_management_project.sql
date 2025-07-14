# Employee Management System – SQL Server Project

This is a structured SQL Server project developed using Azure Data Studio to simulate an Employee Management System. It demonstrates the design and implementation of a relational database with practical business logic, queries, views, stored procedures, and user permissions.

## Project Objective

To build a real-world employee management database that manages employee information, departmental structure, and enables secure access and operations through SQL logic.

## Features

- Relational schema with primary and foreign key constraints
- Auto-incremented Employee IDs using `IDENTITY`
- JOIN operations to display department names with employees
- Pagination using `OFFSET` and `FETCH`
- View to filter high-salaried employees
- Scalar function to calculate annual salary
- Stored procedure to insert new employee records
- Role-based access control using SQL roles
- Creation and assignment of users to specific roles

## Implementation Steps

1. Created database `CompanyDB` and defined two core tables: `Departments` and `Employees`
2. Established primary and foreign key relationships
3. Inserted sample data into both tables
4. Queried employee data with department names using JOIN
5. Implemented pagination with OFFSET and FETCH
6. Created a view to display high-salaried employees
7. Developed a scalar function to calculate annual salary
8. Wrote a stored procedure to insert new employees
9. Created a database role and granted read-only permissions
10. Added a user and assigned them to the custom role

## Technologies Used

- Microsoft SQL Server
- Azure Data Studio
- SQL (DDL, DML, Views, Functions, Stored Procedures, DCL)

## Files

- `employee_management_project.sql`: Full script including table creation, inserts, queries, and security
- `README.md`: Project description and documentation

## Author

**Nikhil Raman**  
Data Analyst | SQL Developer | Manual + AI-Driven Analytics Specialist  
Focused on building structured data solutions that blend traditional SQL logic with modern data workflows.

🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/nikhilraman)
## License

This project is for learning and portfolio demonstration purposes.
