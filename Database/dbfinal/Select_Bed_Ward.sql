GO
CREATE PROCEDURE get_beds_by_ward @WARD_ID bigint
AS
BEGIN
    SELECT cw.D_name, cw.W_name, B_id, B_processNum, S_designation, cw.CW_departureDate, cw.CW_arrivalDate
    FROM State INNER JOIN Bed
    ON S_id = B_S_id INNER JOIN (
            SELECT CW_B_id, CW_departureDate, CW_arrivalDate, W_name, D_name
            FROM Current_Ward INNER JOIN Ward
            ON CW_W_id = W_id INNER JOIN Department
            ON D_id = W_D_id
            WHERE D_id = @WARD_ID) AS cw
            ON B_id = cw.CW_B_id
END