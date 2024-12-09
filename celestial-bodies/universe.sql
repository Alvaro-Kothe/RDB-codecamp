--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation text,
    nstars integer,
    nplanets integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    dst_planet_km numeric(10,1),
    gravity_g numeric(5,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_trivia; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_trivia (
    planet_trivia_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40),
    trivia text NOT NULL,
    source character varying(60)
);


ALTER TABLE public.planet_trivia OWNER TO freecodecamp;

--
-- Name: planet_trivia_planet_trivia_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_trivia_planet_trivia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_trivia_planet_trivia_id_seq OWNER TO freecodecamp;

--
-- Name: planet_trivia_planet_trivia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_trivia_planet_trivia_id_seq OWNED BY public.planet_trivia.planet_trivia_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    earth_distance_ly integer,
    gravity_g numeric(5,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_trivia planet_trivia_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_trivia ALTER COLUMN planet_trivia_id SET DEFAULT nextval('public.planet_trivia_planet_trivia_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Sagittarius', 400, 400);
INSERT INTO public.galaxy VALUES (2, 'Alcyoneus', 'Lynx', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Andromeda', 1000, 1000);
INSERT INTO public.galaxy VALUES (4, 'Antennae Galaxies', 'Corvus', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Blinking Galaxy', 'Serpens', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'Virgo', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400.0, 0.17);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9376.0, 0.01);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23460.0, 0.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 421700.0, 0.18);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 671034.0, 0.13);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 1070400.0, 0.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 6, 1882700.0, 0.13);
INSERT INTO public.moon VALUES (8, 'Titan', 3, 1221870.0, 0.14);
INSERT INTO public.moon VALUES (9, 'Rhea', 1, 527040.0, 0.26);
INSERT INTO public.moon VALUES (10, 'Oberon', 2, 583520.0, 0.35);
INSERT INTO public.moon VALUES (11, 'Triton', 9, 354760.0, 0.07);
INSERT INTO public.moon VALUES (12, 'Nereid', 9, 5510000.0, 0.00);
INSERT INTO public.moon VALUES (13, 'Proteus', 10, 117600.0, 0.00);
INSERT INTO public.moon VALUES (14, 'Larissa', 10, 73500.0, 0.00);
INSERT INTO public.moon VALUES (15, 'Charon', 11, 19590.0, 0.06);
INSERT INTO public.moon VALUES (16, 'Styx', 11, 42656.0, 0.00);
INSERT INTO public.moon VALUES (17, 'Nix', 12, 48694.0, 0.01);
INSERT INTO public.moon VALUES (18, 'Hydra', 12, 64738.0, 0.01);
INSERT INTO public.moon VALUES (19, 'Kerberos', 12, 57700.0, 0.00);
INSERT INTO public.moon VALUES (20, 'Setebos', 7, 1185500.0, 0.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, false);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, true, true);
INSERT INTO public.planet VALUES (6, 'Sirius b', 3, false, true);
INSERT INTO public.planet VALUES (7, 'Nu I', 4, false, false);
INSERT INTO public.planet VALUES (8, 'Nu II', 4, false, false);
INSERT INTO public.planet VALUES (9, '14 Andromedae b', 5, false, false);
INSERT INTO public.planet VALUES (10, '14 Andromedae c', 5, false, false);
INSERT INTO public.planet VALUES (11, 'I Dont Know A', 6, false, false);
INSERT INTO public.planet VALUES (12, 'I Cant Take It B', 7, false, false);


--
-- Data for Name: planet_trivia; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_trivia VALUES (1, 2, NULL, 'Its hot', NULL);
INSERT INTO public.planet_trivia VALUES (2, 3, NULL, 'People live there', NULL);
INSERT INTO public.planet_trivia VALUES (3, 4, NULL, 'Its cold', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 27.40);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4, 16.40);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 8, 196.00);
INSERT INTO public.star VALUES (4, 'Nu Andromedae', 3, NULL, NULL);
INSERT INTO public.star VALUES (5, '14 Andromedae', 3, NULL, NULL);
INSERT INTO public.star VALUES (6, 'I dont know', 1, NULL, NULL);
INSERT INTO public.star VALUES (7, 'I cant take it', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_trivia_planet_trivia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_trivia_planet_trivia_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_trivia planet_trivia_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_trivia
    ADD CONSTRAINT planet_trivia_name_key UNIQUE (name);


--
-- Name: planet_trivia planet_trivia_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_trivia
    ADD CONSTRAINT planet_trivia_pkey PRIMARY KEY (planet_trivia_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_trivia planet_trivia_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_trivia
    ADD CONSTRAINT planet_trivia_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


