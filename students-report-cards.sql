select concat( s.firstname, ' ', s.Lastname) 'Student', SAT, GPA, Code, ClassGradeValue
	from Student s
		left join Major m
			on s.MajorId = m.Id
		left join MajorClass mc
			on mc.MajorId = m.Id
		left join StudentClass sc
			on sc.StudentId = s.Id
		order by Student, ClassGradeValue;
			

			
