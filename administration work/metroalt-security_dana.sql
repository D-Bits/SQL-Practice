
--Create security schema 
CREATE SCHEMA ManagerSchema;

CREATE VIEW ManangerSchema.vw_Employees
AS
SELECT * 
FROM Employee;

--Create stored procedure for the manager inserting records into Employee
CREATE PROC usp_managerproc
@EmployeeLastName NVARCHAR(255),
@EmployeeFirstName NVARCHAR(255),
@EmployeeAddress NVARCHAR(255),
@EmployeeCity NVARCHAR(255),
@EmployeeZipCode NVARCHAR(11),
@EmployeePhone NVARCHAR(255),
@EmployeeEmail NVARCHAR(255),
@EmployeeHireDate DATE

AS

IF NOT EXISTS 
 (Select EmployeeKey From Employee
     Where EmployeeEmail=@EmployeeEmail
  And EmployeeLastName=@EmployeeLastName)

BEGIN --Should the employee not currently exist

DECLARE @seed INT = dbo.fx_GetSeed()
DECLARE @hash VARBINARY(500) = 
dbo.fx_hashPassword(@seed
, @EmployeePlainPassword)

BEGIN TRAN 
BEGIN TRY 

INSERT INTO Employees(
EmployeeLastName, EmployeeFirstName, EmployeeAddress, EmployeeCity, EmployeeZipCode, EmployeePhone, EmployeeEmail, EmployeeHireDate)
VALUES (@EmployeeLastName, @EmployeeFirstName, @EmployeeAddress, @EmployeeCity, @EmployeeZipCode, @EmployeePhone, @EmployeeEmail, @EmployeeHireDate);

Set @EmployeeKey = IDENT_CURRENT('Employee')

END TRAN

END TRY 

--Insert into EmployeePosition
BEGIN 

INSERT INTO EmployeePosition
(EmployeeHourlyPayRate, EmployeePositionDateAssigned)
VALUES (@EmployeeHourlyPayRate, @EmployeePositionDateAssigned);

--Create login for mechanic Elizabeth Adams
CREATE LOGIN ElizabethAdams 
WITH PASSWORD = 'p@ssw0rd1'

--Login for driver Tammy Fink
CREATE LOGIN TammyFink
WITH PASSWORD = 'p@ssw0rd1';

--Create login for manager Vicki Martin
CREATE LOGIN VickiMartin
WITH PASSWORD='p@ssw0rd1';