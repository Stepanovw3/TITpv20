select City, sum(cast(Age as int)) as TotalAge from Person group by City
