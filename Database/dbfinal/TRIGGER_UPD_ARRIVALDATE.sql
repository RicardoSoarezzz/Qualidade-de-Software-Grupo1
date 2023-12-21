USE [QS_Gestao_Camas]
GO
/****** Object:  Trigger [dbo].[UPDARRIVALDATE]    Script Date: 12/21/2023 5:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[UPDARRIVALDATE]
ON [dbo].[Current_Ward]
AFTER INSERT
AS 
BEGIN 
DECLARE @BID AS BIGINT
DECLARE @CWIDA AS BIGINT
DECLARE @CWIDR AS BIGINT

SET @BID = (SELECT CW_B_id From inserted)
SET @CWIDA = (SELECT CW_ID FROM Current_Ward WHERE CW_B_id = @BID AND CW_departureDate is null)

	BEGIN 

	UPDATE Current_Ward SET CW_departureDate = CURRENT_TIMESTAMP
	WHERE @CWIDA = CW_id 
	END
END