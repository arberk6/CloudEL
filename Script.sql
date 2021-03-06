USE [master]
GO
/****** Object:  Database [ELearning]    Script Date: 11/02/2019 23:38:18 ******/
CREATE DATABASE [ELearning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELearning', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ELearning.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ELearning_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ELearning_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ELearning] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELearning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELearning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELearning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELearning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELearning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELearning] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELearning] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ELearning] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ELearning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELearning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELearning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELearning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELearning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELearning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELearning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELearning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELearning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ELearning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELearning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELearning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELearning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELearning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELearning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELearning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELearning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ELearning] SET  MULTI_USER 
GO
ALTER DATABASE [ELearning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELearning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELearning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELearning] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ELearning]
GO
/****** Object:  User [hack]    Script Date: 11/02/2019 23:38:18 ******/
CREATE USER [hack] FOR LOGIN [hack] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [arber]    Script Date: 11/02/2019 23:38:18 ******/
CREATE USER [arber] FOR LOGIN [arber] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[AdministratoriSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure [dbo].[AdministratoriSelectByID]
@AdministratoriID int

as

select * from Administratori where AdministratoriID = @AdministratoriID


GO
/****** Object:  StoredProcedure [dbo].[aproveRequestForStudent]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[aproveRequestForStudent]
@studentiID int ,
@profesoriKursi int
as
update request set aprovuarNgaAdministratori='approved'
where studenti=5 and ProfesoriKursi=1

GO
/****** Object:  StoredProcedure [dbo].[denyRequestForStudent]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
create procedure [dbo].[denyRequestForStudent]
@studentiID int,
@profesoriKursi int
as
update request set aprovuarNgaAdministratori='denied'
where studenti=@studentiID and ProfesoriKursi=@profesoriKursi

GO
/****** Object:  StoredProcedure [dbo].[denyRequestsByAdministratoriOnAll]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------

create procedure [dbo].[denyRequestsByAdministratoriOnAll]
@ProfesoriKursiid int
as
update request set 
aprovuarNgaAdministratori='denied'
where ProfesoriKursi=@ProfesoriKursiid

GO
/****** Object:  StoredProcedure [dbo].[GetKursiByProfesoriID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------
create procedure [dbo].[GetKursiByProfesoriID]
@profesoriid int
as
select * from ProfesoriKursi
where ProfesoriID=@profesoriid

GO
/****** Object:  StoredProcedure [dbo].[GetProfKursiByProfIDandKursiID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
create procedure [dbo].[GetProfKursiByProfIDandKursiID]
@ProfesoriID int,
@KursiID int

as
Select ProfesoriKursiID from ProfesoriKursi where ProfesoriID = @ProfesoriID AND KursiID = @KursiID

GO
/****** Object:  StoredProcedure [dbo].[getRequestsByProfesoriKursi]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------

--------------------------------------------------------------
create procedure [dbo].[getRequestsByProfesoriKursi]
@ProfesoriKursiid int
as
select r.requestid as 'RequestID',p.PersoniID as 'StudentiID',p.Emri as 'Emri', p.Mbiemri as 'Mbiemri', prog.Emri as 'Programi'
from request r inner join Personi p 
				on p.PersoniID=r.studenti
				inner join ProfesoriKursi pk
				on r.ProfesoriKursi=pk.ProfesoriKursiID
					inner join kursi k
					on k.KursiID = pk.KursiID
						inner join Programi prog
						on prog.ProgramiID=k.Programi
where r.ProfesoriKursi=@ProfesoriKursiid and aprovuarNgaAdministratori='waiting'

GO
/****** Object:  StoredProcedure [dbo].[GetStudentsByProfesoriIDKursiID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetStudentsByProfesoriIDKursiID]
@profesoriid int,
@kursiid int
as
select Personi.*, Studenti.VitiAkademik, request.requestid from Personi join Studenti on Personi.PersoniID = Studenti.StudentiID 
join request on Studenti.StudentiID = request.studenti
join ProfesoriKursi on ProfesoriKursi.ProfesoriKursiID = request.ProfesoriKursi
join Profesori on Profesori.ProfesoriID = ProfesoriKursi.ProfesoriID 
where Profesori.ProfesoriID = @profesoriid and ProfesoriKursi.KursiID = @kursiid 

GO
/****** Object:  StoredProcedure [dbo].[GetStudentsRequestByProfesoriIDKursiID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------
create procedure [dbo].[GetStudentsRequestByProfesoriIDKursiID]
@profesoriid int,
@kursiid int
as
select Personi.*, Studenti.VitiAkademik, request.requestid from Personi join Studenti on Personi.PersoniID = Studenti.StudentiID 
join request on Studenti.StudentiID = request.studenti
join ProfesoriKursi on ProfesoriKursi.ProfesoriKursiID = request.ProfesoriKursi
join Profesori on Profesori.ProfesoriID = ProfesoriKursi.ProfesoriID 
where Profesori.ProfesoriID = @profesoriid and ProfesoriKursi.KursiID = @kursiid 

GO
/****** Object:  StoredProcedure [dbo].[InsertRequest]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
create procedure [dbo].[InsertRequest]
@ProfesoriKursiID int,
@StudentiID int

as

insert into request VALUES(@ProfesoriKursiID, @StudentiID, '0', '0', GETDATE())


GO
/****** Object:  StoredProcedure [dbo].[KursiSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure [dbo].[KursiSelectByID]
@KursiID int

as

select * from Kursi where KursiID = @KursiID


GO
/****** Object:  StoredProcedure [dbo].[MakeRequest]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
--procedura per request
---------------------------------------------------
create procedure [dbo].[MakeRequest]
@ProfesoriKursi int,
@studenti int
as
insert into request(ProfesoriKursi,studenti,aprovuarNgaAdministratori,aprovuarNgaProfesori) values (@ProfesoriKursi,@studenti,'waiting','waiting')

GO
/****** Object:  StoredProcedure [dbo].[PersoniInsert]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[PersoniInsert]
@PersoniID int,
@Emri varchar(20) ,
@Mbiemri varchar(20) ,
@Gjinia char ,
@NrTelefonit varchar (30) ,
@Email varchar (30) ,
@Mosha int 
as
insert into Personi(PersoniID,Emri,Mbiemri,Gjinia,NrTelefonit,Email,Mosha) values(@PersoniID, @Emri,@Mbiemri,@Gjinia,@NrTelefonit,@Email,@Mosha)

GO
/****** Object:  StoredProcedure [dbo].[PersoniSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
--procedurat per Personin
----------------------------------------------------------------
create procedure [dbo].[PersoniSelectByID]
@personiid int
as
select * from Personi 
where PersoniID=@personiid

GO
/****** Object:  StoredProcedure [dbo].[ProfesoriInsert]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[ProfesoriInsert]
@ProfesoriID int,
@TitulliAkademik varchar(10)

as

insert into Profesori VALUES(@ProfesoriID, @TitulliAkademik)


GO
/****** Object:  StoredProcedure [dbo].[ProfesoriSelectByEmriAndMbiemri]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[ProfesoriSelectByEmriAndMbiemri]

@EmriProfes varchar(10),
@MbiemriProfes varchar(10)

as

Select ProfesoriID from Profesori p
inner join Personi pers on p.ProfesoriID = pers.PersoniID
where pers.Emri = @EmriProfes AND pers.Mbiemri = @MbiemriProfes

GO
/****** Object:  StoredProcedure [dbo].[ProfesoriSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
--create procedure StudentiDelete
--@StudentiID int

--as

--update Studenti set Aktiv = '0' where StudentiID = @StudentiID 

--go
----------------------------------------------------------------


--PROCEDURAT PER PROFESORIN
----------------------------------------------------------------
create procedure [dbo].[ProfesoriSelectByID]

@ProfesoriID int
as
Select * 
from Profesori inner join personi on
				ProfesoriID=PersoniID
where ProfesoriID= @profesoriid and Aktiv = '1'

GO
/****** Object:  StoredProcedure [dbo].[ProfesoriUpdate]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[ProfesoriUpdate]
@ProfesoriID int,
@TitulliAkademik varchar(10)

as

update Profesori set TitulliAkademik=@TitulliAkademik
where ProfesoriID=@ProfesoriID


GO
/****** Object:  StoredProcedure [dbo].[ProgramiSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------

--PROCEDURAT PER Programi
----------------------------------------------------------------
create procedure [dbo].[ProgramiSelectByID]
@ProgramiID int

as

select * from Programi where ProgramiID = @ProgramiID


GO
/****** Object:  StoredProcedure [dbo].[readAllRequest]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------
create procedure [dbo].[readAllRequest]
as
select * from request
where aprovuarNgaAdministratori='waiting'

GO
/****** Object:  StoredProcedure [dbo].[readRequests]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------
create procedure [dbo].[readRequests]
as
select pk.ProfesoriKursiID,p.Emri as 'Profesori', k.Emri as 'Kursi', count(r.studenti) as 'Numri'
from request r inner join ProfesoriKursi pk
				on pk.ProfesoriKursiID=r.ProfesoriKursi
					inner join Personi p 
					on p.PersoniID = pk.ProfesoriID
					inner join Kursi k
					on k.KursiID=pk.KursiID
where aprovuarNgaAdministratori='waiting'
group by pk.ProfesoriKursiID, p.Emri, k.Emri

GO
/****** Object:  StoredProcedure [dbo].[requestAprovedByAdministratori]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------

create procedure [dbo].[requestAprovedByAdministratori]
@requestid int
as
update request set aprovuarNgaAdministratori='approved'
where requestid=@requestid  

GO
/****** Object:  StoredProcedure [dbo].[requestAprovedByProfesori]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[requestAprovedByProfesori]
@requestid int
as
update request set aprovuarNgaProfesori='approved'
where requestid=@requestid  

GO
/****** Object:  StoredProcedure [dbo].[requestDeniedByAdministratori]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[requestDeniedByAdministratori]
@requestid int
as
update request set aprovuarNgaAdministratori='denied'
where requestid=@requestid  

GO
/****** Object:  StoredProcedure [dbo].[requestDeniedByProfesori]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[requestDeniedByProfesori]
@requestid int
as
update request set aprovuarNgaProfesori='denied'
where requestid=@requestid  

GO
/****** Object:  StoredProcedure [dbo].[requestSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------
create procedure [dbo].[requestSelectByID]
@requestid int 
as
select * from request where requestid=@requestid

GO
/****** Object:  StoredProcedure [dbo].[SelectAllKurset]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
create procedure [dbo].[SelectAllKurset]
as
select k.Emri as 'EmriKursit', pers.Emri, pers.Mbiemri, s.Kreditet, s.NumriLigjeratave, s.NumriUshtrimeve, k.KursiID  from ProfesoriKursi pk
inner join Profesori p on pk.ProfesoriID = p.ProfesoriID
inner join Personi pers on p.ProfesoriID = pers.PersoniID
inner join Kursi k on pk.KursiID = k.KursiID
inner join Syllabusi s on pk.SyllabusiID = s.SyllabusiID
where k.Aktiv = '1'

GO
/****** Object:  StoredProcedure [dbo].[SelectAllRequestsByStudentiID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------
create procedure [dbo].[SelectAllRequestsByStudentiID]

@StudentiID int

as

Select r.CreatedDate as 'RequestCreatedDate', pers.Emri as 'EmriProfes', pers.Mbiemri as 'MbiemriProfes', k.Emri as 'EmriKursit', r.aprovuarNgaAdministratori, r.aprovuarNgaProfesori
from request r
inner join ProfesoriKursi pk on r.ProfesoriKursi = pk.ProfesoriKursiID

--Per profen
inner join Profesori p on pk.ProfesoriID = p.profesoriID
inner join Personi pers on pk.ProfesoriID = pers.PersoniID
--Per kursin
inner join Kursi k on pk.KursiID = k.KursiID

where r.studenti = @StudentiID

GO
/****** Object:  StoredProcedure [dbo].[SelectLendaByEmri]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
create procedure [dbo].[SelectLendaByEmri]

@Emri varchar(20)

as

Select KursiID from Kursi where Emri = @Emri

GO
/****** Object:  StoredProcedure [dbo].[selectProfesoriKursiByEmriKursit]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
create procedure [dbo].[selectProfesoriKursiByEmriKursit]
@Emri varchar

as

select k.Emri as 'EmriKursit', pers.Emri, pers.Mbiemri, s.Kreditet, s.NumriLigjeratave, s.NumriUshtrimeve, k.KursiID  from ProfesoriKursi pk
inner join Profesori p on pk.ProfesoriID = p.ProfesoriID
inner join Personi pers on p.ProfesoriID = pers.PersoniID
inner join Kursi k on pk.KursiID = k.KursiID
inner join Syllabusi s on pk.SyllabusiID = s.SyllabusiID
where k.Aktiv = '1' and k.Emri = @Emri

GO
/****** Object:  StoredProcedure [dbo].[StudentiInsert]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[StudentiInsert]
@personi int,
@VitiAkademik varchar(10),
@Useri int

as

insert into Studenti VALUES(@personi,@VitiAkademik)


GO
/****** Object:  StoredProcedure [dbo].[StudentiSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[StudentiSelectByID]

@StudentiID int
as
Select * 
from Studenti inner join personi on
				StudentiID=PersoniID
where StudentiID = @StudentiID and Aktiv = '1'

GO
/****** Object:  StoredProcedure [dbo].[StudentiUpdate]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[StudentiUpdate]
@personiid int,
@VitiAkademik varchar(10)

as

update Studenti set VitiAkademik=@VitiAkademik
where StudentiID=@personiid


GO
/****** Object:  StoredProcedure [dbo].[SyllabusiSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------

--PROCEDURAT PER Kursi
----------------------------------------------------------------
create procedure [dbo].[SyllabusiSelectByID]
@SyllabusiID int

as

select * from Syllabusi where SyllabusiID = @SyllabusiID


GO
/****** Object:  StoredProcedure [dbo].[UserGroupSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
--create procedure ProfesoriDelete
--@ProfesoriID int

--as

--update Profesori set Aktiv = '0' where ProfesoriID = @ProfesoriID 

--go
----------------------------------------------------------------


--PROCEDURAT PER UserGroup
----------------------------------------------------------------
create procedure [dbo].[UserGroupSelectByID]
@Prioriteti int

as

Select * from UserGroup where Prioriteti = @Prioriteti

GO
/****** Object:  StoredProcedure [dbo].[UseriSelectByEmail]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
create procedure [dbo].[UseriSelectByEmail]
@email varchar(255)

as

select personiid,email,Passwordi,Roli from Useri u inner join Personi p
											on personi=PersoniID
											inner join UserGroup ug
											on u.Prioriteti=ug.Prioriteti
where email = @email


GO
/****** Object:  StoredProcedure [dbo].[UseriSelectByID]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------

--PROCEDURAT PER Useri
----------------------------------------------------------------
create procedure [dbo].[UseriSelectByID]
@UseriID int

as

select * from Useri where UseriID = @UseriID


GO
/****** Object:  Table [dbo].[Administratori]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administratori](
	[AdministratoriID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kursi]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kursi](
	[KursiID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](20) NOT NULL,
	[Programi] [int] NULL,
	[Aktiv] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[KursiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personi]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personi](
	[PersoniID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](20) NOT NULL,
	[Mbiemri] [varchar](20) NOT NULL,
	[Gjinia] [char](1) NOT NULL,
	[NrTelefonit] [varchar](30) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Mosha] [int] NOT NULL,
	[Aktiv] [bit] NOT NULL,
	[Menaxheri] [int] NULL,
	[KrijuarNga] [int] NULL,
	[ModifikuarNga] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersoniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[profaKursiStudenti]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profaKursiStudenti](
	[profaKursiStudenti] [int] IDENTITY(1,1) NOT NULL,
	[profakursi] [int] NOT NULL,
	[studenti] [int] NOT NULL,
	[createdby] [int] NULL,
	[createddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[profaKursiStudenti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profesori]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profesori](
	[ProfesoriID] [int] NOT NULL,
	[TitulliAkademik] [varchar](30) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProfesoriKursi]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfesoriKursi](
	[ProfesoriKursiID] [int] IDENTITY(1,1) NOT NULL,
	[ProfesoriID] [int] NULL,
	[KursiID] [int] NULL,
	[SyllabusiID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfesoriKursiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Programi]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Programi](
	[ProgramiID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](20) NOT NULL,
	[Aktiv] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[request]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[request](
	[requestid] [int] IDENTITY(1,1) NOT NULL,
	[ProfesoriKursi] [int] NOT NULL,
	[studenti] [int] NOT NULL,
	[aprovuarNgaAdministratori] [varchar](20) NOT NULL,
	[aprovuarNgaProfesori] [varchar](20) NOT NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[requestid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Studenti]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Studenti](
	[StudentiID] [int] NOT NULL,
	[VitiAkademik] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Syllabusi]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Syllabusi](
	[SyllabusiID] [int] IDENTITY(1,1) NOT NULL,
	[Kreditet] [int] NOT NULL,
	[Pershkrimi] [varchar](1000) NOT NULL,
	[Literatura] [varchar](1000) NOT NULL,
	[MetodaVleresimit] [varchar](100) NOT NULL,
	[NumriUshtrimeve] [int] NOT NULL,
	[NumriLigjeratave] [int] NOT NULL,
	[Aktiv] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SyllabusiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Prioriteti] [int] NOT NULL,
	[Roli] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prioriteti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Useri]    Script Date: 11/02/2019 23:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Useri](
	[UseriID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Passwordi] [varchar](20) NOT NULL,
	[Prioriteti] [int] NULL,
	[personi] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UseriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Administratori] ([AdministratoriID]) VALUES (2)
SET IDENTITY_INSERT [dbo].[Kursi] ON 

INSERT [dbo].[Kursi] ([KursiID], [Emri], [Programi], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, N'Java', 1, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Kursi] ([KursiID], [Emri], [Programi], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (2, N'Java2', 1, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Kursi] ([KursiID], [Emri], [Programi], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (3, N'Matematik1', 1, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Kursi] ([KursiID], [Emri], [Programi], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (4, N'SD', 1, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Kursi] ([KursiID], [Emri], [Programi], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (5, N'Database', 1, 1, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kursi] OFF
SET IDENTITY_INSERT [dbo].[Personi] ON 

INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (1, N'test', N'test', N'm', N'123123123', N'test@test.com', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (2, N'arber', N'arber', N'm', N'321321321', N'arber@test.com', 12, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (3, N'baba', N'baba', N'm', N'04923232', N'baba@test.com', 19, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (4, N'tezja', N'tezja', N'f', N'123122321', N'tezja@test.com', 30, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (5, N'student', N'student', N'm', N'2222222', N'student@test.com', 30, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (6, N'student1', N'student', N'm', N'2222222', N'student1@test.com', 30, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (7, N'student2', N'student', N'm', N'2222222', N'student2@test.com', 30, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (8, N'student3', N'student', N'm', N'2222222', N'student3@test.com', 30, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (9, N'student4', N'student', N'm', N'2222222', N'student4@test.com', 30, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (10, N'prof', N'prof', N'm', N'123123123', N'prof@test.com', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (11, N'prof1', N'prof', N'm', N'123123123', N'prof1@test.com', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (12, N'prof2', N'prof', N'm', N'123123123', N'prof2@test.com', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (13, N'prof3', N'prof', N'm', N'123123123', N'prof3@test.com', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Personi] ([PersoniID], [Emri], [Mbiemri], [Gjinia], [NrTelefonit], [Email], [Mosha], [Aktiv], [Menaxheri], [KrijuarNga], [ModifikuarNga]) VALUES (14, N'prof4', N'prof', N'm', N'123123123', N'prof4@test.com', 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Personi] OFF
INSERT [dbo].[Profesori] ([ProfesoriID], [TitulliAkademik]) VALUES (1, N'test')
INSERT [dbo].[Profesori] ([ProfesoriID], [TitulliAkademik]) VALUES (10, N'test1')
INSERT [dbo].[Profesori] ([ProfesoriID], [TitulliAkademik]) VALUES (11, N'test2')
INSERT [dbo].[Profesori] ([ProfesoriID], [TitulliAkademik]) VALUES (12, N'test3')
INSERT [dbo].[Profesori] ([ProfesoriID], [TitulliAkademik]) VALUES (13, N'test4')
INSERT [dbo].[Profesori] ([ProfesoriID], [TitulliAkademik]) VALUES (14, N'test5')
SET IDENTITY_INSERT [dbo].[ProfesoriKursi] ON 

INSERT [dbo].[ProfesoriKursi] ([ProfesoriKursiID], [ProfesoriID], [KursiID], [SyllabusiID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ProfesoriKursi] ([ProfesoriKursiID], [ProfesoriID], [KursiID], [SyllabusiID]) VALUES (2, 1, 2, 2)
INSERT [dbo].[ProfesoriKursi] ([ProfesoriKursiID], [ProfesoriID], [KursiID], [SyllabusiID]) VALUES (3, 10, 3, 3)
INSERT [dbo].[ProfesoriKursi] ([ProfesoriKursiID], [ProfesoriID], [KursiID], [SyllabusiID]) VALUES (4, 11, 4, 4)
INSERT [dbo].[ProfesoriKursi] ([ProfesoriKursiID], [ProfesoriID], [KursiID], [SyllabusiID]) VALUES (5, 12, 5, 5)
INSERT [dbo].[ProfesoriKursi] ([ProfesoriKursiID], [ProfesoriID], [KursiID], [SyllabusiID]) VALUES (6, 13, 5, 5)
SET IDENTITY_INSERT [dbo].[ProfesoriKursi] OFF
SET IDENTITY_INSERT [dbo].[Programi] ON 

INSERT [dbo].[Programi] ([ProgramiID], [Emri], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, N'programi', 1, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Programi] OFF
SET IDENTITY_INSERT [dbo].[request] ON 

INSERT [dbo].[request] ([requestid], [ProfesoriKursi], [studenti], [aprovuarNgaAdministratori], [aprovuarNgaProfesori], [CreatedDate]) VALUES (1, 1, 5, N'waiting', N'waiting', NULL)
INSERT [dbo].[request] ([requestid], [ProfesoriKursi], [studenti], [aprovuarNgaAdministratori], [aprovuarNgaProfesori], [CreatedDate]) VALUES (2, 3, 5, N'waiting', N'waiting', NULL)
INSERT [dbo].[request] ([requestid], [ProfesoriKursi], [studenti], [aprovuarNgaAdministratori], [aprovuarNgaProfesori], [CreatedDate]) VALUES (3, 2, 6, N'waiting', N'waiting', NULL)
INSERT [dbo].[request] ([requestid], [ProfesoriKursi], [studenti], [aprovuarNgaAdministratori], [aprovuarNgaProfesori], [CreatedDate]) VALUES (4, 3, 7, N'waiting', N'waiting', NULL)
INSERT [dbo].[request] ([requestid], [ProfesoriKursi], [studenti], [aprovuarNgaAdministratori], [aprovuarNgaProfesori], [CreatedDate]) VALUES (5, 1, 8, N'waiting', N'waiting', NULL)
INSERT [dbo].[request] ([requestid], [ProfesoriKursi], [studenti], [aprovuarNgaAdministratori], [aprovuarNgaProfesori], [CreatedDate]) VALUES (6, 1, 9, N'waiting', N'waiting', NULL)
SET IDENTITY_INSERT [dbo].[request] OFF
INSERT [dbo].[Studenti] ([StudentiID], [VitiAkademik]) VALUES (5, N'1')
INSERT [dbo].[Studenti] ([StudentiID], [VitiAkademik]) VALUES (6, N'1')
INSERT [dbo].[Studenti] ([StudentiID], [VitiAkademik]) VALUES (7, N'1')
INSERT [dbo].[Studenti] ([StudentiID], [VitiAkademik]) VALUES (8, N'1')
INSERT [dbo].[Studenti] ([StudentiID], [VitiAkademik]) VALUES (9, N'1')
SET IDENTITY_INSERT [dbo].[Syllabusi] ON 

INSERT [dbo].[Syllabusi] ([SyllabusiID], [Kreditet], [Pershkrimi], [Literatura], [MetodaVleresimit], [NumriUshtrimeve], [NumriLigjeratave], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, 5, N'test', N'test', N'test', 2, 2, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Syllabusi] ([SyllabusiID], [Kreditet], [Pershkrimi], [Literatura], [MetodaVleresimit], [NumriUshtrimeve], [NumriLigjeratave], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (2, 5, N'test1', N'test', N'test', 2, 2, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Syllabusi] ([SyllabusiID], [Kreditet], [Pershkrimi], [Literatura], [MetodaVleresimit], [NumriUshtrimeve], [NumriLigjeratave], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (3, 5, N'test2', N'test', N'test', 2, 2, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Syllabusi] ([SyllabusiID], [Kreditet], [Pershkrimi], [Literatura], [MetodaVleresimit], [NumriUshtrimeve], [NumriLigjeratave], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (4, 5, N'test3', N'test', N'test', 2, 2, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Syllabusi] ([SyllabusiID], [Kreditet], [Pershkrimi], [Literatura], [MetodaVleresimit], [NumriUshtrimeve], [NumriLigjeratave], [Aktiv], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (5, 5, N'test4', N'test', N'test', 2, 2, 1, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Syllabusi] OFF
INSERT [dbo].[UserGroup] ([Prioriteti], [Roli]) VALUES (0, N'Student')
INSERT [dbo].[UserGroup] ([Prioriteti], [Roli]) VALUES (1, N'Profesor')
INSERT [dbo].[UserGroup] ([Prioriteti], [Roli]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Useri] ON 

INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, N'arber', N'arber', 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (2, N'student', N'student', 0, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (3, N'student1', N'student1', 0, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (4, N'student2', N'student2', 0, 7, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (5, N'student3', N'student3', 0, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (6, N'student4', N'student4', 0, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (7, N'tester', N'test', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (8, N'prof', N'prof', 1, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (9, N'prof1', N'prof1', 1, 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (10, N'prof2', N'prof2', 1, 12, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (11, N'prof3', N'prof3', 1, 13, NULL, NULL, NULL, NULL)
INSERT [dbo].[Useri] ([UseriID], [Username], [Passwordi], [Prioriteti], [personi], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (12, N'prof4', N'prof4', 1, 14, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Useri] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Personi__A9D105341A6E1122]    Script Date: 11/02/2019 23:38:18 ******/
ALTER TABLE [dbo].[Personi] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kursi] ADD  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[Personi] ADD  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[Programi] ADD  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[Syllabusi] ADD  DEFAULT ((1)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[Administratori]  WITH CHECK ADD FOREIGN KEY([AdministratoriID])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[Kursi]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Kursi]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Kursi]  WITH CHECK ADD FOREIGN KEY([Programi])
REFERENCES [dbo].[Programi] ([ProgramiID])
GO
ALTER TABLE [dbo].[Personi]  WITH CHECK ADD FOREIGN KEY([KrijuarNga])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Personi]  WITH CHECK ADD FOREIGN KEY([Menaxheri])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Personi]  WITH CHECK ADD FOREIGN KEY([ModifikuarNga])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[profaKursiStudenti]  WITH CHECK ADD FOREIGN KEY([createdby])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[profaKursiStudenti]  WITH CHECK ADD FOREIGN KEY([profakursi])
REFERENCES [dbo].[ProfesoriKursi] ([ProfesoriKursiID])
GO
ALTER TABLE [dbo].[profaKursiStudenti]  WITH CHECK ADD FOREIGN KEY([studenti])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[Profesori]  WITH CHECK ADD FOREIGN KEY([ProfesoriID])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[ProfesoriKursi]  WITH CHECK ADD FOREIGN KEY([KursiID])
REFERENCES [dbo].[Kursi] ([KursiID])
GO
ALTER TABLE [dbo].[ProfesoriKursi]  WITH CHECK ADD FOREIGN KEY([ProfesoriID])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[ProfesoriKursi]  WITH CHECK ADD FOREIGN KEY([SyllabusiID])
REFERENCES [dbo].[Syllabusi] ([SyllabusiID])
GO
ALTER TABLE [dbo].[Programi]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Programi]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD FOREIGN KEY([ProfesoriKursi])
REFERENCES [dbo].[ProfesoriKursi] ([ProfesoriKursiID])
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD FOREIGN KEY([studenti])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[Studenti]  WITH CHECK ADD FOREIGN KEY([StudentiID])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[Syllabusi]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Syllabusi]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Useri]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Useri]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Useri] ([UseriID])
GO
ALTER TABLE [dbo].[Useri]  WITH CHECK ADD FOREIGN KEY([personi])
REFERENCES [dbo].[Personi] ([PersoniID])
GO
ALTER TABLE [dbo].[Useri]  WITH CHECK ADD FOREIGN KEY([Prioriteti])
REFERENCES [dbo].[UserGroup] ([Prioriteti])
GO
USE [master]
GO
ALTER DATABASE [ELearning] SET  READ_WRITE 
GO
