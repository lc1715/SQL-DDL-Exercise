-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT[] 
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbits_around ON DELETE CASCADE,
  galaxy_id INTEGER REFERENCES galaxy ON DELETE CASCADE,
  moons_id INTEGER REFERENCES moons ON DELETE CASCADE
);


INSERT INTO orbits_around (name)
VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO galaxy (name)
VALUES ('Milky Way');

INSERT INTO moons (name)
VALUES ('{"The Moon"}'), ('{"Phobos", "Deimos"}'), ('{}'), ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'); 


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_id, galaxy_id, moons_id)
VALUES
  ('Earth', 1.00, 1, 1, 1),
  ('Mars', 1.88, 1, 1, 2),
  ('Venus', 0.62, 1, 1, 3),
  ('Neptune', 164.8, 1, 1, 4),
  ('Proxima Centauri b', 0.03, 1, 1, 3),
  ('Gliese 876 b', 0.23, 1, 1, 3);

