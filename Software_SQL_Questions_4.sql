declare @StudentCourse table
(
Student nvarchar(100),
Course nvarchar(100)
)
insert @StudentCourse values ('Student A','Course X')
insert @StudentCourse values ('Student A','Course X')
insert @StudentCourse values ('Student A','Course X')
insert @StudentCourse values ('Student B','Course Y')
insert @StudentCourse values ('Student B','Course Y')
insert @StudentCourse values ('Student C','Course X')
insert @StudentCourse values ('Student C','Course X')
insert @StudentCourse values ('Student D','Course X')
insert @StudentCourse values ('Student E','Course X')
insert @StudentCourse values ('Student E','Course X')
insert @StudentCourse values ('Student E','Course X')
select * from @StudentCourse


SELECT 
DISTINCT 
Student,
Course 
FROM 
@StudentCourse