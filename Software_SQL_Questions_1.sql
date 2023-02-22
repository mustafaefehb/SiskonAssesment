declare @Course table
(
CourseID nvarchar(4)
)
declare @CourseStudent table
(
CourseID nvarchar(4),
Student nvarchar(50)
)
insert @Course values ('SOS1')
insert @Course values ('MAT3')
insert @Course values ('FEN2')
insert @CourseStudent values ('MAT3', 'Mehmet')
insert @CourseStudent values ('SOS1', 'Ahmet')
insert @CourseStudent values ('MAT3', 'Ahmet')
insert @CourseStudent values ('FEN2', 'Ahmet')
insert @CourseStudent values ('SOS1', 'Ali')
insert @CourseStudent values ('FEN2', 'Ayse')
select * from @Course
select * from @CourseStudent

SELECT
CS.Student
from 
@CourseStudent CS 
JOIN 
@Course C ON C.CourseID = CS.CourseID 
GROUP BY CS.Student
HAVING COUNT(CS.Student) = (SELECT COUNT(*) FROM @Course)