
USE MetroAlt;

--View for the total cost of buses by type
CREATE VIEW vw_BusTypeCost
AS
SELECT BusTypeKey, BusTypeDescription, SUM(BusTypePurchasePrice) AS [Purchase Cost]
FROM BusType
GROUP BY BusTypeKey, BusTypeDescription;

--View for total revenues per year
CREATE VIEW vw_TotalRevenue
AS
SELECT YEAR(BusScheduleAssignmentDate) [Year],
FORMAT(SUM(Riders * FareAmount), '$ #,##0.00') [TotalFares]
FROM BusScheduleAssignment [Assignment]
INNER JOIN Ridership ON Assignment.BusScheduleAssignmentKey=Ridership.BusScheduleAssigmentKey
INNER JOIN Fare ON Fare.FareKey=Ridership.FareKey
GROUP BY YEAR(BusScheduleAssignmentDate); 

--View for total number of employees by position
CREATE VIEW vw_EmployeesbyPosition
AS
SELECT COUNT(EmployeePosition.EmployeeKey) AS [Total Employees], EmployeePosition.PositionKey, Position.PositionName
FROM EmployeePosition
INNER JOIN Position ON EmployeePosition.PositionKey=Position.PositionKey
GROUP BY PositionName, EmployeePosition.PositionKey;

--How many buses are assigned to a barn