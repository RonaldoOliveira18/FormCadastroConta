GO
/****** Object:  StoredProcedure [dbo].[DEL_Pessoa]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_Pessoa]
	@cvIdPessoa	int = NULL

AS
BEGIN

	        DELETE  FROM tb_pessoa
            WHERE   cvidPessoa = @cvIdPessoa

	END
GO
/****** Object:  StoredProcedure [dbo].[INS_Pessoa]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INS_Pessoa]
  	@ccNome	VARCHAR(100) = NULL
, 	@ccEmail	VARCHAR(100) = NULL
, 	@ccEndereco	VARCHAR(100) = NULL
, 	@ccCidade	VARCHAR(100) = NULL
, 	@ccUF	char(2) = NULL
, 	@ccCEP	VARCHAR(9) = NULL
, 	@ccTelefoneCelular	VARCHAR(20) = NULL
, 	@ccTelefoneComercial	VARCHAR(20) = NULL
, 	@ccTelefoneResidencial	VARCHAR(20) = NULL
, 	@ccCPF	VARCHAR(20) = NULL
, 	@ccRG	VARCHAR(20) = NULL
, 	@cvIdUsuarioAtualizacao	INT = NULL
,	@cdNascimento	datetime = NULL
,	@cdAtualizacao	datetime = NULL
,	@ImgComprovResid	image = NULL
,   @NewId INT OUTPUT


AS
BEGIN

	IF @cdAtualizacao IS NULL
		BEGIN
			SET @cdAtualizacao = GETDATE()
		END

	INSERT INTO [dbo].[tb_Pessoa]
           (ccNome
           ,ccEmail
           ,ccEndereco
           ,ccCidade
           ,ccUF
           ,ccCEP
           ,ccTelefoneCelular
           ,ccTelefoneComercial
           ,ccTelefoneResidencial
           ,cdNascimento
           ,ImgComprovResid
           ,cdAtualizacao
		   ,ccCPF
		   ,ccRG)
	VALUES(@ccNome
           ,@ccEmail
           ,@ccEndereco
           ,@ccCidade
           ,@ccUF
           ,@ccCEP
           ,@ccTelefoneCelular
           ,@ccTelefoneComercial
           ,@ccTelefoneResidencial
           ,@cdNascimento
           ,@ImgComprovResid
           ,@cdAtualizacao
		   ,@ccCPF
		   ,@ccRG)

		select @NewId = SCOPE_IDENTITY();

	END

GO
/****** Object:  StoredProcedure [dbo].[SEL_conta]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE[dbo].[SEL_conta]
	@cvIdConta	INT = NULL
,	@cvIdPessoa	INT = NULL
,	@cvIdAgencia	INT = NULL
,	@cdDataAtualizacao	DATETIME = NULL
,	@cvIdUsuarioAtualizacao	int = NULL


AS
BEGIN
	SET NOCOUNT ON;

	SELECT dbo.tb_conta.cvIdConta
		 , dbo.tb_conta.cvIdPessoa
		 , dbo.tb_conta.cvIdAgencia
		 , dbo.tb_conta.cdDataAtualizacao
	  FROM dbo.tb_conta	 WHERE (dbo.tb_conta.cvIdConta = @cvIdConta OR @cvIdConta IS NULL) 
	   AND (dbo.tb_conta.cvIdPessoa = @cvIdPessoa OR @cvIdPessoa IS NULL) 
	   AND (dbo.tb_conta.cvIdAgencia = @cvIdAgencia OR @cvIdAgencia IS NULL) 
	   AND (dbo.tb_conta.cdDataAtualizacao = @cdDataAtualizacao OR @cdDataAtualizacao IS NULL) 
	 ORDER BY cvIdConta
END

GO
/****** Object:  StoredProcedure [dbo].[SEL_Imagem]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[SEL_Imagem]
	@cvIdPessoa	INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ImgComprovResid
	  FROM dbo.tb_Pessoa	 WHERE (dbo.tb_Pessoa.cvIdPessoa = @cvIdPessoa OR @cvIdPessoa IS NULL) 
END

GO
/****** Object:  StoredProcedure [dbo].[SEL_Pessoa]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[SEL_Pessoa]
	@cvIdPessoa	INT = NULL
,	@ccNome	VARCHAR(100) = NULL
,	@ccEmail	VARCHAR(100) = NULL
,	@ccEndereco	VARCHAR(100) = NULL
,	@ccCidade	VARCHAR(100) = NULL
,	@ccUF	CHAR(2) = NULL
,	@ccCEP	VARCHAR(9) = NULL
,	@ccTelefoneCelular	VARCHAR(20) = NULL
,	@ccTelefoneComercial	VARCHAR(20) = NULL
,	@ccTelefoneResidencial	VARCHAR(20) = NULL
,	@cdNascimento	DATETIME = NULL
,	@cvIdUsuarioAtualizacao	int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT dbo.tb_Pessoa.cvIdPessoa
		 , dbo.tb_Pessoa.ccNome
		 , dbo.tb_Pessoa.ccEmail
		 , dbo.tb_Pessoa.ccEndereco
		 , dbo.tb_Pessoa.ccCidade
		 , dbo.tb_Pessoa.ccUF
		 , dbo.tb_Pessoa.ccCEP
		 , dbo.tb_Pessoa.ccTelefoneCelular
		 , dbo.tb_Pessoa.ccTelefoneComercial
		 , dbo.tb_Pessoa.ccTelefoneResidencial
		 , CONVERT (VARCHAR, dbo.tb_Pessoa.cdNascimento, 103) as cdNascimento
		 , dbo.tb_Pessoa.ccCPF
		 , dbo.tb_Pessoa.ccRG
		 ,	ImgComprovResid
	  FROM dbo.tb_Pessoa	 WHERE (dbo.tb_Pessoa.cvIdPessoa = @cvIdPessoa OR @cvIdPessoa IS NULL) 
	 
  AND (dbo.tb_Pessoa.ccNome = @ccNome OR @ccNome IS NULL) 
	   AND (dbo.tb_Pessoa.ccEmail = @ccEmail OR @ccEmail IS NULL) 
	   AND (dbo.tb_Pessoa.ccEndereco = @ccEndereco OR @ccEndereco IS NULL) 
	   AND (dbo.tb_Pessoa.ccCidade = @ccCidade OR @ccCidade IS NULL) 
	   AND (dbo.tb_Pessoa.ccUF = @ccUF OR @ccUF IS NULL) 
	   AND (dbo.tb_Pessoa.ccCEP = @ccCEP OR @ccCEP IS NULL) 
	   AND (dbo.tb_Pessoa.ccTelefoneCelular = @ccTelefoneCelular OR @ccTelefoneCelular IS NULL) 
	   AND (dbo.tb_Pessoa.ccTelefoneComercial = @ccTelefoneComercial OR @ccTelefoneComercial IS NULL) 
	   AND (dbo.tb_Pessoa.ccTelefoneResidencial = @ccTelefoneResidencial OR @ccTelefoneResidencial IS NULL) 
	   AND (dbo.tb_Pessoa.cdNascimento = @cdNascimento OR @cdNascimento IS NULL) 
	 ORDER BY

 cvIdPessoa
END

GO
/****** Object:  StoredProcedure [dbo].[UPD_Pessoa]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_Pessoa]
  	@ccNome	VARCHAR(100) = NULL
, 	@ccEmail	VARCHAR(100) = NULL
, 	@ccEndereco	VARCHAR(100) = NULL
, 	@ccCidade	VARCHAR(100) = NULL
, 	@ccUF	char(2) = NULL
, 	@ccCEP	VARCHAR(9) = NULL
, 	@ccTelefoneCelular	VARCHAR(20) = NULL
, 	@ccTelefoneComercial	VARCHAR(20) = NULL
, 	@ccTelefoneResidencial	VARCHAR(20) = NULL
, 	@cvIdUsuarioAtualizacao	INT = NULL
,	@cdNascimento	datetime = NULL
,	@cdAtualizacao	datetime = NULL
, 	@ccCPF	VARCHAR(20) = NULL
, 	@ccRG VARCHAR(20) = NULL
,	@cvIdPessoa	int = NULL
,   @NewId INT OUTPUT


AS
BEGIN

	IF @cdAtualizacao IS NULL
		BEGIN
			SET @cdAtualizacao = GETDATE()
		END

		   UPDATE tb_Pessoa
		   SET ccNome = @ccNome,
			   ccEmail = @ccEmail,
			   ccEndereco = @ccEndereco,
			   ccCidade = @ccCidade,
			   ccUF = @ccUF,
			   ccCEP = @ccCEP,
			   ccTelefoneCelular = @ccTelefoneCelular,
			   ccTelefoneComercial = @ccTelefoneComercial,
			   ccTelefoneResidencial = @ccTelefoneResidencial,
			   cdNascimento = @cdNascimento,
			   ccRG = @ccRG,
			   ccCPF = @ccCPF
		 WHERE cvIdPessoa = @cvIdPessoa

		select @NewId = @cvIdPessoa;

	END

	
GO
/****** Object:  StoredProcedure [dbo].[UPD_PessoaAnexo]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_PessoaAnexo]
	@cvIdPessoa	int = NULL
,	@ccImage	varbinary(MAX) = NULL



AS
BEGIN

	   UPDATE tb_Pessoa
		   SET ImgComprovResid = @ccImage
		 WHERE cvIdPessoa = @cvIdPessoa

	END
	
GO
/****** Object:  Table [dbo].[tb_Pessoa]    Script Date: 31/01/2017 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Pessoa](
	[cvIdPessoa] [int] IDENTITY(1,1) NOT NULL,
	[ccNome] [varchar](100) NULL,
	[ccEmail] [varchar](100) NULL,
	[ccEndereco] [varchar](100) NULL,
	[ccCidade] [varchar](100) NULL,
	[ccUF] [char](2) NULL,
	[ccCEP] [varchar](9) NULL,
	[ccTelefoneCelular] [varchar](20) NULL,
	[ccTelefoneComercial] [varchar](20) NULL,
	[ccTelefoneResidencial] [varchar](20) NULL,
	[cdNascimento] [datetime] NULL,
	[ImgComprovResid] [varbinary](max) NULL,
	[cdAtualizacao] [datetime] NULL,
	[ccCPF] [varchar](20) NULL,
	[ccRG] [varchar](20) NULL,
 CONSTRAINT [PK__tb_Pesso__BB302A3603317E3D] PRIMARY KEY CLUSTERED 
(
	[cvIdPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
