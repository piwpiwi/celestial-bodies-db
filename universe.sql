--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    estimated_age integer NOT NULL,
    stars_in_billions integer,
    mass numeric,
    has_active_core boolean,
    is_spiral boolean
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
    name character varying(30) NOT NULL,
    planet_id integer,
    age integer,
    mass numeric
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
    name character varying(30) NOT NULL,
    star_id integer,
    age integer,
    mass numeric
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(255) NOT NULL,
    launch_year integer,
    operator character varying(100)
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age text,
    mass numeric
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 400, 1.500, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 1000, 1.200, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12, 40, 0.050, false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13, 800, 0.800, true, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 13, 200, 0.500, true, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13, 12000, 2.700, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 4510, 1.0000);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 4500, 0.0000);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 4500, 0.0000);
INSERT INTO public.moon VALUES (4, 'Io', 5, 4500, 1.2100);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4500, 0.6500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4500, 2.0200);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4500, 1.4600);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 4500, 0.0005);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 4500, 0.0015);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 4500, 0.0084);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 4500, 0.0149);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 4500, 0.0313);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 4500, 1.8000);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 4500, 0.0245);
INSERT INTO public.moon VALUES (15, 'Sirius Moon A', 7, 200, 0.1100);
INSERT INTO public.moon VALUES (16, 'Sirius Moon B', 7, 200, 0.0500);
INSERT INTO public.moon VALUES (17, 'Vega Outer', 9, 400, 0.3200);
INSERT INTO public.moon VALUES (18, 'Almach Rock', 10, 6000, 0.9500);
INSERT INTO public.moon VALUES (19, 'Tri-Moon', 11, 3000, 0.4500);
INSERT INTO public.moon VALUES (20, 'Sombrero Dust', 12, 8500, 0.0100);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4500, 0.0553);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4500, 0.8150);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4540, 1.0000);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4500, 0.1070);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4600, 317.8000);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4600, 95.2000);
INSERT INTO public.planet VALUES (7, 'Sirius Prime', 2, 200, 4.2000);
INSERT INTO public.planet VALUES (8, 'Vega Minor', 3, 400, 0.8500);
INSERT INTO public.planet VALUES (9, 'Vega Major', 3, 410, 12.4000);
INSERT INTO public.planet VALUES (10, 'Almach b', 4, 6000, 5.1000);
INSERT INTO public.planet VALUES (11, 'Triangulum-1', 5, 3000, 0.9000);
INSERT INTO public.planet VALUES (12, 'Sombrero Prime', 6, 8500, 25.0000);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Voyager 1', 1977, 'NASA');
INSERT INTO public.space_mission VALUES (2, 'Voyager 2', 1977, 'NASA');
INSERT INTO public.space_mission VALUES (3, 'Cassini-Huygens', 1997, 'NASA/ESA');
INSERT INTO public.space_mission VALUES (4, 'Mariner 10', 1973, 'NASA');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, '4.6 Billion Years', 1.0000);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, '242 Million Years', 2.0630);
INSERT INTO public.star VALUES (3, 'Vega', 2, '455 Million Years', 2.1350);
INSERT INTO public.star VALUES (4, 'Almach', 2, '6.5 Billion Years', 4.5000);
INSERT INTO public.star VALUES (5, 'Triangulum Star A', 3, '3.1 Billion Years', 1.2000);
INSERT INTO public.star VALUES (6, 'Sombrero Giant', 4, '9.0 Billion Years', 3.1000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

