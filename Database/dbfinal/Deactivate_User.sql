GO
CREATE PROCEDURE deactivate_user @USER_ID bigint
AS
BEGIN
    UPDATE User_Info
    SET U_active = 0
    WHERE U_id = @USER_ID
END