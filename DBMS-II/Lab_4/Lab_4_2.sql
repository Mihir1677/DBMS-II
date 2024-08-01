--11)
create function name_find()
returns  @namefind table (workerid int, firstname varchar(100), lastname varchar(100), salary int, joiningdate datetime, departmentid int, designationid int)
as
begin
	insert into @namefind
	select workerid, firstname, lastname, salary, joiningdate, departmentid, designationid from Person
	where firstname like 'b%'
	return
end

--2)
create function distinct_name()
returns @distinct_name table (firstname varchar(50)
as
begin
	insert into  