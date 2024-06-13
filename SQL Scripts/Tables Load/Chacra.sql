use TBD2024;

select * from dbo.Section;

select * from Chacra;

Insert into Chacra
select 1 as ChacraId,s.SectionId,LocaleId,'Chacra 1' as Name from dbo.Section as s;