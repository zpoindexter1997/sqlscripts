SELECT * 
	from Student
	left join Major
		on Student.MajorId = Major.Id
	where gpa >= 3.5 and gpa < 4.0
	order by GPA desc, SAT desc;