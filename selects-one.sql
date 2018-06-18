/*Queries for the "Selects One" assignment*/

USE MetroAlt;

/*Return all the employees*/
SELECT *
FROM Employee

/*Return only the last name, first name and emails for all employees*/
SELECT EmployeeLastName, EmployeeFirstName, EmployeeEmail
FROM Employee;

/*Return only the last name, first name and emails for all employees*/
SELECT *
FROM Employee
ORDER BY EmployeeLastName ASC;

/*Sort by hire date*/
SELECT *
FROM Employee
ORDER BY EmployeeHireDate DESC;

/*List all the employees who live in Seattle*/
SELECT *
FROM Employee
WHERE EmployeeCity='Seattle';

/*List all the employees who do not live in Seattle*/
SELECT *
FROM Employee
WHERE NOT EmployeeCity='Seattle';

/*List the employees who do not have listed phones*/
SELECT *
FROM Employee
WHERE EmployeePhone IS NULL;

/*List only the employees who have phones*/
SELECT *
FROM Employee
WHERE NOT EmployeePhone IS NULL;

/*List all the employees whose last name starts with “c.”*/
SELECT *
FROM Employee
WHERE EmployeeLastName LIKE 'C%';

/*List all the employee keys and their wages sorted by pay from highest to lowest*/
SELECT EmployeeKey, EmployeeHourlyPayRate
FROM EmployeePosition
ORDER BY EmployeeHourlyPayRate DESC;

/*List all the employee keys and their hourly wage for those with PositionKey equal to 2 (mechanics)*/
SELECT EmployeeKey, EmployeeHourlyPayRate, PositionKey
FROM EmployeePosition
WHERE PositionKey='2';

/*Return the top 10 of the query for question 11*/
SELECT TOP 10 EmployeeKey, EmployeeHourlyPayRate, PositionKey
FROM EmployeePosition
WHERE PositionKey='2';

/*Using the same query offset by 20 and list 10*/
SELECT 10 EmployeeKey, EmployeeHourlyPayRate, PositionKey
FROM EmployeePosition
WHERE PositionKey='2'
ORDER BY PositionKey OFFSET 20 ROWS FETCH NEXT 10 ROWS;


/*Return the EmployeeKey and the busrouteKey but remove all duplicates*/ 
SELECT DISTINCT EmployeeKey, BusRouteKey
FROM BusScheduleAssignment;