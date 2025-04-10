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
    guesses integer NOT NULL,
    user_id integer NOT NULL
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
    name character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 6, 6);
INSERT INTO public.games VALUES (2, 6, 6);
INSERT INTO public.games VALUES (3, 11, 7);
INSERT INTO public.games VALUES (4, 7, 7);
INSERT INTO public.games VALUES (5, 9, 6);
INSERT INTO public.games VALUES (6, 4, 6);
INSERT INTO public.games VALUES (7, 9, 6);
INSERT INTO public.games VALUES (8, 7, 1);
INSERT INTO public.games VALUES (9, 11, 8);
INSERT INTO public.games VALUES (10, 7, 8);
INSERT INTO public.games VALUES (11, 7, 9);
INSERT INTO public.games VALUES (12, 7, 9);
INSERT INTO public.games VALUES (13, 10, 8);
INSERT INTO public.games VALUES (14, 11, 8);
INSERT INTO public.games VALUES (15, 10, 8);
INSERT INTO public.games VALUES (16, 7, 10);
INSERT INTO public.games VALUES (17, 8, 10);
INSERT INTO public.games VALUES (18, 5, 11);
INSERT INTO public.games VALUES (19, 8, 11);
INSERT INTO public.games VALUES (20, 8, 10);
INSERT INTO public.games VALUES (21, 11, 10);
INSERT INTO public.games VALUES (22, 7, 10);
INSERT INTO public.games VALUES (23, 13, 1);
INSERT INTO public.games VALUES (24, 839, 12);
INSERT INTO public.games VALUES (25, 938, 12);
INSERT INTO public.games VALUES (26, 508, 13);
INSERT INTO public.games VALUES (27, 506, 13);
INSERT INTO public.games VALUES (28, 708, 12);
INSERT INTO public.games VALUES (29, 832, 12);
INSERT INTO public.games VALUES (30, 881, 12);
INSERT INTO public.games VALUES (31, 623, 14);
INSERT INTO public.games VALUES (32, 509, 14);
INSERT INTO public.games VALUES (33, 557, 15);
INSERT INTO public.games VALUES (34, 928, 15);
INSERT INTO public.games VALUES (35, 212, 14);
INSERT INTO public.games VALUES (36, 317, 14);
INSERT INTO public.games VALUES (37, 588, 14);
INSERT INTO public.games VALUES (38, 229, 16);
INSERT INTO public.games VALUES (39, 768, 16);
INSERT INTO public.games VALUES (40, 543, 17);
INSERT INTO public.games VALUES (41, 929, 17);
INSERT INTO public.games VALUES (42, 370, 16);
INSERT INTO public.games VALUES (43, 172, 16);
INSERT INTO public.games VALUES (44, 120, 16);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Jackson');
INSERT INTO public.users VALUES (2, 'user_1744120402078');
INSERT INTO public.users VALUES (3, 'user_1744120402077');
INSERT INTO public.users VALUES (4, 'user_1744120416300');
INSERT INTO public.users VALUES (5, 'user_1744120416299');
INSERT INTO public.users VALUES (6, 'user_1744120447482');
INSERT INTO public.users VALUES (7, 'user_1744120447481');
INSERT INTO public.users VALUES (8, 'user_1744120559531');
INSERT INTO public.users VALUES (9, 'user_1744120559530');
INSERT INTO public.users VALUES (10, 'user_1744120590109');
INSERT INTO public.users VALUES (11, 'user_1744120590108');
INSERT INTO public.users VALUES (12, 'user_1744120648165');
INSERT INTO public.users VALUES (13, 'user_1744120648164');
INSERT INTO public.users VALUES (14, 'user_1744120824427');
INSERT INTO public.users VALUES (15, 'user_1744120824426');
INSERT INTO public.users VALUES (16, 'user_1744120902415');
INSERT INTO public.users VALUES (17, 'user_1744120902414');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 44, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


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

