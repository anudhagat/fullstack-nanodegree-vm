-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE players (id serial primary key, name text);

CREATE TABLE games (id serial primary key, winner integer, loser integer);

CREATE VIEW gamewins AS
	SELECT totalgames.id as id,
			totalwins.name as name,
			totalwins.wins as wins,
			totalgames.matches as matches FROM
	(SELECT players.id as id, players.name as name,
		    COUNT (games.winner ) AS wins
		    FROM players LEFT JOIN games
		    ON games.winner = players.id
		    GROUP BY players.id)
		AS totalwins
	LEFT JOIN
	(SELECT players.id as id, COUNT(games.id) AS matches
		FROM players LEFT JOIN games
			ON games.winner = players.id
			OR games.loser = players.id
			GROUP BY players.id)
		AS totalgames
	ON totalwins.id = totalgames.id
	ORDER BY wins DESC;
