GO
alter PROCEDURE [ams].[usp_tblAssetsSelect]
		@AssetCode [varchar](80),
		@ParentCode varchar(80),
		@ManufacturerID int,
		@ChartLevel int
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select * from ams.vwAssets
	where 
	[AssetCode]= case when @AssetCode is not null then @AssetCode else [AssetCode] end
	AND [ParentCode]= case when @ParentCode is not null then @ParentCode else [ParentCode] end
	and [ChartLevel]= case when @ChartLevel !=0 then @ChartLevel else [ChartLevel] end
	and ((@ManufacturerID != 0 and ManufacturerID = @ManufacturerID) or ( null is null))

	COMMIT
	GO
alter PROCEDURE [ams].[usp_tblAssetsInsert]
	(
		@AssetCode [varchar](80),
		@ParentCode [varchar](80),
		@AssetName [varchar](100),
		@AssetNameU [nvarchar](150),
		@ChartLevel [int],
		@UOMID [varchar](15),
		@LabelRequired [bit],
		@TransactionalLevel [bit],
		@DepMethodID varchar(2),
		@ManufacturerID int,
		@Active [bit],
	    @CreatedBy [varchar](5)
		--//@CreationDate [datetime],

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	INSERT INTO ams.tblAssets
	(
		AssetCode, ParentCode, AssetName, AssetNameU, ChartLevel, UOMID, LabelRequired, TransactionalLevel, DepMethodID, ManufacturerID, Active, CreatedBy, CreationDate
	)
	VALUES
	(
	    @AssetCode,
		@ParentCode,
		@AssetName,
		@AssetNameU,
		@ChartLevel,
		@UOMID,
		@LabelRequired,
		@TransactionalLevel,
		@DepMethodID,
		@ManufacturerID,
		@Active,
		@CreatedBy,
		GETDATE()
	)
	SELECT *
	    FROM ams.vwAssets
	WHERE (AssetCode =  @AssetCode)

	COMMIT


	GO



	GO
alter Procedure [ams].[usp_tblAssetsDataTable](
@AssetCode [varchar](80),
@ParentCode [varchar](80),
@ChartLevel [int],
@ManufacturerID int,
@PageSize int,
@Next int)
as
IF @PageSize!=0 and @Next=1
BEGIN
   select * from ams.vwAssets
where 
 [AssetCode]= case when @AssetCode is not null then @AssetCode else [AssetCode] end
AND [ParentCode]= case when @ParentCode is not null then @ParentCode else [ParentCode] end
and [ChartLevel]= case when @ChartLevel !=0 then @ChartLevel else [ChartLevel] end
and ((@ManufacturerID != 0 and ManufacturerID = @ManufacturerID) or ( null is null))
order by CreationDate desc
OFFSET 0 ROWS
FETCH NEXT @PageSize ROWS ONLY;
END
ELSE
BEGIN
   select * from ams.vwAssets
where 
 [AssetCode]= case when @AssetCode is not null then @AssetCode else [AssetCode] end
AND [ParentCode]= case when @ParentCode is not null then @ParentCode else [ParentCode] end
and [ChartLevel]= case when @ChartLevel !=0 then @ChartLevel else [ChartLevel] end
and ((@ManufacturerID != 0 and ManufacturerID = @ManufacturerID) or ( null is null))
order by CreationDate desc
OFFSET (@Next-1)*@PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY;
END
GO
alter PROCEDURE [ams].[usp_tblAssetsSelectByParent]
		@ParentCode [varchar](80)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	SELECT *
	    FROM ams.vwAssets
	WHERE (ParentCode = @ParentCode)

	COMMIT
	GO
alter PROCEDURE [ams].[usp_tblAssetsUpdate]
	(
		@AssetCode [varchar](80),
		@ParentCode [varchar](80),
		@AssetName [varchar](100),
		@AssetNameU [nvarchar](150),
		@UOMID [varchar](3),
		@ChartLevel [int],
		@LabelRequired [bit],
		@TransactionalLevel [bit],
		@DepMethodID nvarchar(2),
		@ManufacturerID int,
		@Active [bit],
		@UpdatedBy [varchar](5)
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
		UPDATE ams.tblAssets
		SET AssetCode = @AssetCode, ParentCode = @ParentCode, AssetName = @AssetName, AssetNameU = @AssetNameU, ChartLevel = @ChartLevel, UOMID = @UOMID, LabelRequired = @LabelRequired, TransactionalLevel = @TransactionalLevel, DepMethodID = @DepMethodID, ManufacturerID = @ManufacturerID, Active = @Active,  UpdatedBy = @UpdatedBy, UpdationDate = GETDATE()
		WHERE (AssetCode = @AssetCode)

		SELECT *
	    FROM ams.vwAssets
	    WHERE (AssetCode =  @AssetCode)
	COMMIT
	GO

