
--XML
USE MetroAlt

--Create the db in XML form
SELECT *
FROM Employee
FOR XML RAW('Employee'), ELEMENTS, ROOT('Employees')