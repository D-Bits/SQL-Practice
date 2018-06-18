
/*TRIGGERS*/

USE MetroAlt;

SELECT *
FROM BusScheduleAssignment

/*Start trigger*/
GO
CREATE TRIGGER tr_Overtime 
ON [dbo].[BusScheduleAssignment]
FOR INSERT 
AS 
DECLARE @EmployeeKey INT
DECLARE @Date Date
DECLARE @Count INT
SELECT @EmployeeKey= EmployeeKey, @Date= BusScheduleAssignmentDate 
FROM Inserted 
SELECT @count=COUNT(EmployeeKey)
FROM BusScheduleAssignment
WHERE [BusScheduleAssignmentDate]=@Date AND EmployeeKey = @EmployeeKey
IF @Count > 1
BEGIN 
	IF NOT EXISTS 
		(SELECT Name 
		 FROM sys.tables
		 WHERE Name = 'Overtime')
		 BEGIN
			CREATE TABLE Overtime (
			BusScheduleAssignmentKey INT, 
			BusDriverShiftKey INT, 
			EmployeeKey INT, 
			BusRouteKey INT, 
			BusScheduleAssignmentDate DATE, 
			BusKey INT
			)
		 END

		 INSERT INTO Overtime (BusScheduleAssignmentKey, BusDriverShiftKey, EmployeeKey, BusRouteKey, BusScheduleAssignmentDate, BusKey)
		 SELECT BusScheduleAssignmentKey, BusDriverShiftKey, EmployeeKey, BusRouteKey, BusScheduleAssignmentDate, BusKey
		 FROM inserted
END