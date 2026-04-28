-- DELETE.SQL
-- Drop tables in reverse dependency order
USE University_Lab7;
GO
IF OBJECT_ID('Subject_Science', 'U') IS NOT NULL DROP TABLE Subject_Science;
IF OBJECT_ID('Goods', 'U') IS NOT NULL DROP TABLE Goods;
IF OBJECT_ID('Firms', 'U') IS NOT NULL DROP TABLE Firms;
IF OBJECT_ID('Curriculum', 'U') IS NOT NULL DROP TABLE Curriculum;
IF OBJECT_ID('Student', 'U') IS NOT NULL DROP TABLE Student;
IF OBJECT_ID('Sciense', 'U') IS NOT NULL DROP TABLE Sciense;
IF OBJECT_ID('Tutor', 'U') IS NOT NULL DROP TABLE Tutor;
IF OBJECT_ID('Academical_adviser', 'U') IS NOT NULL DROP TABLE Academical_adviser;
PRINT 'All tables dropped successfully.';
GO