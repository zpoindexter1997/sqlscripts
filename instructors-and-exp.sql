select CONCAT(i.firstname, ' ', i.Lastname) 'Instructor', YearsExperience
	from Instructor i
		order by Lastname
