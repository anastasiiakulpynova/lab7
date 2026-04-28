Table: Student
Attribute	Physical Name	Data Type	PKEY	FKEY	ALLOW NULLS	UNIQUE
Student ID	id_Student	INT	X			X
Full Name	FullName	NVARCHAR(100)				
Birth Date	BirthDate	DATE				
Enrollment Year	EnrollmentYear	INT				
Email	Email	NVARCHAR(100)				X
Adviser ID	id_Adviser	INT		X	X	
Table: Academical_adviser
Attribute	Physical Name	Data Type	PKEY	FKEY	ALLOW NULLS	UNIQUE
Adviser ID	id_Adviser	INT	X			X
Full Name	FullName	NVARCHAR(100)				
Department	Department	NVARCHAR(50)			X	
Phone	Phone	VARCHAR(20)			X	
Table: Curriculum
Attribute	Physical Name	Data Type	PKEY	FKEY	ALLOW NULLS	UNIQUE
Curriculum ID	id_Curriculum	INT	X			X
Subject	Subject	NVARCHAR(100)				
Course	Kourse	INT				
Term	Term	INT				
Hours	Hours	INT				
Control Form	ControlForm	NVARCHAR(20)			X	
Tutor ID	id_Tutor	INT		X		
Table: Tutor
Attribute	Physical Name	Data Type	PKEY	FKEY	ALLOW NULLS	UNIQUE
Tutor ID	id_Tutor	INT	X			X
Full Name	FullName	NVARCHAR(100)				
Position	Position	NVARCHAR(50)			X	
Hire Date	HireDate	DATE				
Table: Sciense
Attribute	Physical Name	Data Type	PKEY	FKEY	ALLOW NULLS	UNIQUE
Science ID	id_Science	INT	X			X
Science Name	Science_Name	NVARCHAR(100)				
Description	Description	NVARCHAR(MAX)	