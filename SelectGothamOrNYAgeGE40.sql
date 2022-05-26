--- kõik, kes elevad välja toodud linnades ja on vanemad kui 40 a
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40