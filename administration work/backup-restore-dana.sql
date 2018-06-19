
USE MetroAlt;

--Backup MetroAlt
BACKUP DATABASE [MetroAlt] 
TO  DISK = 'C:\Backups\MetroAlt\MetroAlt.log' 
WITH DIFFERENTIAL;

--Add an employee
INSERT INTO Employee(EmployeeLastName, EmployeeFirstName, EmployeeAddress, EmployeeCity, EmployeeZipCode, EmployeePhone, EmployeeEmail, EmployeeHireDate)
VALUES ('Doe', 'John', '123 Fake St', 'Seattle', '98106', '2068997692', 'jdoe@gmail.com', '2014-08-24');

--Backup the log
BACKUP LOG MetroAlt
TO DISK='C:\Backups\Community_Assist\Community_Assist.log';

BACKUP LOG MetroAlt
TO DISK='C:\Backups\MetroAlt\MetroAlt.log'
with norecovery;

--Restore MetroAlt
RESTORE DATABASE MetroAlt
FROM DISK = 'C:\Backups\MetroAlt\MetroAlt.bak'
WITH NORECOVERY, FILE=1;

RESTORE DATABASE MetroAlt
FROM DISK = 'C:\Backups\MetroAlt\MetroAlt.bak'
WITH NORECOVERY, FILE=2;

--Restore the log
RESTORE LOG MetroAlt
FROM DISK = 'C:\Backups\MetroAlt\MetroAlt.log'
WITH RECOVERY;