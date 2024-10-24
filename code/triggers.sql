DROP TRIGGER OVERSTATS.PreventDuplicateFriend;
GO
CREATE TRIGGER OVERSTATS.PreventDuplicateFriend
ON OVERSTATS.FRIENDS
INSTEAD OF INSERT
AS
BEGIN
    -- Check if the inserted friend already exists in the friends list
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN OVERSTATS.FRIENDS f ON 
                (f.player1 = i.player1 AND f.player2 = i.player2)
                OR (f.player1 = i.player2 AND f.player2 = i.player1)
    )
    BEGIN
        -- Friend already exists, prevent the insertion
       THROW 50000, 'User is already your friend.', 1;
    END
    ELSE
    BEGIN
        -- Friend doesn't exist, perform the insertion
        INSERT INTO OVERSTATS.FRIENDS (player1, player2)
        SELECT player1, player2
        FROM inserted;
    END
END
GO

-- Create the trigger on the STATS table

DROP TRIGGER OVERSTATS.PreventInvalidStats;
GO
CREATE TRIGGER OVERSTATS.PreventInvalidStats
ON OVERSTATS.STATS
INSTEAD OF INSERT
AS
BEGIN
    -- Check if the inserted hero exists in the HEROES table
    IF NOT EXISTS (
        SELECT 1
        FROM OVERSTATS.HERO
        WHERE nome IN (SELECT hero FROM INSERTED)
        )
    BEGIN
        RAISERROR('Invalid hero. Please select a valid hero.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Check if the inserted map exists in the MAPS table
    IF NOT EXISTS (
        SELECT 1
        FROM OVERSTATS.MAP
        WHERE nome IN (SELECT map FROM INSERTED)
        )
    BEGIN
        RAISERROR('Invalid map. Please select a valid map.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Check if the inserted player exists in the PLAYERS table
    IF NOT EXISTS (
        SELECT 1
        FROM OVERSTATS.PLAYER
        WHERE id IN (SELECT player FROM INSERTED)
        )
    BEGIN
        RAISERROR('Invalid player. Please select a valid player.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Check if the time played is valid
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE time_played < 0
        )
    BEGIN
        RAISERROR('Invalid time played. Please select a valid time played.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Check if the kda is valid
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE kda < 0
        )
    BEGIN
        RAISERROR('Invalid kda. Please select a valid kda.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Check if the accuracy is valid
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE accuracy < 0
        )
    BEGIN
        RAISERROR('Invalid accuracy. Please select a valid accuracy.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Check if the result is valid
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE result NOT IN ('WIN', 'LOSS')
        )
    BEGIN
        RAISERROR('Invalid result. Please select a valid result.', 16, 1)
        ROLLBACK;
        RETURN;
    END

    -- Insert the valid data into the STATS table
    INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map)
    SELECT player, hero, kda, accuracy, result, time_played, map
    FROM INSERTED;
END;
