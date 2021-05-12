-- Display states and number of students in each
/* This also works for comments */

select  StateCode, count(*) 'Count'
	from Student s
		where SAT < 1000
		group by StateCode
		having count(*) > 1
		order by count(*) desc
