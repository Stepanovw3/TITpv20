--- kuvab kõige nooremat isikut
select min(cast(Age as int)) from Person
--- kõige vanem isik
select max(cast(Age as int)) from Person