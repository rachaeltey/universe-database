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
    name character varying NOT NULL,
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
    mass numeric NOT NULL,
    has_black_hole boolean NOT NULL,
    radius_km integer,
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
    name character varying(30),
    mass numeric NOT NULL,
    has_life boolean NOT NULL,
    radius_km integer,
    description text,
    planet_id integer NOT NULL
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
    name character varying(30),
    mass numeric NOT NULL,
    has_life boolean NOT NULL,
    radius_km integer,
    description text,
    star_id integer NOT NULL
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
    name character varying(30),
    mass numeric NOT NULL,
    has_life boolean NOT NULL,
    radius_km integer,
    description text,
    galaxy_id integer NOT NULL
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

INSERT INTO public.celestial_properties VALUES (1, 'Earth Properties', true, 'Supports life and water', 6371);
INSERT INTO public.celestial_properties VALUES (2, 'Sun Properties', false, 'Extremely hot star', 696340);
INSERT INTO public.celestial_properties VALUES (3, 'Milky Way Properties', false, 'Massive galaxy', 52850);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1500000000000, true, 52850, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1200000000000, true, 110000, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000000000, false, 30000, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 160000000000, true, 43000, 'Famous interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 800000000000, true, 50000, 'Bright central bulge galaxy');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 290000000000, false, 75000, 'Ring-shaped galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.073, false, 1737, 'Earth''s moon', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.00001, false, 11, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000002, false, 6, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (4, 'Io', 0.089, false, 1821, 'Volcanic moon of Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0.048, false, 1560, 'Icy moon of Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.148, false, 2634, 'Largest moon', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.107, false, 2410, 'Cratered moon of Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 0.134, false, 2575, 'Largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 0.00018, false, 252, 'Ice geysers', 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 0.023, false, 764, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Oberon', 0.03, false, 761, 'Moon of Uranus', 6);
INSERT INTO public.moon VALUES (12, 'Titania', 0.035, false, 789, 'Largest Uranus moon', 6);
INSERT INTO public.moon VALUES (13, 'Triton', 0.021, false, 1353, 'Moon of Neptune', 6);
INSERT INTO public.moon VALUES (14, 'Charon', 0.016, false, 606, 'Moon of Pluto', 6);
INSERT INTO public.moon VALUES (15, 'Exomoon 1', 0.05, false, 2000, 'Fictional moon', 7);
INSERT INTO public.moon VALUES (16, 'Exomoon 2', 0.06, false, 2100, 'Fictional moon', 8);
INSERT INTO public.moon VALUES (17, 'Exomoon 3', 0.07, false, 2200, 'Fictional moon', 9);
INSERT INTO public.moon VALUES (18, 'Exomoon 4', 0.08, false, 2300, 'Fictional moon', 10);
INSERT INTO public.moon VALUES (19, 'Exomoon 5', 0.09, false, 2400, 'Fictional moon', 11);
INSERT INTO public.moon VALUES (20, 'Exomoon 6', 0.1, false, 2500, 'Fictional moon', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.33, false, 2440, 'Closest planet to the Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.87, false, 6052, 'Hottest planet', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5.97, true, 6371, 'Supports life', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.64, false, 3389, 'Red planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898, false, 69911, 'Largest planet', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568, false, 58232, 'Has rings', 1);
INSERT INTO public.planet VALUES (7, 'Proxima b', 1.27, false, 7000, 'Exoplanet near Proxima Centauri', 3);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 1.13, false, 6500, 'Exoplanet candidate', 2);
INSERT INTO public.planet VALUES (9, 'Andromeda Planet 1', 10.0, false, 9000, 'Planet in Andromeda galaxy', 4);
INSERT INTO public.planet VALUES (10, 'Triangulum Planet 1', 8.5, false, 8500, 'Planet in Triangulum galaxy', 5);
INSERT INTO public.planet VALUES (11, 'Whirlpool Planet 1', 9.2, false, 8700, 'Planet in Whirlpool galaxy', 6);
INSERT INTO public.planet VALUES (12, 'Whirlpool Planet 2', 11.0, false, 9200, 'Another Whirlpool planet', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, true, 696340, 'Star at the center of our solar system', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1.1, true, 720000, 'Closest star system to Earth', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 0.12, true, 200000, 'Red dwarf star', 1);
INSERT INTO public.star VALUES (4, 'Andromeda Star 1', 2.0, true, 800000, 'Bright star in Andromeda', 2);
INSERT INTO public.star VALUES (5, 'Triangulum Star 1', 1.5, true, 750000, 'Star in Triangulum galaxy', 3);
INSERT INTO public.star VALUES (6, 'Whirlpool Star 1', 1.8, true, 770000, 'Star in Whirlpool galaxy', 4);


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
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

