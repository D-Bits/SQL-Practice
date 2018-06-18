
USE MetroAlt; 

/*Create a derived table that returns the position name as position and count of employees 
at that position. (I know that this can be done as a simple join, but do it in the format of a 
derived table. There still will be a join in the subquery portion).*/

SELECT PositionName, EmployeeCount
FROM
(SELECT PositionName, COUNT(EmployeeKey) AS EmployeeCount
FROM EmployeePosition 
INNER JOIN Position ON EmployeePosition.PositionKey=Position.PositionKey
GROUP BY PositionName) AS TotalEmployee;

/*Create a derived table that returns a column HireYear and the count of employees who were hired that year. (Same comment as above).*/
SELECT HireYear, PositionKey, EmployeeCount
FROM 
(SELECT YEAR(EmployeeHireDate) AS HireYear, PositionKey, COUNT(EmployeePosition.EmployeeKey) AS EmployeeCount
FROM Employee 
INNER JOIN EmployeePosition ON Employee.EmployeeKey=EmployeePosition.EmployeeKey
GROUP BY YEAR(EmployeeHireDate), PositionKey) AS HireYear;

/*Redo problem 1 as a Common Table Expression (CTE).*/
WITH TotalEmployee AS (

SELECT PositionName, COUNT(EmployeeKey) AS EmployeeCount
FROM EmployeePosition 
INNER JOIN Position ON EmployeePosition.PositionKey=Position.PositionKey
GROUP BY PositionName)

SELECT PositionName, EmployeeCount
FROM TotalEmployee;

/*Redo problem 2 as a CTE.*/
WITH YearHired AS (

SELECT YEAR(EmployeeHireDate) AS HireYear, PositionKey, COUNT(EmployeePosition.EmployeeKey) AS EmployeeCount
FROM Employee 
INNER JOIN EmployeePosition ON Employee.EmployeeKey=EmployeePosition.EmployeeKey
GROUP BY YEAR(EmployeeHireDate), PositionKey)

SELECT HireYear, PositionKey, EmployeeCount
FROM YearHired;

/*Create a CTE that takes a variable argument called @BusBarn and returns the count of busses grouped 
by the description of that bus type at a particular Bus barn. Set @BusBarn to 3.*/

DECLARE @BusBarn INT
	SET @BusBarn ='3'; 

WITH BusDescription AS
(
	SELECT BusBarnKey, BusBarnAddress, BusBarnCity, BusBarnDescription AS Descriptions
	FROM BusBarn AS BB
	INNER JOIN Bus AS B ON B.BusBarnKey = BB.BusBarnKey
	WHERE BusDescription=@BusBarn) 

SELECT *
FROM BusDescription;

/*Create a View of Employees for Human Resources it should contain all the information in the 
Employee table plus their position and hourly pay rate*/

CREATE VIEW vw_HRemployees AS
	SELECT Employee.EmployeeKey, EmployeeLastName, EmployeeFirstName, EmployeeAddress, EmployeeCity, EmployeeZipCode, EmployeePhone, EmployeeEmail, EmployeeHireDate, EmployeeHourlyPayRate
	FROM dbo.Employee
	INNER JOIN dbo.EmployeePosition ON Employee.EmployeeKey = EmployeePosition.EmployeeKey;

/*Alter the view in 6 to bind the SCHEMA*/
CREATE VIEW vw_HRemployees WITH SCHEMABINDING AS
	SELECT Employee.EmployeeKey, EmployeeLastName, EmployeeFirstName, EmployeeAddress, EmployeeCity, EmployeeZipCode, EmployeePhone, EmployeeEmail, EmployeeHireDate, EmployeeHourlyPayRate
	FROM dbo.Employee
	INNER JOIN dbo.EmployeePosition ON Employee.EmployeeKey = EmployeePosition.EmployeeKey;

/*Create a view of the Bus Schedule assignment that returns the Shift times, The Employee first 
and last name, the bus route (key) and the Bus (key). Use the view to list the shifts for Neil 
Pangle in October of 2014*/

GO
CREATE VIEW vw_NeilPangleOct14
AS SELECT EmployeeFirstName, EmployeeLastName, BusRouteKey, BusKey
FROM Employee
INNER JOIN BusScheduleAssignment ON Employee.EmployeeKey = BusScheduleAssignment.EmployeeKey;

/*Create a table valued function that takes a parameter of city and returns all the employees who live in that city*/
GO
CREATE FUNCTION fx_KentEmployees(@city NVARCHAR(255))
RETURNS TABLE 
AS
RETURN 
(
SELECT EmployeeCity
FROM Employee
WHERE EmployeeCity='Kent'
);
