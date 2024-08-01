--1)
declare @productid int,
	@productname varchar(250),
	@price decimal(10,2)
declare Product_cursor cursor
for select product_id, product_name , price from Products

open Product_cursor
fetch next from product_cursor into @productid, @productname, @price
while @@FETCH_STATUS = 0
begin
	print concat(@productid,' - ',@productname,' - ',@price)
	fetch next from product_cursor into @productid, @productname, @price
end
close Product_cursor
deallocate Product_cursor



--2)
declare @productid int,
	@productname varchar(250)
declare Product_cursor_fetch cursor
for select product_id, product_name from Products

open Product_cursor_fetch
fetch next from product_cursor_fetch into @productid, @productname
while @@FETCH_STATUS = 0
begin
	print concat(@productid,'_',@productname)
	fetch next from product_cursor_fetch into @productid, @productname
end
close Product_cursor_fetch
deallocate Product_cursor_fetch


--3)
declare @productid int
declare Product_CursorDelete cursor
for select product_id from products
open product_cursorDelete
fetch next from product_cursordelete into @productid
while @@FETCH_STATUS = 0
begin
	delete from products
	where product_id = @productid
	fetch next from product_cursordelete into @productid
end
close product_cursordelete
deallocate product_cursordelete


--4)
declare @productid int,
declare Product_CursorUpdate cursor
for select product_id, price from products
open product_cursorUpdate
fetch next from Product_cursorupdate into @productid
while @@FETCH_STATUS = 0
begin
	update products
	set price = price+(price*0.1)
	where product_id = @productid 
	fetch next from product_cursorupdate into @productid
end
close product_cursorupdate
deallocate product_cursorUpdate


--5)
declare @productid int,
	@productname varchar(250),
	@price decimal(10,2)
declare product_cursorAdd cursor
for select product_id, product_name, price from products
open product_cursoradd
fetch next from product_cursoradd into @productid, @productname, @price
while @@FETCH_STATUS = 0
begin
	insert into NewProducts
	values(@productid,@productname,@price)
	fetch next from product_cursoradd into @productid, @productname, @price
end
close product_cursoradd
deallocate product_cursoradd



