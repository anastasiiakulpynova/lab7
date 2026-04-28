USE University_Lab7;
GO
SET NOCOUNT ON;
GO

-- Insert 200 advisers (we'll scale up)
INSERT INTO Academical_adviser (FullName, Department, Phone)
SELECT TOP 200 
    'Adviser_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3 = 1 THEN 'CS'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3 = 2 THEN 'Math'
         ELSE 'Physics' END,
    '380' + RIGHT('00000000' + CAST(ABS(CHECKSUM(NEWID())) % 100000000 AS VARCHAR(8)), 8)
FROM sys.objects a CROSS JOIN sys.objects b;
GO

-- Insert 200 tutors
INSERT INTO Tutor (FullName, Position, HireDate)
SELECT TOP 200
    'Tutor_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 4 = 1 THEN 'Professor'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 4 = 2 THEN 'Associate Professor'
         ELSE 'Lecturer' END,
    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 5000, GETDATE())
FROM sys.objects a CROSS JOIN sys.objects b;
GO

-- Insert 1000+ students (let's do 1000)
WITH Numbers AS (
    SELECT TOP 1000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects a CROSS JOIN sys.objects b
)
INSERT INTO Student (FullName, BirthDate, EnrollmentYear, Email, id_Adviser)
SELECT 
    'Student_' + CAST(n AS VARCHAR(10)),
    DATEADD(year, -18 - (n % 10), GETDATE()),
    2015 + (n % 9),
    'student' + CAST(n AS VARCHAR(10)) + '@univ.edu',
    (n % 200) + 1
FROM Numbers;
GO

-- Insert 1000+ curriculum records (using cross join)
INSERT INTO Curriculum (Subject, Kourse, Term, Hours, ControlForm, id_Tutor)
SELECT 
    'Subject_' + CAST(ABS(CHECKSUM(NEWID())) % 500 AS VARCHAR(10)),
    (ABS(CHECKSUM(NEWID())) % 6) + 1,
    (ABS(CHECKSUM(NEWID())) % 4) + 1,
    (ABS(CHECKSUM(NEWID())) % 151),
    CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'Exam' ELSE 'Credit' END,
    (ABS(CHECKSUM(NEWID())) % 200) + 1
FROM sys.objects a CROSS JOIN sys.objects b CROSS JOIN sys.objects c;
GO
-- Ensure we have at least 1000 rows
INSERT INTO Curriculum (Subject, Kourse, Term, Hours, ControlForm, id_Tutor)
SELECT TOP 500
    'Extra_Subject_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 6) + 1,
    (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 4) + 1,
    30 + (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 121),
    'Exam',
    (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 200) + 1
FROM sys.objects a CROSS JOIN sys.objects b;
GO

-- Insert sciences
INSERT INTO Sciense (Science_Name, Description)
SELECT TOP 50
    'Science_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    'Description for science ' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10))
FROM sys.objects;
GO

-- Link curriculum to science (many-to-many)
INSERT INTO Subject_Science (id_Curriculum, id_Science)
SELECT DISTINCT c.id_Curriculum, s.id_Science
FROM Curriculum c
CROSS JOIN Science s
WHERE c.id_Curriculum % 7 = s.id_Science % 7
  AND c.id_Curriculum <= 1000;
GO

-- Insert into Firms and Goods (if needed)
INSERT INTO Firms (Firm_Name, Address)
SELECT TOP 100
    'Firm_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    'Address_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10))
FROM sys.objects;
GO

INSERT INTO Goods (Goods_Name, Unit_Of_Measure, Guarantee_Period, Unit_Price, Manufacture_Date, id_Firm)
SELECT 
    'Goods_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3 = 1 THEN 'pcs'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3 = 2 THEN 'kg'
         ELSE 'liters' END,
    (ABS(CHECKSUM(NEWID())) % 730),
    ROUND(RAND(CHECKSUM(NEWID())) * 1000, 2),
    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 1000, GETDATE()),
    (ABS(CHECKSUM(NEWID())) % 100) + 1
FROM sys.objects a CROSS JOIN sys.objects b;
GO

-- Verify counts
SELECT 'Academical_adviser' AS TableName, COUNT(*) AS RecordCount FROM Academical_adviser
UNION ALL
SELECT 'Tutor', COUNT(*) FROM Tutor
UNION ALL
SELECT 'Student', COUNT(*) FROM Student
UNION ALL
SELECT 'Curriculum', COUNT(*) FROM Curriculum
UNION ALL
SELECT 'Sciense', COUNT(*) FROM Sciense
UNION ALL
SELECT 'Subject_Science', COUNT(*) FROM Subject_Science
UNION ALL
SELECT 'Firms', COUNT(*) FROM Firms
UNION ALL
SELECT 'Goods', COUNT(*) FROM Goods;
GO