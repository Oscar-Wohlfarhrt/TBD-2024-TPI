use TBD2024;

Select * from dbo.[Square];

insert into [Square]
select 1 as SquareId,c.ChacraId,c.SectionId,c.LocaleId from dbo.Chacra as c;
go

select * from dbo.Plot

insert into dbo.Plot
select 1 as PlotId,s.SquareId,s.ChacraId,s.SectionId,s.LocaleId from dbo.[Square] as s;

go


create or alter view PlotListView as
select
    l.Name as Locale,
    c.Name as [Chacra Name],
    format(p.SectionId,'0000') as [Section],
    format(p.ChacraId,'0000') as [Chacra Id],
    format(p.SquareId,'0000') as [Square],
    format(p.PlotId,'0000') as [Plot]
from dbo.Plot as p
inner join dbo.Locale as l on l.LocaleId=p.LocaleId
inner join dbo.Chacra as c on c.ChacraId=p.ChacraId and c.SectionId=p.SectionId and c.LocaleId=p.LocaleId;
go

select * from PlotListView order by Locale DESC