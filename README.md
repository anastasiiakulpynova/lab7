# lab7
# Laboratory Work 7: Physical Model in MSSQL

## Subject Area: University Database

### Verbal Model
The database stores information about students, academic advisers, tutors, curricula, and sciences. Each student has one adviser. Each curriculum is taught by one tutor. A curriculum can cover multiple sciences, and a science can be part of multiple curricula.

### Scripts
- [SETUP.SQL](SETUP.SQL) – creates all tables with constraints
- [INSERT.SQL](INSERT.SQL) – populates tables with 1000+ records
- [DELETE.SQL](DELETE.SQL) – drops all tables

### Sample Query
```sql
SELECT s.FullName AS Student, a.FullName AS Adviser, c.Subject
FROM Student s
JOIN Academical_adviser a ON s.id_Adviser = a.id_Adviser
JOIN Curriculum c ON ...
