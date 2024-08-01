--1)
begin try
	select (10/0)
end try
begin catch
	Print('Error occurs that is - ')+Error_Message()
end catch 

--2)
declare @val1 varchar(10) = 'String'
begin try
	select cast(@val1 as int)
end try
begin catch
	print('Error - ') + Error_Message()
end catch

--3)
create proc sp_sum_of_2
@var1 int ,@var2 varchar(50) 
as
begin
	begin try
		select CAST(@var1 as int) + cast(@var2 as int)		
	end try
	begin catch
		print('Error occurs - ') + Error_message()
	end catch
end

exec sp_sum_of_2 10,name

--4)
begin try
	insert into Customers
	values(101,'Raj','raj@abc')
end try
begin catch
	exec sp_error_print
end catch

--5)
alter proc sp_select_by_custid
@id int
as
begin
	begin try
		if not exists(select customer_id from customers where customer_id = @id)
		throw 50001,'no Customer_id is available in database.' , 1
	end try
	begin catch
		print error_message()
	end catch
end

exec sp_select_by_custid 105

--6)
begin try
	insert into Orders
	values(2,116,'12-03-2023')
end try
begin catch
	print('Error Occurs - ')+ Error_message()
end catch

--7)
alter proc sp_select_orderid
@id int
as
begin
	begin try
		if(@id<=0)
		throw 50002,'Order id cannot be less than or equal to 0',1
	end try
	begin catch
		print error_message()
	end catch
end

exec sp_select_orderid 0


--8)
create proc sp_error_print
as
begin
	print('The Customer_id is already taken. Try another one')
end