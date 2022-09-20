--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE games;
--
-- Name: games; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE games WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE games OWNER TO freecodecamp;

\connect games

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'ppp', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1663665421239', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1663665421238', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1663665584571', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1663665584570', 0, NULL);
INSERT INTO public.users VALUES (8, 'lopa', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1663666057317', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1663666057316', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1663666265348', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1663666265347', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1663666629786', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1663666629785', 0, NULL);
INSERT INTO public.users VALUES (1, 'popa', 2, 4);
INSERT INTO public.users VALUES (15, ';pp[a', 0, NULL);
INSERT INTO public.users VALUES (2, 'loopa', 3, 1);
INSERT INTO public.users VALUES (17, 'user_1663672408226', 2, 362);
INSERT INTO public.users VALUES (16, 'user_1663672408227', 5, 155);
INSERT INTO public.users VALUES (19, 'user_1663672532734', 2, 359);
INSERT INTO public.users VALUES (18, 'user_1663672532735', 5, 170);
INSERT INTO public.users VALUES (21, 'user_1663672622843', 2, 229);
INSERT INTO public.users VALUES (20, 'user_1663672622844', 5, 129);
INSERT INTO public.users VALUES (23, 'user_1663672654269', 2, 172);
INSERT INTO public.users VALUES (22, 'user_1663672654270', 5, 358);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 23, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

