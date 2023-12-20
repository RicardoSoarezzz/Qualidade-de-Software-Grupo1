CREATE TRIGGER UPDARRIVALDATE
ON CURRENT_WARD
AFTER UPDATE
AS 
BEGIN 
DECLARE @BID AS BIGINT
DECLARE @WIDA AS BIGINT
DECLARE @WIDR AS BIGINT

SET @BID = (SELECT CW_B_id From inserted)
SET @WIDA = (SELECT CW_W_ID FROM Current_Ward WHERE CW_B_id = @BID)
SET @WIDR = (SELECT CW_W_ID FROM inserted)

IF(@WIDA != @WIDR)
	BEGIN 
	UPDATE Current_Ward SET CW_arrivalDate = CURRENT_TIMESTAMP
	WHERE @WIDR = CW_W_id AND CW_B_id = @BID

	UPDATE Current_Ward SET CW_departureDate = CURRENT_TIMESTAMP
	WHERE @WIDA = CW_W_id AND CW_B_id = @BID
	END
END
