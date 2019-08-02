use master 
go 
create database Wollies_Shelter
go

Use Wollies_Shelter
go
---
---
---
---THIS IS WHERE THE LOOKUP TABLES BEGIN
---
---
---
create table Donation_Type
(
Donation_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Donation_Type_Name nvarchar(600),
Donation_Type_Description nvarchar(600),
)
go

create table Event_Type
(
Event_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Event_Type_Name nvarchar(50),
)
go

create table Title
(
Title_ID INT IDENTITY(1,1) PRIMARY KEY, 
Title_Description nvarchar(50),
)
go

create table Employee_Status
(
Employee_Status_ID INT IDENTITY(1,1) PRIMARY KEY, 
Employee_Status_Name nvarchar(50),
)
go
create table Employee_Type
(
Emp_Type_ID INT IDENTITY(1,1) PRIMARY KEY,
Emp_Type_Name nvarchar(50),
Emp_Type_Description nvarchar(50)
)
go

create table Animal_Status
(
Animal_Status_ID INT IDENTITY(1,1) PRIMARY KEY, 
Animal_Status_Name nvarchar(50),
)
go
create table Animal_Type
(
Animal_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Animal_Type_Name nvarchar(50)
)
go

create table Animal_Breed
(
Animal_Breed_ID INT IDENTITY(1,1) PRIMARY KEY,
Animal_Breed_Name nvarchar(200),
Animal_Breed_Description nvarchar(200),
Animal_Type_ID int,
Constraint fkanibreed foreign key (Animal_Type_ID) references Animal_Type(Animal_Type_ID)
)
go

create table Foster_Care_Parent_Status
(
Foster_Parent_Status_ID INT IDENTITY(1,1) PRIMARY KEY,
Foster_Care_Parent_Status_Name nvarchar(200),
Foster_Parent_Status_Description nvarchar(200),
Last_Modified DATETIME
)
go


create table Payment_Type
(
Payment_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Payment_Type_Name nvarchar(100),
Payment_Type_Description nvarchar(200),
)
go

create table Stock_Type
(
Stock_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Stock_Type_Name nvarchar(100),
Stock_Type_Description nvarchar(200),
)
go

create table Packaging_Type
(
Packaging_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Packaging_Type_Name nvarchar(50)
)
go

create table Unit_Type
(
Unit_Type_ID INT IDENTITY(1,1) PRIMARY KEY, 
Unit_Type_Name nvarchar(50)
)
go

create table Adoption_Status
(
Adopt_Status_ID INT IDENTITY(1,1) PRIMARY KEY, 
Adopt_Status_Name nvarchar(100),
Adopt_Status_Description nvarchar(200),
)
go

create table Adopter_Status
(
Adopter_Status_ID INT IDENTITY(1,1) PRIMARY KEY, 
Adopter_Status_Name nvarchar(100),
)
go

create table Volunteer_Work_Type
(
Vol_WorkType_ID INT IDENTITY(1,1) PRIMARY KEY, 
Vol_WorkType_Name nvarchar(100),
Vol_WorkType_Description nvarchar(200),
)
go

---
---
---
---THIS IS WHERE THE LOOKUP TABLES END
---
---
---
create table Foster_Care_Parent
(
Foster_Parent_ID INT IDENTITY(1,1) PRIMARY KEY,
Foster_Parent_Name varchar(200),
Foster_Parent_Surname varchar(200),
Foster_Parent_Address varchar(200),
Foster_Parent_CellNumber varchar(200),
Foster_Parent_WorkNumber varchar(200),
Foster_Parent_Email varchar(200),
Foster_Parent_IDNumber INT,
Foster_Parent_Last_Modified DATETIME,
Num_In_Household INT,
Type_Of_Housing varchar(200),
Ownership_Housing varchar(200),
Hours_Left_Alone INT,
Foster_Parent_Status_ID INT,
Adopter_ID int,
Constraint fkfos foreign key (Adopter_ID) references Adopter(Adopter_ID),
Constraint fkfos1 foreign key (Foster_Parent_Status_ID) references Foster_Care_Parent_Status(Foster_Parent_Status_ID)
)
go

create table Foster_Care
(
Foster_Care_ID INT IDENTITY(1,1) PRIMARY KEY,
Foster_Care_Period varchar(200),
Foster_Start_Date date,
Foster_Parent_ID int,
Animal_ID int,
Constraint fkfosc foreign key (Animal_ID) references Animal(Animal_ID),
Constraint fkfosc1 foreign key (Foster_Parent_ID) references Foster_Care_Parent(Foster_Parent_ID)
)
go
create table Event_Schedule
(
Event_Schedule_ID INT IDENTITY(1,1) PRIMARY KEY,
Schedule_Subject nvarchar(100),
Schedule_Description nvarchar(300),
Schedule_Start datetime,
Schedule_End datetime,
Schedule_ThemeColor nvarchar(30),
IsFullDay bit,
)
go

create table Employee
(
Emp_ID INT IDENTITY(1,1) PRIMARY KEY,
Emp_Name nvarchar(150),
Emp_Surname varchar(150),
Emp_ContactNumber nvarchar(12),
Emp_IDNumber nvarchar(150),
Emp_Email nvarchar (254),
Emp_Contract nvarchar(254),
Emp_Date_Employed date,
Title_ID int,
Emp_Type_ID int,
Constraint fkemp foreign key (Title_ID) references Title(Title_ID),
Constraint fkemp1 foreign key (Emp_Type_ID) references Employee_Type(Emp_Type_ID)
)
go

create table TimeSheet
(
TimeSheet_ID INT IDENTITY(1,1) PRIMARY KEY,
Check_in datetime,
Check_out datetime,
Emp_ID int,
Constraint fktime foreign key (Emp_ID) references Employee(Emp_ID)
)
go

create table Volunteer
(
Vol_ID INT IDENTITY(1,1) PRIMARY KEY,
Vol_Name nvarchar(200),
Vol_Surname nvarchar(100),
Vol_Email nvarchar(254),
Vol_ContactNumber nvarchar(15),
Vol_Address nvarchar(250),
Vol_Emergency_ContactName nvarchar(150),
Vol_Emergency_ContactNumber nvarchar(15),
Title_ID int,
Constraint fkvol foreign key (Title_ID) references Title(Title_ID)
)
go
create table Volunteer_Hours
(
Vol_Hours_ID INT IDENTITY(1,1) PRIMARY KEY,
Vol_workDate Date,
Vol_Start_Time datetime,
Vol_End_Time datetime,
Vol_ID int,
Vol_WorkType_ID int,
Constraint fkvolhrs foreign key (Vol_ID) references Volunteer(Vol_ID),
Constraint fkvolhrs1 foreign key (Vol_WorkType_ID) references Volunteer_Work_Type(Vol_WorkType_ID)
)
go
create table Payment
(
Payment_ID INT IDENTITY(1,1) PRIMARY KEY,
Payment_Description nvarchar (200),
Amount_Paid decimal(15),
Payment_Date Datetime,
Payment_Type_ID int,
Constraint fkpay foreign key (Payment_Type_ID) references Payment_Type(Payment_Type_ID)
)
go
create table Stock
(
Stock_ID INT IDENTITY(1,1) PRIMARY KEY,
Stock_Name nvarchar (200),
Stock_Quantity int,
Stock_Description nvarchar (200),
Stock_Type_ID int,
Packaging_Type_ID int,
Unit_Type_ID int,
Constraint fkstock foreign key (Stock_Type_ID) references Stock_Type(Stock_Type_ID),
Constraint fkstock1 foreign key (Packaging_Type_ID) references Packaging_Type(Packaging_Type_ID),
Constraint fkstock2 foreign key (Unit_Type_ID) references Unit_Type(Unit_Type_ID)
)
go
create table Donor
(
Donor_ID INT IDENTITY(1,1) PRIMARY KEY,
Donor_Name nvarchar (200),
Donor_Surname nvarchar (200),
Donor_Email nvarchar (200),
Title_ID int,
Constraint fkdonor foreign key (Title_ID) references Title(Title_ID)
)
go
create table Donation
(
Donation_ID INT IDENTITY(1,1) PRIMARY KEY,
Donation_Date datetime,
Donor_ID int,
Constraint fkdon foreign key (Donor_ID) references Donor(Donor_ID)
)
go
create table Donation_Line
(
Donation_Line_ID INT IDENTITY(1,1) PRIMARY KEY,
Donation_Quantity Decimal (15),
Stock_ID int,
Donation_ID int,
Donation_Type_ID int,
Constraint fkdonl foreign key (Stock_ID) references Stock(Stock_ID),
Constraint fkdonl1 foreign key (Donation_ID) references Donation(Donation_ID),
Constraint fkdonl2 foreign key (Donation_Type_ID) references Donation_Type(Donation_Type_ID)
)
go
create table Adopter
(
Adopter_ID INT IDENTITY(1,1) PRIMARY KEY,
Adopter_Name nvarchar (200),
Adopter_Surname nvarchar (200),
Adopter_Email nvarchar (200),
Title_ID int,
Adopter_Address  nvarchar (200), 
Adopter_PostalAddress  nvarchar (200), 
Adopter_HomeNumber  nvarchar (200), 
Adopter_WorkNumber  nvarchar (200), 
Adopter_CellNumber  nvarchar (200), 
Adopter_CarRegistartion_Number  nvarchar (200), 
Adopter_Employer  nvarchar (200), 
Adopter_Status_ID  int, 
Amount_of_Family_Memebers int,
No_of_Children int,
Age_of_Children int,
Property_Securely_Closed bit,
Properyty_Include_Pool bit,
Pool_Secured bit,
Animal_Shelter_Available bit,
Sick_Animal bit,
Sick_Animal_Diagnosis nvarchar(354),
Animal_Sleep_Location nvarchar (354),
Given_Animal_Away bit,
HomeCheck_Suburb nvarchar (354),
Type_of_House nvarchar (354),
Adopted_Before bit,
Complex_or_Flat bit,
Animal_Allowed bit,
Animal_Captivity nvarchar (354),
Animal_Vaccines_Updated bit,
Constraint fkado foreign key (Title_ID) references Title(Title_ID),
Constraint fkado1 foreign key (Adopter_Status_ID) references Adopter_Status(Adopter_Status_ID)
)
go
create table Adopter_Contract
(
Contract_ID INT IDENTITY(1,1) PRIMARY KEY,
Electronic_Contract  Varchar(max),
Adopter_ID int,
Constraint fkadoc foreign key (Adopter_ID) references Adopter(Adopter_ID)
)
go
create table Adopter_Relative
(
Relative_ID INT IDENTITY(1,1) PRIMARY KEY,
Relative_Name nvarchar (200),
Relative_Surname nvarchar (200),
Relative_Email nvarchar (200),
Relative_Address  nvarchar (200), 
Relative_PostalAddress  nvarchar (200), 
Relative_Home_Tel  nvarchar (200), 
Relative_Work_Tel   nvarchar (200), 
Relative_Cell  nvarchar (200), 
Relationship  nvarchar (200), 
Adopter_ID int,
Constraint fkador foreign key (Adopter_ID) references Adopter(Adopter_ID)
)
go
create table Kennel
(
Kennel_ID INT IDENTITY(1,1) PRIMARY KEY,
Kennel_Name nvarchar (200),
Kennel_Number int,
Kennel_Capacity int
)
go
create table Emp_Kennel
(
Emp_Kennel_ID INT IDENTITY(1,1) PRIMARY KEY,
Emp_ID int,
Kennel_ID int,
Constraint fkempk foreign key (Emp_ID) references Employee(Emp_ID),
Constraint fkempk1 foreign key (Kennel_ID) references Kennel(Kennel_ID)
)
go
create table Animal
(
Animal_ID INT IDENTITY(1,1) PRIMARY KEY,
Animal_Image varchar(max),
Animal_Name varchar(150),
Animal_Description varchar(200),
Animal_Gender varchar(50),
Animal_Age int,
Animal_Sterilization bit,
Animal_Castration bit,
Animal_Size varchar(10),
Animal_Entry_Date datetime,
Animal_Coat varchar(100),
Animal_Status_ID int,
Constraint fkani foreign key (Animal_Status_ID) references Animal_Status(Animal_Status_ID)
)
go
create table CrossBreed
(
CrossBreed_ID INT IDENTITY(1,1) PRIMARY KEY,
Animal_ID int,
Animal_Breed_ID int
Constraint fkcrb foreign key (Animal_ID) references Animal(Animal_ID),
Constraint fkcrb1 foreign key (Animal_Breed_ID) references Animal_Breed(Animal_Breed_ID)
)
go
create table Microchip
(
Microchip_ID INT IDENTITY(1,1) PRIMARY KEY,
Animal_Microchip_Code nvarchar(50),
Date_of_Implant date,
Implanters_PIN_Number nvarchar(10),
Owner_Name varchar (200),
Owner_Address varchar (200),
Animal_ID int,
Constraint fkmicro foreign key (Animal_ID) references Animal(Animal_ID)
)
go
create table Animal_Kennel_History
(
Animal_Kennel_History_ID INT IDENTITY(1,1) PRIMARY KEY,
Animal_ID int,
Kennel_ID int,
Constraint fkanikh foreign key (Animal_ID) references Animal(Animal_ID),
Constraint fkanikh1 foreign key (Kennel_ID) references Kennel(Kennel_ID)
)
go
create table Adoption
(
Adoption_ID INT IDENTITY(1,1) PRIMARY KEY,
Adoption_Date datetime,
Adoption_Form Varchar(max),
Payment_ID int,
Adopter_ID int,
Adopt_Status_ID int,
Animal_ID int,
Collection_Date datetime,
Constraint fkadopt foreign key (Animal_ID) references Animal(Animal_ID),
Constraint fkadopt1 foreign key (Payment_ID) references Payment(Payment_ID),
Constraint fkadopt2 foreign key (Adopt_Status_ID) references Adoption_Status(Adopt_Status_ID),
Constraint fkadopt3 foreign key (Adopter_ID) references Adopter(Adopter_ID)
)
go
create table HomeCheck
(
HomeCheck_ID INT IDENTITY(1,1) PRIMARY KEY,
HomeCheck_Datetime datetime,
Adoption_ID int,
Constraint fkhoch foreign key (Adoption_ID) references Adoption(Adoption_ID)
)
go
create table Veterinarian
(
Vet_ID INT IDENTITY(1,1) PRIMARY KEY,
Vet_Name nVarchar(150),
Vet_Emial nVarchar(254),
Vet_Tel nVarchar(15),
Vet_Address nVarchar(300),
)
go
create table Vet_Appointment
(
Vet_Appointment_ID INT IDENTITY(1,1) PRIMARY KEY,
Vet_ID int,
Constraint fkvetap foreign key (Vet_ID) references Veterinarian(Vet_ID)
)
go

create table Vet_Appointment_Line
(
Vet_Appoint_Line_ID INT IDENTITY(1,1) PRIMARY KEY,
Vet_Appoint_Line_Status int,
Animal_ID int,
Vet_Appointment_ID int,
Constraint fkvetapl foreign key (Animal_ID) references Animal(Animal_ID),
Constraint fkvetapl1 foreign key (Vet_Appointment_ID) references Vet_Appointment(Vet_Appointment_ID)
)
go

create table Capture_Medical_Card
(
Capture_Medical_Card_ID INT IDENTITY(1,1) PRIMARY KEY,
Diagnosis_Details nvarchar (254),
Capture_Medical_Card_Date datetime,
Capture_Medical_Card_NextAppointment_Date datetime,
Vet_Appoint_Line_ID int,
Constraint fkcapmed foreign key (Vet_Appoint_Line_ID) references Vet_Appointment_Line(Vet_Appoint_Line_ID)
)
go
create table Animal_Treatment
(
Treat_ID INT IDENTITY(1,1) PRIMARY KEY,
Treat_StartDate date,
Treat_EndDate date,
Treat_Quantity int,
Treat_Regularity varchar(50),
Treat_Name varchar(150),
Treat_cost decimal,
Capture_Medical_Card_ID int,
Constraint fkanitreat foreign key (Capture_Medical_Card_ID) references Capture_Medical_Card(Capture_Medical_Card_ID)
)
go
create table Event_
(
Event_ID INT IDENTITY(1,1) PRIMARY KEY,
Event_Name varchar(150),
Event_StartTime datetime,
Event_EndTime datetime,
Event_Guest_Number int,
Event_Ticket_Price decimal(12),
Event_Location varchar(200),
Event_Description varchar(200),
Event_Type_ID int,
Constraint fkevnt foreign key (Event_Type_ID) references Event_Type(Event_Type_ID)
)
go
create table Customer_Event
(
Customer_Event_ID INT IDENTITY(1,1) PRIMARY KEY,
Customer_Event_Name varchar (150),
Customer_Event_Surname varchar(150),
Customer_Event_Email nvarchar(254),
Number_of_tickects int,
TicketFee_Date datetime,
TicketFee_Total decimal(15),
Event_ID int,
Payment_ID int,
Constraint fkcevnt foreign key (Event_ID) references Event_(Event_ID),
Constraint fkcevnt1 foreign key (Payment_ID) references Payment(Payment_ID)
)
go
create table Role_
(
Role_ID INT IDENTITY(1,1) PRIMARY KEY,
Role_Name nvarchar (100)
)
go

create table User_
(
UserID INT IDENTITY(1,1) PRIMARY KEY,
Username nvarchar(150),
Emp_ID int,
Constraint fkuser foreign key (Emp_ID) references Employee(Emp_ID)
)
go
create table UserRole
(
UserRole_ID INT IDENTITY(1,1) PRIMARY KEY,
UserID int,
Role_ID int,
Constraint fkuserol foreign key (UserID) references User_(UserID),
Constraint fkuserol1 foreign key (Role_ID) references Role_(Role_ID)
)
go
create table Audit_Log
(
Auditlog_ID INT IDENTITY(1,1) PRIMARY KEY,
Auditlog_DateTime datetime,
Transaction_Type varchar,
Critical_Date varchar,
UserID int,
Constraint fkaudlog foreign key (UserID) references User_(UserID)
)
go
