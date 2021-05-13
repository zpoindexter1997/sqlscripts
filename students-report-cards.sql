select concat( s.firstname, ' ', s.Lastname) 'Student', SAT, GPA, Code, ClassGradeValue
	from Student s
		left join Major m
			on s.MajorId = m.Id
		left join MajorClass mc
			on mc.MajorId = m.Id
		left join StudentClass sc
			on sc.StudentId = s.Id
		order by Student, ClassGradeValue;
				
select distinct 'A' as 'ABC', concat( s.firstname, ' ', s.Lastname) 'Student', SAT, GPA, Code, ClassGradeValue
	from Student s
		left join Major m
			on s.MajorId = m.Id
		left join MajorClass mc
			on mc.MajorId = m.Id
		left join StudentClass sc
			on sc.StudentId = s.Id
		where GPA > 3.00
UNION 

select distinct 'B' as 'ABC', concat( s.firstname, ' ', s.Lastname) 'Student', SAT, GPA, Code, ClassGradeValue
	from Student s
		left join Major m
			on s.MajorId = m.Id
		left join MajorClass mc
			on mc.MajorId = m.Id
		left join StudentClass sc
			on sc.StudentId = s.Id
		where GPA <= 3.00 and GPA > 2.00
				
UNION 
select distinct 'C' as 'ABC',concat( s.firstname, ' ', s.Lastname) 'Student', SAT, GPA, Code, ClassGradeValue
	from Student s
		left join Major m
			on s.MajorId = m.Id
		left join MajorClass mc
			on mc.MajorId = m.Id
		left join StudentClass sc
			on sc.StudentId = s.Id
		where GPA <= 2.00
		order by 'ABC'
				
				
