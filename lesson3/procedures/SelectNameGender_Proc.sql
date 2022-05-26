--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select Name, Gender from Employees
end

exec spGetEmployees
execute spGetEmployees