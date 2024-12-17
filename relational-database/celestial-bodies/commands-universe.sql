CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE, constellation TEXT, nstars int, nplanets int);
CREATE TABLE star(star_id SERIAL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE, galaxy_id INT NOT NULL, earth_distance_ly int, gravity_g numeric(5,2));
CREATE TABLE planet(planet_id SERIAL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE, star_id INT NOT NULL, has_life BOOLEAN, has_water BOOLEAN);
CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE, planet_id INT NOT NULL, dst_planet_km numeric(10, 1), gravity_g numeric(5, 2));

ALTER TABLE star ADD FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD FOREIGN KEY(star_id) REFERENCES star(star_id);
ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);

CREATE TABLE planet_trivia(planet_trivia_id SERIAL PRIMARY KEY, planet_id INT NOT NULL, name VARCHAR(40) UNIQUE, trivia TEXT NOT NULL, source VARCHAR(60));
ALTER TABLE planet_trivia ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);

INSERT INTO galaxy(galaxy_id, name, constellation, nstars, nplanets) VALUES(1, 'Milky way', 'Sagittarius', 400, 400), (2, 'Alcyoneus', 'Lynx', NULL, NULL), (3, 'Andromeda', 'Andromeda', 1000, 1000), (4, 'Antennae Galaxies', 'Corvus', NULL, NULL), (5, 'Blinking Galaxy', 'Serpens', NULL, NULL), (6, 'Butterfly Galaxies', 'Virgo', NULL, NULL);
INSERT INTO star(star_id, name, galaxy_id, earth_distance_ly, gravity_g) 
VALUES
  (1, 'Sun', 1, 1, 27.4),
  (2, 'Proxima Centauri', 1, 4, 16.4),
  (3, 'Sirius A', 1, 8, 196),
  (4, 'Nu Andromedae', 3, NULL, NULL),
  (5, '14 Andromedae', 3, NULL, NULL),
  (6, 'I dont know', 1, NULL, NULL),
  (7, 'I cant take it', 1, NULL, NULL);

INSERT INTO planet (planet_id, name, star_id, has_life, has_water)
VALUES
    (1, 'Mercury', 1, FALSE, FALSE),
    (2, 'Venus', 1, FALSE, FALSE),
    (3, 'Earth', 1, TRUE, TRUE),
    (4, 'Mars', 1, FALSE, FALSE),
    (5, 'Proxima b', 2, TRUE, TRUE),
    (6, 'Sirius b', 3, FALSE, TRUE),
    (7, 'Nu I', 4, FALSE, FALSE),
    (8, 'Nu II', 4, FALSE, FALSE),
    (9, '14 Andromedae b', 5, FALSE, FALSE),
    (10, '14 Andromedae c', 5, FALSE, FALSE),
    (11, 'I Dont Know A', 6, FALSE, FALSE),
    (12, 'I Cant Take It B', 7, FALSE, FALSE);

INSERT INTO planet_trivia(planet_id, trivia) VALUES(2, 'Its hot'), (3, 'People live there'), (4, 'Its cold');

INSERT INTO moon (moon_id, name, planet_id, dst_planet_km, gravity_g)
VALUES
    (1, 'Moon', 3, 384400.0, 0.17),
    (2, 'Phobos', 4, 9376.0, 0.0057),
    (3, 'Deimos', 4, 23460.0, 0.003),
    (4, 'Io', 5, 421700.0, 0.183),
    (5, 'Europa', 5, 671034.0, 0.134),
    (6, 'Ganymede', 6, 1070400.0, 0.146),
    (7, 'Callisto', 6, 1882700.0, 0.126),
    (8, 'Titan', 3, 1221870.0, 0.138),
    (9, 'Rhea', 1, 527040.0, 0.264),
    (10, 'Oberon', 2, 583520.0, 0.345),
    (11, 'Triton', 9, 354760.0, 0.071),
    (12, 'Nereid', 9, 5510000.0, 0.0022),
    (13, 'Proteus', 10, 117600.0, 0.0006),
    (14, 'Larissa', 10, 73500.0, 0.0004),
    (15, 'Charon', 11, 19590.0, 0.059),
    (16, 'Styx', 11, 42656.0, 0.003),
    (17, 'Nix', 12, 48694.0, 0.005),
    (18, 'Hydra', 12, 64738.0, 0.007),
    (19, 'Kerberos', 12, 57700.0, 0.0035),
    (20, 'Setebos', 7, 1185500.0, 0.003);

