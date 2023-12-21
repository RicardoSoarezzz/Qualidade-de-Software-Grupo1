GO
CREATE PROCEDURE get_wards_name_by_department @DEPARTMENT_ID bigint
AS
BEGIN
    SELECT W_name
    FROM Ward
    WHERE W_D_id = @DEPARTMENT_ID
END