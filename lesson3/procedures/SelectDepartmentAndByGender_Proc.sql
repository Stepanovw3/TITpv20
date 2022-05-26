create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select Name, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

exec spGetEmployeesByGenderAndDepartment 'Male', 1

exec spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'