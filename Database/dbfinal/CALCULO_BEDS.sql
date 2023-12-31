CREATE PROCEDURE CALCULOBEDS 
	@WID BIGINT
	AS
DECLARE @TOTALBEDS AS BIGINT

SELECT @TOTALBEDS = COUNT(CW_B_ID)
FROM Current_Ward WHERE CW_W_id = @WID

SET @TOTALBEDS = ISNULL(@TOTALBEDS,0)

UPDATE WARD 
SET W_occupied = @TOTALBEDS
WHERE W_id = @WID
