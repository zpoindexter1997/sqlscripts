select c.Id, code, subject, section, CONCAT(firstname, ' ', Lastname) 'Instructor'
	from Class c
		join Instructor i
			on c.InstructorId = i.Id
		where Section >= 300 and Section < 400
		order by Section 