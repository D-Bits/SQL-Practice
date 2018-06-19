USE master;

CREATE DATABASE [LSDemo];

ALTER DATABASE [LSDemo]
SET RECOVERY FULL;

BACKUP DATABASE [LSDemo]
TO DISK = 'C:\LSDEMO\LSDEMO.bak'

--Execute on separate connection
go
RESTORE DATABASE [LSDemo]
FROM DISK = '\\sum17-sql-a\LSDemo\LSDEMO.bak'
WITH NORECOVERY