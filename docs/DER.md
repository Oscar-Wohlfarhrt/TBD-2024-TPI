[Volver al README](./../README.md)

# Diagrama Entidad Relación

```mermaid
erDiagram
	Locale{
		int LocaleId PK
		varchar2(50) Name
	}
	Section{
		int SectionId PK
        int LocaleId PK,FK
    }
	Chacra{
		int ChacraId PK
		int SectionId PK,FK
        int LocaleId PK,FK
		varchar2(50) Name
	}
	Square{
		int SquareId PK
		int ChacraId PK,FK
		int SectionId PK,FK
        int LocaleId PK,FK
	}
	Plot{
		int PlotId PK
		int SquareId PK,FK
		int ChacraId PK,FK
		int SectionId PK,FK
        int LocaleId PK,FK
	}
	Connection{
		int ConnectionNum PK
		int PlotId FK
		int SquareId FK
		int ChacraId FK
		int SectionId FK
        int LocaleId PK,FK
        int DNI FK
        float Latitude
		float Longitude
	}
    ConnectionUser{
        int DNI PK
        varchar2(50) Name
        varchar2(50) LastName
    }

    Area{
        int AreaId PK
		varchar2(50) Name
	}
	Worker{
		int FileNumber PK
        int AreaId FK
		varchar2(50) Name
		varchar2(50) LastName
	}
	GenericWork{
		int WorkTypeId PK
		varchar(50) Description
	}
	GenericTask{
		int WorkType PK,FK
		int TaskId PK
		int Order
		varchar(50) Description
		long EstimatedDuration
	}
    GenericTaskMaterial{
        int RefNumWork PK,FK
        int TaskNumber PK,FK
        int MaterialId PK,FK
		int Quantity
		float Cost
		long validitySpan
	}
	Work{
        int WorkId PK
		int WorkType FK
        int Priority FK
		int ConnectionNum FK
		int FileNumber FK
		Date RequestDate
        Date StartDate
        Date EndDate
	}
    WorkPriority{
        int Priority PK
        varchar2(50) PriorDescription
    }
	Task{
        int WorkId PK,FK
		int TaskNumber FK
		Date ETA
		Date Creation
		float ManWorkCost
		int FileNumber FK
        int TaskState FK
        int AreaId FK
	}
	Material{
		int Id PK
		varchar2(50) Name
	}
	TaskMaterial{
        int WorkId PK,FK
        int TaskNumber PK,FK
        int MaterialId PK,FK
		int Quantity
		float Cost
		Date CostStartDate
		Date CostEndDate
	}
    TaskState{
        int TaskStateNum PK
        varchar2(50) Description
    }

    MonthCertificate{
        Date CurrentDate PK
        Date StartDate
        Date EndDate
        int Company FK
        int ElectricCompanyId FK
    }
    MonthCertificateDetail{
        Date CurrentDate PK,FK
        int Index PK
        int WorkId FK
    }
	MonthCertificateMats{
		Date CurrentDate PK
		int MatId PK
        int WorkId PK,FK
        int TaskNumber PK,FK
        int MaterialId PK,FK
		int Quantity
		float Cost
		Date CostStartDate
		Date CostEndDate
	}
	Company{
		int CompanyId PK
		varchar2(50) CompanyName
	}
	ElectricCompany{
		int ElectricCompanyId PK
		varchar2(50) ElectricCompanyName
	}

    MonthCertificate ||--|{ MonthCertificateDetail : "tiene"
    MonthCertificateDetail }|--|| Work: "esta en"
    Company ||--|{ MonthCertificate : "de"
	ElectricCompany ||--|{ MonthCertificate : "de"
	MonthCertificate ||--|{ MonthCertificateMats : "tiene"
	MonthCertificateMats }|--|| Material : "de"
    
	Locale ||--|{ Section : tiene
	Section ||--|{ Chacra : tiene
	Chacra ||--|{ Square : tiene
	Square ||--|{ Plot : tiene
	Connection }|--|| Plot : tiene
    
	Connection ||--|{ Work : tiene
	Worker }|--|| Area : "trabaja en"
    Task }|--|| Worker : registra
	Task }|--|| Area : resposable
	Work ||--|{ Task : contiene
    Task }|--|| TaskState : tiene
	Task ||--|{ TaskMaterial : usa
	Material ||--|{ TaskMaterial : "esta en"
    WorkPriority ||--|{ Work : "tiene"
    ConnectionUser ||--|{ Connection : "tiene"

	GenericWork ||--|{ Work : "es"
	GenericTask }|--|| GenericWork : "tiene"
	GenericTaskMaterial ||--|{ GenericTask : "usa"
    GenericTaskMaterial }|--|| Material : "de"
```
