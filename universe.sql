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
-- Name: celestial_properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_properties (
    celestial_properties_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_habitable boolean NOT NULL,
    description text,
    radius_km integer
);


ALTER TABLE public.celestial_properties OWNER TO freecodecamp;

--
-- Name: celestial_properties_celestial_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_properties_celestial_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_properties_celestial_properties_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_properties_celestial_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_properties_celestial_properties_id_seq OWNED BY public.celestial_properties.celestial_properties_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    has_black_hole boolean NOT NULL,
    description text
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
    planet_id integer NOT NULL,
    mass numeric,
    is_spherical boolean NOT NULL,
    radius_km integer,
    description text
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
    star_id integer NOT NULL,
    mass numeric,
    has_life boolean NOT NULL,
    radius_km integer,
    description text
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric,
    is_spherical boolean NOT NULL,
    temperature integer,
    description text
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
-- Name: celestial_properties celestial_properties_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties ALTER COLUMN celestial_properties_id SET DEFAULT nextval('public.celestial_properties_celestial_properties_id_seq'::regclass);


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
-- Data for Name: celestial_properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_properties VALUES (1, 'Earth Properties', true, 'Supports life and liquid water', 6371);
INSERT INTO public.celestial_properties VALUES (2, 'Sun Properties', false, 'Extremely hot star at center of solar system', 696340);
INSERT INTO public.celestial_properties VALUES (3, 'Milky Way Properties', false, 'Large galaxy containing billions of stars', 52850);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 0, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, true, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9000, 3000000, false, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8000, 23000000, true, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 11000, 29000000, true, 'Bright central bulge');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 400, 500000000, false, 'Ring-shaped galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.073, true, 1737, 'Earth''s moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.00001, true, 11, 'Moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.000002, true, 6, 'Moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.089, true, 1821, 'Volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.048, true, 1560, 'Icy moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0.148, true, 2634, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.107, true, 2410, 'Cratered moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 0.134, true, 2575, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 0.00018, true, 252, 'Ice geysers');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 0.023, true, 764, 'Moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Oberon', 6, 0.03, true, 761, 'Moon of Uranus');
INSERT INTO public.moon VALUES (12, 'Titania', 6, 0.035, true, 789, 'Largest Uranus moon');
INSERT INTO public.moon VALUES (13, 'Triton', 6, 0.021, true, 1353, 'Moon of Neptune');
INSERT INTO public.moon VALUES (14, 'Charon', 6, 0.016, true, 606, 'Moon of Pluto');
INSERT INTO public.moon VALUES (15, 'Exomoon 1', 7, 0.05, true, 2000, 'Fictional moon');
INSERT INTO public.moon VALUES (16, 'Exomoon 2', 8, 0.06, true, 2100, 'Fictional moon');
INSERT INTO public.moon VALUES (17, 'Exomoon 3', 9, 0.07, true, 2200, 'Fictional moon');
INSERT INTO public.moon VALUES (18, 'Exomoon 4', 10, 0.08, true, 2300, 'Fictional moon');
INSERT INTO public.moon VALUES (19, 'Exomoon 5', 11, 0.09, true, 2400, 'Fictional moon');
INSERT INTO public.moon VALUES (20, 'Exomoon 6', 12, 0.10, true, 2500, 'Fictional moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.33, false, 2440, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4.87, false, 6052, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 5.97, true, 6371, 'Supports life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.64, false, 3389, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1898, false, 69911, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 568, false, 58232, 'Has rings');
INSERT INTO public.planet VALUES (7, 'Proxima b', 3, 1.27, false, 7000, 'Exoplanet near Proxima Centauri');
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 2, 1.13, false, 6500, 'Exoplanet candidate');
INSERT INTO public.planet VALUES (9, 'Andromeda Planet 1', 4, 10.0, false, 9000, 'Planet in Andromeda');
INSERT INTO public.planet VALUES (10, 'Triangulum Planet 1', 5, 8.5, false, 8500, 'Planet in Triangulum');
INSERT INTO public.planet VALUES (11, 'Whirlpool Planet 1', 6, 9.2, false, 8700, 'Planet in Whirlpool');
INSERT INTO public.planet VALUES (12, 'Whirlpool Planet 2', 6, 11.0, false, 9200, 'Another Whirlpool planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, 5500, 'Center of Solar System');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1.1, true, 5800, 'Closest star system');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 0.12, true, 3000, 'Red dwarf star');
INSERT INTO public.star VALUES (4, 'Andromeda Star 1', 2, 2.0, true, 6000, 'Star in Andromeda');
INSERT INTO public.star VALUES (5, 'Triangulum Star 1', 3, 1.5, true, 5200, 'Star in Triangulum');
INSERT INTO public.star VALUES (6, 'Whirlpool Star 1', 4, 1.8, true, 5700, 'Star in Whirlpool');


--
-- Name: celestial_properties_celestial_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_properties_celestial_properties_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_properties celestial_properties_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties
    ADD CONSTRAINT celestial_properties_name_key UNIQUE (name);


--
-- Name: celestial_properties celestial_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_properties
    ADD CONSTRAINT celestial_properties_pkey PRIMARY KEY (celestial_properties_id);


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

