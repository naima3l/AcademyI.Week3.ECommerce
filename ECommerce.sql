USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 10/7/2021 4:01:29 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Users\naima.el.khattabi\ECommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Users\naima.el.khattabi\ECommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE = OFF
GO
USE [ECommerce]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Carta]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carta](
	[CodCarta] [char](16) NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
	[Scadenza] [date] NOT NULL,
	[Saldo] [decimal](18, 0) NOT NULL,
	[CodCliente] [varchar](10) NOT NULL,
 CONSTRAINT [Pk_Carta] PRIMARY KEY CLUSTERED 
(
	[CodCarta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[CodCliente] [varchar](10) NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Cognome] [varchar](30) NOT NULL,
	[DataNascita] [date] NOT NULL,
 CONSTRAINT [Pk_Cliente] PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indirizzo]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indirizzo](
	[IdIndirizzo] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
	[Città] [varchar](30) NOT NULL,
	[Via] [varchar](30) NOT NULL,
	[Cap] [int] NOT NULL,
	[NumeroCivico] [varchar](10) NOT NULL,
	[Provincia] [varchar](30) NOT NULL,
	[Nazione] [varchar](30) NOT NULL,
	[CodCliente] [varchar](10) NOT NULL,
 CONSTRAINT [Pk_Indirizzo] PRIMARY KEY CLUSTERED 
(
	[IdIndirizzo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordine]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordine](
	[IdOrdine] [int] IDENTITY(1,1) NOT NULL,
	[Stato] [varchar](20) NOT NULL,
	[DataOrdine] [date] NOT NULL,
	[Totale] [decimal](18, 0) NOT NULL,
	[CodCliente] [varchar](10) NOT NULL,
	[CodCarta] [char](16) NOT NULL,
	[IdIndirizzo] [int] NOT NULL,
 CONSTRAINT [Pk_Ordine] PRIMARY KEY CLUSTERED 
(
	[IdOrdine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdineProdotto]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdineProdotto](
	[IdOrdine] [int] NOT NULL,
	[CodProdotto] [varchar](10) NOT NULL,
	[Quantità] [int] NOT NULL,
	[SubTotale] [decimal](18, 0) NOT NULL,
 CONSTRAINT [Pk_OrdineProdotto] PRIMARY KEY CLUSTERED 
(
	[IdOrdine] ASC,
	[CodProdotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodotto]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodotto](
	[CodProdotto] [varchar](10) NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Descrizione] [varchar](100) NOT NULL,
	[PrezzoUnitario] [decimal](18, 0) NOT NULL,
 CONSTRAINT [Pk_Prodotto] PRIMARY KEY CLUSTERED 
(
	[CodProdotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carta]  WITH CHECK ADD  CONSTRAINT [Fk_CartaCliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([CodCliente])
GO
ALTER TABLE [dbo].[Carta] CHECK CONSTRAINT [Fk_CartaCliente]
GO
ALTER TABLE [dbo].[Indirizzo]  WITH CHECK ADD  CONSTRAINT [Fk_IndirizzoCliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([CodCliente])
GO
ALTER TABLE [dbo].[Indirizzo] CHECK CONSTRAINT [Fk_IndirizzoCliente]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [Fk_OrdineCarta] FOREIGN KEY([CodCarta])
REFERENCES [dbo].[Carta] ([CodCarta])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [Fk_OrdineCarta]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [Fk_OrdineCliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([CodCliente])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [Fk_OrdineCliente]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [Fk_OrdineIndirizzo] FOREIGN KEY([IdIndirizzo])
REFERENCES [dbo].[Indirizzo] ([IdIndirizzo])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [Fk_OrdineIndirizzo]
GO
ALTER TABLE [dbo].[OrdineProdotto]  WITH CHECK ADD  CONSTRAINT [Fk_Ordine] FOREIGN KEY([IdOrdine])
REFERENCES [dbo].[Ordine] ([IdOrdine])
GO
ALTER TABLE [dbo].[OrdineProdotto] CHECK CONSTRAINT [Fk_Ordine]
GO
ALTER TABLE [dbo].[OrdineProdotto]  WITH CHECK ADD  CONSTRAINT [Fk_Prodotto] FOREIGN KEY([CodProdotto])
REFERENCES [dbo].[Prodotto] ([CodProdotto])
GO
ALTER TABLE [dbo].[OrdineProdotto] CHECK CONSTRAINT [Fk_Prodotto]
GO
ALTER TABLE [dbo].[Carta]  WITH CHECK ADD  CONSTRAINT [Check_Saldo] CHECK  (([Saldo]>(0)))
GO
ALTER TABLE [dbo].[Carta] CHECK CONSTRAINT [Check_Saldo]
GO
ALTER TABLE [dbo].[Carta]  WITH CHECK ADD  CONSTRAINT [Check_Tipo] CHECK  (([Tipo]='Debito' OR [Tipo]='Credito'))
GO
ALTER TABLE [dbo].[Carta] CHECK CONSTRAINT [Check_Tipo]
GO
ALTER TABLE [dbo].[Indirizzo]  WITH CHECK ADD  CONSTRAINT [Check_TipoIndirizzo] CHECK  (([Tipo]='Residenza' OR [Tipo]='Domicilio'))
GO
ALTER TABLE [dbo].[Indirizzo] CHECK CONSTRAINT [Check_TipoIndirizzo]
GO
/****** Object:  StoredProcedure [dbo].[AggiungiProdottoOrdine]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AggiungiProdottoOrdine]
@IdOrdine INT,
@NomeProdotto VARCHAR(20),
@QuantitàProdotto INT

AS
DECLARE @CodProdotto VARCHAR(10)
SELECT @CodProdotto = p.CodProdotto
FROM Prodotto p
WHERE p.Nome = @NomeProdotto

DECLARE @PrezzoProdotto DECIMAL
SELECT @PrezzoProdotto = p.PrezzoUnitario
FROM Prodotto p
WHERE p.CodProdotto = @CodProdotto


DECLARE @StatoOrdine VARCHAR(20)
SELECT @StatoOrdine = o.Stato
FROM Ordine o
WHERE o.IdOrdine = @IdOrdine

DECLARE @SubTotale DECIMAL = @QuantitàProdotto * @PrezzoProdotto

BEGIN
	BEGIN TRY
	IF @StatoOrdine <> 'Provvisorio'
	BEGIN
	SET @IdOrdine = NULL
	END
	INSERT INTO OrdineProdotto VALUES (@IdOrdine,@CodProdotto,@QuantitàProdotto,@SubTotale)
	UPDATE Ordine SET Totale = Totale+@SubTotale WHERE IdOrdine = @IdOrdine
	END TRY

	BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS [Messaggio d'errore]
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InserisciCarta]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserisciCarta]
@CodCarta CHAR(16),
@TipoCarta VARCHAR(30),
@Scadenza DATE,
@Saldo DECIMAL,
@NomeCliente VARCHAR(20)

AS
DECLARE @CodCliente VARCHAR(10)
SELECT @CodCliente = c.CodCliente
FROM Cliente c
WHERE c.Nome = @NomeCliente
BEGIN
	BEGIN TRY
	IF(@Scadenza < GETDATE())
		BEGIN
		SET @Scadenza = NULL
		END
	INSERT INTO Carta VALUES (@CodCarta,@TipoCarta,@Scadenza,@Saldo,@CodCliente)
	END TRY

	BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS [Messaggio d'errore]
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InserisciCliente]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserisciCliente]
@CodCliente VARCHAR(10),
@Nome VARCHAR(20),
@Cognome VARCHAR(30),
@DataNascita DATE,
@Tipo VARCHAR(20),
@Città VARCHAR(30),
@Via VARCHAR(30),
@Cap INT,
@NumeroCivico VARCHAR(10),
@Provincia VARCHAR(30),
@Nazione VARCHAR(30),
@CodCarta CHAR(16),
@TipoCarta VARCHAR(30),
@Scadenza DATE,
@Saldo DECIMAL

AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO Cliente VALUES (@CodCliente,@Nome,@Cognome,@DataNascita)
	INSERT INTO Indirizzo VALUES (@Tipo, @Città, @Via,@Cap,@NumeroCivico,@Provincia,@Nazione,@CodCliente)

	IF(@Scadenza < GETDATE())
		BEGIN
		SET @Scadenza = NULL
		END
	INSERT INTO Carta VALUES(@CodCarta,@TipoCarta,@Scadenza,@Saldo,@CodCliente)

	COMMIT TRAN;
	END TRY

	BEGIN CATCH
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRANSACTION;
	END

	SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS [Messaggio d'errore]
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[InserisciIndirizzo]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserisciIndirizzo]
@TipoIndirizzo VARCHAR(20),
@Città VARCHAR(30),
@Via VARCHAR(30),
@Cap INT,
@NumeroCivico VARCHAR(10),
@Provincia VARCHAR(30),
@Nazione VARCHAR(30),
@NomeCliente VARCHAR(20)

AS
DECLARE @CodCliente VARCHAR(10)
SELECT @CodCliente = c.CodCliente
FROM Cliente c
WHERE c.Nome = @NomeCliente
BEGIN
	BEGIN TRY
	INSERT INTO Indirizzo VALUES (@TipoIndirizzo, @Città, @Via,@Cap,@NumeroCivico,@Provincia,@Nazione,@CodCliente)
	END TRY

	BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS [Messaggio d'errore]
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InserisciOrdine]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserisciOrdine]
@DataOrdine DATE,
@NomeCliente VARCHAR(20),
@CodCarta CHAR(16),
@TipoIndirizzo VARCHAR(20)

AS
DECLARE @CodCliente VARCHAR(10)
SELECT @CodCliente = c.CodCliente
FROM Cliente c
WHERE c.Nome = @NomeCliente

DECLARE @IdIndirizzo INT
SELECT @IdIndirizzo = i.IdIndirizzo
FROM Indirizzo i
WHERE i.Tipo = @TipoIndirizzo

DECLARE @StatoOrdine VARCHAR(20)= 'Provvisorio'
DECLARE @TotaleOrdine DECIMAL = 0

BEGIN
	BEGIN TRY
	IF(@DataOrdine < GETDATE())
	BEGIN
	SET @DataOrdine = NULL
	END
	INSERT INTO Ordine VALUES(@StatoOrdine,@DataOrdine,@TotaleOrdine,@CodCliente,@CodCarta,@IdIndirizzo)
	END TRY

	BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS [Messaggio d'errore]
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InserisciProdotto]    Script Date: 10/7/2021 4:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserisciProdotto]
@CodProdotto VARCHAR(10),
@NomeProdotto VARCHAR(20),
@DescrizioneProdotto VARCHAR(100),
@PrezzoUnitarioProdotto DECIMAL

AS
BEGIN
	BEGIN TRY
	INSERT INTO Prodotto VALUES (@CodProdotto,@NomeProdotto,@DescrizioneProdotto,@PrezzoUnitarioProdotto)
	END TRY

	BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS [Messaggio d'errore]
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
