select 'A' as 'ABC', * 
	from Student
	where SAT > 1200
UNION
select 'B' as 'ABC', *
	from Student
	where SAT >= 1000 and SAT <= 1200
UNION
select 'C' as 'ABC', *
	from Student
	where SAT < 1000
		order by SAT desc
