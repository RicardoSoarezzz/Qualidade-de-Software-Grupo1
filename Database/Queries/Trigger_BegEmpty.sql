CREATE TRIGGER VERIFY_BED_OCCUPATION_1
ON dbo.BED 
AFTER Update
AS
BEGIN
	DECLARE @BSTATE AS BIGINT
	DECLARE @NSTATE AS BIGINT
	DECLARE @BID AS BIGINT

	SET @BID = (SELECT B_id FROM inserted)

	SET @BSTATE = (SELECT BED.B_S_id FROM Bed INNER JOIN Records on B_id = R_B_id WHERE B_id = @BID) 
	
	IF(@BSTATE) = 1
	BEGIN
		SELECT @NSTATE = B_S_id FROM inserted
		SELECT @BID = B_id FROM inserted
		IF(@NSTATE != 1 AND @NSTATE != 3)
		BEGIN
		UPDATE BED SET B_S_id = @NSTATE
		WHERE B_S_id = 1 AND B_id = @BID

		UPDATE Records SET R_actualEndDate = CURRENT_TIMESTAMP
		WHERE R_B_id = @BID
		END
	END 

END
	ERRO1: 
		ERRO1:
		RAISERROR('#1 - N�O S�O PERMITIDOS UPDATES',16,1)
		RETURN