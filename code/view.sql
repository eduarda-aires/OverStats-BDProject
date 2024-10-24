DROP VIEW OVERSTATS.PlayerStatsView;
go

CREATE VIEW OVERSTATS.PlayerStatsView
AS
SELECT s.stat_id AS id, p.id AS playerId, p.nome AS PlayerName, s.hero AS Hero, s.kda AS KDA, s.accuracy AS Accuracy, s.result AS Result, s.time_played AS TimePlayed, s.map AS Map
FROM OVERSTATS.Player p
JOIN OVERSTATS.Stats s ON p.id = s.player;