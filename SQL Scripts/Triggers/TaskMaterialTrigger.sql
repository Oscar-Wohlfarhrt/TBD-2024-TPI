use TBD2024;

select * from Task;
select * from TaskMaterial;

go
create or alter TRIGGER TaskMaterialLoader on Task
for Insert as
insert into TaskMaterial
select
    t.WorkId,
    t.TaskNumber,
    m.MaterialId,
    m.Quantity as Quantity,
    m.Cost as Cost,
    GETDATE() as CostStartDate,
    DATEADD(day,m.ValiditySpan, GETDATE()) as CostendDate
from inserted as t
inner join dbo.[Work] as w ON
t.WorkId = w.WorkId
inner join dbo.GenericTaskMaterial as m on
w.WorkType = m.RefNumWork and t.TaskNumber = m.TaskNumber
go

select * from TaskMaterial

select * from GenericTaskMaterial
select * from Material


insert into Material (Id,Name)
values (next value for SequenceMaterial,'Medidor')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Caja de Herramientas')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Metro de Cable')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Destornillador')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Pelacables')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Pinza Universal')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Alicate')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Llave Termomagnetica Bifasica 20A')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Llave Termomagnetica Bifasica 35A')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Llave Termomagnetica Bifasica 50A')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Llave Termomagnetica Trifasica 20A')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Llave Termomagnetica Trifasica 35A')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Llave Termomagnetica Trifasica 50A')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Multimetro')
insert into Material (Id,Name)
values (next value for SequenceMaterial,'Fusible Aereo')

select * from Material
select * from GenericTaskMaterial
select * from GenericTask

Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,1,1,1,100000,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,1,9,1,40000,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,1,15,1,10000,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,2,14,1,1000,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,3,3,20,1000,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,3,4,1,500,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,3,5,1,500,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (1,4,14,1,1000,30)
Insert into GenericTaskMaterial (RefNumWork,TaskNumber,MaterialId,Quantity,Cost,ValiditySpan)
Values (2,1,14,1,1000,30)