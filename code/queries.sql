/* queries used in the application */
SELECT * FROM OVERSTATS.PlayerStatsView; /* get all player stats along with the name*/

SELECT * FROM OVERSTATS.MAP /* get all maps */

SELECT * FROM OVERSTATS.SINGLEMAP WHERE nome = @mapName; /* get single map info */

SELECT * FROM OVERSTATS.MULTIMAP WHERE nome = @mapName; /* get multi map info */

SELECT * FROM OVERSTATS.HERO /* get all heroes */

SELECT nome, main FROM OVERSTATS.PLAYER /* get all players and their main */

SELECT OVERSTATS.GetPlayerIdByName('{playerName}') AS PlayerId /* get player id by name */

SELECT * FROM OVERSTATS.RANK WHERE player = @playerId /* get player rank */

SELECT nome,main FROM OVERSTATS.PLAYER INNER JOIN OVERSTATS.FRIENDS ON (OVERSTATS.FRIENDS.player2 = OVERSTATS.PLAYER.id OR OVERSTATS.FRIENDS.player1 = OVERSTATS.PLAYER.id) WHERE (OVERSTATS.FRIENDS.player1 = @playerId OR OVERSTATS.FRIENDS.player2 = @playerId) AND OVERSTATS.PLAYER.id != @playerId /* get player friends */

SELECT stat_id, hero, map, kda, accuracy, result, time_played FROM OVERSTATS.STATS WHERE player = @playerId /* get player stats */

DELETE FROM OVERSTATS.FRIENDS WHERE (player1 = @playerId AND player2 = @friendId) OR (player1 = @friendId AND player2 = @playerId) /* remove friend */

INSERT INTO OVERSTATS.FRIENDS (player1, player2) VALUES (@playerId, @friendId) /* add friend */

INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) " +  "VALUES (@playerId, @hero, @kda, @accuracy, @result, @timePlayed, @map) /* add stat */



