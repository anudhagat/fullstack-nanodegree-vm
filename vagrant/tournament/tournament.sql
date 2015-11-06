-- Table definitions for the tournament project.
--
-- Create the database for the tournament project and connect to it.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

-- TABLE players: list of registered players with their names and id.

CREATE TABLE players (id serial PRIMARY KEY, name text NOT NULL);

-- TABLE games: list of games played with a unique id for each game, the winner and the loser of the game.
-- The winner and loser are ids from the players table.

CREATE TABLE games (id serial PRIMARY KEY,
	winner integer REFERENCES players(id) ON DELETE CASCADE,
	loser integer REFERENCES players(id) ON DELETE CASCADE,
	CHECK (winner <> loser));

-- VIEW gamewins: list player's id, name, the total number of wins and the total number of games the players has played.
-- The list is ordered by the player with the largest wins to the smallest number of wins.

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
