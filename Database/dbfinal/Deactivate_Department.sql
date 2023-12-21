GO
CREATE PROCEDURE deactivate_department @DEPARTMENT_ID bigint
AS
BEGIN
    UPDATE Department
    SET D_active = 0
    WHERE D_id = @DEPARTMENT_ID
END