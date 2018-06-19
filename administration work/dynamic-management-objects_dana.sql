
USE MetroAlt;

--Display all databases on the server
SELECT *
FROM sys.Databases;

--Display all columns
SELECT *
FROM sys.all_columns;

--Show backup devices
SELECT *
FROM sys.backup_devices;

--Show all views
SELECT *
FROM sys.all_views;

--Display constraints
SELECT *
FROM sys.check_constraints;

--Display computed columns
SELECT *
FROM sys.computed_columns;

--Show certificates 
SELECT * 
FROM sys.certificates; 

--Display every object
SELECT *
FROM sys.all_objects;

--Show asymmetric crytpographic keys
SELECT *
FROM sys.asymmetric_keys;

--Show symmetric keys
SELECT *
FROM sys.symmetric_keys; 