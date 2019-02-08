--drop database ELearning
--use ELearning
create table UserGroup (
Prioriteti int not null primary key,
Roli varchar(10) not null
)

create table Personi(
PersoniID int primary key not null identity (1,1),
Emri varchar(20) not null,
Mbiemri varchar(20) not null,
Gjinia char not null,
NrTelefonit varchar (30) not null,
Email varchar (30) not null,
Mosha int not null,
Aktiv bit not null default 1
)
create table Useri (
UseriID int not null primary key identity(1,1),
Username varchar(20) not null,
Passwordi varchar(20) not null,
Prioriteti int foreign key references UserGroup(Prioriteti),
personi int foreign key references personi(personiid) not null,
CreatedBy int foreign key references Useri(useriid) not null ,
ModifiedBy int foreign key references Useri(useriid) null,
CreatedDate date,
ModifiedDate date
)

create table Programi(
ProgramiID int not null primary key identity(1,1),
Emri varchar(20) not null,
Aktiv bit not null default 1,
CreatedBy int foreign key references Useri(useriid) not null ,
ModifiedBy int foreign key references Useri(useriid) null,
CreatedDate date,
ModifiedDate date
)

create table Kursi(
KursiID int not null primary key identity(1,1),
Emri varchar(20) not null,
Programi int foreign key references Programi(ProgramiID),
Aktiv bit not null default 1,
CreatedBy int foreign key references Useri(useriid) not null ,
ModifiedBy int foreign key references Useri(useriid) null,
CreatedDate date,
ModifiedDate date
)

create table Syllabusi (
SyllabusiID int not null primary key identity(1,1),
Kreditet int not null,
Pershkrimi varchar(1000) not null,
Literatura varchar(1000) not null,
MetodaVleresimit varchar(100) not null,
NumriUshtrimeve int not null,
NumriLigjeratave int not null,
Aktiv bit not null default 1,
CreatedBy int foreign key references Useri(useriid) not null ,
ModifiedBy int foreign key references Useri(useriid) null,
CreatedDate date,
ModifiedDate date
)

create table Administratori (
AdministratoriID int not null foreign key references personi(personiid)
)

create table Studenti (
StudentiID int not null foreign key references personi(personiid),
VitiAkademik varchar(10) not null
)

create table Profesori(
ProfesoriID int not null foreign key references personi(personiid),
TitulliAkademik varchar (30) not null
)

create table ProfesoriKursi(
ProfesoriKursiID int not null primary key identity(1,1),
ProfesoriID int foreign key references Personi(Personiid),
KursiID int foreign key references Kursi(KursiID),
SyllabusiID int foreign key references Syllabusi(SyllabusiID)
)

create table request
(
requestid int not null primary key identity(1,1),
ProfesoriKursi int not null foreign key references ProfesoriKursi(ProfesoriKursiID),
studenti int not null foreign key references Personi(personiID),
CreatedBy int foreign key references Useri(useriid) not null ,
CreatedDate date
)

insert into UserGroup VALUES('0', 'Student')
insert into UserGroup VALUES('1', 'Profesor')
insert into UserGroup VALUES('2', 'Admin')

alter table Personi ADD Menaxheri int foreign key references useri(useriid)
alter table Personi ADD KrijuarNga int NOT NULL foreign key references useri(useriid)
alter table Personi ADD ModifikuarNga int foreign key references useri(useriid)
alter table Request add aprovuar bit default 0

-- PROCEDURAT PER STUDENT
----------------------------------------------------------------
go
create procedure StudentiSelectByID

@StudentiID int
as
Select * 
from Studenti inner join personi on
				StudentiID=PersoniID
where StudentiID = @StudentiID and Aktiv = '1'
go
----------------------------------------------------------------
create procedure StudentiInsert
@personi int,
@VitiAkademik varchar(10),
@Useri int

as

insert into Studenti VALUES(@personi,@VitiAkademik)

go
----------------------------------------------------------------
create procedure StudentiUpdate
@personiid int,
@VitiAkademik varchar(10)

as

update Studenti set VitiAkademik=@VitiAkademik
where StudentiID=@personiid

go
----------------------------------------------------------------
--create procedure StudentiDelete
--@StudentiID int

--as

--update Studenti set Aktiv = '0' where StudentiID = @StudentiID 

--go
----------------------------------------------------------------


--PROCEDURAT PER PROFESORIN
----------------------------------------------------------------
create procedure ProfesoriSelectByID

@ProfesoriID int
as
Select * 
from Profesori inner join personi on
				ProfesoriID=PersoniID
where ProfesoriID= @profesoriid and Aktiv = '1'
go
----------------------------------------------------------------
create procedure ProfesoriInsert
@ProfesoriID int,
@TitulliAkademik varchar(10)

as

insert into Profesori VALUES(@ProfesoriID, @TitulliAkademik)

go
----------------------------------------------------------------
create procedure ProfesoriUpdate
@ProfesoriID int,
@TitulliAkademik varchar(10)

as

update Profesori set TitulliAkademik=@TitulliAkademik
where ProfesoriID=@ProfesoriID

go
----------------------------------------------------------------
--create procedure ProfesoriDelete
--@ProfesoriID int

--as

--update Profesori set Aktiv = '0' where ProfesoriID = @ProfesoriID 

--go
----------------------------------------------------------------


--PROCEDURAT PER UserGroup
----------------------------------------------------------------
create procedure UserGroupSelectByID
@Prioriteti int

as

Select * from UserGroup where Prioriteti = @Prioriteti
go
----------------------------------------------------------------

--PROCEDURAT PER Useri
----------------------------------------------------------------
create procedure UseriSelectByID
@UseriID int

as

select * from Useri where UseriID = @UseriID

go
----------------------------------------------------------------

--PROCEDURAT PER Programi
----------------------------------------------------------------
create procedure ProgramiSelectByID
@ProgramiID int

as

select * from Programi where ProgramiID = @ProgramiID

go
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure KursiSelectByID
@KursiID int

as

select * from Kursi where KursiID = @KursiID

go
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure SyllabusiSelectByID
@SyllabusiID int

as

select * from Syllabusi where SyllabusiID = @SyllabusiID

go
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure AdministratoriSelectByID
@AdministratoriID int

as

select * from Administratori where AdministratoriID = @AdministratoriID

go
----------------------------------------------------------------
procedurat per Personin
----------------------------------------------------------------
create procedure PersoniSelectByID
@personiid int
as
select * from Personi 
where PersoniID=@personiid
go
----------------------------------------------------------------
create procedure PersoniInsert
@PersoniID int,
@Emri varchar(20) ,
@Mbiemri varchar(20) ,
@Gjinia char ,
@NrTelefonit varchar (30) ,
@Email varchar (30) ,
@Mosha int 
as
insert into Personi(PersoniID,Emri,Mbiemri,Gjinia,NrTelefonit,Email,Mosha) values(@PersoniID, @Emri,@Mbiemri,@Gjinia,@NrTelefonit,@Email,@Mosha)
go
----------------------------------------------------------------
procedura per request
---------------------------------------------------
alter procedure MakeRequest
@ProfesoriKursi int,
@studenti int
as
insert into request(ProfesoriKursi,studenti) values (@ProfesoriKursi,@studenti)
go
--------------------------------------------------------------
create procedure readAllRequest
as
select * from request
go
--------------------------------------------------------------
create procedure requestSelectByID
@requestid int 
as
select * from request where requestid=@requestid
go

---------------------------------------------------------------

create procedure requestUpdateByID
@requestid int
as
update request set aprovuar=1
where requestid=@requestid
go

------------------------------------------
create procedure GetKursiByProfesoriID
@profesoriid int
as
select * from ProfesoriKursi
where ProfesoriID=@profesoriid
go