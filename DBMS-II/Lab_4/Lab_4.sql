--7)
alter function Even_sum_1to20()
returns int
as begin
	declare @i int
	set @i=0
	declare @sum int
	set @sum=0
	while(@i<=20)
	begin
		if(@i%2=0)
		set @sum = @sum + @i
		set @i = @i + 1
	end
	return @sum
end

select dbo.Even_sum_1to20()

--8)
alter function Prime_or_not(@n int)
returns varchar(100)
as
begin	
	declare @i int
	set @i =2
	declare @count bit =0
	declare @output varchar(100)
	while(@i<@n)
	begin
		if(@n%@i=0)
		begin 
			set @count =  1
			SET @i=@i+1;
			break;
		end
		else
			SET @i=@i+1;
	end
	if(@count=0)
		set @output = 'Given number is Prime'
	else
		set @output = 'Given number is not Prime'
	return @output
end

select dbo.Prime_or_not(8)

--9)
alter function Day_diff(@sdate datetime, @edate datetime)
returns int
as
begin
	return abs(datediff(day,@sdate,@edate))
end

select dbo.Day_diff('2005-05-18','2005-06-17')

--10)
alter function Total_days_in_mny(@month int, @year int)
returns int
begin
	declare @days varchar(100)
	set convert(varchar(20),@month)
	set convert(varchar(20),@year)
	set @days = @year+'-'+@month+'-01'
	set convert(datetime,@days)
	return eomonth(@days)
end

select dbo.Day_diff(05,2005)