select top5* into #temp1 from [sales].[customers]

select * from #temp1

delete #temp1 
drop table #temp1
truncate table #temp1

-- using ## can be acessed by other people in the same server it is a global table
select top 5 * into ##temp2 from [sales].[customers]




