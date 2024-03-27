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

DROP DATABASE players;
--
-- Name: players; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE players WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE players OWNER TO freecodecamp;

\connect players

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
    guesses integer,
    player_id integer
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 337, 7);
INSERT INTO public.games VALUES (2, 80, 7);
INSERT INTO public.games VALUES (3, 696, 8);
INSERT INTO public.games VALUES (4, 683, 8);
INSERT INTO public.games VALUES (5, 902, 7);
INSERT INTO public.games VALUES (6, 653, 7);
INSERT INTO public.games VALUES (7, 557, 7);
INSERT INTO public.games VALUES (8, 544, 9);
INSERT INTO public.games VALUES (9, 115, 9);
INSERT INTO public.games VALUES (10, 690, 10);
INSERT INTO public.games VALUES (11, 260, 10);
INSERT INTO public.games VALUES (12, 861, 9);
INSERT INTO public.games VALUES (13, 578, 9);
INSERT INTO public.games VALUES (14, 168, 9);
INSERT INTO public.games VALUES (15, 10, 11);
INSERT INTO public.games VALUES (16, 8, 11);
INSERT INTO public.games VALUES (17, 299, 12);
INSERT INTO public.games VALUES (18, 423, 12);
INSERT INTO public.games VALUES (19, 564, 13);
INSERT INTO public.games VALUES (20, 453, 13);
INSERT INTO public.games VALUES (21, 675, 12);
INSERT INTO public.games VALUES (22, 684, 12);
INSERT INTO public.games VALUES (23, 740, 12);
INSERT INTO public.games VALUES (24, 168, 14);
INSERT INTO public.games VALUES (25, 316, 14);
INSERT INTO public.games VALUES (26, 220, 15);
INSERT INTO public.games VALUES (27, 532, 15);
INSERT INTO public.games VALUES (28, 818, 14);
INSERT INTO public.games VALUES (29, 503, 14);
INSERT INTO public.games VALUES (30, 868, 14);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1711553267806');
INSERT INTO public.players VALUES (2, 'user_1711553267805');
INSERT INTO public.players VALUES (3, 'user_1711553278310');
INSERT INTO public.players VALUES (4, 'user_1711553278309');
INSERT INTO public.players VALUES (5, 'user_1711553283899');
INSERT INTO public.players VALUES (6, 'user_1711553283898');
INSERT INTO public.players VALUES (7, 'user_1711553348584');
INSERT INTO public.players VALUES (8, 'user_1711553348583');
INSERT INTO public.players VALUES (9, 'user_1711553386536');
INSERT INTO public.players VALUES (10, 'user_1711553386535');
INSERT INTO public.players VALUES (11, 'Vlad');
INSERT INTO public.players VALUES (12, 'user_1711553570134');
INSERT INTO public.players VALUES (13, 'user_1711553570133');
INSERT INTO public.players VALUES (14, 'user_1711553656034');
INSERT INTO public.players VALUES (15, 'user_1711553656033');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: games player_game_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT player_game_fk FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

