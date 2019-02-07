create database E_Learning

create table User_Group (
Prioriteti int not null primary key,
Roli varchar(10) not null
)

create table Useri (
Useri_ID int not null primary key identity(1,1),
Username varchar(20) not null,
Passwordi varchar(20) not null,
Prioriteti int foreign key references User_Group(Prioriteti)
)

create table Programi(
Programi_ID int not null primary key identity(1,1),
Emri varchar(20) not null,
Aktiv bit not null default 1
)

create table Kursi(
Kursi_ID int not null primary key identity(1,1),
Emri varchar(20) not null,
Programi int foreign key references Programi(Programi_ID),
Aktiv bit not null default 1
)

create table Syllabusi (
Syllabusi_ID int not null primary key identity(1,1),
Kreditet int not null,
Pershkrimi varchar(1000) not null,
Literatura varchar(1000) not null,
Metoda_Vleresimit varchar(100) not null,
Numri_Oreve int not null,
Numri_Ushtrimeve int not null,
Numri_Ligjeratave int not null,
Aktiv bit not null default 1
)

create table Administratori (
Administratori_ID int not null primary key identity(1,1),
Emri varchar(20) not null,
Mbiemri varchar(20) not null,
Email varchar (30) not null,
Mosha int not null,
Nr_Telefonit varchar (30) not null,
Useri int not null foreign key references Useri(Useri_ID),
Aktiv bit not null default 1
)

create table Studenti (
Studenti_ID int not null primary key identity(1,1),
Emri varchar(20) not null,
Mbiemri varchar(20) not null,
Gjinia char not null,
Nr_Telefonit varchar (30) not null,
Email varchar (30) not null,
Mosha int not null,
Viti_Akademik varchar(10) not null,
Modifikuar_Nga int foreign key references Administratori(Administratori_ID),
Useri int not null foreign key references Useri(Useri_ID),
Aktiv bit not null default 1
)

create table Profesori(
Profesori_ID int not null primary key identity(1,1),
Emri varchar(20) not null,
Mbiemri varchar(20) not null,
Gjinia char not null,
Nr_Telefonit varchar (30) not null,
Email varchar (30) not null,
Mosha int not null,
Titulli_Akademik varchar (30) not null,
Modifikuar_Nga int foreign key references Administratori(Administratori_ID),
Useri int not null foreign key references Useri(Useri_ID),
Aktiv bit not null default 1
)

create table Profesori_Kursi(
Profesori_Kursi_ID int not null primary key identity(1,1),
Profesori_ID int foreign key references Profesori(Profesori_ID),
Kursi_ID int foreign key references Kursi(Kursi_ID),
Syllabusi_ID int foreign key references Syllabusi(Syllabusi_ID)
)

insert into User_Group VALUES('0', 'Student')
insert into User_Group VALUES('1', 'Profesor')
insert into User_Group VALUES('2', 'Admin')

-- PROCEDURAT PER STUDENT
----------------------------------------------------------------
go
create procedure StudentiSelectByID

@Studenti_ID int
as
Select * from Studenti where Studenti_ID = @Studenti_ID and Aktiv = '1'
go
----------------------------------------------------------------
create procedure StudentiInsert
@Emri varchar(20),
@Mbiemri varchar(20),
@Gjinia char,
@Nr_Telefonit varchar(30),
@Email varchar(30),
@Mosha int,
@Viti_Akademik varchar(10),
@Useri int

as

insert into Studenti VALUES(@Emri, @Mbiemri, @Gjinia, @Nr_Telefonit,
@Email, @Mosha, @Viti_Akademik, null, @Useri, '1')

go
----------------------------------------------------------------
create procedure StudentiUpdate
@Emri varchar(20),
@Mbiemri varchar(20),
@Gjinia char,
@Nr_Telefonit varchar(30),
@Email varchar(30),
@Mosha int,
@Viti_Akademik varchar(10),
@Modifikuar_Nga int,
@Useri int

as

update Studenti set Emri=@Emri, Mbiemri=@Mbiemri, Gjinia=@Gjinia, Nr_telefonit=@Nr_Telefonit,
Email=@Email, Mosha=@Mosha, Viti_Akademik=@Viti_Akademik, Modifikuar_Nga=@Modifikuar_Nga, Useri=@Useri

go
----------------------------------------------------------------
create procedure StudentiDelete
@Studenti_ID int

as

update Studenti set Aktiv = '0' where Studenti_ID = @Studenti_ID 

go
----------------------------------------------------------------


--PROCEDURAT PER PROFESORIN
----------------------------------------------------------------
create procedure ProfesoriSelectByID

@Profesori_ID int
as
Select * from Profesori where Profesori_ID = @Profesori_ID and Aktiv = '1'
go
----------------------------------------------------------------
create procedure ProfesoriInsert
@Emri varchar(20),
@Mbiemri varchar(20),
@Gjinia char,
@Nr_Telefonit varchar(30),
@Email varchar(30),
@Mosha int,
@Titulli_Akademik varchar(10),
@Useri int

as

insert into Profesori VALUES(@Emri, @Mbiemri, @Gjinia, @Nr_Telefonit,
@Email, @Mosha, @Titulli_Akademik, null, @Useri, '1')

go
----------------------------------------------------------------
create procedure ProfesoriUpdate
@Emri varchar(20),
@Mbiemri varchar(20),
@Gjinia char,
@Nr_Telefonit varchar(30),
@Email varchar(30),
@Mosha int,
@Titulli_Akademik varchar(10),
@Modifikuar_Nga int,
@Useri int

as

update Profesori set Emri=@Emri, Mbiemri=@Mbiemri, Gjinia=@Gjinia, Nr_telefonit=@Nr_Telefonit,
Email=@Email, Mosha=@Mosha, Titulli_Akademik=@Titulli_Akademik, Modifikuar_Nga=@Modifikuar_Nga, Useri=@Useri

go
----------------------------------------------------------------
create procedure ProfesoriDelete
@Profesori_ID int

as

update Profesori set Aktiv = '0' where Profesori_ID = @Profesori_ID 

go
----------------------------------------------------------------


--PROCEDURAT PER User_Group
----------------------------------------------------------------
create procedure UserGroupSelectByID
@Prioriteti int

as

Select * from User_Group where Prioriteti = @Prioriteti
go
----------------------------------------------------------------

--PROCEDURAT PER Useri
----------------------------------------------------------------
create procedure UseriSelectByID
@Useri_ID int

as

select * from Useri where Useri_ID = @Useri_ID

go
----------------------------------------------------------------

--PROCEDURAT PER Programi
----------------------------------------------------------------
create procedure ProgramiSelectByID
@Programi_ID int

as

select * from Programi where Programi_ID = @Programi_ID

go
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure KursiSelectByID
@Kursi_ID int

as

select * from Kursi where Kursi_ID = @Kursi_ID

go
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure SyllabusiSelectByID
@Syllabusi_ID int

as

select * from Syllabusi where Syllabusi_ID = @Syllabusi_ID

go
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure AdministratoriSelectByID
@Administratori_ID int

as

select * from Administratori where Administratori_ID = @Administratori_ID

go
----------------------------------------------------------------