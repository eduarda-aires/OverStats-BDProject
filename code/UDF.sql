DROP FUNCTION OVERSTATS.GetPlayerIdByName
GO

CREATE FUNCTION OVERSTATS.GetPlayerIdByName (@playerName VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @playerId INT;
    
    SELECT @playerId = id
    FROM OVERSTATS.Player
    WHERE nome = @playerName;
    
    RETURN @playerId;
END

