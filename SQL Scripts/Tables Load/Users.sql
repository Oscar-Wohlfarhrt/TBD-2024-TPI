use TBD2024;

Select ROW_NUMBER() OVER( ORDER BY newid() ) as DNI,Name,LastName from RanNamesCross;

Insert INTO ConectionUser
Select ROW_NUMBER() OVER( ORDER BY newid() ) as DNI,Name,LastName
from RanNamesCross;

Select * from ConectionUser;

