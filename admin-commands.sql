
/*Administrative Commands*/

USE MetroAlt;

--"Schema" could also mean ownership 

GO
CREATE SCHEMA ManagementSchema 
GO
CREATE VIEW ManagementSchema.EmployeeView
AS 
SELECT *
FROM Employee;

GO
CREATE VIEW ManagementSchema.BusSchedule
AS
SELECT *
FROM BusScheduleAssignment
GO 

/*Create a role*/ 
CREATE ROLE ManagementRole
GO --Execute first

GRANT SELECT, INSERT, UPDATE 
ON SCHEMA::ManagementSchema TO ManagementRole

/*Create a login*/
CREATE LOGIN rsanchez 
WITH PASSWORD='p@ssword', 
DEFAULT_DATABASE = MetroAlt;

/*Create a user*/
CREATE USER msmith
FOR LOGIN rsanchez 

/*Add a user to a role w/ a stored procedure*/
EXEC sp_addrolemember ManagementRole, msmith;

--Create backup of database
BACKUP DATABASE MetroAlt 
TO DISK='C:\Backups\MetroAlt.bak'

--Restore database
RESTORE DATABASE MetroAlt 
FROM DISK='C:\Backups\MetroAlt.bak'

