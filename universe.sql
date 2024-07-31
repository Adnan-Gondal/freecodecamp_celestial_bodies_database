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
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    discoverer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    field_of_expertise character varying(255)
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    discoverer_id integer,
    galaxy_mass numeric(20,10),
    galaxy_diameter numeric(15,5),
    galaxy_has_stars boolean,
    galaxy_description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    discoverer_id integer,
    moon_mass numeric(20,10),
    moon_diameter numeric(15,5),
    distance_from_planet numeric(15,5),
    moon_description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    discoverer_id integer,
    planet_mass numeric(20,10),
    planet_diameter numeric(15,5),
    distance_from_star numeric(15,5),
    has_moons boolean,
    num_of_moons integer,
    planet_description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    discoverer_id integer,
    star_diameter numeric(15,5),
    star_temperature numeric(10,2),
    star_mass numeric(20,10),
    star_has_planets boolean,
    num_of_planets integer,
    star_description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES (1, 'Edwin Hubble', 'Astronomy');
INSERT INTO public.discoverer VALUES (2, 'William Herschel', 'Astronomy');
INSERT INTO public.discoverer VALUES (3, 'Caroline Herschel', 'Astronomy');
INSERT INTO public.discoverer VALUES (4, 'Johann Gottfried Galle', 'Astronomy');
INSERT INTO public.discoverer VALUES (5, 'Karl Wilhelm Ludwig', 'Astronomy');
INSERT INTO public.discoverer VALUES (6, 'Friedrich Bessel', 'Astronomy');
INSERT INTO public.discoverer VALUES (7, 'James Clerk Maxwell', 'Physics');
INSERT INTO public.discoverer VALUES (8, 'Annie Jump Cannon', 'Astronomy');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 1500000000.0000000000, 100000.00000, true, 'The Milky Way galaxy is a large spiral galaxy containing our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Messier 87', 2, 2400000000.0000000000, 200000.00000, true, 'Messier 87 is an enormous elliptical galaxy in the Virgo Cluster.');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 3, 800000000.0000000000, 50000.00000, false, 'The Large Magellanic Cloud is a nearby irregular galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 4, 1200000000.0000000000, 220000.00000, true, 'Andromeda is the closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5, 400000000.0000000000, 80000.00000, true, 'Triangulum is a spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 6, 600000000.0000000000, 150000.00000, true, 'The Whirlpool Galaxy is a classic spiral galaxy.');
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 7, 500000000.0000000000, 50000.00000, true, 'The Sombrero Galaxy is a spiral galaxy known for its bright nucleus.');
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', 8, 700000000.0000000000, 170000.00000, true, 'The Pinwheel Galaxy is a spiral galaxy in the constellation Ursa Major.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, 734.0000000000, 3474.00000, 380000.00000, 'The Moon is Earths only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, NULL, 108.0000000000, 22.00000, 9377.00000, 'Phobos is the larger of Mars two moons.');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, NULL, 15.0000000000, 12.00000, 23460.00000, 'Deimos is the smaller of Mars two moons.');
INSERT INTO public.moon VALUES (4, 'Io', 4, NULL, 453.0000000000, 3642.00000, 421800.00000, 'Io is one of Jupiters largest moons and is known for its volcanic activity.');
INSERT INTO public.moon VALUES (5, 'Europa', 4, NULL, 480.0000000000, 3121.00000, 670900.00000, 'Europa is known for its smooth ice-covered surface and potential subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, NULL, 1480.0000000000, 5268.00000, 1070400.00000, 'Ganymede is the largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, NULL, 1080.0000000000, 4821.00000, 1882700.00000, 'Callisto is heavily cratered and the second largest of Jupiters moons.');
INSERT INTO public.moon VALUES (8, 'Titan', 5, NULL, 1350.0000000000, 5150.00000, 1222000.00000, 'Titan is Saturns largest moon and has a thick atmosphere.');
INSERT INTO public.moon VALUES (9, 'Rhea', 5, NULL, 231.0000000000, 1528.00000, 527620.00000, 'Rhea is the second largest moon of Saturn.');
INSERT INTO public.moon VALUES (10, 'Iapetus', 5, NULL, 180.0000000000, 1469.00000, 356130.00000, 'Iapetus has a unique two-tone coloration and is one of Saturns moons.');
INSERT INTO public.moon VALUES (11, 'Oberon', 6, NULL, 301.0000000000, 1523.00000, 583520.00000, 'Oberon is one of Uranus largest moons and is heavily cratered.');
INSERT INTO public.moon VALUES (12, 'Titania', 6, NULL, 352.0000000000, 1578.00000, 436300.00000, 'Titania is the largest moon of Uranus.');
INSERT INTO public.moon VALUES (13, 'Triton', 7, NULL, 2140.0000000000, 2706.00000, 3547600.00000, 'Triton is Neptunes largest moon and has a retrograde orbit.');
INSERT INTO public.moon VALUES (14, 'Mimas', 1, NULL, 40.0000000000, 396.00000, 185000.00000, 'Mimas is a small moon of Saturn and is known for its large impact crater.');
INSERT INTO public.moon VALUES (15, 'Enceladus', 1, NULL, 50.0000000000, 252.00000, 238000.00000, 'Enceladus is known for its geysers and is a moon of Saturn.');
INSERT INTO public.moon VALUES (16, 'Dione', 1, NULL, 70.0000000000, 1122.00000, 377400.00000, 'Dione is one of Saturns moons and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (17, 'Tethys', 1, NULL, 63.0000000000, 1062.00000, 294660.00000, 'Tethys is a moon of Saturn with a large impact crater.');
INSERT INTO public.moon VALUES (18, 'Ariel', 6, NULL, 120.0000000000, 1158.00000, 191020.00000, 'Ariel is one of Uranus moons and has a bright and icy surface.');
INSERT INTO public.moon VALUES (19, 'Umbriel', 6, NULL, 130.0000000000, 1178.00000, 266300.00000, 'Umbriel is a moon of Uranus with a dark surface.');
INSERT INTO public.moon VALUES (20, 'Miranda', 6, NULL, 60.0000000000, 471.00000, 129800.00000, 'Miranda is known for its extreme surface features and is a moon of Uranus.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, 59720.0000000000, 12742.00000, 149600000.00000, true, 1, 'Earth is the third planet from the Sun and the only one known to support life.');
INSERT INTO public.planet VALUES (2, 'Mars', 1, NULL, 6410.0000000000, 6779.00000, 227900000.00000, true, 2, 'Mars is the fourth planet from the Sun and is known as the Red Planet.');
INSERT INTO public.planet VALUES (3, 'Venus', 1, NULL, 48680.0000000000, 12104.00000, 108200000.00000, false, 0, 'Venus is the second planet from the Sun and is similar in size to Earth.');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, NULL, 1898000.0000000000, 139820.00000, 778500000.00000, true, 79, 'Jupiter is the largest planet in the Solar System and has a Great Red Spot.');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, NULL, 568300.0000000000, 116460.00000, 1433000000.00000, true, 83, 'Saturn is known for its prominent ring system and is the second-largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Uranus', 1, NULL, 86810.0000000000, 50724.00000, 2871000000.00000, true, 27, 'Uranus is an ice giant with a unique tilt that makes it appear to roll along its orbit.');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, NULL, 102430.0000000000, 49244.00000, 4495000000.00000, true, 14, 'Neptune is known for its deep blue color and strong winds.');
INSERT INTO public.planet VALUES (8, 'Mercury', 1, NULL, 3300.0000000000, 4879.00000, 57900000.00000, false, 0, 'Mercury is the closest planet to the Sun and has a very thin atmosphere.');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, NULL, 1350.0000000000, 2376.00000, 5913000000.00000, true, 5, 'Pluto is a dwarf planet located in the Kuiper Belt.');
INSERT INTO public.planet VALUES (10, 'Titan', 4, NULL, 134500.0000000000, 5150.00000, 1222000.00000, true, 82, 'Titan is Saturns largest moon and has a thick atmosphere.');
INSERT INTO public.planet VALUES (11, 'Ganymede', 4, NULL, 148000.0000000000, 5268.00000, 1070000.00000, true, 0, 'Ganymede is the largest moon in the Solar System and orbits Jupiter.');
INSERT INTO public.planet VALUES (12, 'Europa', 4, NULL, 48000.0000000000, 3121.00000, 670900.00000, true, 0, 'Europa is known for its ice-covered surface and potential subsurface ocean.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 1392000.00000, 5778.00, 1989000.0000000000, NULL, NULL, 'The Sun is the star at the center of the Solar System.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, NULL, 1189600.00000, 9940.00, 4020000.0000000000, NULL, NULL, 'Sirius is the brightest star in the night sky.');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, NULL, 1056000.00000, 5790.00, 2188000.0000000000, NULL, NULL, 'Alpha Centauri is the closest star system to the Solar System.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, NULL, 887000000.00000, 3500.00, 27700000.0000000000, NULL, NULL, 'Betelgeuse is a red supergiant star in the constellation Orion.');
INSERT INTO public.star VALUES (5, 'Rigel', 2, NULL, 717000.00000, 12000.00, 10800000.0000000000, NULL, NULL, 'Rigel is a blue supergiant star in the constellation Orion.');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, NULL, 200000.00000, 3040.00, 1090000.0000000000, NULL, NULL, 'Proxima Centauri is the closest known star to the Sun.');


--
-- Name: discoverer constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT constraint_name UNIQUE (discoverer_id);


--
-- Name: discoverer discoverer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_pkey PRIMARY KEY (discoverer_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: galaxy galaxy_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: moon moon_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

