GO
CREATE PROCEDURE delete_ward
AS
DECLARE @DAYS_TO_DELETE int = CAST((SELECT SI_code FROM Standard_Information WHERE SI_value = 'DAYS_TO_DELETE') AS int),
@DEACTIVATION_DATE datetime = (SELECT W_deactivate_date FROM Ward WHERE W_active = 0)
BEGIN
	DELETE Ward
	WHERE DATEADD(day, @DAYS_TO_DELETE, @DEACTIVATION_DATE) <= GETDATE()
END