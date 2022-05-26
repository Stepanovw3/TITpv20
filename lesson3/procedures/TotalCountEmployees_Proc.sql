create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees