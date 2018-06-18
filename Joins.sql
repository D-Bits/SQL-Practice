
/*Queries for week 3 Joins assignment*/

USE MetroAlt;

/*Create a cross join between employees and bus routes to show all possible combinations of routes and drivers 
(better use position to distinguish only drivers this involves a cross join and an inner join. I will accept either)*/
SELECT EmployeeKey, EmployeeLastName AS [Last Name], EmployeeFirstName [First Name], BusRouteKey
FROM Employee
CROSS JOIN BusRoute;

/*List all the bus type details for each bus assigned to bus barn 3 (INCOMPLETE)*/
SELECT Bustype.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((BusBarn
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

/*What is the total cost of all the busses at bus barn 3*/
SELECT SUM(BustypePurchasePrice) AS [Bus Cost]
FROM Bustype
INNER JOIN Bus ON Bustype.BusTypeKey = Bus.BustypeKey
WHERE BusBarnkey = 3;

/*What is the total cost per type of bus at bus barn 3*/
SELECT BustypePurchasePrice AS [Bus Cost], Bustype.BusTypeKey
FROM Bustype
INNER JOIN Bus ON Bustype.BusTypeKey = Bus.BustypeKey
WHERE BusBarnkey = 3;

/*List the last name, first name, email, position name and hourly pay for each employee*/
SELECT EmployeeLastName, EmployeeFirstName, EmployeeEmail, PositionName, EmployeeHourlyPayRate
FROM Employee
INNER JOIN EmployeePosition ON Employee.EmployeeKey = EmployeePosition.EmployeeKey
INNER JOIN Position ON EmployeePosition.PositionKey = Position.PositionKey;

/*List the bus driver’s last name  the shift times, the bus number (key)  and the bus type for each bus on route 43*/
SELECT EmployeeLastName, BusScheduleAssignment.BusRouteKey, BusDriverShiftStartTime, BusDriverShiftStopTime
FROM Employee
INNER JOIN Employee ON Employee.EmployeeKey = BusScheduleAssignment.EmployeeKey
INNER JOIN BusScheduleAssignment ON BusScheduleAssignment.BusDriverShiftKey = BusDriverShift.BusDriverShiftKey
WHERE BusRouteKey = 43;

/*Return all the positions that no employee holds.*/
SELECT EmployeePosition.EmployeeKey, EmployeePosition.PositionKey, EmployeePosition.EmployeePositionDateAssigned
FROM EmployeePosition
INNER JOIN EmployeePosition ON EmployeePosition.PositionKey = Position.PositionKey;

/*Get the employee key, first name, last name, position key for every driver (position key=1) who has never been assigned to a shift. 
(This is hard it involves an inner join of several tables and then an outer join with BusscheduleAssignment.)*/
SELECT Employee.EmployeeKey, Employee.EmployeeFirstName, Employee.EmployeeLastName, EmployeePosition.PositionKey
FROM Employee
INNER JOIN EmployeePosition ON Employee.EmployeeKey = EmployeePosition.EmployeeKey
LEFT OUTER JOIN BusScheduleAssignment
ON Employee.EmployeeKey = BusScheduleAssignment.EmployeeKey
WHERE PositionKey = 1
AND BusScheduleAssignment.EmployeeKey IS NULL;
