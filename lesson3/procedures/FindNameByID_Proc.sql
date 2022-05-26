create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = Name from employees where Id = @Id
end
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName
