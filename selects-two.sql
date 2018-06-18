/*SQL queries for the selects-two assignment*/

USE MetroAlt;

/*List the years in which employees were hired, sort by year and then last name.*/
SELECT EmployeeHireDate, EmployeeLastName
FROM Employee
ORDER BY Year(EmployeeHireDate), EmployeeLastName;

/*What is the difference in Months between the first employee hired and the last one.*/
SELECT DATEDIFF (MONTH, MAX(EmployeeHireDate), MIN(EmployeeHireDate))
FROM Employee;

/*Output the employee phone number so it looks like (206)555-1234.*/
SELECT FORMAT(CAST(EmployeePhone AS BIGINT), '(000)-000-0000') AS Phone
FROM Employee;

/*Output the employee hourly wage so it looks like $45.00 (EmployeePosition).*/
SELECT FORMAT(CAST(EmployeeHourlyPayRate AS MONEY), '$45.00') AS Pay Rate
FROM EmployeePosition;

/*List only the employees who were hired between 2013 and 2015.*/
SELECT *
FROM Employee;
WHERE EmployeeHireDate BETWEEN 1/1/2013 and 1/1/2015; 

/*Output the position, the hourly wage and the hourly wage multiplied by 40 to see what a weekly wage might look like.*/
SELECT Position, EmployeeHourlyPayRate, EmployeeHourlyPayRate * 40
FROM EmployeePosition;

/*What is the highest hourly pay rate (EmployeePosition)?*/
SELECT TOP 1 EmployeeHourlyPayRate
FROM EmployeePosition;

/*What is the lowest hourly pay rate?*/

/*What is the average hourly pay rate?*/
SELECT AVG EmployeeHourlyPayRate
FROM Employee;
/*Average pay rate is 39.898000*/

/*What is the average pay rate by position?*/
SELECT AVG(EmployeeHourlyPayRate) AS AveragePayRate, PositionKey
FROM EmployeePosition;

/*Provide a count of how many employees were hired each year and each month of the year.*/
SELECT COUNT(EmployeeKey) AS [Employee Count], YEAR(EmployeeHireDate) AS [Year Hired]
FROM Employee
GROUP BY YEAR(EmployeeHireDate);

/*Do the query 11 again but with a case structure to output the months as words.*/
SELECT COUNT(EmployeeKey) AS [Employee Count], EmployeeHireDate AS [Year Hired],
CASE MONTH(EmployeeHireDate)
WHEN 1 THEN 'January'
WHEN 2 THEN 'February'
WHEN 3 THEN 'March'
WHEN 4 THEN 'April'
WHEN 5 THEN 'May'
WHEN 6 THEN 'June'
WHEN 7 THEN 'July'
WHEN 8 THEN 'August'
WHEN 9 THEN 'September'
WHEN 10 THEN 'October'
WHEN 11 THEN 'November'
WHEN 12 THEN 'December'
END AS [Month]
FROM Employee
GROUP BY YEAR(EmployeeHireDate);

/*Return which positions average more than $50 an hour.*/
SELECT AVG(EmployeeHourlyPayRate) AS [Average Pay], PositionKey
FROM EmployeePosition
GROUP BY PositionKey
HAVING AVG(EmployeeHourlyPayRate) > 50;

/*List the total number of riders on Metroalt busses (RiderShip).*/
SELECT COUNT(Riders) AS [Total Riders]
FROM Ridership;

/*List all the tables in the metroAlt databases (system views).*/
SELECT NAME
FROM Sys.Tables;

/*List all the databases on server.*/
SELECT NAME
FROM Sys.Databases;