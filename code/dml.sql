/* insert data into tables */
/* delete all data from tables */
DELETE FROM OVERSTATS.SINGLEMAP;
DELETE FROM OVERSTATS.MULTIMAP;
DELETE FROM OVERSTATS.STATS;
DELETE FROM OVERSTATS.MAP;
DELETE FROM OVERSTATS.HERO;
DELETE FROM OVERSTATS.RANK;
DELETE FROM OVERSTATS.FRIENDS;
DELETE FROM OVERSTATS.PLAYER;


/* populate db with some data */
/*PLAYER*/
INSERT INTO OVERSTATS.PLAYER (id, nome, email, main) VALUES (1, 'Joao', 'joazinho@ua.pt', NULL);
INSERT INTO OVERSTATS.PLAYER (id, nome, email, main) VALUES (2, 'Maria', 'mariazinha@ua.pt', NULL);
INSERT INTO OVERSTATS.PLAYER (id, nome, email, main) VALUES (3, 'Pedro', 'pedrinho@ua.pt', NULL);
INSERT INTO OVERSTATS.PLAYER (id, nome, email, main) VALUES (4, 'Carlos', 'carlinhos@ua.pt', NULL);
INSERT INTO OVERSTATS.PLAYER (id, nome, email, main) VALUES (5, 'Raquel', 'raquelinha@ua.pt', NULL);

/*FRIENDS*/
INSERT INTO OVERSTATS.FRIENDS (player1, player2) VALUES (1, 2);
INSERT INTO OVERSTATS.FRIENDS (player1, player2) VALUES (1, 3);

/*RANK*/
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (1, 'DPS', 'DIAMOND');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (1, 'SUPPORT', 'PLATINUM');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (2, 'TANK', 'GOLD');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (2, 'SUPPORT', 'DIAMOND');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (2, 'DPS', 'MASTER');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (3, 'DPS', 'SILVER');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (3, 'TANK', 'PLATINUM');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (4, 'SUPPORT', 'BRONZE');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (4, 'DPS', 'GOLD');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (5, 'TANK', 'SILVER');
INSERT INTO OVERSTATS.RANK (player, teamrole, nome) VALUES (5, 'SUPPORT', 'MASTER');

/*HERO*/
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Ana', 'SUPPORT', 'Egyptian', 'Ana is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Biotic Rifle', 'Biotic Grenade');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Sigma', 'TANK', 'Dutch', 'Sigma is a Tank hero with a barrier that can be recalled at any time.', 'Hyperspheres', 'Experimental Barrier');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Reinhardt', 'TANK', 'German', 'Reinhardt is a Tank hero with a barrier that can be recalled at any time.', 'Rocket Hammer', 'Barrier Field');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Orisa', 'TANK', 'Nigerian', 'Orisa is a Tank hero with a barrier that can be recalled at any time.', 'Fusion Driver', 'Protective Barrier');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Ashe', 'DPS', 'American', 'Ashe is a Damage hero with a semi-automatic rifle that fires quick shots, a coach gun that pushes enemies away from her, and a dynamite that explodes after a short delay.', 'The Viper', 'Dynamite');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Cassidy', 'DPS', 'American', 'Cassidy is a Damage hero with a semi-automatic rifle that fires quick shots, a coach gun that pushes enemies away from her, and a dynamite that explodes after a short delay.', 'Combat Roll', 'Magnetic Grenade');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Dva', 'TANK', 'Korean', 'Dva is a Tank hero with a barrier that can be recalled at any time.', 'Fusion Cannons', 'Defense Matrix');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Kiriko', 'SUPPORT', 'Japanese', 'Kiriko is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Biotic Rifle', 'Biotic Grenade');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Mercy', 'SUPPORT', 'Swiss', 'Mercy is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Caduceus Staff', 'Caduceus Blaster');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Moira', 'SUPPORT', 'Irish', 'Moira is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Biotic Grasp', 'Biotic Orb');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Zenyatta', 'SUPPORT', 'Nepalese', 'Zenyatta is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Orb of Destruction', 'Orb of Harmony');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Winston', 'TANK', 'American', 'Winston is a Tank hero with a barrier that can be recalled at any time.', 'Tesla Cannon', 'Barrier Projector');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Wrecking Ball', 'TANK', 'American', 'Wrecking Ball is a Tank hero with a barrier that can be recalled at any time.', 'Quad Cannons', 'Adaptive Shield');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Zarya', 'TANK', 'Russian', 'Zarya is a Tank hero with a barrier that can be recalled at any time.', 'Particle Cannon', 'Particle Barrier');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Baptiste', 'SUPPORT', 'Haitian', 'Baptiste is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Biotic Launcher', 'Immortality Field');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Brigitte', 'SUPPORT', 'Swedish', 'Brigitte is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Rocket Flail', 'Repair Pack');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Lucio', 'SUPPORT', 'Brazilian', 'Lucio is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Sonic Amplifier', 'Crossfade');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Symmetra', 'SUPPORT', 'Indian', 'Symmetra is a versatile Support hero with a hitscan weapon and the ability to heal teammates from a distance.', 'Photon Projector', 'Sentry Turret');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Torbjorn', 'DPS', 'Swedish', 'Torbjorn is a Damage hero with a semi-automatic rifle that fires quick shots, a coach gun that pushes enemies away from her, and a dynamite that explodes after a short delay.', 'Rivet Gun', 'Forge Hammer');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Tracer', 'DPS', 'British', 'Tracer is a Damage hero with a semi-automatic rifle that fires quick shots, a coach gun that pushes enemies away from her, and a dynamite that explodes after a short delay.', 'Pulse Pistols', 'Blink');
INSERT INTO OVERSTATS.HERO (nome, teamrole, nationality, shortdescription, hability1, hability2) VALUES ('Widowmaker', 'DPS', 'French', 'Widowmaker is a Damage hero with a semi-automatic rifle that fires quick shots, a coach gun that pushes enemies away from her, and a dynamite that explodes after a short delay.', 'Widow''s Kiss', 'Grappling Hook');

/*MAP*/
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Esperanca', 'Push', 'Portugal');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Hollywood', 'Hybrid', 'USA');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Numbani', 'Hybrid', 'Nigeria');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Ilios', 'Control', 'Greece');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Lijiang Tower', 'Control', 'China');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Nepal', 'Control', 'Nepal');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Oasis', 'Control', 'Iraq');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Hanamura', 'Assault', 'Japan');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Rialto', 'Escort', 'Italy');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Route 66', 'Escort', 'USA');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Watchpoint: Gibraltar', 'Escort', 'Gibraltar');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Blizzard World', 'Hybrid', 'USA');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Eichenwalde', 'Hybrid', 'Germany');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Havana', 'Escort', 'Cuba');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Junkertown', 'Escort', 'Australia');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Dorado', 'Escort', 'Mexico');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Paris', 'Assault', 'France');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Temple of Anubis', 'Assault', 'Egypt');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Volskaya Industries', 'Assault', 'Russia');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Busan', 'Control', 'South Korea');
INSERT INTO OVERSTATS.MAP (nome, gameMode, located) VALUES ('Circuit Royal', 'Escort', 'Monaco');


/*STATS*/
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (1, 'Ana', 3, 60,'WIN',  20, 'Hanamura');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (2, 'Kiriko', 2, 25, 'WIN', 20, 'Hollywood');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (3, 'Dva', 1, 80,'LOSS',  30, 'Numbani');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (1, 'Orisa', 4, 90,'WIN',  15, 'Ilios');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (1, 'Ashe', 5, 70, 'LOSS', 8, 'Lijiang Tower');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (3, 'Cassidy', 6, 36,'LOSS',  17, 'Nepal');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (4, 'Mercy', 7, 50,'WIN',  25, 'Oasis');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (5, 'Moira', 8, 60,'WIN',  20, 'Hanamura');
INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) VALUES (2, 'Zenyatta', 9, 70,'LOSS',  20, 'Rialto');

/*MULTIMAP*/
INSERT INTO OVERSTATS.MULTIMAP (nome, map1, map2, map3) VALUES ('Ilios', 'Ilios Lighthouse', 'Ilios Ruins', 'Ilios Well');
INSERT INTO OVERSTATS.MULTIMAP (nome, map1, map2, map3) VALUES ('Lijiang Tower', 'Lijiang Control Center', 'Lijiang Garden', 'Lijiang Night Market');
INSERT INTO OVERSTATS.MULTIMAP (nome, map1, map2, map3) VALUES ('Nepal', 'Nepal Sanctum', 'Nepal Shrine', 'Nepal Village');
INSERT INTO OVERSTATS.MULTIMAP (nome, map1, map2, map3) VALUES ('Oasis', 'Oasis City Center', 'Oasis Gardens', 'Oasis University');
INSERT INTO OVERSTATS.MULTIMAP (nome, map1, map2, map3) VALUES ('Busan', 'Busan Downtown', 'Busan Sanctuary', 'Busan MEKA Base');

/*SINGLEMAP*/
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Esperanca', 'Robot');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Hollywood', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Numbani', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Hanamura', 'Point');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Rialto', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Route 66', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Watchpoint: Gibraltar', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Blizzard World', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Eichenwalde', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Havana', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Junkertown', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Dorado', 'Car');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Paris', 'Point');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Temple of Anubis', 'Point');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Volskaya Industries', 'Point');
INSERT INTO OVERSTATS.SINGLEMAP (nome, cartType) VALUES ('Circuit Royal', 'Car');


