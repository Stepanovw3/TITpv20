--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select FirstName, Gender from Employees
end

spGetEmployees
exec spGetEmployees
execute spGetEmployees

--- 
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select FirstName, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

--- k�ik esimeses osakonnas meessoost t��tavad isikud
spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'




create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- annab teada, palju on meessoost isikuid ning kuvab vastava stringi
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount

-- annab teada, palju on meessoost isikuid
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount

---- annab kogu tabeli ridade arvu
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- k�ivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

--- mis id all on keegi nime j�rgi
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = FirstName from employees where Id = @Id
end

--- k�ivitame sp
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName


create proc spGetNameById2
@Id int
as begin
	return (select FirstName from Employees where Id = @Id)
end
-- tuleb veatead kuna kutsusime v�lja int-i, aga Tom on string
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
