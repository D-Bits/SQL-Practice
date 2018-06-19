
CREATE DATABASE FullTextDB;

--Add file groups
ALTER DATABASE FullTextDB
ADD FILEGROUP FullTextCatalog;

USE FullTextDB;

--Create a sample table
CREATE TABLE TextTable (
	TextTableKEY INT IDENTITY(1,1) PRIMARY KEY,
	TextExample NVARCHAR(255)
);

--Populate the sample table
INSERT INTO TextTable(TextExample)
VALUES ('This is a whole bunch of text for one, little record right here!'),
	   ('Money! Get back! Its the root of all evil'),
	   ('Will the cow jump over the fence?'),
	   ('If you dont eat your meat you cant have any pudding!'),
	   ('How can you have your pudding if you dont eat your meat?!?'),
	   ('You! Yes you behind the the grey desk! Stand still laddy!'); 

--Create full text catalog 
CREATE FULLTEXT CATALOG TestDescription
ON FILEGROUP FullTextCatalog;

--Create indexes for FTC
CREATE FULLTEXT INDEX ON TextTable(TextExample)
KEY INDEX [PK__TextTabl__B2585815FB2B9ACD]
ON TestDescription 
WITH CHANGE_TRACKING AUTO;

--Find all uses of the world "pudding"
SELECT TextTableKey, TextExample
FROM TextTable
WHERE FREETEXT(TextExample, 'pudding');

--Find all uses of the world "evil"
SELECT TextTableKey, TextExample
FROM TextTable
WHERE FREETEXT(TextExample, 'evil');

--Select words that have "pud" in them
SELECT TextTableKey, TextExample
FROM TextTable
WHERE CONTAINS(TextExample, 'FORMSOF(INFLECTIONAL, pud)');