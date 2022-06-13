--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Ubuntu 14.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.3 (Ubuntu 14.3-1.pgdg20.04+1)

-- Started on 2022-06-13 14:03:20 CDT

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

--
-- TOC entry 851 (class 1247 OID 68862)
-- Name: estadoorden; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estadoorden AS ENUM (
    'RECIBIDA',
    'EN_PROCESO',
    'EN_CAMINO',
    'ENTREGADA'
);


ALTER TYPE public.estadoorden OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 68852)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 68872)
-- Name: administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrador (
    idadmin integer NOT NULL,
    idrestaurante integer,
    idusuario integer NOT NULL
);


ALTER TABLE public.administrador OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 68871)
-- Name: administrador_idadmin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrador_idadmin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrador_idadmin_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 210
-- Name: administrador_idadmin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrador_idadmin_seq OWNED BY public.administrador.idadmin;


--
-- TOC entry 213 (class 1259 OID 68879)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    idusuario integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 68878)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 212
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;


--
-- TOC entry 215 (class 1259 OID 68895)
-- Name: contenidoorden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenidoorden (
    idcontenidoorden integer NOT NULL,
    idplatillo integer,
    idorden integer NOT NULL
);


ALTER TABLE public.contenidoorden OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 68894)
-- Name: contenidoorden_idcontenidoorden_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenidoorden_idcontenidoorden_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contenidoorden_idcontenidoorden_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 214
-- Name: contenidoorden_idcontenidoorden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenidoorden_idcontenidoorden_seq OWNED BY public.contenidoorden.idcontenidoorden;


--
-- TOC entry 217 (class 1259 OID 68902)
-- Name: entregadomicilio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entregadomicilio (
    identregadomicilio integer NOT NULL,
    idrepartidor integer NOT NULL,
    idorden integer NOT NULL
);


ALTER TABLE public.entregadomicilio OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 68901)
-- Name: entregadomicilio_identregadomicilio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entregadomicilio_identregadomicilio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entregadomicilio_identregadomicilio_seq OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 216
-- Name: entregadomicilio_identregadomicilio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entregadomicilio_identregadomicilio_seq OWNED BY public.entregadomicilio.identregadomicilio;


--
-- TOC entry 219 (class 1259 OID 68923)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    idmenu integer NOT NULL,
    idrestaurante integer NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 68922)
-- Name: menu_idmenu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_idmenu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_idmenu_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 218
-- Name: menu_idmenu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_idmenu_seq OWNED BY public.menu.idmenu;


--
-- TOC entry 235 (class 1259 OID 69262)
-- Name: mesa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesa (
    idmesa integer NOT NULL,
    idrestaurante integer NOT NULL,
    ocupada boolean NOT NULL
);


ALTER TABLE public.mesa OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 69261)
-- Name: mesa_idmesa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mesa_idmesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mesa_idmesa_seq OWNER TO postgres;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 234
-- Name: mesa_idmesa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mesa_idmesa_seq OWNED BY public.mesa.idmesa;


--
-- TOC entry 221 (class 1259 OID 68930)
-- Name: mesero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesero (
    idmesero integer NOT NULL,
    idadmin integer NOT NULL,
    idrestaurante integer NOT NULL,
    idusuario integer NOT NULL
);


ALTER TABLE public.mesero OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 68929)
-- Name: mesero_idmesero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mesero_idmesero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mesero_idmesero_seq OWNER TO postgres;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 220
-- Name: mesero_idmesero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mesero_idmesero_seq OWNED BY public.mesero.idmesero;


--
-- TOC entry 233 (class 1259 OID 69253)
-- Name: orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden (
    idorden integer NOT NULL,
    domicilio text,
    estado public.estadoorden NOT NULL,
    "esCarrito" boolean NOT NULL,
    pagado boolean NOT NULL,
    costo integer NOT NULL,
    idrestaurante integer NOT NULL,
    idcliente integer,
    idmesa integer
);


ALTER TABLE public.orden OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 69252)
-- Name: orden_idorden_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_idorden_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_idorden_seq OWNER TO postgres;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 232
-- Name: orden_idorden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_idorden_seq OWNED BY public.orden.idorden;


--
-- TOC entry 223 (class 1259 OID 68958)
-- Name: platillo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platillo (
    idplatillo integer NOT NULL,
    idmenu integer NOT NULL,
    idrestaurante integer NOT NULL,
    nombre character varying(100) NOT NULL,
    costo integer NOT NULL,
    img character varying(1000)
);


ALTER TABLE public.platillo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 68957)
-- Name: platillo_idplatillo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platillo_idplatillo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platillo_idplatillo_seq OWNER TO postgres;

--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 222
-- Name: platillo_idplatillo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.platillo_idplatillo_seq OWNED BY public.platillo.idplatillo;


--
-- TOC entry 225 (class 1259 OID 68979)
-- Name: repartidor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repartidor (
    idrepartidor integer NOT NULL,
    idusuario integer NOT NULL
);


ALTER TABLE public.repartidor OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 68978)
-- Name: repartidor_idrepartidor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repartidor_idrepartidor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repartidor_idrepartidor_seq OWNER TO postgres;

--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 224
-- Name: repartidor_idrepartidor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repartidor_idrepartidor_seq OWNED BY public.repartidor.idrepartidor;


--
-- TOC entry 231 (class 1259 OID 69229)
-- Name: resena; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resena (
    idresena integer NOT NULL,
    idrestaurante integer NOT NULL,
    classificacion integer NOT NULL,
    date date NOT NULL,
    texto character varying(255) NOT NULL,
    idcliente integer NOT NULL
);


ALTER TABLE public.resena OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 69228)
-- Name: resena_idresena_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resena_idresena_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resena_idresena_seq OWNER TO postgres;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 230
-- Name: resena_idresena_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resena_idresena_seq OWNED BY public.resena.idresena;


--
-- TOC entry 227 (class 1259 OID 68986)
-- Name: restaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurante (
    idrestaurante integer NOT NULL,
    nombre character varying(100),
    estado character varying(100),
    calle character varying(100),
    numero integer,
    cp integer,
    municipio character varying(100)
);


ALTER TABLE public.restaurante OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 68985)
-- Name: restaurante_idrestaurante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurante_idrestaurante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurante_idrestaurante_seq OWNER TO postgres;

--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 226
-- Name: restaurante_idrestaurante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurante_idrestaurante_seq OWNED BY public.restaurante.idrestaurante;


--
-- TOC entry 229 (class 1259 OID 69000)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    email character varying(255),
    contrasegna character varying(255),
    token character varying(255),
    rol character varying(255),
    idusuario integer NOT NULL,
    amaterno character(100),
    apatermo character(100),
    calle character varying(100),
    confirmado boolean NOT NULL,
    cp integer,
    estado character varying(100),
    municipio character varying(100),
    nombre character(100) NOT NULL,
    numero integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 68999)
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_idusuario_seq OWNER TO postgres;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 228
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;


--
-- TOC entry 3243 (class 2604 OID 68875)
-- Name: administrador idadmin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador ALTER COLUMN idadmin SET DEFAULT nextval('public.administrador_idadmin_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 68882)
-- Name: cliente idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 68898)
-- Name: contenidoorden idcontenidoorden; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidoorden ALTER COLUMN idcontenidoorden SET DEFAULT nextval('public.contenidoorden_idcontenidoorden_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 68905)
-- Name: entregadomicilio identregadomicilio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregadomicilio ALTER COLUMN identregadomicilio SET DEFAULT nextval('public.entregadomicilio_identregadomicilio_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 68926)
-- Name: menu idmenu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN idmenu SET DEFAULT nextval('public.menu_idmenu_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 69265)
-- Name: mesa idmesa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa ALTER COLUMN idmesa SET DEFAULT nextval('public.mesa_idmesa_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 68933)
-- Name: mesero idmesero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesero ALTER COLUMN idmesero SET DEFAULT nextval('public.mesero_idmesero_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 69256)
-- Name: orden idorden; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden ALTER COLUMN idorden SET DEFAULT nextval('public.orden_idorden_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 68961)
-- Name: platillo idplatillo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platillo ALTER COLUMN idplatillo SET DEFAULT nextval('public.platillo_idplatillo_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 68982)
-- Name: repartidor idrepartidor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidor ALTER COLUMN idrepartidor SET DEFAULT nextval('public.repartidor_idrepartidor_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 69232)
-- Name: resena idresena; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resena ALTER COLUMN idresena SET DEFAULT nextval('public.resena_idresena_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 68989)
-- Name: restaurante idrestaurante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurante ALTER COLUMN idrestaurante SET DEFAULT nextval('public.restaurante_idrestaurante_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 69003)
-- Name: usuario idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);


--
-- TOC entry 3449 (class 0 OID 68852)
-- Dependencies: 209
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
dc6abaa8-61ca-45b1-8bea-475624e81bc1	085cadb053103648b83e93754b1faed54be75ef7fb38be2957f50acce1beee9f	2022-06-12 12:54:18.791178-05	20220419004950_init	\N	\N	2022-06-12 12:54:18.693322-05	1
5c57edd2-a307-4bb0-8d9d-4c86252ff7db	1108aa7b303d5506a1c082041e2569496f1f210384eac753276c57075a298dc4	2022-06-12 12:54:18.837601-05	20220421225449_	\N	\N	2022-06-12 12:54:18.792989-05	1
d55a4a7d-b124-4f67-aff7-6a6f49e41ea2	d88a5a57877a3db092dcb86792d6a1163110cf563b5c03be3c919939de0b84a0	2022-06-12 12:54:18.848323-05	20220426033706_no_franquicia	\N	\N	2022-06-12 12:54:18.839632-05	1
1b58342c-652b-4b8a-8b7a-d486e40884cf	041ca6799fd9bf4c0cd5a74581871c74f5ce0a10eeb410ba3b57a3a4ee0217b2	2022-06-12 12:54:18.859073-05	20220426191351_week10	\N	\N	2022-06-12 12:54:18.849981-05	1
fe4da27f-7d5c-45c5-956b-d4c1c6bc1e12	e693239e35d4671b3efd97cf1c615e426487a1ce99cdb23fa25ea9f5877db34a	2022-06-12 12:54:18.873531-05	20220429165602_migration_with_reviews	\N	\N	2022-06-12 12:54:18.860988-05	1
09f5dbf9-3467-4729-8254-614d82bc5c14	c2244bb25987cd96eeb3cbee04aaf5944037c2b3071d94b144880b5c6636b6a5	2022-06-12 12:54:18.882135-05	20220429170413_	\N	\N	2022-06-12 12:54:18.875305-05	1
9a96a483-29e9-4f5c-bf0e-83cd032aebc6	e1773e090510923a2d34f52474d3cfb075594a29ef8adcc6e5e66b37b2f1e985	2022-06-12 12:54:18.890567-05	20220429171411_	\N	\N	2022-06-12 12:54:18.884151-05	1
c0fa8557-c406-478a-8e98-af9c69c55e6e	7352beb4165f3317439722f1e0308d15d0245cd6194f7b988b37259105b298f4	2022-06-12 12:54:18.899492-05	20220510021459_	\N	\N	2022-06-12 12:54:18.892185-05	1
7237916d-73fd-41e1-8aff-883321b8d3e4	297ceb5b54f200fcb2e41c2c309dfbf8c7610a14a37bef1ecb117ffa4754efa3	2022-06-12 12:54:18.940549-05	20220518210851_version_final	\N	\N	2022-06-12 12:54:18.900787-05	1
37d8fbcb-88e4-4d2e-9062-6ef89ea74fa0	4497a45125ccedc2246971657e69632aaae99151b7863d1ddec7b790740de981	2022-06-12 12:54:18.959054-05	20220526191104_version_casi_final	\N	\N	2022-06-12 12:54:18.941983-05	1
2617a1ce-3b3c-4e2e-9f68-209d67230f79	712735dae892e50c4f816d852648c546336ebad2e1f0f930de0ef35a6b25c699	2022-06-12 12:54:32.408026-05	20220612175431_	\N	\N	2022-06-12 12:54:32.388536-05	1
\.


--
-- TOC entry 3451 (class 0 OID 68872)
-- Dependencies: 211
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrador (idadmin, idrestaurante, idusuario) FROM stdin;
1	1	41
2	2	52
3	3	63
4	4	74
5	5	85
\.


--
-- TOC entry 3453 (class 0 OID 68879)
-- Dependencies: 213
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (idcliente, idusuario) FROM stdin;
1	11
2	12
3	13
4	14
5	15
6	16
7	17
8	18
9	19
10	20
11	21
12	22
13	23
14	24
15	25
16	26
17	27
18	28
19	29
20	30
21	31
22	32
23	33
24	34
25	35
26	36
27	37
28	38
29	39
30	40
\.


--
-- TOC entry 3455 (class 0 OID 68895)
-- Dependencies: 215
-- Data for Name: contenidoorden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenidoorden (idcontenidoorden, idplatillo, idorden) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	21	11
12	21	12
13	21	13
14	21	14
15	21	15
16	21	16
17	21	17
18	21	18
19	21	19
20	21	20
21	41	21
22	41	22
23	41	23
24	41	24
25	41	25
26	41	26
27	41	27
28	41	28
29	41	29
30	41	30
31	61	31
32	61	32
33	61	33
34	61	34
35	61	35
36	61	36
37	61	37
38	61	38
39	61	39
40	61	40
41	81	41
42	81	42
43	81	43
44	81	44
45	81	45
46	81	46
47	81	47
48	81	48
49	81	49
50	81	50
\.


--
-- TOC entry 3457 (class 0 OID 68902)
-- Dependencies: 217
-- Data for Name: entregadomicilio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entregadomicilio (identregadomicilio, idrepartidor, idorden) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	1	11
12	2	12
13	3	13
14	4	14
15	5	15
16	6	16
17	7	17
18	8	18
19	9	19
20	10	20
21	1	21
22	2	22
23	3	23
24	4	24
25	5	25
26	6	26
27	7	27
28	8	28
29	9	29
30	10	30
31	1	31
32	2	32
33	3	33
34	4	34
35	5	35
36	6	36
37	7	37
38	8	38
39	9	39
40	10	40
41	1	41
42	2	42
43	3	43
44	4	44
45	5	45
46	6	46
47	7	47
48	8	48
49	9	49
50	10	50
\.


--
-- TOC entry 3459 (class 0 OID 68923)
-- Dependencies: 219
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (idmenu, idrestaurante) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- TOC entry 3475 (class 0 OID 69262)
-- Dependencies: 235
-- Data for Name: mesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesa (idmesa, idrestaurante, ocupada) FROM stdin;
1	1	t
2	1	t
3	1	t
4	1	t
5	1	t
6	1	t
7	1	t
8	1	t
9	1	t
10	1	t
11	2	t
12	2	t
13	2	t
14	2	t
15	2	t
16	2	t
17	2	t
18	2	t
19	2	t
20	2	t
21	3	t
22	3	t
23	3	t
24	3	t
25	3	t
26	3	t
27	3	t
28	3	t
29	3	t
30	3	t
31	4	t
32	4	t
33	4	t
34	4	t
35	4	t
36	4	t
37	4	t
38	4	t
39	4	t
40	4	t
41	5	t
42	5	t
43	5	t
44	5	t
45	5	t
46	5	t
47	5	t
48	5	t
49	5	t
50	5	t
\.


--
-- TOC entry 3461 (class 0 OID 68930)
-- Dependencies: 221
-- Data for Name: mesero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesero (idmesero, idadmin, idrestaurante, idusuario) FROM stdin;
1	1	1	42
2	1	1	43
3	1	1	44
4	1	1	45
5	1	1	46
6	1	1	47
7	1	1	48
8	1	1	49
9	1	1	50
10	1	1	51
11	2	2	53
12	2	2	54
13	2	2	55
14	2	2	56
15	2	2	57
16	2	2	58
17	2	2	59
18	2	2	60
19	2	2	61
20	2	2	62
21	3	3	64
22	3	3	65
23	3	3	66
24	3	3	67
25	3	3	68
26	3	3	69
27	3	3	70
28	3	3	71
29	3	3	72
30	3	3	73
31	4	4	75
32	4	4	76
33	4	4	77
34	4	4	78
35	4	4	79
36	4	4	80
37	4	4	81
38	4	4	82
39	4	4	83
40	4	4	84
41	5	5	86
42	5	5	87
43	5	5	88
44	5	5	89
45	5	5	90
46	5	5	91
47	5	5	92
48	5	5	93
49	5	5	94
50	5	5	95
\.


--
-- TOC entry 3473 (class 0 OID 69253)
-- Dependencies: 233
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden (idorden, domicilio, estado, "esCarrito", pagado, costo, idrestaurante, idcliente, idmesa) FROM stdin;
1	\N	EN_PROCESO	f	t	100	1	1	1
2	\N	EN_PROCESO	f	t	100	1	2	2
3	\N	EN_PROCESO	f	t	100	1	3	3
4	\N	EN_PROCESO	f	t	100	1	4	4
5	\N	EN_PROCESO	f	t	100	1	5	5
6	\N	EN_PROCESO	f	t	100	1	6	6
7	\N	EN_PROCESO	f	t	100	1	7	7
8	\N	EN_PROCESO	f	t	100	1	8	8
9	\N	EN_PROCESO	f	t	100	1	9	9
10	\N	EN_PROCESO	f	t	100	1	10	10
11	\N	EN_PROCESO	f	t	100	2	1	11
12	\N	EN_PROCESO	f	t	100	2	2	12
13	\N	EN_PROCESO	f	t	100	2	3	13
14	\N	EN_PROCESO	f	t	100	2	4	14
15	\N	EN_PROCESO	f	t	100	2	5	15
16	\N	EN_PROCESO	f	t	100	2	6	16
17	\N	EN_PROCESO	f	t	100	2	7	17
18	\N	EN_PROCESO	f	t	100	2	8	18
19	\N	EN_PROCESO	f	t	100	2	9	19
20	\N	EN_PROCESO	f	t	100	2	10	20
21	\N	EN_PROCESO	f	t	100	3	1	21
22	\N	EN_PROCESO	f	t	100	3	2	22
23	\N	EN_PROCESO	f	t	100	3	3	23
24	\N	EN_PROCESO	f	t	100	3	4	24
25	\N	EN_PROCESO	f	t	100	3	5	25
26	\N	EN_PROCESO	f	t	100	3	6	26
27	\N	EN_PROCESO	f	t	100	3	7	27
28	\N	EN_PROCESO	f	t	100	3	8	28
29	\N	EN_PROCESO	f	t	100	3	9	29
30	\N	EN_PROCESO	f	t	100	3	10	30
31	\N	EN_PROCESO	f	t	100	4	1	31
32	\N	EN_PROCESO	f	t	100	4	2	32
33	\N	EN_PROCESO	f	t	100	4	3	33
34	\N	EN_PROCESO	f	t	100	4	4	34
35	\N	EN_PROCESO	f	t	100	4	5	35
36	\N	EN_PROCESO	f	t	100	4	6	36
37	\N	EN_PROCESO	f	t	100	4	7	37
38	\N	EN_PROCESO	f	t	100	4	8	38
39	\N	EN_PROCESO	f	t	100	4	9	39
40	\N	EN_PROCESO	f	t	100	4	10	40
41	\N	EN_PROCESO	f	t	100	5	1	41
42	\N	EN_PROCESO	f	t	100	5	2	42
43	\N	EN_PROCESO	f	t	100	5	3	43
44	\N	EN_PROCESO	f	t	100	5	4	44
45	\N	EN_PROCESO	f	t	100	5	5	45
46	\N	EN_PROCESO	f	t	100	5	6	46
47	\N	EN_PROCESO	f	t	100	5	7	47
48	\N	EN_PROCESO	f	t	100	5	8	48
49	\N	EN_PROCESO	f	t	100	5	9	49
50	\N	EN_PROCESO	f	t	100	5	10	50
\.


--
-- TOC entry 3463 (class 0 OID 68958)
-- Dependencies: 223
-- Data for Name: platillo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.platillo (idplatillo, idmenu, idrestaurante, nombre, costo, img) FROM stdin;
1	1	1	Generic Granite Computer	45	\N
2	1	1	Generic Wooden Table	675	\N
3	1	1	Handmade Bronze Chips	71	\N
4	1	1	Licensed Steel Bacon	276	\N
5	1	1	Intelligent Cotton Hat	506	\N
6	1	1	Unbranded Rubber Mouse	881	\N
7	1	1	Generic Wooden Shirt	471	\N
8	1	1	Licensed Bronze Salad	373	\N
9	1	1	Intelligent Concrete Cheese	477	\N
10	1	1	Refined Concrete Car	441	\N
11	1	1	Licensed Bronze Pizza	258	\N
12	1	1	Luxurious Rubber Chips	383	\N
13	1	1	Refined Bronze Keyboard	543	\N
14	1	1	Elegant Plastic Computer	771	\N
15	1	1	Luxurious Soft Bacon	213	\N
16	1	1	Generic Steel Tuna	319	\N
17	1	1	Rustic Concrete Chair	959	\N
18	1	1	Incredible Granite Tuna	635	\N
19	1	1	Sleek Cotton Gloves	365	\N
20	1	1	Ergonomic Bronze Bacon	723	\N
21	2	2	Electronic Metal Ball	405	\N
22	2	2	Unbranded Plastic Pizza	305	\N
23	2	2	Sleek Granite Car	253	\N
24	2	2	Electronic Metal Ball	596	\N
25	2	2	Rustic Cotton Gloves	177	\N
26	2	2	Awesome Fresh Chair	162	\N
27	2	2	Licensed Rubber Gloves	588	\N
28	2	2	Luxurious Cotton Ball	1000	\N
29	2	2	Luxurious Bronze Towels	23	\N
30	2	2	Handcrafted Steel Salad	879	\N
31	2	2	Oriental Soft Gloves	851	\N
32	2	2	Sleek Steel Chicken	230	\N
33	2	2	Oriental Cotton Computer	847	\N
34	2	2	Awesome Plastic Chair	890	\N
35	2	2	Elegant Granite Chair	995	\N
36	2	2	Oriental Fresh Chips	519	\N
37	2	2	Rustic Bronze Chair	693	\N
38	2	2	Rustic Granite Chicken	600	\N
39	2	2	Incredible Rubber Pants	880	\N
40	2	2	Gorgeous Cotton Salad	858	\N
41	3	3	Unbranded Granite Soap	46	\N
42	3	3	Awesome Steel Shirt	183	\N
43	3	3	Modern Bronze Ball	172	\N
44	3	3	Luxurious Rubber Towels	627	\N
45	3	3	Intelligent Granite Bacon	330	\N
46	3	3	Luxurious Bronze Chips	63	\N
47	3	3	Intelligent Bronze Bacon	917	\N
48	3	3	Handcrafted Cotton Chicken	585	\N
49	3	3	Small Cotton Bacon	222	\N
50	3	3	Awesome Bronze Cheese	924	\N
51	3	3	Modern Cotton Chicken	923	\N
52	3	3	Unbranded Concrete Computer	761	\N
53	3	3	Fantastic Plastic Chips	487	\N
54	3	3	Practical Wooden Bike	214	\N
55	3	3	Gorgeous Rubber Chicken	746	\N
56	3	3	Elegant Frozen Mouse	2	\N
57	3	3	Incredible Steel Fish	217	\N
58	3	3	Sleek Fresh Hat	583	\N
59	3	3	Practical Concrete Car	654	\N
60	3	3	Licensed Steel Sausages	155	\N
61	4	4	Fantastic Steel Sausages	790	\N
62	4	4	Electronic Concrete Fish	464	\N
63	4	4	Generic Rubber Tuna	300	\N
64	4	4	Awesome Rubber Towels	895	\N
65	4	4	Licensed Wooden Bike	277	\N
66	4	4	Fantastic Steel Car	64	\N
67	4	4	Elegant Cotton Car	38	\N
68	4	4	Luxurious Granite Tuna	752	\N
69	4	4	Licensed Soft Keyboard	650	\N
70	4	4	Practical Metal Pizza	976	\N
71	4	4	Handmade Metal Sausages	406	\N
72	4	4	Elegant Granite Hat	785	\N
73	4	4	Unbranded Concrete Fish	414	\N
74	4	4	Sleek Cotton Bike	926	\N
75	4	4	Luxurious Plastic Bike	334	\N
76	4	4	Fantastic Concrete Chicken	415	\N
77	4	4	Practical Concrete Chicken	515	\N
78	4	4	Intelligent Fresh Chips	449	\N
79	4	4	Refined Cotton Shoes	265	\N
80	4	4	Intelligent Cotton Computer	836	\N
81	5	5	Rustic Soft Table	47	\N
82	5	5	Small Bronze Cheese	964	\N
83	5	5	Practical Concrete Pizza	111	\N
84	5	5	Bespoke Wooden Chips	63	\N
85	5	5	Awesome Cotton Salad	597	\N
86	5	5	Oriental Metal Shoes	5	\N
87	5	5	Generic Metal Ball	717	\N
88	5	5	Licensed Frozen Shirt	599	\N
89	5	5	Electronic Rubber Cheese	111	\N
90	5	5	Tasty Concrete Pizza	889	\N
91	5	5	Elegant Concrete Pants	697	\N
92	5	5	Small Wooden Pizza	11	\N
93	5	5	Modern Plastic Soap	812	\N
94	5	5	Luxurious Fresh Chair	21	\N
95	5	5	Fantastic Granite Ball	929	\N
96	5	5	Handcrafted Soft Chair	876	\N
97	5	5	Bespoke Metal Chair	107	\N
98	5	5	Electronic Fresh Bacon	27	\N
99	5	5	Handmade Rubber Towels	402	\N
100	5	5	Handcrafted Cotton Pizza	835	\N
\.


--
-- TOC entry 3465 (class 0 OID 68979)
-- Dependencies: 225
-- Data for Name: repartidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repartidor (idrepartidor, idusuario) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
\.


--
-- TOC entry 3471 (class 0 OID 69229)
-- Dependencies: 231
-- Data for Name: resena; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resena (idresena, idrestaurante, classificacion, date, texto, idcliente) FROM stdin;
1	1	3	2021-07-08	autem voluptatibus ut	1
2	1	1	2021-08-08	blanditiis modi ipsum	2
3	1	1	2021-07-15	recusandae doloribus asperiores	3
4	1	5	2022-05-02	quisquam et eaque	4
5	1	3	2022-06-06	quasi adipisci aut	5
6	1	3	2022-03-11	expedita quisquam et	6
7	1	2	2021-11-24	et aut quia	7
8	1	4	2022-05-13	totam repellendus doloremque	8
9	1	1	2021-10-23	libero tempora voluptatem	9
10	1	3	2022-03-20	id fugit in	10
11	1	0	2021-12-13	voluptatem sit nulla	11
12	1	2	2021-07-23	porro quam dolor	12
13	1	5	2022-03-13	non corrupti praesentium	13
14	1	4	2021-10-15	ad quam nostrum	14
15	1	3	2021-08-01	nobis iste cum	15
16	1	0	2021-11-02	ratione voluptatibus consequatur	16
17	1	1	2022-01-21	voluptate ea praesentium	17
18	1	1	2021-10-18	error alias voluptas	18
19	1	3	2021-12-01	et voluptate assumenda	19
20	1	3	2021-10-06	vero qui error	20
21	1	5	2021-07-27	quae facilis nisi	21
22	1	3	2022-05-18	consectetur quibusdam aperiam	22
23	1	2	2021-11-14	occaecati enim molestiae	23
24	1	3	2021-06-26	id rerum molestiae	24
25	1	3	2021-11-13	rem placeat occaecati	25
26	1	0	2022-02-15	similique autem facere	26
27	1	5	2022-01-05	qui dolor suscipit	27
28	1	1	2021-10-05	eos veritatis minus	28
29	1	1	2022-03-10	nulla quidem sit	29
30	1	4	2021-06-27	facere maxime velit	30
31	2	2	2022-06-07	ad quis voluptatibus	1
32	2	1	2022-06-09	rerum aliquam enim	2
33	2	1	2021-11-07	ipsam quidem necessitatibus	3
34	2	1	2022-01-29	explicabo quam eos	4
35	2	2	2021-09-13	commodi quos natus	5
36	2	2	2021-08-21	doloremque qui provident	6
37	2	2	2022-01-10	nulla blanditiis est	7
38	2	2	2021-08-13	aspernatur laudantium odit	8
39	2	5	2022-06-01	ut inventore blanditiis	9
40	2	0	2021-09-24	quo voluptas dolor	10
41	2	1	2021-12-23	vel et ipsam	11
42	2	3	2021-07-14	corrupti ratione explicabo	12
43	2	0	2021-08-17	rem tempora omnis	13
44	2	4	2022-02-06	adipisci ex rerum	14
45	2	5	2022-05-16	porro et sint	15
46	2	5	2022-01-22	assumenda aut sapiente	16
47	2	3	2022-05-25	nostrum molestias ipsam	17
48	2	1	2022-01-08	et hic excepturi	18
49	2	5	2021-10-27	dignissimos rerum ad	19
50	2	5	2022-03-27	culpa similique ipsa	20
51	2	1	2022-01-08	quam facilis ea	21
52	2	4	2021-12-10	totam cum sequi	22
53	2	3	2021-11-30	maxime est ut	23
54	2	0	2021-08-13	autem et quia	24
55	2	0	2021-09-17	vel laudantium quia	25
56	2	0	2021-07-24	quis et quis	26
57	2	4	2022-02-22	molestias sed velit	27
58	2	0	2022-04-17	eum repudiandae amet	28
59	2	2	2021-09-27	eum id consectetur	29
60	2	1	2022-02-25	vero rerum non	30
61	3	5	2021-10-07	saepe aut sint	1
62	3	2	2021-12-30	labore qui harum	2
63	3	1	2022-01-13	consequatur ad inventore	3
64	3	2	2022-06-02	nobis aut quae	4
65	3	0	2022-03-24	aut voluptatum aliquam	5
66	3	2	2022-05-01	voluptatum et qui	6
67	3	2	2022-02-13	qui quia vitae	7
68	3	0	2022-05-27	deleniti fugiat enim	8
69	3	0	2021-12-24	et cumque est	9
70	3	1	2021-12-25	excepturi suscipit quos	10
71	3	1	2022-04-13	architecto est praesentium	11
72	3	3	2021-09-30	est omnis mollitia	12
73	3	0	2021-08-14	aut porro ut	13
74	3	2	2022-06-07	itaque eius omnis	14
75	3	5	2021-11-07	assumenda voluptas eum	15
76	3	3	2021-07-04	atque doloribus optio	16
77	3	1	2022-05-22	aperiam esse consequatur	17
78	3	5	2022-06-06	omnis ut aut	18
79	3	0	2022-04-20	pariatur veritatis in	19
80	3	3	2021-12-12	quia eius aut	20
81	3	2	2022-04-04	consectetur pariatur quas	21
82	3	4	2021-12-17	sapiente neque voluptatem	22
83	3	5	2022-01-20	cum ut esse	23
84	3	3	2021-08-10	beatae itaque nihil	24
85	3	1	2021-12-05	porro rerum est	25
86	3	3	2022-04-16	mollitia natus id	26
87	3	3	2022-06-01	unde possimus sint	27
88	3	4	2022-02-20	voluptate praesentium dolore	28
89	3	1	2021-10-27	quam eos eos	29
90	3	2	2022-04-04	facere facere est	30
91	4	2	2021-12-21	nihil harum facilis	1
92	4	5	2022-04-24	perferendis autem pariatur	2
93	4	1	2021-12-05	facilis vel hic	3
94	4	5	2021-12-11	necessitatibus nihil possimus	4
95	4	5	2021-09-12	consequatur fugiat repellendus	5
96	4	2	2022-06-05	et sit voluptates	6
97	4	5	2021-10-17	voluptatum provident rerum	7
98	4	2	2022-01-19	itaque aperiam fugiat	8
99	4	3	2022-04-14	ut et eligendi	9
100	4	4	2021-11-30	et possimus placeat	10
101	4	5	2022-03-07	commodi non qui	11
102	4	1	2021-06-29	et id ipsum	12
103	4	5	2022-05-12	odit id sunt	13
104	4	0	2022-05-25	accusamus deserunt a	14
105	4	2	2022-01-29	aperiam ipsam ad	15
106	4	5	2021-09-16	et dolores laboriosam	16
107	4	3	2021-11-21	recusandae occaecati enim	17
108	4	4	2021-11-13	nisi soluta autem	18
109	4	4	2021-06-20	omnis voluptatem nulla	19
110	4	5	2021-07-05	quis cumque ab	20
111	4	0	2021-08-01	enim architecto ut	21
112	4	2	2022-01-29	consectetur reiciendis ratione	22
113	4	0	2021-09-16	ut nobis veritatis	23
114	4	2	2021-07-11	autem officiis consequatur	24
115	4	3	2021-10-28	eligendi cum mollitia	25
116	4	5	2021-09-18	minima rem voluptate	26
117	4	4	2021-12-12	quis dignissimos molestiae	27
118	4	1	2021-07-06	enim quia quam	28
119	4	5	2021-09-03	quidem qui rerum	29
120	4	2	2021-07-31	tenetur natus ad	30
121	5	3	2021-10-23	commodi consequuntur ipsa	1
122	5	1	2021-09-02	qui sapiente corporis	2
123	5	4	2022-02-02	molestiae soluta dolore	3
124	5	1	2022-02-24	aspernatur et natus	4
125	5	5	2021-08-12	pariatur voluptatem neque	5
126	5	0	2022-02-05	quibusdam earum beatae	6
127	5	5	2021-06-26	qui eius numquam	7
128	5	0	2022-03-07	aut ab non	8
129	5	0	2022-01-17	sed fuga facere	9
130	5	5	2021-06-20	natus quasi ullam	10
131	5	1	2022-03-13	magni in est	11
132	5	3	2021-10-16	sunt illo accusantium	12
133	5	1	2021-10-28	aut qui veniam	13
134	5	5	2021-09-13	rerum possimus sed	14
135	5	2	2022-03-02	possimus cupiditate temporibus	15
136	5	3	2021-10-30	aliquam similique consectetur	16
137	5	4	2022-01-29	quas maiores reprehenderit	17
138	5	5	2022-03-19	quo quis necessitatibus	18
139	5	0	2022-02-22	at esse corporis	19
140	5	5	2021-12-25	consequatur aperiam sed	20
141	5	2	2022-04-13	placeat quibusdam debitis	21
142	5	1	2022-03-17	quia qui qui	22
143	5	4	2021-08-19	rerum voluptas et	23
144	5	4	2022-05-10	minus ipsam non	24
145	5	4	2022-04-11	ex alias qui	25
146	5	3	2022-04-07	aliquam id qui	26
147	5	3	2021-07-07	aspernatur accusamus ab	27
148	5	5	2022-02-27	vel non officia	28
149	5	3	2022-06-02	ut qui totam	29
150	5	1	2022-02-01	debitis fugiat nihil	30
\.


--
-- TOC entry 3467 (class 0 OID 68986)
-- Dependencies: 227
-- Data for Name: restaurante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurante (idrestaurante, nombre, estado, calle, numero, cp, municipio) FROM stdin;
1	Bailey Group	Indiana	Lynch Square	69606	69474	South Major
2	Lind, O'Reilly and Bradtke	Utah	Vicente Mill	15046	25362	Ariboro
3	Schneider and Sons	Maryland	Sheridan Tunnel	57363	29626	Jacobsonstead
4	Crona - Murray	South Dakota	Rogahn Wells	36643	40511	Fort Wilfred
5	Green - Monahan	North Dakota	Schultz Rest	55010	10809	Strosinbury
\.


--
-- TOC entry 3469 (class 0 OID 69000)
-- Dependencies: 229
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (email, contrasegna, token, rol, idusuario, amaterno, apatermo, calle, confirmado, cp, estado, municipio, nombre, numero) FROM stdin;
\N	\N	\N	\N	1	Nicolas                                                                                             	Graham                                                                                              	\N	f	\N	\N	\N	Camryn                                                                                              	\N
\N	\N	\N	\N	2	Turcotte                                                                                            	Klein                                                                                               	\N	f	\N	\N	\N	Demetris                                                                                            	\N
\N	\N	\N	\N	3	Corwin                                                                                              	Rutherford                                                                                          	\N	f	\N	\N	\N	Malcolm                                                                                             	\N
\N	\N	\N	\N	4	Reichel                                                                                             	Kassulke                                                                                            	\N	f	\N	\N	\N	Gay                                                                                                 	\N
\N	\N	\N	\N	5	Witting                                                                                             	Reilly                                                                                              	\N	f	\N	\N	\N	Garrison                                                                                            	\N
\N	\N	\N	\N	6	Wiza                                                                                                	Waters                                                                                              	\N	f	\N	\N	\N	Payton                                                                                              	\N
\N	\N	\N	\N	7	Jones                                                                                               	Lebsack                                                                                             	\N	f	\N	\N	\N	Modesto                                                                                             	\N
\N	\N	\N	\N	8	O'Hara                                                                                              	Bauch                                                                                               	\N	f	\N	\N	\N	Anderson                                                                                            	\N
\N	\N	\N	\N	9	Wiegand                                                                                             	Kuhic                                                                                               	\N	f	\N	\N	\N	Hilma                                                                                               	\N
\N	\N	\N	\N	10	Bauch                                                                                               	Littel                                                                                              	\N	f	\N	\N	\N	Sylvia                                                                                              	\N
\N	\N	\N	\N	11	Kennedy                                                                                             	Walter                                                                                              	\N	f	\N	\N	\N	Mariah                                                                                              	\N
\N	\N	\N	\N	12	Dakota                                                                                              	McCullough                                                                                          	\N	f	\N	\N	\N	Thaddeus                                                                                            	\N
\N	\N	\N	\N	13	Bowie                                                                                               	Prohaska                                                                                            	\N	f	\N	\N	\N	Rafael                                                                                              	\N
\N	\N	\N	\N	14	Bowie                                                                                               	Hodkiewicz                                                                                          	\N	f	\N	\N	\N	Rita                                                                                                	\N
\N	\N	\N	\N	15	Cameron                                                                                             	Turcotte                                                                                            	\N	f	\N	\N	\N	Kayli                                                                                               	\N
\N	\N	\N	\N	16	Hayden                                                                                              	Hammes                                                                                              	\N	f	\N	\N	\N	Reggie                                                                                              	\N
\N	\N	\N	\N	17	Phoenix                                                                                             	Donnelly                                                                                            	\N	f	\N	\N	\N	Abdiel                                                                                              	\N
\N	\N	\N	\N	18	London                                                                                              	Tillman                                                                                             	\N	f	\N	\N	\N	Dawn                                                                                                	\N
\N	\N	\N	\N	19	Sage                                                                                                	Cassin                                                                                              	\N	f	\N	\N	\N	Piper                                                                                               	\N
\N	\N	\N	\N	20	Sasha                                                                                               	Harber                                                                                              	\N	f	\N	\N	\N	George                                                                                              	\N
\N	\N	\N	\N	21	Finley                                                                                              	Altenwerth                                                                                          	\N	f	\N	\N	\N	Kayden                                                                                              	\N
\N	\N	\N	\N	22	Sasha                                                                                               	Turcotte                                                                                            	\N	f	\N	\N	\N	Jacinto                                                                                             	\N
\N	\N	\N	\N	23	Rory                                                                                                	Koelpin                                                                                             	\N	f	\N	\N	\N	Brad                                                                                                	\N
\N	\N	\N	\N	24	Charlie                                                                                             	Russel                                                                                              	\N	f	\N	\N	\N	Celestine                                                                                           	\N
\N	\N	\N	\N	25	Gray                                                                                                	Schiller                                                                                            	\N	f	\N	\N	\N	Bert                                                                                                	\N
\N	\N	\N	\N	26	Skyler                                                                                              	Kris                                                                                                	\N	f	\N	\N	\N	Trey                                                                                                	\N
\N	\N	\N	\N	27	Avery                                                                                               	Lehner                                                                                              	\N	f	\N	\N	\N	Ethan                                                                                               	\N
\N	\N	\N	\N	28	Rowan                                                                                               	Macejkovic                                                                                          	\N	f	\N	\N	\N	Elouise                                                                                             	\N
\N	\N	\N	\N	29	Rowan                                                                                               	Reichel                                                                                             	\N	f	\N	\N	\N	Angelo                                                                                              	\N
\N	\N	\N	\N	30	Kai                                                                                                 	Doyle                                                                                               	\N	f	\N	\N	\N	Zoie                                                                                                	\N
\N	\N	\N	\N	31	Skyler                                                                                              	Weber                                                                                               	\N	f	\N	\N	\N	Trevion                                                                                             	\N
\N	\N	\N	\N	32	Addison                                                                                             	McClure                                                                                             	\N	f	\N	\N	\N	Kimberly                                                                                            	\N
\N	\N	\N	\N	33	Marlowe                                                                                             	Spinka                                                                                              	\N	f	\N	\N	\N	Eloise                                                                                              	\N
\N	\N	\N	\N	34	Elliott                                                                                             	Rath                                                                                                	\N	f	\N	\N	\N	Melba                                                                                               	\N
\N	\N	\N	\N	35	Austin                                                                                              	Kulas                                                                                               	\N	f	\N	\N	\N	Bridget                                                                                             	\N
\N	\N	\N	\N	36	Taylor                                                                                              	Berge                                                                                               	\N	f	\N	\N	\N	Santina                                                                                             	\N
\N	\N	\N	\N	37	Bailey                                                                                              	Jenkins                                                                                             	\N	f	\N	\N	\N	Arely                                                                                               	\N
\N	\N	\N	\N	38	Quinn                                                                                               	Senger                                                                                              	\N	f	\N	\N	\N	Devyn                                                                                               	\N
\N	\N	\N	\N	39	London                                                                                              	Ernser                                                                                              	\N	f	\N	\N	\N	Katrine                                                                                             	\N
\N	\N	\N	\N	40	Marlowe                                                                                             	Corkery                                                                                             	\N	f	\N	\N	\N	Jaquan                                                                                              	\N
\N	\N	\N	\N	41	Ellis                                                                                               	Gerhold                                                                                             	\N	f	\N	\N	\N	Adalberto                                                                                           	\N
\N	\N	\N	\N	42	Dakota                                                                                              	Bednar                                                                                              	\N	f	\N	\N	\N	Gregorio                                                                                            	\N
\N	\N	\N	\N	43	Austin                                                                                              	Wintheiser                                                                                          	\N	f	\N	\N	\N	Floyd                                                                                               	\N
\N	\N	\N	\N	44	Ellis                                                                                               	MacGyver                                                                                            	\N	f	\N	\N	\N	Laisha                                                                                              	\N
\N	\N	\N	\N	45	Sawyer                                                                                              	Goodwin                                                                                             	\N	f	\N	\N	\N	Nash                                                                                                	\N
\N	\N	\N	\N	46	Drew                                                                                                	Huels                                                                                               	\N	f	\N	\N	\N	Hanna                                                                                               	\N
\N	\N	\N	\N	47	Drew                                                                                                	Wolf                                                                                                	\N	f	\N	\N	\N	Celestine                                                                                           	\N
\N	\N	\N	\N	48	Addison                                                                                             	Reynolds                                                                                            	\N	f	\N	\N	\N	Adrain                                                                                              	\N
\N	\N	\N	\N	49	Micah                                                                                               	Kris                                                                                                	\N	f	\N	\N	\N	Jarrod                                                                                              	\N
\N	\N	\N	\N	50	London                                                                                              	Price                                                                                               	\N	f	\N	\N	\N	Ernie                                                                                               	\N
\N	\N	\N	\N	51	Bowie                                                                                               	Gaylord                                                                                             	\N	f	\N	\N	\N	Candido                                                                                             	\N
\N	\N	\N	\N	52	Jamie                                                                                               	Kassulke                                                                                            	\N	f	\N	\N	\N	Savanah                                                                                             	\N
\N	\N	\N	\N	53	Noah                                                                                                	Kemmer                                                                                              	\N	f	\N	\N	\N	Marianna                                                                                            	\N
\N	\N	\N	\N	54	Nico                                                                                                	Johnston                                                                                            	\N	f	\N	\N	\N	Gwendolyn                                                                                           	\N
\N	\N	\N	\N	55	Kai                                                                                                 	Ledner                                                                                              	\N	f	\N	\N	\N	Guy                                                                                                 	\N
\N	\N	\N	\N	56	Kennedy                                                                                             	Stroman                                                                                             	\N	f	\N	\N	\N	Madeline                                                                                            	\N
\N	\N	\N	\N	57	Jaden                                                                                               	Bergnaum                                                                                            	\N	f	\N	\N	\N	D'angelo                                                                                            	\N
\N	\N	\N	\N	58	Reese                                                                                               	Daugherty                                                                                           	\N	f	\N	\N	\N	Elisabeth                                                                                           	\N
\N	\N	\N	\N	59	Ellis                                                                                               	Franecki                                                                                            	\N	f	\N	\N	\N	Barton                                                                                              	\N
\N	\N	\N	\N	60	Arden                                                                                               	Conroy                                                                                              	\N	f	\N	\N	\N	Adell                                                                                               	\N
\N	\N	\N	\N	61	Austin                                                                                              	Dickens                                                                                             	\N	f	\N	\N	\N	Arlie                                                                                               	\N
\N	\N	\N	\N	62	Riley                                                                                               	Schaden                                                                                             	\N	f	\N	\N	\N	Allen                                                                                               	\N
\N	\N	\N	\N	63	Sawyer                                                                                              	Windler                                                                                             	\N	f	\N	\N	\N	Devin                                                                                               	\N
\N	\N	\N	\N	64	Riley                                                                                               	Wiegand                                                                                             	\N	f	\N	\N	\N	Garnett                                                                                             	\N
\N	\N	\N	\N	65	Shawn                                                                                               	Boehm                                                                                               	\N	f	\N	\N	\N	Colleen                                                                                             	\N
\N	\N	\N	\N	66	Sawyer                                                                                              	Wisozk                                                                                              	\N	f	\N	\N	\N	Brenda                                                                                              	\N
\N	\N	\N	\N	67	Ellis                                                                                               	Emmerich                                                                                            	\N	f	\N	\N	\N	Marshall                                                                                            	\N
\N	\N	\N	\N	68	Harper                                                                                              	Waelchi                                                                                             	\N	f	\N	\N	\N	Khalil                                                                                              	\N
\N	\N	\N	\N	69	Drew                                                                                                	Will                                                                                                	\N	f	\N	\N	\N	Sabrina                                                                                             	\N
\N	\N	\N	\N	70	Finley                                                                                              	Roob                                                                                                	\N	f	\N	\N	\N	Hulda                                                                                               	\N
\N	\N	\N	\N	71	Angel                                                                                               	Kshlerin                                                                                            	\N	f	\N	\N	\N	Jace                                                                                                	\N
\N	\N	\N	\N	72	Anderson                                                                                            	Leannon                                                                                             	\N	f	\N	\N	\N	Stacy                                                                                               	\N
\N	\N	\N	\N	73	Reign                                                                                               	McKenzie                                                                                            	\N	f	\N	\N	\N	Brent                                                                                               	\N
\N	\N	\N	\N	74	Jaden                                                                                               	Kreiger                                                                                             	\N	f	\N	\N	\N	Ansley                                                                                              	\N
\N	\N	\N	\N	75	Bailey                                                                                              	Kemmer                                                                                              	\N	f	\N	\N	\N	Kayleigh                                                                                            	\N
\N	\N	\N	\N	76	Reign                                                                                               	Baumbach                                                                                            	\N	f	\N	\N	\N	Ida                                                                                                 	\N
\N	\N	\N	\N	77	Jordan                                                                                              	Bauch                                                                                               	\N	f	\N	\N	\N	Era                                                                                                 	\N
\N	\N	\N	\N	78	Brooklyn                                                                                            	Leannon                                                                                             	\N	f	\N	\N	\N	Jaime                                                                                               	\N
\N	\N	\N	\N	79	Anderson                                                                                            	Brakus                                                                                              	\N	f	\N	\N	\N	Jo                                                                                                  	\N
\N	\N	\N	\N	80	Charlie                                                                                             	Schmidt                                                                                             	\N	f	\N	\N	\N	Timmothy                                                                                            	\N
\N	\N	\N	\N	81	Sawyer                                                                                              	Schmeler                                                                                            	\N	f	\N	\N	\N	Jodie                                                                                               	\N
\N	\N	\N	\N	82	Addison                                                                                             	Denesik                                                                                             	\N	f	\N	\N	\N	Gage                                                                                                	\N
\N	\N	\N	\N	83	Elliott                                                                                             	Klocko                                                                                              	\N	f	\N	\N	\N	Royal                                                                                               	\N
\N	\N	\N	\N	84	Parker                                                                                              	Schiller                                                                                            	\N	f	\N	\N	\N	Ransom                                                                                              	\N
\N	\N	\N	\N	85	James                                                                                               	Dare                                                                                                	\N	f	\N	\N	\N	Kaitlyn                                                                                             	\N
\N	\N	\N	\N	86	Kai                                                                                                 	Schiller                                                                                            	\N	f	\N	\N	\N	Destin                                                                                              	\N
\N	\N	\N	\N	87	Kai                                                                                                 	Becker                                                                                              	\N	f	\N	\N	\N	Favian                                                                                              	\N
\N	\N	\N	\N	88	Jules                                                                                               	Stanton                                                                                             	\N	f	\N	\N	\N	Deron                                                                                               	\N
\N	\N	\N	\N	89	August                                                                                              	Kovacek                                                                                             	\N	f	\N	\N	\N	Ashtyn                                                                                              	\N
\N	\N	\N	\N	90	Riley                                                                                               	Toy                                                                                                 	\N	f	\N	\N	\N	Joey                                                                                                	\N
\N	\N	\N	\N	91	Logan                                                                                               	Crooks                                                                                              	\N	f	\N	\N	\N	Cecil                                                                                               	\N
\N	\N	\N	\N	92	Taylor                                                                                              	Little                                                                                              	\N	f	\N	\N	\N	Tierra                                                                                              	\N
\N	\N	\N	\N	93	Greer                                                                                               	Langworth                                                                                           	\N	f	\N	\N	\N	Daron                                                                                               	\N
\N	\N	\N	\N	94	Sage                                                                                                	Toy                                                                                                 	\N	f	\N	\N	\N	Bridie                                                                                              	\N
\N	\N	\N	\N	95	Leslie                                                                                              	Stoltenberg                                                                                         	\N	f	\N	\N	\N	Al                                                                                                  	\N
\.


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 210
-- Name: administrador_idadmin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrador_idadmin_seq', 5, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 212
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_idcliente_seq', 30, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 214
-- Name: contenidoorden_idcontenidoorden_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenidoorden_idcontenidoorden_seq', 50, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 216
-- Name: entregadomicilio_identregadomicilio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entregadomicilio_identregadomicilio_seq', 50, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 218
-- Name: menu_idmenu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_idmenu_seq', 5, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 234
-- Name: mesa_idmesa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesa_idmesa_seq', 50, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 220
-- Name: mesero_idmesero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesero_idmesero_seq', 50, true);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 232
-- Name: orden_idorden_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_idorden_seq', 50, true);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 222
-- Name: platillo_idplatillo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.platillo_idplatillo_seq', 100, true);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 224
-- Name: repartidor_idrepartidor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repartidor_idrepartidor_seq', 10, true);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 230
-- Name: resena_idresena_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resena_idresena_seq', 150, true);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 226
-- Name: restaurante_idrestaurante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurante_idrestaurante_seq', 5, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 228
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_idusuario_seq', 95, true);


--
-- TOC entry 3257 (class 2606 OID 68860)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 68877)
-- Name: administrador administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (idadmin);


--
-- TOC entry 3264 (class 2606 OID 68886)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 3266 (class 2606 OID 68900)
-- Name: contenidoorden contenidoorden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidoorden
    ADD CONSTRAINT contenidoorden_pkey PRIMARY KEY (idcontenidoorden);


--
-- TOC entry 3269 (class 2606 OID 68907)
-- Name: entregadomicilio entregadomicilio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregadomicilio
    ADD CONSTRAINT entregadomicilio_pkey PRIMARY KEY (identregadomicilio);


--
-- TOC entry 3271 (class 2606 OID 68928)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (idmenu);


--
-- TOC entry 3290 (class 2606 OID 69267)
-- Name: mesa mesa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT mesa_pkey PRIMARY KEY (idmesa);


--
-- TOC entry 3274 (class 2606 OID 68935)
-- Name: mesero mesero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesero
    ADD CONSTRAINT mesero_pkey PRIMARY KEY (idmesero);


--
-- TOC entry 3288 (class 2606 OID 69260)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (idorden);


--
-- TOC entry 3276 (class 2606 OID 68963)
-- Name: platillo platillo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platillo
    ADD CONSTRAINT platillo_pkey PRIMARY KEY (idplatillo);


--
-- TOC entry 3278 (class 2606 OID 68984)
-- Name: repartidor repartidor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidor
    ADD CONSTRAINT repartidor_pkey PRIMARY KEY (idrepartidor);


--
-- TOC entry 3286 (class 2606 OID 69234)
-- Name: resena resena_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (idresena);


--
-- TOC entry 3280 (class 2606 OID 68991)
-- Name: restaurante restaurante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT restaurante_pkey PRIMARY KEY (idrestaurante);


--
-- TOC entry 3283 (class 2606 OID 69007)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 3258 (class 1259 OID 69268)
-- Name: administrador_idrestaurante_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX administrador_idrestaurante_key ON public.administrador USING btree (idrestaurante);


--
-- TOC entry 3259 (class 1259 OID 69284)
-- Name: administrador_idusuario_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX administrador_idusuario_key ON public.administrador USING btree (idusuario);


--
-- TOC entry 3262 (class 1259 OID 69285)
-- Name: cliente_idusuario_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX cliente_idusuario_key ON public.cliente USING btree (idusuario);


--
-- TOC entry 3267 (class 1259 OID 70157)
-- Name: entregadomicilio_idorden_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX entregadomicilio_idorden_key ON public.entregadomicilio USING btree (idorden);


--
-- TOC entry 3272 (class 1259 OID 69286)
-- Name: mesero_idusuario_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX mesero_idusuario_key ON public.mesero USING btree (idusuario);


--
-- TOC entry 3284 (class 1259 OID 70158)
-- Name: resena_idrestaurante_idcliente_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX resena_idrestaurante_idcliente_key ON public.resena USING btree (idrestaurante, idcliente);


--
-- TOC entry 3281 (class 1259 OID 69287)
-- Name: usuario_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_email_key ON public.usuario USING btree (email);


--
-- TOC entry 3307 (class 2606 OID 70159)
-- Name: orden fk,orden3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT "fk,orden3" FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3291 (class 2606 OID 69008)
-- Name: administrador fk_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT fk_admin FOREIGN KEY (idrestaurante) REFERENCES public.restaurante(idrestaurante) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3295 (class 2606 OID 69269)
-- Name: contenidoorden fk_contenido1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidoorden
    ADD CONSTRAINT fk_contenido1 FOREIGN KEY (idorden) REFERENCES public.orden(idorden) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 69048)
-- Name: contenidoorden fk_contenido3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidoorden
    ADD CONSTRAINT fk_contenido3 FOREIGN KEY (idplatillo) REFERENCES public.platillo(idplatillo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3298 (class 2606 OID 69073)
-- Name: menu fk_menu1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu1 FOREIGN KEY (idrestaurante) REFERENCES public.restaurante(idrestaurante) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3309 (class 2606 OID 69279)
-- Name: mesa fk_mesa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT fk_mesa FOREIGN KEY (idrestaurante) REFERENCES public.restaurante(idrestaurante) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3299 (class 2606 OID 69078)
-- Name: mesero fk_mesero1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesero
    ADD CONSTRAINT fk_mesero1 FOREIGN KEY (idadmin) REFERENCES public.administrador(idadmin) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3300 (class 2606 OID 69083)
-- Name: mesero fk_mesero2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesero
    ADD CONSTRAINT fk_mesero2 FOREIGN KEY (idrestaurante) REFERENCES public.restaurante(idrestaurante) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 69058)
-- Name: entregadomicilio fk_or1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregadomicilio
    ADD CONSTRAINT fk_or1 FOREIGN KEY (idrepartidor) REFERENCES public.repartidor(idrepartidor) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3297 (class 2606 OID 69274)
-- Name: entregadomicilio fk_or2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregadomicilio
    ADD CONSTRAINT fk_or2 FOREIGN KEY (idorden) REFERENCES public.orden(idorden) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3308 (class 2606 OID 70164)
-- Name: orden fk_orden1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_orden1 FOREIGN KEY (idmesa) REFERENCES public.mesa(idmesa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3306 (class 2606 OID 69288)
-- Name: orden fk_orden2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_orden2 FOREIGN KEY (idrestaurante) REFERENCES public.restaurante(idrestaurante) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3302 (class 2606 OID 69108)
-- Name: platillo fk_paltillo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platillo
    ADD CONSTRAINT fk_paltillo1 FOREIGN KEY (idmenu) REFERENCES public.menu(idmenu) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3304 (class 2606 OID 69235)
-- Name: resena fk_resena2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT fk_resena2 FOREIGN KEY (idrestaurante) REFERENCES public.restaurante(idrestaurante);


--
-- TOC entry 3305 (class 2606 OID 69245)
-- Name: resena fk_resena3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT fk_resena3 FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- TOC entry 3292 (class 2606 OID 69013)
-- Name: administrador fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT fk_usuario FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 69018)
-- Name: cliente fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_usuario FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3301 (class 2606 OID 69088)
-- Name: mesero fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesero
    ADD CONSTRAINT fk_usuario FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3303 (class 2606 OID 69138)
-- Name: repartidor fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidor
    ADD CONSTRAINT fk_usuario FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-06-13 14:03:20 CDT

--
-- PostgreSQL database dump complete
--

