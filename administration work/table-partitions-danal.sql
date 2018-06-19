
/*Create a new database with 5 file groups and one file in each group.*/
CREATE DATABASE PartitionDB;

/*Create filegroups*/
ALTER DATABASE PartitionDB
ADD FILEGROUP FG1;

ALTER DATABASE PartitionDB
ADD FILEGROUP FG2;

ALTER DATABASE PartitionDB
ADD FILEGROUP FG3; 

ALTER DATABASE PartitionDB
ADD FILEGROUP FG4;

ALTER DATABASE PartitionDB
ADD FILEGROUP FG5;

/*Add Files to filegroups*/

--1st file
ALTER DATABASE PartitionExample 

Add File
(name='FG1_dat2', 

Filename='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC224_6\MSSQL\DATA\Partition_Example6.ndf', 

size=5mb, 

MaxSize=200mb, 

FileGrowth=5mb 

) 

TO FILEGROUP FG1;  

--2nd file
ALTER DATABASE PartitionExample 

Add File

(name='FG2_dat2', 

Filename='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC224_6\MSSQL\DATA\Partition_Example7.ndf', 

size=5mb, 

MaxSize=200mb, 

FileGrowth=5mb 

) 

TO FILEGROUP FG2;

--3rd file
ALTER DATABASE PartitionExample 

Add File

(name='FG3_dat2', 

Filename='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC224_6\MSSQL\DATA\Partition_Example8.ndf', 

size=5mb, 

MaxSize=200mb, 

FileGrowth=5mb 

) 

TO FILEGROUP FG3;

--4th file
ALTER DATABASE PartitionExample 

Add File

(name='FG4_dat2', 

Filename='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC224_6\MSSQL\DATA\Partition_Example9.ndf', 

size=5mb, 

MaxSize=200mb, 

FileGrowth=5mb 

)

TO FILEGROUP FG4;

--5th Group 
ALTER DATABASE PartitionExample 

Add File

(name='FG5_dat2', 

Filename='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC224_6\MSSQL\DATA\Partition_Example10.ndf', 

size=5mb, 

MaxSize=200mb, 

FileGrowth=5mb 

)

TO FILEGROUP FG5; 

/*Create table partition function*/
CREATE PARTITION FUNCTION BusPartitionFunction
AS 
RANGE RIGHT 
FOR VALUES ('2012', '2013', '2014', '2015');

/*Create table partition scheme*/
CREATE PARTITION SCHEME BusPartitionScheme
AS
BusPartitionFunction
TO (FG1, FG2, FG3, FG4, FG5)

/*Create a table that has the same structure as BusRoutescheduleAssignment. Import the data from BusRoutShiftAssignment into the new Table.*/
CREATE TABLE BusRouteSA2 
BusScheduleAssignmentKey INT IDENTITY(1,1) PRIMARY KEY,
BusDriverShiftKey INT,
EmployeeKey INT,
BusRouteKey INT,
BusScheduleAssignmentDate DATE,
BusKey INT;

INSERT INTO BusRouteSA2
SELECT *
FROM BusScheduleAssignment;
