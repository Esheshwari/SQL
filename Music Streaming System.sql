CREATE DATABASE music_db;
USE music_db;

CREATE TABLE artists (
  artist_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE albums (
  album_id INT PRIMARY KEY,
  artist_id INT,
  title VARCHAR(150),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE songs (
  song_id INT PRIMARY KEY,
  album_id INT,
  title VARCHAR(150),
  duration INT,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

INSERT INTO artists (name) VALUES ('Artist1');
INSERT INTO albums (artist_id,title) VALUES (1,'Album1');
INSERT INTO songs (album_id,title,duration) VALUES (1,'Song1',180),(1,'Song2',210);

-- Total songs per album
SELECT al.title AS album, COUNT(s.song_id) AS total_songs
FROM albums al
LEFT JOIN songs s ON al.album_id = s.album_id
GROUP BY al.album_id;

-- Join artist and song details
SELECT ar.name AS artist, al.title AS album, s.title AS song
FROM artists ar
JOIN albums al ON ar.artist_id = al.artist_id
JOIN songs s ON al.album_id = s.album_id;

-- Procedure to add a new track
DROP PROCEDURE add_track;
DELIMITER $$
CREATE PROCEDURE add_track(IN p_album INT, IN p_title VARCHAR(150), IN p_duration INT)
BEGIN
  INSERT INTO songs (album_id,title,duration) VALUES (p_album,p_title,p_duration);
END$$
DELIMITER ;
