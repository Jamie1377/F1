
CREATE TABLE Artist (
  artist_id  SERIAL,
  name VARCHAR(255),
  PRIMARY KEY(artist_id)
); 


CREATE TABLE Album (
  album_id serial ,
  title VARCHAR(255),
  artist_id INTEGER,

  PRIMARY KEY(album_id),
  

  FOREIGN KEY (artist_id)
    REFERENCES Artist (artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ;


CREATE TABLE Genre (
  genre_id serial,
  name VARCHAR(255),
  PRIMARY KEY(genre_id)
) ;


CREATE TABLE Track (
  track_id serial,
  title VARCHAR(255),
  len INTEGER,
  rating INTEGER,
  count  INTEGER,
  album_id INTEGER,
  genre_id INTEGER,

  PRIMARY KEY(track_id),
  

  FOREIGN KEY (album_id) REFERENCES Album (album_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ;


INSERT INTO Artist (name) VALUES ('Led Zepplin');
INSERT INTO Artist ("name") VALUES ('AC/DC');

INSERT INTO Genre (name) VALUES ('Rock');
INSERT INTO Genre ("name") VALUES ('Metal');

INSERT INTO Album (title, artist_id) VALUES ('Who Made Who', 2);
INSERT INTO Album (title, artist_id) VALUES ('IV', 1);


INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Black Dog', 5, 297, 0, 2, 1);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Stairway', 5, 482, 0, 2, 1);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('About to Rock', 5, 313, 0, 1, 2);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Who Made Who', 5, 207, 0, 1, 2);
	
	select album.title, artist."name" 
	from album
	JOin artist
	On artist.artist_id = album.artist_id
	
	
	update artist set name = 'AC/DC' where name = 'Yue Yu'
	