-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);


CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
 country_name TEXT NOT NULL
);


CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines ON DELETE CASCADE,
  from_city_id INTEGER REFERENCES city ON DELETE CASCADE,
  to_city_id INTEGER REFERENCES city ON DELETE CASCADE,
  from_country_id INTEGER REFERENCES country ON DELETE CASCADE,
  to_country_id INTEGER REFERENCES country ON DELETE CASCADE
);

INSERT INTO city (city_name)
VALUES ('Washington DC'), ('Seattle'), ('Tokyo'), ('London');


INSERT INTO country (country_name)
VALUES ('United States'), ('Japan'), ('United Kingdom');


INSERT INTO airlines (airline_name)
VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');


INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id, from_country_id, to_country_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2, 1, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4, 2, 3);
  

