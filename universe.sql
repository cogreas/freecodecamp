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
    name character varying(60) NOT NULL,
    diametr numeric NOT NULL,
    amount_stars integer,
    description text,
    amount_blackhole integer
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
    name character varying(60) NOT NULL,
    diametr numeric,
    description text,
    planet_id integer NOT NULL,
    size integer
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
    name character varying(60) NOT NULL,
    diametr numeric,
    exoplanet boolean,
    viability boolean,
    description text,
    star_id integer,
    size integer
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
-- Name: small_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.small_body (
    small_body_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    type text
);


ALTER TABLE public.small_body OWNER TO freecodecamp;

--
-- Name: small_body_small_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.small_body_small_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.small_body_small_body_id_seq OWNER TO freecodecamp;

--
-- Name: small_body_small_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.small_body_small_body_id_seq OWNED BY public.small_body.small_body_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    weight numeric,
    supernova boolean,
    amount_planets integer,
    color text,
    galaxy_id integer NOT NULL,
    size integer
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
-- Name: small_body small_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_body ALTER COLUMN small_body_id SET DEFAULT nextval('public.small_body_small_body_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1580184.6248, 58102, 'Our native galaxy', 245);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 61389121247.513, 138971, 'colliding with ours', 153);
INSERT INTO public.galaxy VALUES (3, 'NGS 5143', 518523.34, 5125, 'spiral', 46);
INSERT INTO public.galaxy VALUES (4, 'NGS 1641', 13135.6586, 135246, 'have two collide galaxy spiral and sphere', 91385);
INSERT INTO public.galaxy VALUES (5, 'NGS 6272', 235246.46, 513624, 'have a big pulsar', 513);
INSERT INTO public.galaxy VALUES (6, 'NGS 932', 514634.6246, 636132, 'have a thee wormhole to our galaxy', 153);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'fobos', 513.135, 'fajfoiajf', 1, 1135);
INSERT INTO public.moon VALUES (3, 'demos', 513.135, 'fajfoiajf', 3, 1135);
INSERT INTO public.moon VALUES (4, 'mion', 513.135, 'fajfoiajf', 4, 1135);
INSERT INTO public.moon VALUES (5, 'oa', 513.135, 'fajfoiajf', 5, 1135);
INSERT INTO public.moon VALUES (6, 'ad', 513.135, 'fajfoiajf', 6, 1135);
INSERT INTO public.moon VALUES (7, 'opgpoa', 513.135, 'fajfoiajf', 7, 1135);
INSERT INTO public.moon VALUES (8, 'lkjalif', 513.135, 'fajfoiajf', 9, 1135);
INSERT INTO public.moon VALUES (9, 'lfaogp', 513.135, 'fajfoiajf', 10, 1135);
INSERT INTO public.moon VALUES (10, 'ogp', 513.135, 'fajfoiajf', 1, 1135);
INSERT INTO public.moon VALUES (12, 'gakjsljkg', 513.135, 'fajfoiajf', 3, 1135);
INSERT INTO public.moon VALUES (13, 'gakgflg;kj', 513.135, 'fajfoiajf', 4, 1135);
INSERT INTO public.moon VALUES (14, 'hl;kdjiod', 513.135, 'fajfoiajf', 5, 1135);
INSERT INTO public.moon VALUES (15, 'hg;ldkjoid', 513.135, 'fajfoiajf', 6, 1135);
INSERT INTO public.moon VALUES (16, 'hjoid', 513.135, 'fajfoiajf', 7, 1135);
INSERT INTO public.moon VALUES (17, 'gajeiogsu', 513.135, 'fajfoiajf', 8, 1135);
INSERT INTO public.moon VALUES (18, 'gbclkj', 513.135, 'fajfoiajf', 9, 1135);
INSERT INTO public.moon VALUES (19, 'mnbnkjf', 513.135, 'fajfoiajf', 10, 1135);
INSERT INTO public.moon VALUES (20, 'opicpvobi', 513.135, 'fajfoiajf', 12, 1135);
INSERT INTO public.moon VALUES (21, 'zghxf', 513.135, 'fajfoiajf', 1, 1135);
INSERT INTO public.moon VALUES (22, 'lkjlkjz', 513.135, 'fajfoiajf', 4, 1135);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'kepler-51', 155.51, false, true, 'rich water', 4, 151);
INSERT INTO public.planet VALUES (3, 'kepler-311', 155.51, true, false, 'a lot of lava', 8, 511);
INSERT INTO public.planet VALUES (4, 'dune', 595.51, false, true, 'without water', 3, 9712);
INSERT INTO public.planet VALUES (5, 'morglon', 1235.51, true, true, 'a lot of titanium', 2, 9963);
INSERT INTO public.planet VALUES (6, 'globilium', 321.51, true, false, 'ice and fire', 4, 3623);
INSERT INTO public.planet VALUES (7, 'lium', 3321.51, true, false, 'icefire', 1, 3623);
INSERT INTO public.planet VALUES (8, 'lum', 3321.51, true, false, 'icefie', 4, 3623);
INSERT INTO public.planet VALUES (9, '591', 321.1, true, false, 'ice35fie', 2, 3623);
INSERT INTO public.planet VALUES (10, 'gkja', 321.1, true, false, 'ice35fie', 2, 3623);
INSERT INTO public.planet VALUES (11, 'hps[k[', 321.1, true, false, 'ice35fie', 2, 3623);
INSERT INTO public.planet VALUES (12, 'blnkjsh', 321.1, true, false, 'ice35fie', 2, 3623);
INSERT INTO public.planet VALUES (13, 'pkiwijtiq', 321.1, true, false, 'ice35fie', 2, 3623);
INSERT INTO public.planet VALUES (14, 'pkgaegsrd', 321.1, true, false, 'ice35fie', 1, 3623);


--
-- Data for Name: small_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.small_body VALUES (1, 'giaoeig-51', 5235, 'comet');
INSERT INTO public.small_body VALUES (2, 'oeig', 5235, 'meteor');
INSERT INTO public.small_body VALUES (3, 'faji', 535, 'asteroid');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Nembus', 5236.25, false, 17, 'blue', 2, 3462);
INSERT INTO public.star VALUES (2, 'Nbus', 551336.25, false, 9, 'red', 2, 3462);
INSERT INTO public.star VALUES (3, 'Nb-51', 13326.25, false, 7, 'yellow', 3, 3472);
INSERT INTO public.star VALUES (4, 'Ahorion', 13326.25, true, 2, 'black', 4, 7652);
INSERT INTO public.star VALUES (5, 'begot', 32516.25, true, 2, 'black', 5, 762462);
INSERT INTO public.star VALUES (8, 'poliglot', 32516.25, false, 5, 'green', 6, 762);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: small_body_small_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.small_body_small_body_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: small_body small_body_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_body
    ADD CONSTRAINT small_body_name_key UNIQUE (name);


--
-- Name: small_body small_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_body
    ADD CONSTRAINT small_body_pkey PRIMARY KEY (small_body_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

