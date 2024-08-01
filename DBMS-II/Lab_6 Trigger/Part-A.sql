--1)
create trigger tr_person_int_up_del_message
on person
for insert,update,delete
as
begin
	print 'Record is Affected.'
end

--2)
alter trigger tr_person_ins_up_del
on person
for insert,update,delete
as 
begin
	declare @personid int,
			@personname varchar(250),
			@operation varchar(50),
			@updatedate datetime

	if exists(select * from deleted)
	begin
		select @personid = personid,
			   @personname = personname
		from deleted
		set @operation = 'Deleted'
		set @updatedate = getdate()
	end

	else
	begin
			select @personid = personid,
				   @personname = personname
			from inserted
			set @operation = 'Inserted/Updated'
			set @updatedate = getdate()
	end

	insert into PersonLog
	values(@personid,@personname,@operation,@updatedate)
end

--3)
create trigger tr_person_ins_up_del_insteadof
on person
instead of insert,update,delete
as
begin
	declare @personid int,
			@personname varchar(250),
			@operation varchar(50),
			@updatedate datetime

	if exists(select * from deleted)
	begin
		select @personid = personid,
			   @personname = personname
		from deleted
		set @operation = 'Deleted'
		set @updatedate = getdate()
	end

	else
	begin
			select @personid = personid,
				   @personname = personname
			from inserted
			set @operation = 'Inserted/Updated'
			set @updatedate = getdate()
	end

	insert into PersonLog
	values(@personid,@personname,@operation,@updatedate)
end

--4)
alter trigger tr_person_ins_touppercase
on person
for insert
as
begin
	declare @personID int,
	        @personName varchar(50)
	
end 

insert into person values (101,'darshan',10.00,'01-08-2023','Rajkot','19','01-01-2004')
select * from person

