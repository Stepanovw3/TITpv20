create trigger tr_Employee_ForInsert
on EmployeeTrigger
for insert
begin
	declare @Id int
	select @Id = Id from inserted

	insert into EmployeeAudit
	values('New employee with Id = ' + cast(@Id as nvarchar(5)) 
	+ ' is added at ' + cast(Getdate() as nvarchar(20)))
end