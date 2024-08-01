--1)
alter proc sp_person_selectfirst3
as
begin
	select top 3 * from person
	full outer join department on 
	person.departmentid = department.departmentid
	full outer join designation on 
	person.designationid = designation.designationid
end

exec sp_person_selectfirst3

--2)
alter proc sp_person_selectbydepartment
@departmentname varchar(50) = null
as
begin
	select * from person
	inner join department
	on person.departmentid = department.departmentid
	inner join designation
	on person.designationid = designation.designationid
	where @departmentname is null or departmentname = @departmentname
end

exec sp_person_selectbydepartment

--3)
create proc sp_person_selectByDepartmentDesignation
@departmentname varchar(50),
@designationname varchar(50)
as
begin
	select person.firstname,
		person.salary,
		person.joiningdate,
		designation.designationname
	from person
	left outer join department
	on person.departmentid = department.departmentid
	left outer join designation
	on person.designationid = designation.designationid
	where departmentname = @departmentname and designationname = @designationname
end 

exec sp_person_selectByDepartmentDesignation 'Admin','Jobber'

--4)
create proc sp_person_selectByFirstname
@firstname varchar(50)
as
begin
	select * from person
	left outer join department
	on person.departmentid = department.departmentid
	left outer join designation
	on person.designationid = designation.designationid
	where firstname = @firstname
end

exec sp_person_selectByFirstname 'Rahul'

--5)
alter proc sp_departmentwisesmaxmintotalsalary
as 
begin
	select department.departmentname,
		max(person.salary) as max,min(person.salary) as min,sum(person.salary) as total
	from person
	inner join department
	on person.departmentid = department.departmentid
	group by department.departmentname
end

exec sp_departmentwisesmaxmintotalsalary

--6)
create proc sp_designationwisesmaxmintotalsalary
as 
begin
	select designation.designationname,
		max(person.salary) as max,min(person.salary) as min,sum(person.salary) as total
	from person
	inner join designation

	on person.designationid = designation.designationid
	group by designation.designationname
end 

exec sp_designationwisesmaxmintotalsalary
