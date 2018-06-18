
/*SQL for the Subqueries assignment*/


/*This involves joining tables, then using a subquery. Return the employee key, last name and first name, position name 
and hourly rate for those employees receiving the maximum pay rate.*/
SELECT Employee.EmployeeKey, EmployeeLastName, EmployeeFirstName, EmployeeHourlyPayRate, PositionName
FROM EmployeePosition 
INNER JOIN Employee ON Employee.EmployeeKey=EmployeePosition.EmployeeKey
INNER JOIN Position ON Position.PositionKey=EmployeePosition.PositionKey
WHERE EmployeeHourlyPayRate=(SELECT MAX(EmployeeHourlyPayRate)FROM EmployeePosition);

/*Use only subqueries to do this. Return the key, last name and first name of every employee who has the position name “manager.”*/
SELECT EmployeeKey, EmployeeLastName, EmployeeFirstName
FROM Employee
WHERE EmployeeKey IN(SELECT EmployeeKey FROM EmployeePosition WHERE PositionKey IN (SELECT PositionKey FROM Position WHERE PositionName='Manager')); 

/*This is very difficult. It combines regular aggregate functions, a scalar function, a cast, subqueries and a join. But it produces a useful result. 
The results should look like this: User Ridership totals for the numbers.

The Total  is the grand total for all the years. The Percent is Annual Total / Grand Total * 100*/

SELECT YEAR(EmployeePositionDateAssigned) [Year],
MONTH(EmployeePositionDateAssigned)[Month],
Position.PositionName, 
SUM(EmployeeHourlyPayRate) AS Total,
(SELECT SUM(EmployeeHourlyPayRate) FROM EmployeePosition) AS GrandTotal,
SUM(EmployeeHourlyPayRate) / 
(SELECT SUM(EmployeeHourlyPayRate) FROM EmployeePosition) * 100 AS [Percent]
FROM EmployeePosition
INNER JOIN Position ON EmployeePosition.PositionKey=Position.PositionKey
GROUP BY YEAR(EmployeePositionDateAssigned), MONTH(EmployeePositionDateAssigned), PositionName;

/*Create a new table called EmployeeZ. It should have the following structure:
EmployeeKey int,
EmployeeLastName nvarchar(255),
EmployeeFirstName nvarchar(255),
EmployeeEmail Nvarchar(255)

Use an insert with a subquery to copy all the employees from the employee table whose last name starts with “Z.”*/

CREATE TABLE EmployeeZ
EmployeeKey INT,
EmployeeLastName NVARCHAR(255),
EmployeeFirstName NVARCHAR(255),
EmployeeEmail NVARCHAR(255);

/*This is a correlated subquery. Return the position key, the employee key and the hourly pay rate for those 
employees who are receiving the highest pay in their positions. Order it by position key.*/
SELECT Position.PositionKey, Position.EmployeeKey, EmployeeHourlyPayRate
FROM EmployeePosition
WHERE EmployeeHourlyPayRate =
	(SELECT MAX(EmployeeHourlyPayRate)
	FROM EmployeePosition
ORDER BY PositionKey ASC);