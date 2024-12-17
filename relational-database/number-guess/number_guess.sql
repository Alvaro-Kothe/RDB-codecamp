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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 10);
INSERT INTO public.games VALUES (2, 1, 20);
INSERT INTO public.games VALUES (3, 1, 5);
INSERT INTO public.games VALUES (4, 2, 5);
INSERT INTO public.games VALUES (5, 4, 10);
INSERT INTO public.games VALUES (6, 5, 113);
INSERT INTO public.games VALUES (7, 5, 231);
INSERT INTO public.games VALUES (8, 6, 461);
INSERT INTO public.games VALUES (9, 6, 840);
INSERT INTO public.games VALUES (10, 5, 530);
INSERT INTO public.games VALUES (11, 5, 442);
INSERT INTO public.games VALUES (12, 5, 778);
INSERT INTO public.games VALUES (13, 7, 900);
INSERT INTO public.games VALUES (14, 7, 474);
INSERT INTO public.games VALUES (15, 8, 550);
INSERT INTO public.games VALUES (16, 8, 8);
INSERT INTO public.games VALUES (17, 7, 202);
INSERT INTO public.games VALUES (18, 7, 745);
INSERT INTO public.games VALUES (19, 7, 145);
INSERT INTO public.games VALUES (20, 4, 12);
INSERT INTO public.games VALUES (21, 4, 13);
INSERT INTO public.games VALUES (22, 4, 14);
INSERT INTO public.games VALUES (23, 4, 15);
INSERT INTO public.games VALUES (24, 1, 10);
INSERT INTO public.games VALUES (25, 11, 384);
INSERT INTO public.games VALUES (26, 11, 835);
INSERT INTO public.games VALUES (27, 12, 408);
INSERT INTO public.games VALUES (28, 12, 455);
INSERT INTO public.games VALUES (29, 11, 326);
INSERT INTO public.games VALUES (30, 11, 480);
INSERT INTO public.games VALUES (31, 11, 445);
INSERT INTO public.games VALUES (32, 13, 277);
INSERT INTO public.games VALUES (33, 13, 199);
INSERT INTO public.games VALUES (34, 14, 722);
INSERT INTO public.games VALUES (35, 14, 764);
INSERT INTO public.games VALUES (36, 13, 498);
INSERT INTO public.games VALUES (37, 13, 76);
INSERT INTO public.games VALUES (38, 13, 303);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'a');
INSERT INTO public.users VALUES (2, 'b');
INSERT INTO public.users VALUES (3, 'c');
INSERT INTO public.users VALUES (4, 'd');
INSERT INTO public.users VALUES (5, 'user_1734233594519');
INSERT INTO public.users VALUES (6, 'user_1734233594518');
INSERT INTO public.users VALUES (7, 'user_1734233613047');
INSERT INTO public.users VALUES (8, 'user_1734233613046');
INSERT INTO public.users VALUES (9, 'user_1734233727835');
INSERT INTO public.users VALUES (10, 'user_1734233727834');
INSERT INTO public.users VALUES (11, 'user_1734233976738');
INSERT INTO public.users VALUES (12, 'user_1734233976737');
INSERT INTO public.users VALUES (13, 'user_1734234033524');
INSERT INTO public.users VALUES (14, 'user_1734234033523');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 38, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


