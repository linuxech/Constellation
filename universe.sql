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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    num_stars integer NOT NULL,
    brightest_star character varying NOT NULL,
    has_legend boolean NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    size integer,
    shape text,
    has_black_hole boolean NOT NULL,
    num_stars integer
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
    name character varying NOT NULL,
    planet_id integer,
    diameter integer,
    orbital_period numeric,
    is_in_habitable_zone boolean NOT NULL
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
    name character varying NOT NULL,
    star_id integer,
    distance_from_star double precision,
    num_moon integer,
    has_atmoshphere boolean NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    mass numeric,
    temprature integer,
    is_main_sequence boolean NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 7, 'Rigel', true, 'One of the most recognizable constellations in the night sky.', '2024-04-27 11:11:54.351245');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 7, 'Dubhe', true, 'Contains the Big Dipper and the North Star.', '2024-04-27 11:11:54.351245');
INSERT INTO public.constellation VALUES (3, 'Pegasus', 9, 'Enif', true, 'Named after the mythical winged horse.', '2024-04-27 11:11:54.351245');
INSERT INTO public.constellation VALUES (4, 'Draco', 18, 'Thuban', true, 'Represents a dragon in Greek mythology.', '2024-04-27 11:11:54.351245');
INSERT INTO public.constellation VALUES (5, 'Leo', 9, 'Regulus', true, 'One of the twelve constellations of the zodiac.', '2024-04-27 11:11:54.351245');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 'Spiral', true, 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 'Spiral', false, 100);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 150000, 'Elliptical', true, 300);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 80000, 'Spiral', false, 150);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 70000, 'Spiral', false, 180);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 27.3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 0.3, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1.3, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3637, 1.8, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, 3.6, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, 7.2, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4800, 16.7, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150, 15.9, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 498, 1.4, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 396, 0.9, false);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, 236, 1.4, false);
INSERT INTO public.moon VALUES (12, 'Umbriel', 5, 1169, 4.1, false);
INSERT INTO public.moon VALUES (13, 'Titania', 5, 1577, 8.7, false);
INSERT INTO public.moon VALUES (14, 'Triton', 6, 2706, 5.9, false);
INSERT INTO public.moon VALUES (15, 'Charon', 7, 1207, 6.4, false);
INSERT INTO public.moon VALUES (16, 'D Qar', 8, 908, 4.7, false);
INSERT INTO public.moon VALUES (17, 'Scarif', 9, 1290, 3.2, false);
INSERT INTO public.moon VALUES (18, 'Jakku', 10, 2099, 8.6, false);
INSERT INTO public.moon VALUES (19, 'Alderaan Moon', 11, 1909, 7.2, false);
INSERT INTO public.moon VALUES (20, 'Theed', 12, 1412, 4.5, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 149600000, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 227900000, 2, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 778600000, 79, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 1434000000, 82, true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 2871000000, 27, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 4495000000, 14, true);
INSERT INTO public.planet VALUES (7, 'Mercury', 2, 57900000, 0, true);
INSERT INTO public.planet VALUES (8, 'Venus', 2, 108200000, 0, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 2, 5906000000, 5, false);
INSERT INTO public.planet VALUES (10, 'Tatooine', 3, 149600000, 2, true);
INSERT INTO public.planet VALUES (11, 'Krypton', 3, 227900000, 0, true);
INSERT INTO public.planet VALUES (12, 'Gallifrey', 3, 778600000, 0, true);
INSERT INTO public.planet VALUES (13, 'Alderaan', 4, 1434000000, 1, true);
INSERT INTO public.planet VALUES (14, 'Endor', 4, 2871000000, 0, true);
INSERT INTO public.planet VALUES (15, 'Kashyyyk', 5, 4495000000, 3, true);
INSERT INTO public.planet VALUES (16, 'Hoth', 5, 57900000, 1, false);
INSERT INTO public.planet VALUES (17, 'Dagobah', 5, 108200000, 0, true);
INSERT INTO public.planet VALUES (18, 'Naboo', 6, 5906000000, 3, true);
INSERT INTO public.planet VALUES (19, 'Mustafar', 6, 149600000, 0, true);
INSERT INTO public.planet VALUES (20, 'Coruscant', 6, 227900000, 4, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2063000000000000000000000000000, 9940, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 438000000000000000000000000000, 5790, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 14060000000000000000000000000000, 3500, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2450000000000000000000000000000, 9602, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 244700000000000000000000000000, 3042, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

