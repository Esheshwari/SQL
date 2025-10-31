CREATE DATABASE sports_db;
USE sports_db;

CREATE TABLE teams (
  team_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE matches (
  match_id INT PRIMARY KEY,
  team1 INT,
  team2 INT,
  match_date DATE,
  FOREIGN KEY (team1) REFERENCES teams(team_id),
  FOREIGN KEY (team2) REFERENCES teams(team_id)
);

CREATE TABLE players (
  player_id INT PRIMARY KEY,
  name VARCHAR(100),
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

INSERT INTO teams (name) VALUES ('Tigers'),('Lions');
INSERT INTO players (name,team_id) VALUES ('P1',1),('P2',2);
INSERT INTO matches (team1,team2,match_date) VALUES (1,2,'2025-10-12');

-- Total matches played per team (count appearances)
SELECT t.name,
 (SELECT COUNT(*) FROM matches m WHERE m.team1=t.team_id OR m.team2=t.team_id) AS matches_played
FROM teams t;

-- Player-match info via joins (example requires match-player association table — simplified: show players and upcoming matches of their team)
SELECT p.name AS player, t.name AS team, m.match_date
FROM players p
LEFT JOIN teams t ON p.team_id = t.team_id
LEFT JOIN matches m ON (m.team1 = t.team_id OR m.team2 = t.team_id);
