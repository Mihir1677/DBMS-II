--1)
create procedure sp_person_insert
@firstname varchar(50), @lastname varchar(50), @salary int, @joiningdate datetime, @departmentid int, @designationid int
as
begin
	insert into person
	values(@firstname,@lastname,@salary,@joiningdate,@departmentid)
end

exec dbo.sp_person_insert()

--

create proc sp_department_insert
@departmentid int, @departmentname varchar(100)
as
begin
	insert into department
	values(@departmentid,@departmentname)
end

exec dbo.sp_department_insert()

--

create proc sp_designation_insert
@designationid int, @designationname varchar(50)
as
begin
	insert into designation
	values(@designationid,@designationname)
end


--2)
create proc sp_person_update
