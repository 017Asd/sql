--creating a table named customers with customerid full name,city,segment,isactive,createdon
--creating a table orders with orderid customerid orderdate amount status paymentmode 
--the customerid in these two tables used to create a relationship betweent hese two tables

-- now we would be performing different operations on this using various keywords

--1)select* 
	--selecting all the columns with * from the table
	SELECT * 
	FROM Customers
--2)select specific columns
	--by mentioning the coumn name we can select specific columns from the table
	SELECT CustomerId,FullName,City
	FROM Customers
--3)distinct 
	--using distinct to reduce redudancy in the table only unique values ar considreed here
	select distinct city
	from customers
--4)column alias
	--here we are creating alias name for the exisiting columns using as or without it
	select FullName as customername, city as customercity
	from customers
--5)where
	--use where to filter the rows where we can provide the conditions we want to check
	select *
	from customers
	where city='Seatle'
--6)where with and or
	--use when we want to check for more than one conditions at the same time
	select * from customers
	where city='California' and segment='Corporate'
--7)in
	--it is used to check condition with multiple values of same column
	select * 
	from customers
	where city in ('Seatle','Chicago')

--8)between
	-- to get the details of values between a specific range
	select * 
	from Orders
	where amount between 700 and 5000
--9)like 
	-- it is used to search for patterns
	select * 
	from Customers
	where FullName LIKE 'J%';
--10)orderby
	-- it is used to sort the results in either ascending or descending order whereas ascedning is by default
	select *
	from Orders
	--order by Amount;
	order by Amount desc
--11)top
	-- if we want to get the first n rows we combine it with orderby 
	select top 2*
	from Orders
	order by Amount
--12)update and set
	--if we want to update the values of already exisiting table using set
	go
	UPDATE Customers
	SET          Segment = 'Social Service', IsActive = 'True'
	WHERE  (CustomerId = 206)
	go