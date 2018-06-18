USE MetroAlt;

/*Create a Union between Person and PersonAddress in Community assist and Employee in MetroAlt. You will need to fully qualify the tables in the CommunityAssist part of the query:
CommunityAssist.dbo.Person etc.*/
SELECT Person.PersonKey, PersonLastName, PersonFirstName, PersonEmail
FROM Community_Assist.dbo.Person 
INNER JOIN Community_Assist.dbo.PersonAddress ON Person.PersonKey = PersonAddress.PersonKey

UNION

SELECT EmployeeKey, EmployeeLastName, EmployeeFirstName, EmployeeEmail
FROM MetroAlt.dbo.Employee; 

/*Do an intersect between the PersonAddress and Employee that returns the cities that are in both.*/
SELECT PersonAddressCity
FROM Community_Assist.dbo.PersonAddress

INTERSECT

SELECT EmployeeCity
FROM MetroAlt.dbo.Employee;

/*Do an except between PersonAddress and Employee that returns the cities that are not in both.*/
SELECT PersonAddressCity
FROM Community_Assist.dbo.PersonAddress

EXCEPT

SELECT EmployeeCity
FROM MetroAlt.dbo.Employee;

/*For this we will use the Data Tables we made in Assignment 1. Insert the following services into BusService: General Maintenance, Brake service, hydraulic maintenance, and Mechanical Repair. 
You can add descriptions if you like. Next add entries into the Maintenance table for busses 12 and 24. You can use today’s date. For the details on 12 add General Maintenance and Brake Service, for 24 just General Maintenance. 
You can use employees 60 and 69 they are both mechanics.*/
ALTER TABLE BusService
ADD GeneralMaintenance NVARCHAR(255), BrakeSerivce NVARCHAR(255), HydraulicMaintenance NVARCHAR(255), MechanicalRepair NVARCHAR(255);

INSERT INTO Maintenance(BusKey, MaintenceDate) 
VALUES ('12', GETDATE()), ('24', GETDATE());

INSERT INTO MaintenanceDetail(MaintenanceDetailNote)
VALUES ('General Maintenance and Brake Service'), ('General Maintenance');

/*Create a table that has the same structure as Employee, name it Drivers. Use the Select form of an insert to copy all the employees whose position is driver (1) into the new table.*/
CREATE TABLE Drivers (
EmployeeKey INT IDENTITY (1,1) PRIMARY KEY,
EmployeeLastName NVARCHAR(255) NOT NULL,
EmployeeFirstName NVARCHAR(255) NOT NULL,
EmployeeAddress NVARCHAR(255) NOT NULL,
EmployeeCity NVARCHAR(255) NOT NULL,
EmployeeZipCode INT NOT NULL,
EmployeePhone NVARCHAR(255),
EmployeeEmail NVARCHAR(255),
EmployeeHireDate DATE,
);

INSERT INTO Drivers(EmployeeKey, EmployeeLastName, EmployeeFirstName, EmployeeAddress, EmployeeCity, EmployeeZipCode, EmployeePhone, EmployeeEmail, EmployeeHireDate)
SELECT *
FROM Employee
WHERE EmployeeKey='1';

/*Edit the record for Bob Carpenter (Key 3) so that his first name is Robert and is City is Bellevue*/
UPDATE Employee
SET EmployeeFirstName='Rbbert', EmployeeCity='Bellevue'
WHERE EmployeeKey='3';

/*Give everyone a 3% Cost of Living raise.*/
UPDATE EmployeePosition
SET EmployeeHourlyPayRate=EmployeeHourlyPayRate * 1.03; 

/*Delete the position Detailer*/
DELETE PositionName
FROM Postion
WHERE PositionName='Detailer';

