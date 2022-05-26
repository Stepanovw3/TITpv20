--- arvutame k]ikide palgad kokku
select sum(cast(Salary as int)) from Employees
--- k]ige v'iksema palga saaja
select min(cast(Salary as int)) from Employees