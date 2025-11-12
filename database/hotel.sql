--
-- PostgreSQL database dump
--

\restrict 5e2NNaDRjvMKv4729TQ7IzqWKbtsDJkLe3eiInhazmdJyrDqgb2kepfpAVHH4hH

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-12 23:06:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 16471)
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    rate numeric(10,2) NOT NULL,
    guests integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    "hotelId" integer,
    "roomTypeId" integer
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16470)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO postgres;

--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 225
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- TOC entry 224 (class 1259 OID 16449)
-- Name: daily_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daily_rates (
    id integer NOT NULL,
    hotel_id integer,
    room_type_id integer,
    date date NOT NULL,
    rate numeric(10,2) NOT NULL
);


ALTER TABLE public.daily_rates OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16448)
-- Name: daily_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daily_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.daily_rates_id_seq OWNER TO postgres;

--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 223
-- Name: daily_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daily_rates_id_seq OWNED BY public.daily_rates.id;


--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    id integer NOT NULL,
    name character varying,
    location character varying
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16419)
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotels_id_seq OWNER TO postgres;

--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 219
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- TOC entry 222 (class 1259 OID 16432)
-- Name: room_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_types (
    id integer NOT NULL,
    capacity integer NOT NULL,
    name character varying,
    "hotelId" integer NOT NULL
);


ALTER TABLE public.room_types OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16431)
-- Name: room_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_types_id_seq OWNER TO postgres;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 221
-- Name: room_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_types_id_seq OWNED BY public.room_types.id;


--
-- TOC entry 4874 (class 2604 OID 16474)
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 16452)
-- Name: daily_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rates ALTER COLUMN id SET DEFAULT nextval('public.daily_rates_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 16423)
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- TOC entry 4872 (class 2604 OID 16435)
-- Name: room_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_types ALTER COLUMN id SET DEFAULT nextval('public.room_types_id_seq'::regclass);


--
-- TOC entry 5044 (class 0 OID 16471)
-- Dependencies: 226
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, check_in, check_out, rate, guests, created_at, "hotelId", "roomTypeId") FROM stdin;
2	2025-11-12	2025-11-12	45.00	5	2025-11-12 11:13:51.050083	2	\N
3	2025-11-13	2025-11-13	60.00	4	2025-11-12 15:56:38.349719	1	\N
4	2025-11-14	2025-11-14	115.00	3	2025-11-12 15:56:38.349719	1	\N
1	2025-11-12	2025-11-13	40.00	2	2025-11-12 11:13:21.017397	1	\N
5	2025-11-15	2025-11-15	88.00	36	2025-11-12 16:02:21.160302	1	\N
6	2025-11-16	2025-11-16	130.00	14	2025-11-12 16:02:47.880214	1	\N
11	2025-11-17	2025-11-17	210.00	20	2025-11-12 16:04:05.528436	1	\N
12	2025-11-18	2025-11-18	298.00	20	2025-11-12 16:04:05.528436	1	\N
\.


--
-- TOC entry 5042 (class 0 OID 16449)
-- Dependencies: 224
-- Data for Name: daily_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daily_rates (id, hotel_id, room_type_id, date, rate) FROM stdin;
1	1	1	2025-11-12	20.00
2	1	2	2025-11-12	35.00
3	2	3	2025-11-12	60.00
4	2	4	2025-11-12	50.00
\.


--
-- TOC entry 5038 (class 0 OID 16420)
-- Dependencies: 220
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (id, name, location) FROM stdin;
1	\N	\N
2	\N	\N
\.


--
-- TOC entry 5040 (class 0 OID 16432)
-- Dependencies: 222
-- Data for Name: room_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_types (id, capacity, name, "hotelId") FROM stdin;
1	2	single bed	1
2	4	double bed room	1
3	2	single bed	2
4	6	lux room	2
\.


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 225
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 12, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 223
-- Name: daily_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.daily_rates_id_seq', 4, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 219
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_id_seq', 2, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 221
-- Name: room_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_types_id_seq', 4, true);


--
-- TOC entry 4885 (class 2606 OID 16481)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 16459)
-- Name: daily_rates daily_rates_hotel_id_room_type_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rates
    ADD CONSTRAINT daily_rates_hotel_id_room_type_id_date_key UNIQUE (hotel_id, room_type_id, date);


--
-- TOC entry 4883 (class 2606 OID 16457)
-- Name: daily_rates daily_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rates
    ADD CONSTRAINT daily_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 16430)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 16442)
-- Name: room_types room_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 16528)
-- Name: bookings FK_2869e3b31e403a2ac2509e4fce1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "FK_2869e3b31e403a2ac2509e4fce1" FOREIGN KEY ("roomTypeId") REFERENCES public.room_types(id);


--
-- TOC entry 4889 (class 2606 OID 16523)
-- Name: bookings FK_6713f297621b99988068dd63fe5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "FK_6713f297621b99988068dd63fe5" FOREIGN KEY ("hotelId") REFERENCES public.hotels(id);


--
-- TOC entry 4886 (class 2606 OID 16460)
-- Name: daily_rates daily_rates_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rates
    ADD CONSTRAINT daily_rates_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- TOC entry 4887 (class 2606 OID 16465)
-- Name: daily_rates daily_rates_room_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rates
    ADD CONSTRAINT daily_rates_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES public.room_types(id);


-- Completed on 2025-11-12 23:06:38

--
-- PostgreSQL database dump complete
--

\unrestrict 5e2NNaDRjvMKv4729TQ7IzqWKbtsDJkLe3eiInhazmdJyrDqgb2kepfpAVHH4hH

