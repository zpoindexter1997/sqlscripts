SELECT *
	from Student
	order by GPA desc;
	
insert student 
	(Firstname, Lastname, StateCode, SAT, GPA, MajorId)
		values ( 'Zha''Quon', 'Poindexter', 'WV', 1337, 4.05, 1);

UPDATE Student set
	GPA = 4.25
		where Firstname = 'Zha''Quon';

delete from Student
	where firstname = 'Zha''Quon';