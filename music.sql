-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE duration_in_seconds
(
  id SERIAL PRIMARY KEY,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE release_date
(
  id SERIAL PRIMARY KEY,
  release_date INTEGER NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT[] NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT[] NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds_id INTEGER REFERENCES duration_in_seconds,
  release_date_id INTEGER REFERENCES release_date,
  artists_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums,
  producers_id INTEGER REFERENCES producers
);


INSERT INTO duration_in_seconds (duration_in_seconds)
VALUES (238), (355);

INSERT INTO release_date (release_date)
VALUES (1997-04-15), (1997-04-15);

INSERT INTO artists (artist_name)
VALUES ('{"Hanson"}'), ('{"Queen"}');

INSERT INTO albums (album_name)
VALUES ('Middle of Nowhere'), ('A Night at the Opera');

INSERT INTO producers (producer_name)
VALUES ('{"Dust Brothers", "Stephen Lironi"}'), ('{"Roy Thomas Baker"}');


INSERT INTO songs
  (title, duration_in_seconds_id, release_date_id, artists_id, album_id, producers_id)
VALUES
  ('MMMBop', 1, 1, 1, 1, 1),
  ('Bohemian Rhapsody', 2, 2, 2, 2, 2);


