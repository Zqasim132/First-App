USE [BSB]
GO
/****** Object:  StoredProcedure [ams].[usp_tblOpeningIssued]    Script Date: 6/22/2021 3:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON



GO


/*************** PURCHASE RECEIVING ***************/

create PROCEDURE [ams].[usp_tblPReceivingIssued]
	(
		@PRID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwPRLabelling l
	inner join ams.vwIssuanceLabelling ll on l.LabelCode = ll.LabelCode 
	where l.PRID = case when @PRID !=0 then @PRID else l.PRID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT



	GO

create PROCEDURE [ams].[usp_tblPReceivingTransfered]
	(
		@PRID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwPRLabelling l
	inner join ams.vwTransferOutLabelling ll on l.LabelCode = ll.LabelCode 
	where l.PRID = case when @PRID !=0 then @PRID else l.PRID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT
GO


















/*************** OPENING ***************/

ALTER PROCEDURE [ams].[usp_tblOpeningIssued]
	(
		@OpeningID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwOpeningLabelling l
	inner join ams.vwIssuanceLabelling ll on l.LabelCode = ll.LabelCode 
	where l.OpeningID = case when @OpeningID !=0 then @OpeningID else l.OpeningID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT



	GO

create PROCEDURE [ams].[usp_tblOpeningTransfered]
	(
		@OpeningID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwOpeningLabelling l
	inner join ams.vwTransferOutLabelling ll on l.LabelCode = ll.LabelCode 
	where l.OpeningID = case when @OpeningID !=0 then @OpeningID else l.OpeningID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT

	GO


















	/*************** RETURN_IN ***************/


create PROCEDURE [ams].[usp_tblReturnInIssued]
	(
		@RIID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwReturnInLabelling l
	inner join ams.vwIssuanceLabelling ll on l.LabelCode = ll.LabelCode 
	where l.RIID = case when @RIID !=0 then @RIID else l.RIID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT



	GO

create PROCEDURE [ams].[usp_tblReturnInTransfered]
	(
		@RIID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwReturnInLabelling l
	inner join ams.vwTransferOutLabelling ll on l.LabelCode = ll.LabelCode 
	where l.RIID = case when @RIID !=0 then @RIID else l.RIID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT



	GO





	/*************** TRANSFER_IN ***************/


create PROCEDURE [ams].[usp_tblTransferInIssued]
	(
		@TIID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwTransferInLabelling l
	inner join ams.vwIssuanceLabelling ll on l.LabelCode = ll.LabelCode 
	where l.TIID = case when @TIID !=0 then @TIID else l.TIID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT



	GO

create PROCEDURE [ams].[usp_tblTransferInTransfered]
	(
		@TIID bigint,
		@AssetCode varchar(80),
		@LabelCode varchar(100)

	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
	select Count(*) from ams.vwTransferInLabelling l
	inner join ams.vwTransferOutLabelling ll on l.LabelCode = ll.LabelCode 
	where l.TIID = case when @TIID !=0 then @TIID else l.TIID end
	and l.AssetCode = case when @AssetCode is not null then @AssetCode else l.AssetCode end
	and l.LabelCode = case when @LabelCode is not null then @LabelCode else l.LabelCode end
	COMMIT