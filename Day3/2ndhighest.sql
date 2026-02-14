-- query to find the second largest height
select MAX(height) from data
where height<(select MAX(height) from data)

--using offset
select height
as thirdhighest
from data
order by height desc
offset 2 rows fetch next 1 rows only
