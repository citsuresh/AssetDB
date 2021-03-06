--USE master;
--ALTER DATABASE AssetDBAzureSample SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--DROP DATABASE AssetDBAzureSample ;
--create database AssetDBAzureSample;

--drop all tables
--DECLARE @sql NVARCHAR(max)=''
--SELECT @sql += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
--FROM   INFORMATION_SCHEMA.TABLES
--WHERE  TABLE_TYPE = 'BASE TABLE'
--Exec Sp_executesql @sql
--go;


use AssetDBAzureSample;


/****** Object:  StoredProcedure [dbo].[usp_GetLastAssetID]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================	=====
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetLastAssetID]


	
AS
BEGIN

	SET NOCOUNT ON;
SELECT IDENT_CURRENT ('dbo.asset') AS CurrentIdentity






END
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetType](
	[AssetTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AssetType] [nvarchar](255) NULL,
 CONSTRAINT [PK_AssetType] PRIMARY KEY CLUSTERED 
(
	[AssetTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSubTypePropertyValueLookup]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetSubTypePropertyValueLookup](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[PropertySubType] [int] NOT NULL,
	[LookupValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AssetSubTypePropertyValueLookup] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderType] [nvarchar](255) NULL,
	[PurchaseOrderNo] [nvarchar](255) NULL,
	[RequisitionNo] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[Supplier] [nvarchar](255) NULL,
	[CallReference] [nvarchar](255) NULL,
	[CostCode] [nvarchar](255) NULL,
	[InvoiceNo] [nvarchar](255) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Whether order is for Software or Hardware etc...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssetID] [int] NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Extension] [nvarchar](50) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[ContentLength] [int] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentMimeTypes]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DocumentMimeTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Extension] [nvarchar](50) NULL,
	[MimeType] [nvarchar](100) NULL,
 CONSTRAINT [PK_DocumentMimeTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetTypePropertyValueLookup]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTypePropertyValueLookup](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyType] [int] NOT NULL,
	[LookupValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AssetPropertyLookup] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSubType]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetSubType](
	[AssetSubTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AssetType] [int] NOT NULL,
	[AssetSubType] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AssetSubType] PRIMARY KEY CLUSTERED 
(
	[AssetSubTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAssetType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_DeleteAssetType] 
	@AssetTypeID int,
	@AssetType nvarchar(255)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


Delete [dbo].[AssetType]
      Where AssetTypeID = @AssetType

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssetType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssetType] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AssetTypeID]
      ,[AssetType]
  FROM [dbo].[AssetType]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderDelete]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Order]
	WHERE  [ID] = @ID

	COMMIT


/****** Object:  StoredProcedure [dbo].[sp_OrderInsert]    Script Date: 07/07/2010 16:20:31 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupDDLTypeValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_LookupDDLTypeValues]
	@PropertyType int


	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT 
      [LookupValue]
  FROM [dbo].[AssetTypePropertyValueLookup]
  WHERE (PropertyType = @PropertyType)











END
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupAssetType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_LookupAssetType] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [AssetTypeID]
      ,[AssetType]
  FROM [dbo].[AssetType]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTypeLookupValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetTypeLookupValues]
	@PropertyType int,
	@prefixText nvarchar(50)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT 
      [LookupValue]
  FROM [dbo].[AssetTypePropertyValueLookup] value
  WHERE (PropertyType = @PropertyType) and (LookupValue like @prefixText)











END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSubTypeLookupValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetSubTypeLookupValues]
	@PropertySubType int,
	@prefixText nvarchar(50)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT 
      [LookupValue]
  FROM [dbo].[AssetSubTypePropertyValueLookup] value
  WHERE (PropertySubType = @PropertySubType) and (LookupValue like @prefixText)











END
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderInsert]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderInsert] 
    @OrderType nvarchar(50),

    @PurchaseOrderNo nvarchar(25),

    @RequisitionNo nvarchar(25),

    @Status nvarchar(15),

    @Supplier nvarchar(25),

    @CallReference nvarchar(15),

    @CostCode nvarchar(25),

    @InvoiceNo nvarchar(25),

    @OrderDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Order] ([OrderType], [PurchaseOrderNo], [RequisitionNo], [Status], [Supplier], [CallReference], [CostCode], [InvoiceNo], [OrderDate])
	SELECT @OrderType, @PurchaseOrderNo, @RequisitionNo, @Status, @Supplier, @CallReference, @CostCode, @InvoiceNo, @OrderDate
	
	/*/*/*/*-- Begin Return Select <- do not remove
	SELECT [ID], [OrderType], [PurchaseOrderNo], [RequisitionNo], [Status], [Supplier], [CallReference], [CostCode], [InvoiceNo], [OrderDate]
	FROM   [dbo].[Order]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove*/*/*/*/
               
	COMMIT



/****** Object:  StoredProcedure [dbo].[sp_OrderItemsDelete]    Script Date: 07/07/2010 16:20:41 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderUpdate]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderUpdate] 
    @ID int,

    @OrderType nvarchar(50),

    @PurchaseOrderNo nvarchar(25),

    @RequisitionNo nvarchar(25),

    @Status nvarchar(15),

    @Supplier nvarchar(25),

    @CallReference nvarchar(15),

    @CostCode nvarchar(25),

    @InvoiceNo nvarchar(25),

    @OrderDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Order]
	SET    [OrderType] = @OrderType, [PurchaseOrderNo] = @PurchaseOrderNo, [RequisitionNo] = @RequisitionNo, [Status] = @Status, [Supplier] = @Supplier, [CallReference] = @CallReference, [CostCode] = @CostCode, [InvoiceNo] = @InvoiceNo, [OrderDate] = @OrderDate
	WHERE  [ID] = @ID
	
	/*/*/*/*-- Begin Return Select <- do not remove
	SELECT [ID], [OrderType], [PurchaseOrderNo], [RequisitionNo], [Status], [Supplier], [CallReference], [CostCode], [InvoiceNo], [OrderDate]
	FROM   [dbo].[Order]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove*/*/*/*/

	COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderSelectAll]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderSelectAll] 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [OrderType], [PurchaseOrderNo], [RequisitionNo], [Status], [Supplier], [CallReference], [CostCode], [InvoiceNo], [OrderDate] 
	FROM   [dbo].[Order] 


	COMMIT


/****** Object:  StoredProcedure [dbo].[sp_OrderUpdate]    Script Date: 07/07/2010 16:21:14 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderSelect] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [OrderType], [PurchaseOrderNo], [RequisitionNo], [Status], [Supplier], [CallReference], [CostCode], [InvoiceNo], [OrderDate] 
	FROM   [dbo].[Order] 
	WHERE  [ID] = @ID 

	COMMIT


/****** Object:  StoredProcedure [dbo].[sp_OrderSelectAll]    Script Date: 07/07/2010 16:21:09 ******/

SET ANSI_NULLS ON
GO
/****** Object:  Table [dbo].[AssetTypeProperty]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTypeProperty](
	[AssetTypePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[AssetType] [int] NOT NULL,
	[AssetTypeProperty] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AssetTypeProperty] PRIMARY KEY CLUSTERED 
(
	[AssetTypePropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetTypePropertyValueLookupUpdate]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetTypePropertyValueLookupUpdate] 
    @LookupID int,
    @PropertyType int,
    @LookupValue nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[AssetTypePropertyValueLookup]
	SET    [PropertyType] = @PropertyType, [LookupValue] = @LookupValue
	WHERE  [LookupID] = @LookupID
	
	/*-- Begin Return Select <- do not remove
	SELECT [LookupID], [PropertyType], [LookupValue]
	FROM   [dbo].[AssetTypePropertyValueLookup]
	WHERE  [LookupID] = @LookupID	
	-- End Return Select <- do not remove*/

	COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetTypePropertyValueLookupSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetTypePropertyValueLookupSelect] 
    @PropertyType INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [LookupID], [PropertyType], [LookupValue] 
	FROM   [dbo].[AssetTypePropertyValueLookup] 
	WHERE  [PropertyType] = @PropertyType 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetTypePropertyValueLookupInsert]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetTypePropertyValueLookupInsert] 
    @PropertyType int,
    @LookupValue nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[AssetTypePropertyValueLookup] ([PropertyType], [LookupValue])
	SELECT @PropertyType, @LookupValue
	
	/*-- Begin Return Select <- do not remove
	SELECT [LookupID], [PropertyType], [LookupValue]
	FROM   [dbo].[AssetTypePropertyValueLookup]
	WHERE  [LookupID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove*/
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetTypePropertyValueLookupDelete]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetTypePropertyValueLookupDelete] 
    @LookupID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[AssetTypePropertyValueLookup]
	WHERE  [LookupID] = @LookupID

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetSubTypePropertyValueLookupUpdate]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetSubTypePropertyValueLookupUpdate] 
    @LookupID int,
    @PropertySubType int,
    @LookupValue nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[AssetSubTypePropertyValueLookup]
	SET    [PropertySubType] = @PropertySubType, [LookupValue] = @LookupValue
	WHERE  [LookupID] = @LookupID
	
	/*-- Begin Return Select <- do not remove
	SELECT [LookupID], [PropertySubType], [LookupValue]
	FROM   [dbo].[AssetSubTypePropertyValueLookup]
	WHERE  [LookupID] = @LookupID	
	-- End Return Select <- do not remove*/

	COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetSubTypePropertyValueLookupSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetSubTypePropertyValueLookupSelect] 
    @PropertySubType INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [LookupID], [PropertySubType], [LookupValue] 
	FROM   [dbo].[AssetSubTypePropertyValueLookup] 
	WHERE  [PropertySubType] = @PropertySubType 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetSubTypePropertyValueLookupInsert]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetSubTypePropertyValueLookupInsert] 
    @PropertySubType int,
    @LookupValue nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[AssetSubTypePropertyValueLookup] ([PropertySubType], [LookupValue])
	SELECT @PropertySubType, @LookupValue
	
	/*-- Begin Return Select <- do not remove
	SELECT [LookupID], [PropertySubType], [LookupValue]
	FROM   [dbo].[AssetSubTypePropertyValueLookup]
	WHERE  [LookupID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove*/
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetSubTypePropertyValueLookupDelete]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetSubTypePropertyValueLookupDelete] 
    @LookupID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[AssetSubTypePropertyValueLookup]
	WHERE  [LookupID] = @LookupID

	COMMIT
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Type] [nvarchar](255) NULL,
	[MakeOrPublisher] [nvarchar](255) NULL,
	[ModelOrTitle] [nvarchar](255) NULL,
	[Version] [nvarchar](15) NULL,
	[Quantity] [int] NULL,
	[Value] [money] NULL,
	[Status] [nvarchar](255) NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateAssetType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_CreateAssetType] 
	@AssetTypeID int,
	@AssetType nvarchar(25)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [dbo].[AssetType]
           ([AssetType])
     VALUES
           (@AssetType)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentsUpdate]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentsUpdate] 
    @ID int,
    @AssetID int,
    @Title nvarchar(100),
    @DateUploaded datetime,
    @Extension nvarchar(50),
    @Data varbinary(MAX)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Documents]
	SET    [AssetID] = @AssetID, [Title] = @Title, [DateUploaded] = @DateUploaded, [Extension] = @Extension, [Data] = @Data
	WHERE  [ID] = @ID
	
	/*-- Begin Return Select <- do not remove
	SELECT [ID], [AssetID], [Title], [DateUploaded], [Extension], [Data]
	FROM   [dbo].[Documents]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove*/

	COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentsSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentsSelect] 
    @AssetID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [doc].[ID], [doc].[Title] + [doc].[Extension] as Title, [doc].[DateUploaded]
	FROM   [dbo].[Documents] Doc
	WHERE  [AssetID] = @AssetID 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentsInsert]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentsInsert] 
    @AssetID int,
    @Title nvarchar(100),
    @Extension nvarchar(50),
    @Data varbinary(MAX),
    @ContentLength int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	DECLARE @DateUploaded datetime = GETDATE()
	
	INSERT INTO [dbo].[Documents] ([AssetID], [Title], [DateUploaded], [Extension], [Data], ContentLength)
	SELECT @AssetID, @Title, @DateUploaded, @Extension, @Data, @ContentLength
	
	/*-- Begin Return Select <- do not remove
	SELECT [ID], [AssetID], [Title], [DateUploaded], [Extension], [Data]
	FROM   [dbo].[Documents]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove*/
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentsDelete]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentsDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Documents]
	WHERE  [ID] = @ID

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentOpen]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentOpen] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT '"' + [Doc].Title + [Doc].Extension + '"' as Title ,[Doc].[Data], [DMT].MimeType, [Doc].ContentLength
	FROM   [dbo].[Documents] Doc
	Inner Join dbo.DocumentMimeTypes DMT on Doc.Extension = DMT.Extension
	WHERE  [Doc].[ID] = @ID 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentMimeTypesSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentMimeTypesSelect] 
    @Extension nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MimeType] 
	FROM   [dbo].[DocumentMimeTypes] 
	WHERE  [Extension] = @Extension 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_DocumentCheck]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_DocumentCheck] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Doc].Title , [DMT].MimeType 
	FROM   [dbo].[Documents] Doc
	Inner Join dbo.DocumentMimeTypes DMT on Doc.Extension = DMT.Extension
	WHERE  [Doc].[ID] = @ID 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAssetType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAssetType] 
	@AssetTypeID int,
	@AssetType nvarchar(25)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




UPDATE [dbo].[AssetType]
   SET [AssetType] = @AssetType
 WHERE AssetTypeID = @AssetTypeID



END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAssetTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAssetTypeProperty]
	@AssetTypePropertyID int,
	@AssetType int,
	@AssetTypeProperty nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[AssetTypeProperty]
   SET [AssetTypeProperty] = @AssetTypeProperty
 WHERE AssetTypePropertyID = @AssetTypePropertyID












END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAssetTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_DeleteAssetTypeProperty]
	@AssetTypePropertyID int,
	@AssetType int,
	@AssetTypeProperty nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


Delete [dbo].[AssetTypeProperty]
WHERE AssetTypePropertyID = @AssetTypePropertyID






END
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateAssetSubType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_CreateAssetSubType] 
	@AssetSubTypeID int,
	@AssetType int,
	@AssetSubType nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [dbo].[AssetSubType]
           ([AssetType]
           ,[AssetSubType])
     VALUES
           (@AssetType
           ,@AssetSubType)






END
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderItemsUpdate]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderItemsUpdate] 
    @ID int,

    @OrderID int,

    @Type nvarchar(25),

    @MakeOrPublisher nvarchar(25),

    @ModelOrTitle nvarchar(50),

    @Version nvarchar(15),

    @Quantity int,

    @Value money,

    @Status nvarchar(25)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[OrderItems]
	SET    [OrderID] = @OrderID, [Type] = @Type, [MakeOrPublisher] = @MakeOrPublisher, [ModelOrTitle] = @ModelOrTitle, [Version] = @Version, [Quantity] = @Quantity, [Value] = @Value, [Status] = @Status
	WHERE  [ID] = @ID
	
	/*/*/*-- Begin Return Select <- do not remove
	SELECT [ID], [OrderID], [Type], [MakeOrPublisher], [ModelOrTitle], [Version], [Quantity], [Value], [Status]
	FROM   [dbo].[OrderItems]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove*/*/*/

	COMMIT TRAN


/****** Object:  StoredProcedure [dbo].[sp_OrderSelect]    Script Date: 07/07/2010 16:21:04 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderItemsSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderItemsSelect] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [OrderID], [Type], [MakeOrPublisher], [ModelOrTitle], [Version], [Quantity], [Value], [Status] 
	FROM   [dbo].[OrderItems] 
	WHERE  [OrderID] = @ID 

	COMMIT
	
/****** Object:  StoredProcedure [dbo].[sp_OrderItemsUpdate]    Script Date: 07/07/2010 16:20:57 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderItemsInsert]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderItemsInsert] 
    @OrderID int,

    @Type nvarchar(25),

    @MakeOrPublisher nvarchar(25),

    @ModelOrTitle nvarchar(50),

    @Version nvarchar(15),

    @Quantity int,

    @Value money,

    @Status nvarchar(25)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[OrderItems] ([OrderID], [Type], [MakeOrPublisher], [ModelOrTitle], [Version], [Quantity], [Value], [Status])
	SELECT @OrderID, @Type, @MakeOrPublisher, @ModelOrTitle, @Version, @Quantity, @Value, @Status
	
	/*/*/*-- Begin Return Select <- do not remove
	SELECT [ID], [OrderID], [Type], [MakeOrPublisher], [ModelOrTitle], [Version], [Quantity], [Value], [Status]
	FROM   [dbo].[OrderItems]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove*/*/*/
               
	COMMIT


/****** Object:  StoredProcedure [dbo].[sp_OrderItemsSelect]    Script Date: 07/07/2010 16:20:52 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderItemsDelete]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderItemsDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[OrderItems]
	WHERE  [ID] = @ID

	COMMIT


/****** Object:  StoredProcedure [dbo].[sp_OrderItemsInsert]    Script Date: 07/07/2010 16:20:47 ******/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[usp_OrderHardwareTypeLookup]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_OrderHardwareTypeLookup] 
  
AS 
	SET NOCOUNT ON
	
SELECT AssetSubType.AssetSubType AS HardwareType
FROM AssetSubType
INNER JOIN AssetType ON AssetType.AssetTypeID = AssetSubType.AssetType
WHERE AssetType.AssetType = 'Infrastructure' OR AssetType.AssetType = 'Hardware'
ORDER BY  AssetSubType
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAssetSubType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAssetSubType] 
	@AssetSubTypeID int,
	@AssetType int,
	@AssetSubType nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[AssetSubType]
   SET [AssetSubType] = @AssetSubType
 WHERE AssetSubTypeID = @AssetSubTypeID


END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssetTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssetTypeProperty]

	@AssetType int

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT [AssetTypePropertyID]
      ,[AssetType]
      ,[AssetTypeProperty]
  FROM [dbo].[AssetTypeProperty]
  WHERE AssetType = @AssetType









END
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupAssetSubTypebyName]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_LookupAssetSubTypebyName] 
@AssetType nvarchar(25)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT [AssetSubType]
  FROM [AssetSubType]
  right join AssetType on AssetType.AssetTypeID = AssetSubType.AssetType
  where AssetType.[AssetType] = @AssetType
  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_LookupAssetSubType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_LookupAssetSubType] 
@AssetType int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT [AssetSubTypeID]
      ,[AssetSubType]
  FROM [AssetSubType]
where [AssetType] = @AssetType
  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssetSubType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssetSubType] 
	@AssetType int

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT [AssetSubTypeID]
      ,[AssetType]
      ,[AssetSubType]
  FROM [dbo].[AssetSubType]
WHERE AssetType = @AssetType
ORDER BY [AssetSubType]




END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAssetSubType]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_DeleteAssetSubType] 
	@AssetSubTypeID int,
	@AssetType int,
	@AssetSubType nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


Delete [dbo].[AssetSubType]
WHERE AssetSubTypeID = @AssetSubTypeID






END
GO
/****** Object:  Table [dbo].[AssetSubTypeProperty]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetSubTypeProperty](
	[AssetSubTypePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[AssetSubType] [int] NOT NULL,
	[AssetSubTypeProperty] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_AssetSubTypeProperty] PRIMARY KEY CLUSTERED 
(
	[AssetSubTypePropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Asset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetType] [int] NOT NULL,
	[AssetSubType] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ClientID] [nvarchar](255) NULL,
	[LabID] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[DeviceStatus] [nvarchar](50) NOT NULL,
	[HasAlarm] [BIT] NOT NULL DEFAULT 0,
	[AlarmMessage] [nvarchar](50) NULL,
	[LastServiceDate] [date] NULL,
	[NextServiceDate] [date] NULL,
	[Notes] [nvarchar](255) NULL,
 CONSTRAINT [PK_CI] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetTypePropertyValue]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTypePropertyValue](
	[AssetTypePropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[Asset] [int] NOT NULL,
	[AssetTypeProperty] [int] NOT NULL,
	[AssetTypePropertyValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_AssetTypePropertyValue] PRIMARY KEY CLUSTERED 
(
	[AssetTypePropertyValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSubTypePropertyValue]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetSubTypePropertyValue](
	[AssetSubTypePropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[Asset] [int] NOT NULL,
	[AssetSubTypeProperty] [int] NOT NULL,
	[AssetSubTypePropertyValue] [nvarchar](50) NULL,
 CONSTRAINT [PK_AssetSubTypePropertyValue] PRIMARY KEY CLUSTERED 
(
	[AssetSubTypePropertyValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetRelationship]    Script Date: 09/07/2010 20:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetRelationship](
	[AssetID] [int] NOT NULL,
	[RelatedAssetID] [int] NOT NULL,
	[Relationship] [nvarchar](255) NULL,
 CONSTRAINT [PK_AssetRelationship] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC,
	[RelatedAssetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAssetSubTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_DeleteAssetSubTypeProperty]
	@AssetSubTypePropertyID int,
	@AssetSubType int,
	@AssetSubTypeProperty nvarchar(255)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Delete [dbo].[AssetSubTypeProperty]
           where AssetSubTypePropertyID = @AssetSubTypePropertyID






END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAsset]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_DeleteAsset]
@AssetID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DELETE [dbo].[Asset]
 WHERE AssetID = @AssetID








END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssets]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssets] 

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT [AssetID]
      ,assettype.[AssetType]
      ,assetsubtype.[AssetSubType]
      ,[Name]
      ,[ClientID]
	  ,[LabID]
      ,[Status]
      ,[DeviceStatus]
      ,[HasAlarm]
      ,[AlarmMessage]
      ,[LastServiceDate]
      ,[NextServiceDate]
      ,[Notes]
  FROM [dbo].[Asset]
  Inner join dbo.assetType on asset.AssetType = AssetTypeID
  inner join dbo.AssetSubType on Asset.AssetSubType = AssetSubTypeID




END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAsset]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAsset]
@AssetID int 

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT [AssetID]
      ,dbo.Asset.[AssetType] as AssetTypeInt
      ,dbo.Asset.[AssetSubType] as AssetSubTypeInt
      ,AT.[AssetType]
      ,AST.[AssetSubType]
      ,[Name]
      ,[ClientID]
	  ,[LabID]
      ,[Status]
      ,[DeviceStatus]
      ,[HasAlarm]
      ,[AlarmMessage]
      ,[LastServiceDate]
      ,[NextServiceDate]
      ,[Notes]
  FROM [dbo].[Asset] 
  LEFT JOIN dbo.AssetType AT ON dbo.Asset.AssetType = AT.AssetTypeID
  LEFT JOIN dbo.AssetSubType AST ON dbo.Asset.AssetSubType = AST.AssetSubTypeID
  WHERE AssetID = @AssetID




END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssetSubTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssetSubTypeProperty]

	@AssetSubType int

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [AssetSubTypePropertyID]
      ,[AssetSubType]
      ,[AssetSubTypeProperty]
  FROM [dbo].[AssetSubTypeProperty]
  WHERE AssetSubType = @AssetSubType









END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAssetSubTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAssetSubTypeProperty]
	@AssetSubTypePropertyID int,
	@AssetSubType int,
	@AssetSubTypeProperty nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Update [dbo].[AssetSubTypeProperty]
           Set
           [AssetSubTypeProperty] = @AssetSubTypeProperty
           where AssetSubTypePropertyID = @AssetSubTypePropertyID






END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAsset]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAsset]
@AssetID int,
@AssetType int,
@AssetSubType int,
@Name nvarchar(255),
@ClientID nvarchar(255),
@LabID nvarchar(255),
@Status nvarchar(15),
@DeviceStatus nvarchar(50),
@HasAlarm BIT = 0,
@AlarmMessage nvarchar(50),
@LastServiceDate date,
@NextServiceDate date,
@Notes nvarchar(255)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[Asset]
   SET 
      [Name] = @Name
      ,[ClientID] = @ClientID
	  ,[LabID] = @LabID
      ,[Status] = @Status
      ,[DeviceStatus] = @DeviceStatus
      ,[HasAlarm] = @HasAlarm
      ,[AlarmMessage] = @AlarmMessage
      ,[LastServiceDate] = @LastServiceDate
      ,[NextServiceDate] = @NextServiceDate
      ,[Notes] = @Notes
 WHERE AssetID = @AssetID

END
GO
/****** Object:  View [dbo].[View_AssetHierarchyChild]    Script Date: 09/07/2010 20:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_AssetHierarchyChild]
AS
SELECT     dbo.AssetRelationship.RelatedAssetID AS AssetID, dbo.Asset.Name AS AssetName, dbo.AssetRelationship.AssetID AS ParentAssetID, dbo.AssetType.AssetType
FROM         dbo.AssetRelationship INNER JOIN
                      dbo.Asset ON dbo.AssetRelationship.RelatedAssetID = dbo.Asset.AssetID INNER JOIN
                      dbo.AssetType ON dbo.Asset.AssetType = dbo.AssetType.AssetTypeID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssetRelationship"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Asset"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 125
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetType"
            Begin Extent = 
               Top = 6
               Left = 438
               Bottom = 95
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssetHierarchyChild'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssetHierarchyChild'
GO
/****** Object:  View [dbo].[View_AssetHierarchy]    Script Date: 09/07/2010 20:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_AssetHierarchy]
AS
SELECT     dbo.AssetRelationship.RelatedAssetID AS AssetID, dbo.Asset.Name AS AssetName, dbo.AssetRelationship.AssetID AS ParentAssetID, dbo.AssetType.AssetType
FROM         dbo.AssetRelationship INNER JOIN
                      dbo.Asset ON dbo.AssetRelationship.RelatedAssetID = dbo.Asset.AssetID INNER JOIN
                      dbo.AssetType ON dbo.Asset.AssetType = dbo.AssetType.AssetTypeID
UNION
SELECT     dbo.AssetRelationship.AssetID AS AssetID, dbo.Asset.Name AS AssetName, dbo.AssetRelationship.RelatedAssetID AS ParentAssetID, dbo.AssetType.AssetType
FROM         dbo.AssetRelationship INNER JOIN
                      dbo.Asset ON dbo.AssetRelationship.AssetID = dbo.Asset.AssetID INNER JOIN
                      dbo.AssetType ON dbo.Asset.AssetType = dbo.AssetType.AssetTypeID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[12] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssetRelationship"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 99
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Asset"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 114
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetType"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 95
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1470
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssetHierarchy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssetHierarchy'
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAssetTypeValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAssetTypeValues] 
@AssetTypePropertyValueID int,
@AssetTypePropertyValue nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[AssetTypePropertyValue]
   SET [AssetTypePropertyValue] = @AssetTypePropertyValue
 WHERE AssetTypePropertyValueID = @AssetTypePropertyValueID




END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssetTypeValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssetTypeValues] 
@Asset int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [AssetTypePropertyValueID]
      ,property.AssetTypeProperty
      ,value.AssetTypeProperty as AssetTypePropertyID
      ,[AssetTypePropertyValue]
  FROM [dbo].[AssetTypePropertyValue] value
  Inner join AssetTypeProperty property on value.AssetTypeProperty = property.AssetTypePropertyID
	where Asset = @asset  



END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAssetSubTypeValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_GetAssetSubTypeValues] 
@Asset int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [AssetSubTypePropertyValueID]
      ,property.AssetSubTypeProperty
      ,value.AssetSubTypeProperty as AssetSubTypePropertyID
      ,[AssetSubTypePropertyValue]
  FROM [dbo].[AssetSubTypePropertyValue] value
  Inner join AssetSubTypeProperty property on value.AssetSubTypeProperty = property.AssetSubTypePropertyID
	where Asset = @asset  



END
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipDelete]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetRelationshipDelete] 
    @AssetID int,
    @RelatedAssetID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[AssetRelationship]
	WHERE  [AssetID] = @AssetID
	       AND [RelatedAssetID] = @RelatedAssetID

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateAssetTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_CreateAssetTypeProperty]
	@AssetTypePropertyID int,
	@AssetType int,
	@AssetTypeProperty nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




INSERT INTO [dbo].[AssetTypeProperty]
           ([AssetType]
           ,[AssetTypeProperty])
     VALUES
			(@AssetType, @AssetTypeProperty)

INSERT INTO dbo.AssetTypePropertyValue(Asset, AssetTypeProperty)  
	SELECT AssetID , IDENT_CURRENT('dbo.AssetTypeProperty') FROM dbo.asset
		WHERE AssetType = @AssetType











END
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateAssetSubTypeProperty]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_CreateAssetSubTypeProperty]
	@AssetSubTypePropertyID int,
	@AssetSubType int,
	@AssetSubTypeProperty nvarchar(25)

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [dbo].[AssetSubTypeProperty]
           ([AssetSubType]
           ,[AssetSubTypeProperty])
     VALUES
           (@AssetSubType,
           @AssetSubTypeProperty)

INSERT INTO dbo.AssetSubTypePropertyValue(Asset, AssetSubTypeProperty)  
	SELECT AssetID , IDENT_CURRENT('dbo.AssetSubTypeProperty') FROM dbo.asset
		WHERE AssetSubType = @AssetSubType


END
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateAsset]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_CreateAsset]

@AssetType int,
@AssetSubType int,
@Name nvarchar(255),
@ClientID nvarchar(255),
@LabID nvarchar(255),
@Status nvarchar(15) = 'Active',
@DeviceStatus nvarchar(50),
@HasAlarm BIT = 0,
@AlarmMessage nvarchar(50),
@LastServiceDate date,
@NextServiceDate date,
@Notes nvarchar(255)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if(@HasAlarm = NULL)
	set @HasAlarm = 0;

INSERT INTO [dbo].[Asset]
           ([AssetType]
           ,[AssetSubType]
           ,[Name]
           ,[ClientID]
		   ,[LabID]
           ,[Status]
		   ,[DeviceStatus]
			,[HasAlarm]
			,[AlarmMessage]
           ,[LastServiceDate]
           ,[NextServiceDate]
           ,[Notes])
     VALUES
           (@AssetType
           ,@AssetSubType
           ,@Name
           ,@ClientID
		   ,@LabID
           ,@Status
		   ,@DeviceStatus
		   ,@HasAlarm
		   ,@AlarmMessage
           ,@LastServiceDate
           ,@NextServiceDate
           ,@Notes)

INSERT INTO dbo.AssetTypePropertyValue (Asset, AssetTypeProperty) 
		SELECT IDENT_CURRENT ('dbo.Asset'), AssetTypePropertyID FROM dbo.AssetTypeProperty WHERE AssetType = @AssetType

INSERT INTO dbo.AssetSubTypePropertyValue (Asset, AssetSubTypeProperty) 
		SELECT IDENT_CURRENT ('dbo.Asset'), AssetSubTypePropertyID FROM dbo.AssetSubTypeProperty WHERE AssetSubType = @AssetSubType



END
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipUpdate]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetRelationshipUpdate] 
    @AssetID int,
    @RelatedAssetID int,
    @Relationship bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[AssetRelationship]
	SET    [AssetID] = @AssetID, [RelatedAssetID] = @RelatedAssetID, [Relationship] = @Relationship
	WHERE  [AssetID] = @AssetID
	       AND [RelatedAssetID] = @RelatedAssetID
	
	/*-- Begin Return Select <- do not remove
	SELECT [AssetID], [RelatedAssetID], [Relationship]
	FROM   [dbo].[AssetRelationship]
	WHERE  [AssetID] = @AssetID
	       AND [RelatedAssetID] = @RelatedAssetID	
	-- End Return Select <- do not remove*/

	COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipSelect]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetRelationshipSelect] 
    @AssetID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [AssetID], [RelatedAssetID], [Relationship] 
	FROM   [dbo].[AssetRelationship] 
	WHERE  ([AssetID] = @AssetID)

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipInsert]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [usp_AssetRelationshipInsert] 
    @AssetID int,
    @RelatedAssetID int,
    @Relationship bit = 0
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[AssetRelationship] ([AssetID], [RelatedAssetID], [Relationship])
	SELECT @AssetID, @RelatedAssetID, @Relationship
	
	/*-- Begin Return Select <- do not remove
	SELECT [AssetID], [RelatedAssetID], [Relationship]
	FROM   [dbo].[AssetRelationship]
	WHERE  [AssetID] = @AssetID
	       AND [RelatedAssetID] = @RelatedAssetID
	-- End Return Select <- do not remove*/
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAssetSubTypeValues]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SK
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [usp_UpdateAssetSubTypeValues] 
@AssetSubTypePropertyValueID int,
@AssetSubTypePropertyValue nvarchar(255)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[AssetSubTypePropertyValue]
   SET [AssetSubTypePropertyValue] = @AssetSubTypePropertyValue
 WHERE AssetSubTypePropertyValueID = @AssetSubTypePropertyValueID




END
GO
/****** Object:  View [dbo].[View_AssetHierarchyCTE]    Script Date: 09/07/2010 20:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View_AssetHierarchyCTE]
AS
WITH Hierarchy(AssetID, AssetName, ParentAssetID, HLevel) AS (SELECT     AssetID, AssetName, ParentAssetID, 0 AS HLevel
                                                                                                                                              FROM         dbo.View_AssetHierarchy
                                                                                                                                              UNION ALL
                                                                                                                                              SELECT     SubAsset.AssetID, SubAsset.AssetName, SubAsset.ParentAssetID, 
                                                                                                                                                                    ParentAsset.HLevel + 1 AS Expr1
                                                                                                                                              FROM         dbo.View_AssetHierarchy AS SubAsset INNER JOIN
                                                                                                                                                                    Hierarchy AS ParentAsset ON SubAsset.ParentAssetID = ParentAsset.AssetID)
    SELECT     AssetID, REPLICATE('.', HLevel) + AssetName AS AssetName, ParentAssetID, HLevel
     FROM         Hierarchy AS Hierarchy_1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Hierarchy_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssetHierarchyCTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssetHierarchyCTE'
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipHierarchyParent]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Steve King
-- Create date: 
-- Description:	CTE based Recursive Loop to build Hierarchy table for relationship tree view
-- =============================================
CREATE PROCEDURE [usp_AssetRelationshipHierarchyParent] 
	-- Add the parameters for the stored procedure here
	@AssetID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;

SELECT  AssetRelationship.AssetID,
        Asset.Name AS AssetName,
        0 AS ChildNodeCount,
        AssetType.AssetType
FROM    dbo.AssetRelationship
        INNER JOIN asset ON asset.AssetID = dbo.AssetRelationship.AssetID
        INNER JOIN AssetType ON Asset.AssetType = AssetType.AssetTypeID
WHERE RelatedAssetID = @AssetID
UNION   
SELECT AssetID,AssetName,(SELECT count(*) FROM View_AssetHierarchy
WHERE ParentAssetID=AH.AssetID) childnodecount, AssetType FROM View_AssetHierarchy AH
WHERE (AssetID = @AssetID)


END
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipHierarchyChild]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Steve King
-- Create date: 
-- Description:	CTE based Recursive Loop to build Hierarchy table for relationship tree view
-- =============================================
CREATE PROCEDURE [usp_AssetRelationshipHierarchyChild] 
	-- Add the parameters for the stored procedure here
@ParentID int = 0,
@assetID int = 0	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select AssetID, AssetName ,(select count(*) FROM View_AssetHierarchyChild WHERE ParentAssetID=AH.AssetID) 
 childnodecount FROM View_AssetHierarchyChild AH where (parentAssetID = @ParentID) and (AssetID != @AssetID) 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AssetRelationshipHierarchy]    Script Date: 09/07/2010 20:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Steve King
-- Create date: 
-- Description:	CTE based Recursive Loop to build Hierarchy table for relationship tree view
-- =============================================
CREATE PROCEDURE [usp_AssetRelationshipHierarchy] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
WITH Hierarchy(AssetID, AssetName, ParentAssetID, HLevel)
AS
(
SELECT AssetID, AssetName, ParentAssetID, 0 as HLevel FROM View_AssetHierarchy
UNION ALL
SELECT SubAsset.AssetID
, SubAsset.AssetName,
 SubAsset.ParentAssetID,
 HLevel + 1
    FROM View_AssetHierarchy SubAsset
        INNER JOIN Hierarchy ParentAsset
        ON SubAsset.ParentAssetID = ParentAsset.AssetID )
SELECT      AssetID, 
            AssetName = Replicate('.', HLevel) + AssetName, 
            ParentAssetID,
            HLevel
FROM  Hierarchy

END
GO
/****** Object:  Default [DF_Orders_OrderDate]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [Order] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
/****** Object:  Default [DF_Documents_DateUploaded]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [Documents] ADD  CONSTRAINT [DF_Documents_DateUploaded]  DEFAULT (getdate()) FOR [DateUploaded]
GO
/****** Object:  Default [DF_Asset_Status]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [Asset] ADD  CONSTRAINT [DF_Asset_Status]  DEFAULT (N'Planned') FOR [Status]
GO
/****** Object:  ForeignKey [FK_OrderItems_Order]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [Order] ([ID])
GO
ALTER TABLE [OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
/****** Object:  ForeignKey [FK_AssetTypePropertyValue_Asset]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetTypePropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_AssetTypePropertyValue_Asset] FOREIGN KEY([Asset])
REFERENCES [Asset] ([AssetID])
GO
ALTER TABLE [AssetTypePropertyValue] CHECK CONSTRAINT [FK_AssetTypePropertyValue_Asset]
GO
/****** Object:  ForeignKey [FK_AssetTypePropertyValue_AssetTypeProperty]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetTypePropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_AssetTypePropertyValue_AssetTypeProperty] FOREIGN KEY([AssetTypeProperty])
REFERENCES [AssetTypeProperty] ([AssetTypePropertyID])
GO
ALTER TABLE [AssetTypePropertyValue] CHECK CONSTRAINT [FK_AssetTypePropertyValue_AssetTypeProperty]
GO
/****** Object:  ForeignKey [FK_AssetTypeProperty_AssetType]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetTypeProperty]  WITH CHECK ADD  CONSTRAINT [FK_AssetTypeProperty_AssetType] FOREIGN KEY([AssetType])
REFERENCES [AssetType] ([AssetTypeID])
GO
ALTER TABLE [AssetTypeProperty] CHECK CONSTRAINT [FK_AssetTypeProperty_AssetType]
GO
/****** Object:  ForeignKey [FK_AssetSubTypePropertyValue_Asset]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetSubTypePropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_AssetSubTypePropertyValue_Asset] FOREIGN KEY([Asset])
REFERENCES [Asset] ([AssetID])
GO
ALTER TABLE [AssetSubTypePropertyValue] CHECK CONSTRAINT [FK_AssetSubTypePropertyValue_Asset]
GO
/****** Object:  ForeignKey [FK_AssetSubTypePropertyValue_AssetSubTypeProperty]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetSubTypePropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_AssetSubTypePropertyValue_AssetSubTypeProperty] FOREIGN KEY([AssetSubTypeProperty])
REFERENCES [AssetSubTypeProperty] ([AssetSubTypePropertyID])
GO
ALTER TABLE [AssetSubTypePropertyValue] CHECK CONSTRAINT [FK_AssetSubTypePropertyValue_AssetSubTypeProperty]
GO
/****** Object:  ForeignKey [FK_AssetSubTypeProperty_AssetSubType]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetSubTypeProperty]  WITH CHECK ADD  CONSTRAINT [FK_AssetSubTypeProperty_AssetSubType] FOREIGN KEY([AssetSubType])
REFERENCES [AssetSubType] ([AssetSubTypeID])
GO
ALTER TABLE [AssetSubTypeProperty] CHECK CONSTRAINT [FK_AssetSubTypeProperty_AssetSubType]
GO
/****** Object:  ForeignKey [FK_AssetSubType_AssetType]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetSubType]  WITH CHECK ADD  CONSTRAINT [FK_AssetSubType_AssetType] FOREIGN KEY([AssetType])
REFERENCES [AssetType] ([AssetTypeID])
GO
ALTER TABLE [AssetSubType] CHECK CONSTRAINT [FK_AssetSubType_AssetType]
GO
/****** Object:  ForeignKey [FK_AssetRelationship_Asset]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetRelationship]  WITH CHECK ADD  CONSTRAINT [FK_AssetRelationship_Asset] FOREIGN KEY([AssetID])
REFERENCES [Asset] ([AssetID])
GO
ALTER TABLE [AssetRelationship] CHECK CONSTRAINT [FK_AssetRelationship_Asset]
GO
/****** Object:  ForeignKey [FK_AssetRelationship_Asset1]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [AssetRelationship]  WITH CHECK ADD  CONSTRAINT [FK_AssetRelationship_Asset1] FOREIGN KEY([RelatedAssetID])
REFERENCES [Asset] ([AssetID])
GO
ALTER TABLE [AssetRelationship] CHECK CONSTRAINT [FK_AssetRelationship_Asset1]
GO
/****** Object:  ForeignKey [FK_Asset_AssetSubType]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_AssetSubType] FOREIGN KEY([AssetSubType])
REFERENCES [AssetSubType] ([AssetSubTypeID])
GO
ALTER TABLE [Asset] CHECK CONSTRAINT [FK_Asset_AssetSubType]
GO
/****** Object:  ForeignKey [FK_Asset_AssetType]    Script Date: 09/07/2010 20:34:12 ******/
ALTER TABLE [Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_AssetType] FOREIGN KEY([AssetType])
REFERENCES [AssetType] ([AssetTypeID])
GO
ALTER TABLE [Asset] CHECK CONSTRAINT [FK_Asset_AssetType]
GO

/****** Insert default values into AssetType and AssetSubType Table ******/

SET IDENTITY_INSERT AssetType ON
INSERT INTO [AssetType]([AssetTypeID], [AssetType])
SELECT '1','Microbalances' UNION ALL
SELECT '2','Analytical Balances' UNION ALL
SELECT '3','Precision Balances'
SET IDENTITY_INSERT AssetType OFF
GO

SET IDENTITY_INSERT AssetSubType ON
INSERT INTO [AssetSubType]([AssetSubTypeID], [AssetType] ,[AssetSubType])
SELECT '1','1','XP Microbalances' UNION ALL
SELECT '2','1','XP Ultra-microbalances' UNION ALL
SELECT '3','1','XS Microbalances' UNION ALL
SELECT '4','1','XPE Micro-Analytical Balances' UNION ALL
SELECT '5','2','XPE Analytical Balances' UNION ALL
SELECT '6','2','XSE Analytical Balances' UNION ALL
SELECT '7','2','XA Analytical Balances' UNION ALL
SELECT '8','2','MS Analytical Balances' UNION ALL
SELECT '9','2','ML Analytical Balances' UNION ALL
SELECT '10','2','ME Analytical Balances' UNION ALL
SELECT '11','3','XP Precision Balances' UNION ALL
SELECT '12','3','XS Precision Balances' UNION ALL
SELECT '13','3','MS Precision Balances' UNION ALL
SELECT '14','3','MS-L Precision Balances' UNION ALL
SELECT '15','3','ML Precision Balances' UNION ALL
SELECT '16','3','ME Precision Balances' UNION ALL
SELECT '17','3','Classic Light Balances PL-S / PL-L'

SET IDENTITY_INSERT AssetSubType OFF

INSERT INTO DocumentMimeTypes (Extension, MimeType)
SELECT '.gif','image/gif' UNION ALL
SELECT '.jpg','image/jpeg' UNION ALL
SELECT '.jpeg','image/jpeg' UNION ALL
SELECT '.jpe','image/jpeg' UNION ALL
SELECT '.png','image/png' UNION ALL
SELECT '.bmp','image/bmp' UNION ALL
SELECT '.tiff','image/tiff' UNION ALL
SELECT '.txt','text/plain ' UNION ALL
SELECT '.rtf','application/rtf ' UNION ALL
SELECT '.doc','application/msword' UNION ALL
SELECT '.ppt','application/vnd.ms-powerpoint' UNION ALL
SELECT '.xls','application/vnd.ms-excel' UNION ALL
SELECT '.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document' UNION ALL
SELECT '.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation' UNION ALL
SELECT '.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' UNION ALL
SELECT '.vsd','application/vnd.visio' UNION ALL
SELECT '.odt','application/vnd.oasis.opendocument.text' UNION ALL
SELECT '.ods','application/vnd.oasis.opendocument.spreadsheet' UNION ALL
SELECT '.odg','application/vnd.oasis.opendocument.graphics' UNION ALL
SELECT '.htm','text/html' UNION ALL
SELECT '.html','text/html' UNION ALL
SELECT '.pdf','application/pdf'