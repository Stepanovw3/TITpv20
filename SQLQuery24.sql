select Id, coalesce(Name, MiddleName, LastName) as Name
from Employees