
USE master;

--Create the snapshot
CREATE DATABASE MA_Snapshot
ON (NAME='MetroAlt',
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC224_6\MSSQL\DATA\MetroAlt.ds')
AS
SNAPSHOT OF MetroAlt;

--Add new record
USE MetroAlt;

INSERT INTO Employee(EmployeeLastName, EmployeeFirstName, EmployeeAddress, EmployeeCity, EmployeeZipCode, EmployeePhone, EmployeeEmail, EmployeeHireDate)
VALUES ('Doe', 'Jane', '4321 Fake St NW', 'Seattle', '98106', '2067191893', 'doe.jane@gmail.com', '6-22-14');

--Update record
USE MA_Snapshot;

SELECT *
FROM Employee

UPDATE Employee
SET EmployeeLastName='Moron'
WHERE EmployeeKey=1;

--Query snapshot
SELECT *
FROM MA_Snapshot;

/*
* The snapshot keeps track of values by querying the table that it is based off of
*/
