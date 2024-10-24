DROP PROCEDURE OVERSTATS.UpdatePlayerMainCharacter
GO

CREATE PROCEDURE OVERSTATS.UpdatePlayerMainCharacter
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET p.main = c.hero
    FROM OVERSTATS.Player p
    INNER JOIN (
    SELECT player, hero
    FROM (
        SELECT player, hero, ROW_NUMBER() OVER (PARTITION BY player ORDER BY total_time_played DESC) AS rn
        FROM (
            SELECT player, hero, SUM(time_played) AS total_time_played
            FROM OVERSTATS.Stats
            GROUP BY player, hero
        ) s
    ) t
    WHERE rn = 1
    ) c ON p.id = c.player;

END
GO

---SP to getMapInfo
DROP PROCEDURE OVERSTATS.GetMapInfo
GO

CREATE PROCEDURE OVERSTATS.GetMapInfo
    @mapName NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM OVERSTATS.SINGLEMAP WHERE nome = @mapName)
    BEGIN
        SELECT * FROM OVERSTATS.SINGLEMAP WHERE nome = @mapName;
    END
    ELSE IF EXISTS (SELECT 1 FROM OVERSTATS.MULTIMAP WHERE nome = @mapName)
    BEGIN
        SELECT * FROM OVERSTATS.MULTIMAP WHERE nome = @mapName;
    END
END


