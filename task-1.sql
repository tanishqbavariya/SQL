create table employee_details(
EmployeeID Serial,
FirstName VARCHAR(50) not null,
LastName VARCHAR(50) not null, 
Email VARCHAR(100) unique, 
PhoneNumber VARCHAR(15) not null unique, 
HireDate DATE,
Salary DECIMAL(10,2), 
DepartmentID Integer not null,
IsActive BOOLEAN,
JobTitle VARCHAR(100)
)

--------------------------------------------------------------------------------------------------------------------------------------------------

insert into employee_details
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
values
('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', '2023-06-15', 45000.00, 101, TRUE, 'Software Developer');

insert into employee_details
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
values
('Anjali', 'Patil', 'anjali.patil@gmail.com', '9876543211', '2022-11-10', 52000.00, 102, TRUE, 'HR Executive');

insert into employee_details
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
values
('Amit', 'Verma', 'amit.verma@gmail.com', '9876543212', '2021-03-25', 60000.00, 103, TRUE, 'Project Manager');

insert into employee_details
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
values
('Neha', 'Singh', 'neha.singh@gmail.com', '9876543213', '2024-01-05', 38000.00, 101, TRUE, 'Junior Developer');

insert into employee_details
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
values
('Suresh', 'Kumar', 'suresh.kumar@gmail.com', '9876543214', '2020-08-18', 70000.00, 104, FALSE, 'Senior Analyst');

--------------------------------------------------------------------------------------------------------------------------------------------------

update employee_details set departmentid = 0 where isactive = 'false'

--------------------------------------------------------------------------------------------------------------------------------------------------

update employee_details set salary = salary * 1.08 where isactive = 'false' and departmentid = 0 and jobtitle in ('HR Manager', 'Financial Analyst', 'Business Analyst', 'Data Analyst')

--------------------------------------------------------------------------------------------------------------------------------------------------

select firstname as name, lastname as surname from employee_details where salary in (30000, 50000)

--------------------------------------------------------------------------------------------------------------------------------------------------

select firstname from employee_details where firstname like 'A%'

--------------------------------------------------------------------------------------------------------------------------------------------------

delete from employee_details where employeeid between 1 and 5 returning *

--------------------------------------------------------------------------------------------------------------------------------------------------

alter table employee_details rename to employee_database

--------------------------------------------------------------------------------------------------------------------------------------------------

alter table employee_database rename column firstname to Name

--------------------------------------------------------------------------------------------------------------------------------------------------

alter table employee_database rename column lastname to Surname

--------------------------------------------------------------------------------------------------------------------------------------------------

alter table employee_database add column State VARCHAR(50) not null default 'India';

--------------------------------------------------------------------------------------------------------------------------------------------------

update employee_database
set state = 'india'
where isactive = true

--------------------------------------------------------------------------------------------------------------------------------------------------

update employee_database
set state = 'USA'
where isactive = false

--------------------------------------------------------------------------------------------------------------------------------------------------

















