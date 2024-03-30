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
    name character varying(50) NOT NULL,
    type integer,
    planet_count integer,
    description text,
    age integer,
    galaxy_id integer NOT NULL,
    galaxy_types_id integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(20,4),
    description text,
    age integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type integer,
    distance_from_star numeric(20,4),
    description text,
    age integer,
    is_habitable boolean,
    star_id integer,
    planet_types_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age integer,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 200000000, 'Our home galaxy', 13600000, 1, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 1, 100000000, 'Nearest major galaxy', 10000000, 2, 1);
INSERT INTO public.galaxy VALUES ('Whirlpool', 3, 100000000, 'A grand design spiral galaxy', 4000000, 3, 2);
INSERT INTO public.galaxy VALUES ('Sombrero', 2, 80000000, 'A lenticular galaxy', 13250000, 4, 3);
INSERT INTO public.galaxy VALUES ('Centaurus A', 4, 50000000, 'A peculiar galaxy', 13270000, 5, 4);
INSERT INTO public.galaxy VALUES ('Pinwheel', 3, 30000000, 'A face-on spiral galaxy', 2000000, 6, 2);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Galaxies characterized by spiral arms and a central bulge');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Galaxies with an ellipsoidal shape and little apparent structure');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular', 'Galaxies with a prominent central bulge and a disk, but no spiral arms');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'Galaxies that lack a distinct regular shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400.0000, 'The Earth''s natural satellite', 453000000, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 'The larger and inner of Mars'' two moons', 450300000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 'The smaller and outer of Mars'' two moons', 450300000, 2);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 'The innermost of Jupiter''s major moons', 450300000, 3);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 'One of Jupiter''s four major moons', 450300000, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 'The largest moon in our solar system', 450300000, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 'The outermost of Jupiter''s major moons', 450300000, 3);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, 'The largest moon of Saturn', 450300000, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', NULL, 'The second-largest moon of Saturn', 450300000, 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', NULL, 'The third-largest moon of Saturn', 450300000, 4);
INSERT INTO public.moon VALUES (11, 'Miranda', NULL, 'The smallest and innermost of Uranus'' major moons', 450300000, 5);
INSERT INTO public.moon VALUES (12, 'Ariel', NULL, 'One of the major moons of Uranus', 450300000, 5);
INSERT INTO public.moon VALUES (13, 'Umbriel', NULL, 'One of the major moons of Uranus', 450300000, 5);
INSERT INTO public.moon VALUES (14, 'Titania', NULL, 'The largest of Uranus'' major moons', 450300000, 5);
INSERT INTO public.moon VALUES (15, 'Oberon', NULL, 'The outermost of Uranus'' major moons', 450300000, 5);
INSERT INTO public.moon VALUES (16, 'Triton', NULL, 'The largest moon of Neptune', 450300000, 6);
INSERT INTO public.moon VALUES (17, 'Nereid', NULL, 'One of Neptune''s outer moons', 450300000, 6);
INSERT INTO public.moon VALUES (18, 'Proteus', NULL, 'One of Neptune''s inner moons', 450300000, 6);
INSERT INTO public.moon VALUES (19, 'Charon', NULL, 'The largest of Pluto''s moons', 410300000, 7);
INSERT INTO public.moon VALUES (20, 'Nix', NULL, 'One of Pluto''s outer moons', 410300000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 149600000.0000, 'Our home planet', 454000000, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 227900000.0000, 'The red planet', 460300000, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 778500000.0000, 'The largest planet in our solar system', 460300000, false, 1, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 1433500000.0000, 'The ringed planet', 450300000, false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Uranus', 2, 2872500000.0000, 'The tilted planet', 450300000, false, 1, 2);
INSERT INTO public.planet VALUES (6, 'Neptune', 2, 4495100000.0000, 'The farthest planet from the Sun', 450300000, false, 1, 2);
INSERT INTO public.planet VALUES (7, 'Kepler-16b', 3, 104600000.0000, 'The first circumbinary planet discovered', 600000000, false, 2, 3);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 1, 750000.0000, 'An exoplanet orbiting Proxima Centauri', 485000000, true, 3, 1);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 1, 610000.0000, 'One of the TRAPPIST-1 system planets', 760000000, false, 4, 1);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 4, 4700000.0000, 'The first transiting exoplanet discovered', 500000000, false, 5, 4);
INSERT INTO public.planet VALUES (11, 'Gliese 876 d', 5, 21480000.0000, 'A super-Earth exoplanet', 1000000000, false, 6, 5);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 4, 5100000.0000, 'The first exoplanet discovered orbiting a Sun-like star', 800000000, false, 7, 4);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky planets similar in composition to Earth');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Large planets primarily composed of hydrogen and helium, with a small rocky core');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Giant planets with a composition of heavier elements than gas giants, including water, ammonia, and methane');
INSERT INTO public.planet_types VALUES (4, 'Transiting Exoplanet', 'Exoplanets that pass in front of their parent star, causing a dip in brightness as observed from Earth');
INSERT INTO public.planet_types VALUES (5, 'Super-Earth', 'Exoplanets with a mass higher than Earth but lower than the ice giants Neptune and Uranus');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', 460000000, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant star in the Orion constellation', 850000, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky', 24200000, true, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'A bright star in the Lyra constellation', 45500000, true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star in the Orion constellation', 800000, false, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 'The North Star', 750000, true, 1);
INSERT INTO public.star VALUES (7, 'Antares', 'A red supergiant in the Scorpius constellation', 1100000, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 4, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 5, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_type_id_key UNIQUE (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_id_key UNIQUE (planet_types_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_id_key UNIQUE (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

