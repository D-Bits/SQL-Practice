
USE MetroAlt;

--Create a temp table to show how many stops each route has. the table should have fields for the route number and the number of stops. Insert into it from BusRouteStops and then select from the temp table. 
CREATE TABLE #RouteStops (
BusRouteStopScheduleKey INT
BusRouteStopKey INT
BusRouteStopTime TIME(7)
)

INSERT INTO #RouteStops
SELECT BusRouteStopScheduleKey, BusRouteStopKey, BusRouteStopTime
FROM BusRouteStopSchedule; 

--Do the same but using a global temp table. 
CREATE TABLE ##RouteStops (
BusRouteStopScheduleKey INT
BusRouteStopKey INT
BusRouteStopTime TIME(7)
)

INSERT INTO #RouteStops
SELECT BusRouteStopScheduleKey, BusRouteStopKey, BusRouteStopTime
FROM BusRouteStopSchedule; 

--Create a function to create an employee email address. Every employee Email follows the pattern of "firstName.lastName@metroalt.com" 
GO
CREATE FUNCTION fx_employeeemail
(@employeelastname NVARCHAR(255),
@employeefirstname NVARCHAR(255))

RETURNS NVARCHAR(255)
AS BEGIN
DECLARE @complete NVARCHAR(255)
	SET 
	@complete=@employeefirstname + '.' + @employeelastname + '@metroalt.com'
RETURN @complete
END

--Create a function to determine a two week pay check of an individual employee. 
SELECT EmployeeKey, EmployeeHourlyPayRate * 80 AS [Two Weeks Pay]
FROM EmployeePosition;

--Create a function to determine a hourly rate for a new employee. Take difference between top and bottom pay for the new employees position (say driver) and then subtract the difference from the maximum pay. (and yes this is very arbitrary). 
SELECT MAX(EmployeeHourlyPayRate) - MIN(EmployeeHourlyPayRate)
FROM EmployeePosition;



