Use TBD2024;

Select * from dbo.Section;
--Insert into dbo.Section

Select value as SectionId,1 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,2 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,3 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,4 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,5 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,6 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,7 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,8 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,9 as LocaleId from GENERATE_SERIES(1, 10) UNION
Select value as SectionId,10 as LocaleId from GENERATE_SERIES(1, 10) order by LocaleId
