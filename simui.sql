--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: simui; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA simui;


--
-- Name: update_jumlah_daftar_event(); Type: FUNCTION; Schema: simui; Owner: -
--

CREATE FUNCTION simui.update_jumlah_daftar_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
row RECORD;
BEGIN
IF (TG_OP = 'INSERT' OR TG_OP = 'DELETE') THEN
FOR row IN
SELECT e.id_event AS IDevent, COUNT(pe.*) AS jumlah_daftar
FROM event e, pendaftaran_event pe
WHERE e.id_event = pe.id_event
GROUP BY e.id_event, pe.id_event
LOOP
UPDATE event SET jumlah_pendaftar = row.jumlah_daftar
WHERE id_event = row.IDevent;
END LOOP;
RETURN NEW;
END IF;
END;
$$;


--
-- Name: update_jumlah_daftar_event_fungsi(); Type: FUNCTION; Schema: simui; Owner: -
--

CREATE FUNCTION simui.update_jumlah_daftar_event_fungsi() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
row RECORD;
BEGIN
FOR row IN
SELECT e.id_event AS IDevent, COUNT(pe.*) AS jumlah_daftar
FROM event e, pendaftaran_event pe
WHERE e.id_event = pe.id_event
GROUP BY e.id_event, pe.id_event
LOOP
UPDATE event SET jumlah_pendaftar = row.jumlah_daftar
WHERE id_event = row.IDevent;
END LOOP;
END;
$$;


--
-- Name: update_jumlah_daftar_oprec(); Type: FUNCTION; Schema: simui; Owner: -
--

CREATE FUNCTION simui.update_jumlah_daftar_oprec() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
row RECORD;
BEGIN
IF (TG_OP = 'INSERT' OR TG_OP = 'DELETE') THEN
FOR row IN
SELECT e.id_oprec AS IDoprec, COUNT(pe.*) AS jumlah_daftar
FROM open_recruitment e, pendaftaran_oprec pe
WHERE e.id_oprec = pe.id_oprec
GROUP BY e.id_oprec, pe.id_oprec
LOOP
UPDATE open_recruitment SET jumlah_pendaftar = row.jumlah_daftar
WHERE id_oprec = row.IDoprec;
END LOOP;
RETURN NEW;
END IF;
END;
$$;


--
-- Name: update_jumlah_daftar_oprec_fungsi(); Type: FUNCTION; Schema: simui; Owner: -
--

CREATE FUNCTION simui.update_jumlah_daftar_oprec_fungsi() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
row RECORD;
BEGIN
FOR row IN
SELECT e.id_oprec AS IDoprec, COUNT(pe.*) AS jumlah_daftar
FROM open_recruitment e, pendaftaran_oprec pe
WHERE e.id_oprec = pe.id_oprec
GROUP BY e.id_oprec, pe.id_oprec
LOOP
UPDATE open_recruitment SET jumlah_pendaftar = row.jumlah_daftar
WHERE id_oprec = row.IDoprec;
END LOOP;
END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.admin (
    username character varying(15) NOT NULL
);


--
-- Name: dosen; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.dosen (
    username character varying(15) NOT NULL,
    nidn character varying(20) NOT NULL
);


--
-- Name: event; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.event (
    id_event integer NOT NULL,
    id_pembuat_event character(5) NOT NULL,
    nama character varying(50) NOT NULL,
    tanggal date NOT NULL,
    waktu timestamp without time zone NOT NULL,
    kapasitas integer NOT NULL,
    harga_tiket integer,
    lokasi text NOT NULL,
    sifat_event character varying(10) NOT NULL,
    deskripsi_singkat text NOT NULL,
    nomor_kategori character(5),
    jumlah_pendaftar integer DEFAULT 0
);


--
-- Name: guest; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.guest (
    username character varying(15) NOT NULL,
    pekerjaan character varying(50) NOT NULL,
    alamat text
);


--
-- Name: kategori_event; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.kategori_event (
    nomor character(5) NOT NULL,
    nama character varying(50) NOT NULL
);


--
-- Name: kepanitiaan; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.kepanitiaan (
    id_kepanitiaan character(5) NOT NULL,
    id_organisasi character(5) NOT NULL
);


--
-- Name: mahasiswa; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.mahasiswa (
    username character varying(15) NOT NULL,
    npm character varying(20) NOT NULL
);


--
-- Name: non_admin; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.non_admin (
    username character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    nama character varying(50) NOT NULL,
    no_telepon character varying(20) NOT NULL
);


--
-- Name: open_recruitment; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.open_recruitment (
    id_oprec integer NOT NULL,
    id_kepanitiaan character(5) NOT NULL,
    id_organisasi character(5) NOT NULL,
    nama character varying(50) NOT NULL,
    tanggal_dibuka date NOT NULL,
    tanggal_ditutup date NOT NULL,
    berkas_dibutuhkan text,
    persyaratan text,
    jumlah_pendaftar integer DEFAULT 0
);


--
-- Name: organisasi; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.organisasi (
    id_organisasi character(5) NOT NULL
);


--
-- Name: pembuat_event; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.pembuat_event (
    id character(5) NOT NULL,
    nama character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    alamat_website character varying(50),
    tingkatan character varying(50) NOT NULL,
    kategori character varying(50) NOT NULL,
    logo text,
    deskripsi text,
    contact_person character varying(50) NOT NULL
);


--
-- Name: pendaftaran_event; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.pendaftaran_event (
    id_event integer NOT NULL,
    id_pembuat_event character(5) NOT NULL,
    username character varying(15) NOT NULL
);


--
-- Name: pendaftaran_oprec; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.pendaftaran_oprec (
    id_oprec integer NOT NULL,
    id_kepanitiaan character(5) NOT NULL,
    id_organisasi character(5) NOT NULL,
    id_mhs character varying(15) NOT NULL,
    divisi character varying(100) NOT NULL,
    motivasi text NOT NULL,
    tugas text,
    swot text NOT NULL,
    berkas text
);


--
-- Name: pengguna; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.pengguna (
    username character varying(15) NOT NULL,
    password character varying(50) NOT NULL
);


--
-- Name: pengisi_acara; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.pengisi_acara (
    id_event integer NOT NULL,
    id_pembuat_event character(5) NOT NULL,
    nama_pengisi_acara character varying(20) NOT NULL
);


--
-- Name: staff; Type: TABLE; Schema: simui; Owner: -
--

CREATE TABLE simui.staff (
    username character varying(15) NOT NULL,
    nip character varying(20) NOT NULL
);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.admin (username) FROM stdin;
dekwillkuh
naili.s
vikri.a
gries.y
latifah.a
\.


--
-- Data for Name: dosen; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.dosen (username, nidn) FROM stdin;
wisnuj	60200113001
bellawidjaja	60200113002
aniaty.m	60200113003
iis.a	60200113030
laksmita	60200113031
im.ivan	60200113032
inibudi	60200113012
ichalAF	60200113011
windy.a	60200113010
fadhillah.z	60200113020
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.event (id_event, id_pembuat_event, nama, tanggal, waktu, kapasitas, harga_tiket, lokasi, sifat_event, deskripsi_singkat, nomor_kategori, jumlah_pendaftar) FROM stdin;
36	K1   	Doctor's Career Update	2019-10-09	2019-10-09 13:00:00	250	50000	FKM	Privat	Pemilihan Mahasiswa Terbaik	KE10 	1
79	H2   	Mechanical Job Fair	2019-04-23	2019-04-23 10:00:00	100	\N	FIB	Privat	Event Tahunan UI	KE7  	1
16	D4   	Diesnatalis Fasilkom UI	2019-09-08	2019-09-08 07:00:00	200	50000	Balairung	Privat	Pentas Hiburan	KE5  	2
63	D1   	Futsal Competition	2019-09-17	2019-09-17 12:00:00	200	50000	FK	Umum	Pentas Hiburan	KE10 	1
25	G1   	Ruang Kreasi Mahasiswa	2019-09-18	2019-09-18 16:00:00	150	50000	FK	Privat	Event Terbesar UI	KE2  	2
55	B1   	Seminar Nasional Civil Week	2019-11-13	2019-11-13 18:00:00	150	50000	FT	Umum	Event Terbesar UI	KE2  	1
1	A1   	Festival Kreasi Anak Bangsa	2019-02-24	2019-02-24 07:00:00	100	100000	FKG	Umum	Pemilihan Mahasiswa Terbaik	KE10 	1
52	A2   	Atma Expression Lights Out	2019-01-02	2019-02-01 15:00:00	300	\N	FKG	Umum	Event Tahunan UI	KE1  	1
4	A4   	Talkshow Nasional Kewirausahaan	2019-02-24	2019-02-24 10:00:00	200	\N	FKM	Privat	Pesta Pendidikan	KE10 	1
22	F2   	Job Fair IT 2019	2019-09-12	2019-09-12 13:00:00	200	\N	FASILKOM	Privat	Event Terbesar UI	KE7  	2
19	E3   	The Untold Horizon Concert by Paragita	2019-12-23	2019-12-23 10:00:00	100	100000	FKG	Umum	Pesta Pendidikan	KE6  	2
49	O2   	UI Music Fair	2019-01-28	2019-01-28 12:00:00	200	\N	FH	Umum	Kompetisi Tahunan	KE5  	1
10	C2   	Social Art	2019-10-24	2019-10-24 16:00:00	200	50000	FASILKOM	Privat	Event Terbesar UI	KE4  	2
56	B2   	Indonesia Economic Outlook	2019-11-28	2019-11-28 19:00:00	50	\N	FASILKOM	Privat	Event Terbesar UI	KE1  	1
34	J2   	Moeslim Fest	2019-11-26	2019-11-26 11:00:00	100	\N	FMIPA	Umum	Event Tahunan UI	KE7  	1
58	B4   	Techno Fair and Seminar	2019-05-02	2019-05-02 07:00:00	300	100000	Balairung	Umum	Bazar Terbesar	KE6  	1
67	E1   	Dental Festival	2019-12-10	2019-12-10 16:00:00	80	\N	FH	Umum	Pagelaran Seni	KE1  	1
57	B3   	Seminar Kesehatan Nasional	2019-06-15	2019-06-15 20:00:00	300	100000	VOKASI	Privat	Pemilihan Mahasiswa Terbaik	KE8  	1
27	G3   	Heroic	2019-02-13	2019-02-13 18:00:00	100	50000	Balairung	Privat	Pesta Pendidikan	KE5  	1
71	F1   	Edsa Art Show	2019-10-12	2019-10-12 20:00:00	400	\N	FMIPA	Umum	Event Terbesar UI	KE7  	1
70	E4   	Labma Scientific Fair	2019-11-26	2019-11-26 19:00:00	100	100000	FE	Umum	Event Tahunan UI	KE5  	1
46	N2   	Musikologi	2019-06-21	2019-06-21 09:00:00	300	50000	FE	Privat	Pesta Pendidikan	KE5  	1
66	D4   	Teater Kami Bercerita	2019-08-08	2019-08-08 15:00:00	100	100000	FKG	Umum	Bazar Terbesar	KE4  	1
3	A3   	Workshop Photography	2019-02-26	2019-02-26 09:00:00	200	100000	VOKASI	Umum	Event Tahunan UI	KE2  	1
45	N1   	Beasiswa S2 dan S3 di Jerman	2019-05-17	2019-05-17 08:00:00	100	\N	Balairung	Privat	Pagelaran Seni	KE9  	1
20	E4   	TechnoWars	2019-01-02	2019-01-02 11:00:00	50	\N	FASILKOM	Umum	Kompetisi Tahunan	KE9  	2
14	D2   	Festival Budaya Indonesia	2019-07-05	2019-07-05 19:00:00	300	100000	FISIP	Privat	Pagelaran Seni	KE3  	2
59	C1   	Workshop Ilustrasi Digital	2019-02-09	2019-02-09 08:00:00	500	50000	FE	Privat	Pentas Hiburan	KE9  	1
53	A3   	Civil Engineering National Summit	2019-12-17	2019-12-17 16:00:00	250	\N	FMIPA	Umum	Pemilihan Mahasiswa Terbaik	KE3  	1
17	E1   	Gelar Diksi	2019-09-09	2019-09-09 08:00:00	150	100000	VOKASI	Umum	Pagelaran Seni	KE8  	2
78	H1   	Rapmafest	2019-02-22	2019-02-22 18:00:00	150	\N	FIB	Umum	Pentas Hiburan	KE3  	1
62	C4   	Born To Be The Next Web Developer	2019-08-08	2019-08-08 11:00:00	250	100000	FIB	Umum	Event Terbesar UI	KE4  	1
33	J1   	Audisi Mahasiswa Berprestasi	2019-01-22	2019-01-22 10:00:00	80	100000	FKG	Umum	Pentas Hiburan	KE2  	1
72	F2   	Fun Run Action	2019-01-10	2019-01-10 07:00:00	150	\N	Balairung	Privat	Bazar Terbesar	KE3  	1
7	B3   	Gala Concert Mahasiswa	2019-08-06	2019-08-06 13:00:00	500	100000	FIB	Privat	Kompetisi Tahunan	KE1  	2
13	D1   	Pekan Olahraga Kampus	2019-05-22	2019-05-22 17:00:00	300	100000	FH	Umum	Kompetisi Tahunan	KE6  	2
74	F4   	Workshop Cyber	2019-06-06	2019-06-06 09:00:00	200	100000	VOKASI	Privat	Pesta Pendidikan	KE7  	1
41	L3   	Management Job Corner	2019-01-31	2019-01-31 18:00:00	200	50000	FH	Umum	Event Terbesar UI	KE8  	1
32	I3   	Workshop Public Speaking	2019-05-13	2019-05-13 09:00:00	150	100000	FKM	Privat	Pentas Hiburan	KE7  	1
60	C2   	Festival Bahasa dan Sastra Indonesia	2019-10-20	2019-10-20 09:00:00	250	50000	FKG	Privat	Event Terbesar UI	KE2  	1
38	K3   	Gema Lomba Karya Esai	2019-06-13	2019-06-13 15:00:00	300	100000	FH	Umum	Kompetisi Tahunan	KE9  	1
69	E3   	Fasilkom Fest	2019-05-06	2019-05-06 18:00:00	150	100000	FKM	Privat	Bazar Terbesar	KE1  	1
18	E2   	Lomba Band	2019-05-02	2019-05-02 09:00:00	400	100000	Balairung	Umum	Event Terbesar UI	KE10 	2
42	M1   	Diesnatalis Fakultas Hukum UI	2019-09-12	2019-09-12 19:00:00	50	50000	FT	Privat	Pagelaran Seni	KE9  	1
2	A2   	Seminar Nasional Jurnalistik	2019-02-27	2019-02-27 08:00:00	500	\N	FKG	Privat	Bazar Terbesar	KE10 	1
43	M2   	Technoblast	2019-05-19	2019-05-19 20:00:00	300	\N	VOKASI	Privat	Pemilihan Mahasiswa Terbaik	KE8  	1
29	H2   	Design Innovation Project	2019-08-08	2019-08-08 20:00:00	80	50000	FT	Privat	Event Terbesar UI	KE2  	1
75	G1   	World Mental Health Day	2019-06-09	2019-06-09 10:00:00	500	50000	FE	Privat	Bazar Terbesar	KE7  	1
51	A1   	Pesta Sains Nasional	2019-08-14	2019-08-14 14:00:00	100	50000	FASILKOM	Privat	Pagelaran Seni	KE1  	1
80	H3   	Best Accountancy Student	2019-12-04	2019-04-12 09:00:00	500	100000	FKG	Privat	Pesta Pendidikan	KE5  	1
68	E2   	Scholarship and Job Festival	2019-07-23	2019-07-23 17:00:00	200	100000	FISIP	Privat	Event Tahunan UI	KE1  	1
54	A4   	Electrical Evolution	2019-12-18	2019-12-18 17:00:00	250	100000	FKM	Umum	Bazar Terbesar	KE8  	1
65	D3   	Line Follower Robotics	2019-05-18	2019-05-18 14:00:00	150	\N	FT	Privat	Event Tahunan UI	KE4  	1
77	G3   	Food Festival of Accountancy	2019-12-04	2019-12-04 12:00:00	500	100000	FKG	Privat	Pentas Hiburan	KE9  	1
39	L1   	Chemical Product Design Competition	2019-05-22	2019-05-22 16:00:00	250	100000	FIB	Privat	Pesta Pendidikan	KE2  	1
8	B4   	Call For Paper Kedokteran	2019-07-06	2019-07-06 14:00:00	150	50000	FMIPA	Privat	Pagelaran Seni	KE10 	2
47	N3   	Bedah Kampus UI	2019-06-26	2019-06-26 10:00:00	100	50000	FE	Privat	Kompetisi Tahunan	KE9  	1
37	K2   	Festival Olahraga Teknik	2019-08-03	2019-08-03 14:00:00	250	50000	FIB	Umum	Event Terbesar UI	KE4  	1
12	C4   	Seminar Nasional Pekan HAM	2019-03-10	2019-03-10 18:00:00	150	\N	FT	Umum	Event Terbesar UI	KE3  	2
64	D2   	Badminton Competition	2019-10-24	2019-10-24 13:00:00	500	100000	VOKASI	Umum	Pentas Hiburan	KE10 	1
24	F4   	Spartac	2019-12-03	2019-12-03 15:00:00	150	100000	VOKASI	Umum	Pemilihan Mahasiswa Terbaik	KE4  	2
61	C3   	Efestaphoria	2019-06-27	2019-06-27 10:00:00	250	50000	FKG	Privat	Event Tahunan UI	KE10 	1
5	B1   	Seminar Internet of Things	2019-11-02	2019-11-02 11:00:00	250	\N	Balairung	Umum	Kompetisi Tahunan	KE9  	1
50	O3   	Festival Film Sosiologi	2019-12-06	2019-12-06 13:00:00	200	50000	Balairung	Privat	Pemilihan Mahasiswa Terbaik	KE3  	1
11	C3   	Economic Sport	2019-08-13	2019-08-13 17:00:00	300	100000	FISIP	Umum	Event Terbesar UI	KE9  	2
15	D3   	Journalist's Starting Point	2019-03-12	2019-03-12 20:00:00	150	\N	FASILKOM	Umum	Pagelaran Seni	KE8  	2
44	M3   	Informatic Olympiad Competition	2019-02-23	2019-02-23 07:00:00	300	\N	Balairung	Umum	Pagelaran Seni	KE10 	1
35	J3   	Konferensi Nasional Mahasiswa	2019-04-12	2019-04-12 12:00:00	150	100000	FH	Umum	Event Tahunan UI	KE4  	1
73	F3   	E-Sport Competition	2019-04-19	2019-04-19 08:00:00	200	100000	VOKASI	Privat	Pentas Hiburan	KE10 	1
40	L2   	English Competition	2019-02-15	2019-02-15 17:00:00	100	50000	FASILKOM	Umum	Bazar Terbesar	KE3  	1
28	H1   	Biology Festival	2019-11-08	2019-08-11 19:00:00	250	50000	FIB	Umum	Pemilihan Mahasiswa Terbaik	KE1  	1
26	G2   	Telkom Job Fair	2019-10-14	2019-10-14 17:00:00	300	\N	FKM	Privat	Event Terbesar UI	KE2  	2
23	F3   	Electrical and Computer Competition	2019-08-10	2019-08-10 14:00:00	50	100000	Balairung	Umum	Pentas Hiburan	KE6  	2
48	O1   	Career Day	2019-03-25	2019-03-25 11:00:00	100	50000	FK	Privat	Pemilihan Mahasiswa Terbaik	KE3  	1
31	I2   	Mathematics Champion Cup	2019-12-26	2019-12-26 08:00:00	400	50000	FKG	Umum	Pesta Pendidikan	KE4  	1
21	F1   	Angklung in Concert	2019-02-23	2019-02-23 12:00:00	100	50000	Balairung	Umum	Pemilihan Mahasiswa Terbaik	KE3  	2
9	C1   	Pesta Mahasiswa Manajemen	2019-09-17	2019-09-17 15:00:00	400	100000	FMIPA	Privat	Kompetisi Tahunan	KE8  	2
6	B2   	Lomba Desain Poster	2019-07-08	2019-08-07 12:00:00	100	100000	FH	Umum	Pesta Pendidikan	KE9  	1
76	G2   	Lomba Film Pendek	2019-08-26	2019-08-26 11:00:00	300	50000	FK	Umum	Event Tahunan UI	KE2  	1
30	H3   	Jurnalist Job Fair	2019-04-15	2019-02-15 07:00:00	50	\N	FIB	Umum	Pagelaran Seni	KE6  	1
\.


--
-- Data for Name: guest; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.guest (username, pekerjaan, alamat) FROM stdin;
anton12	Dosen	Jl. Pinus No.210, Depok
bagas.kahfi	Guru	Perumahan Melati Raya Blok A/5, Tangerang
dimas.e	Polisi	Jl. Senja Timur No. 40, Bekasi Timur
newtsalam	Polisi	Jl. Laut Raya No. 71, Grogol, Jakarta
anti.a	Akuntan	Jl. Pegangsaan Timur No. 65, Grogol, Jakarta
brook.l	Programmer	Perumahan Asri Blok A No. 71, Bekasi
deby.s	Polisi	Perumahan Ujung Indah Blok K/6, Tangerang
holmes.lock	Novelis	Jl. Permata No. 5, Tebet, Jakarta Selatan
akmal.a	Dokter	Jl. Papandayan No. 143, Ciamis
cindy.p	Programmer	Jl. Sumarko Jaya No. 111, Depok
dina.m	Desainer	Jl. Pinus No.210, Depok
ajmal.t	Akuntan	Perumahan Melati Raya Blok A/5, Tangerang
cantika45	Wartawan	Jl. Senja Timur No. 40, Bekasi Timur
eki.sistem	Dosen	Jl. LautRaya No. 71, Grogol, Jakarta
anggara.d	Dokter	Jl. Pegangsaan Timur No. 65, Grogol, Jakarta
cika83	Akuntan	Jl. Taman Margasatwa No. 12, Warung Buncit, Jakarta Selatan
elios.l	Dosen	JL. Tebet Raya No. 84, Tebet, Jakarta Selatan
angkasapura	Novelis	Jl. Metro Pondok Indah Kav. IV, Kebayoran Lama, Jakarta Selatan
cecep.j	Desainer	Jl. KH. Agus Salim No. 29A, Jakarta Pusat
eunsikorea	Pengacara	Jl. Hos Cokroaminoto, No. 84, Menteng, Jakarta Pusat
andreas.	Perawat	Jl. Ahmad Dahlan/ Jl. Bacang I No.2, Jakarta Selatan
cherry.buah	Akuntan	Jl. Benda No. 20D, Kemang ,Jakarta Selatan
ellats	Dosen	Jl. Alam Segar 3 No. 8, Pondok Indah, Jakarta Selatan
andibobo	Programmer	Jl. Kebon Jeruk Raya No. 44 (depan SMPN 75), Jakarta Barat
chopper.o	Desainer	Jl. KH Asahari, Pinang Ciledug, Tangerang
faridtri3	Perawat	Jl. Arya Putra, Kedaung Ciputat, Tangerang
doffy.doffy	Desainer	Jl. Buaran Raya Blok D No. 1 Duren Sawit, Jakarta Timur
ferguso90	Dosen	Jl. Tebet Barat 1 No. 24, Jakarta Selatan
bayuastra	Dosen	Jl. Pinus Tinggi No.21, Kota Jakarta Utara
dinosaurus	Novelis	Jl. Lontar No. 12, Kota Jakarta Utara
fika76	Perawat	Jl. Papandayan No. 95, Kota Jakarta Utara
bimasakti	Programmer	Jl. Krida Raya No. 91, Kota Jakarta Utara
doniband	Wartawan	Jl. Senja Timur No. 4, Kota Jakarta Timur
tayosibus	Programmer	Perumahan Asri Blok S No. 21, Kota Jakarta Timur
m.faat	Pengacara	Jl. Rimba Raya No. 73, Kota Jakarta Timur, Jakarta
cannunu	Dosen	Jl. Tubagus Indra No. 9, Kota Jakarta Timur
ikaprtwi	Novelis	Jl. Permata No. 5, Kota Jakarta Selatan
bukanhero	Wartawan	Jl. Sumarko No. 111, Kota Jakarta Selatan
welcome	Guru	Perumahan Lama Ijo Blok E/3, Kota Jakarta Selatan
viking245	Perawat	Jl. Sukmaduka No. 3, Kota Jakarta Selatan
\.


--
-- Data for Name: kategori_event; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.kategori_event (nomor, nama) FROM stdin;
KE1  	Seminar
KE2  	Lomba
KE3  	Pentas Seni
KE4  	Pentas Olahraga
KE5  	Pameran
KE6  	Job Fair
KE7  	Talk Show
KE8  	Konferensi
KE9  	Bazar
KE10 	Audisi
\.


--
-- Data for Name: kepanitiaan; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.kepanitiaan (id_kepanitiaan, id_organisasi) FROM stdin;
D4   	A1   
E1   	B3   
E2   	N2   
E3   	F4   
E4   	C4   
F1   	E4   
F2   	D4   
F3   	G1   
F4   	H3   
G1   	I2   
G2   	J3   
G3   	K2   
H1   	L2   
H2   	M3   
H3   	O2   
I2   	A1   
I3   	B3   
J1   	N2   
J2   	F4   
J3   	C4   
K1   	E4   
K2   	D4   
K3   	G1   
L1   	H3   
L2   	I2   
L3   	J3   
M1   	K2   
M2   	L2   
M3   	M3   
N1   	O2   
N2   	A1   
N3   	B3   
O1   	N2   
O2   	F4   
O3   	C4   
\.


--
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.mahasiswa (username, npm) FROM stdin;
bisma.t	1644121906099
dikaradit	1648042219399
lani.b	1698052422799
betrand.h	1635061959999
desiratna	1670071964799
amber23	1646062595899
bernardbear	1661022972199
jessica	1690012956899
bagus.kaffa	1666012467399
didi.y	1613122849099
liliyana	1667030747799
muthia.f	1612111812899
fauhan.p	1628081893899
sultan.m	1691060912099
rifat.k	1604010950899
tusty.n	1617071921099
martin.n	1679110317799
akuadmin	1674072895799
imnotadmin	1682101944199
siapaaku	1677091905699
aquair	1632051872399
adminnih	1668051995799
lokerkosong	1668030710599
buani.buana	1673091012299
iffah.el	1671110703499
usernamaku	1616021622799
annisa.m	1695012639099
hepatika.z	1621071182899
nabila.c	1644112904099
aldi.umar	1627121395699
\.


--
-- Data for Name: non_admin; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.non_admin (username, email, nama, no_telepon) FROM stdin;
anton12	anton@ui.ac.id	anton	081234567890
bagas.kahfi	bagas@ui.ac.id	bagas	083333367890
dimas.e	dimas@ui.ac.id	dimas	086666667890
newtsalam	newt@ui.ac.id	newt	089999967890
anti.a	anti@ui.ac.id	anti	081123467890
brook.l	brook@ui.ac.id	brook	084321567890
deby.s	deby@ui.ac.id	deby	087618967890
holmes.lock	holmes@ui.ac.id	holmes	081098767890
akmal.a	akmal@ui.ac.id	akmal	081112367890
cindy.p	cindy@ui.ac.id	cindy	084432167890
dina.m	dina@ui.ac.id	dina	087761867890
ajmal.t	naili@ui.ac.id	ajmal	081111267890
cantika45	ajmal@ui.ac.id	cantika	084443267890
eki.sistem	cantika@ui.ac.id	eki	087776167890
anggara.d	eki@ui.ac.id	anggara	081111167890
cika83	vikri@ui.ac.id	cika	084444367890
elios.l	anggara@ui.ac.id	elios	087777667890
angkasapura	cika@ui.ac.id	angkasa	082134567890
cecep.j	elios@ui.ac.id	cecep	084444467890
eunsikorea	gries@ui.ac.id	eunsik	087777767890
andreas.	angkasa@ui.ac.id	andreas	082213467890
cherry.buah	cecep@ui.ac.id	cherry	085432167890
ellats	eunsik@ui.ac.id	ella	088761967890
andibobo	latifah@ui.ac.id	andi	082221367890
chopper.o	andreas@ui.ac.id	chopper	085543267890
faridtri3	cherry@ui.ac.id	farid	088876167890
doffy.doffy	ella@ui.ac.id	doffy	085554367890
ferguso90	andi@ui.ac.id	ferguso	088887667890
bayuastra	chopper@ui.ac.id	bayu	082222167890
dinosaurus	farid@ui.ac.id	dino	085555467890
fika76	doffy@ui.ac.id	fika	088888767890
bimasakti	ferguso@ui.ac.id	bima	082222267890
doniband	bayu@ui.ac.id	doni	085555567890
tayosibus	dino@ui.ac.id	tayo	088888867890
bisma.t	fika@ui.ac.id	bisma	083214567890
dikaradit	bima@ui.ac.id	dika	086178967890
lani.b	doni@ui.ac.id	lani	089876167890
betrand.h	tayo@ui.ac.id	betrand	083321467890
desiratna	bisma@ui.ac.id	desi	086617867890
amber23	dika@ui.ac.id	amber	089987667890
bernardbear	lani@ui.ac.id	bernard	083332167890
jessica	betrand@ui.ac.id	jessica	089998767890
bagus.kaffa	desi@ui.ac.id	bagus	083333267890
didi.y	amber@ui.ac.id	didi	086666167890
liliyana	bernard@ui.ac.id	liliyana	089999867890
muthia.f	dekwill@ui.ac.id	muthia	081000189213
fauhan.p	jessica@ui.ac.id	fauhan	081000289213
sultan.m	bagus@ui.ac.id	sultan	081000389213
rifat.k	didi@ui.ac.id	rifat	081000489213
tusty.n	liliyana@ui.ac.id	tusty	081000589213
martin.n	martin@ui.ac.id	martin	081000689213
akuadmin	kevin@ui.ac.id	kevin	081000789213
imnotadmin	jihan@ui.ac.id	jihan	081000889213
siapaaku	indah@ui.ac.id	indah	081000989213
aquair	sukarno@ui.ac.id	sukarno	081001089213
adminnih	putra@ui.ac.id	putra	081001189213
lokerkosong	surya@ui.ac.id	surya	081001289213
buani.buana	satria@ui.ac.id	satria	081001389213
iffah.el	iffah@ui.ac.id	iffah	081001489213
usernamaku	sehun@ui.ac.id	sehun	081001589213
wisnuj	wisnu@ui.ac.id	wisnu	081001689213
bellawidjaja	bella@ui.ac.id	bella	081001789213
aniaty.m	aniaty@ui.ac.id	aniaty	081001889213
iis.a	iis@ui.ac.id	iis	081001989213
laksmita	laksmita@ui.ac.id	laksmita	081002089213
im.ivan	ivan@ui.ac.id	ivan	081002189213
inibudi	budi@ui.ac.id	budi	081002289213
ichalAF	fahrizal@ui.ac.id	fahrizal	081002389213
windy.a	windy@ui.ac.id	windy	081002489213
fadhillah.z	fadhillah@ui.ac.id	fadhillah	081002589213
annisa.m	annisa@ui.ac.id	annisa	081002689213
hepatika.z	hepatika@ui.ac.id	hepatika	081002789213
nabila.c	nabila@ui.ac.id	nabila	081002889213
hidupandu	pandu@ui.ac.id	pandu	081002989213
roby.al	roby@ui.ac.id	roby	081003089213
grafika.j	grafika@ui.ac.id	grafika	081003189213
mouzaqg	muzakkar@ui.ac.id	muzakkar	081003289213
wulandasri	sri@ui.ac.id	sri	081003389213
mutein	mutmainnah@ui.ac.id	mutmainnah	081003489213
wanafaj	wahana@ui.ac.id	wahana	081003589213
ayu.az	ayu@ui.ac.id	ayu	081003689213
masjomblo	alfian@ui.ac.id	alfian	081003789213
anugrah.f	fajar@ui.ac.id	fajar	081003889213
aldi.umar	aldi@ui.ac.id	aldi	081003989213
m.faat	syafaat@ui.ac.id	syafaat	081004089213
cannunu	nurul@ui.ac.id	nurul	081004189213
ikaprtwi	ika@ui.ac.id	ika	081004289213
bukanhero	baymax@ui.ac.id	baymax	081004389213
welcome	hiro@ui.ac.id	hiro	081004489213
viking245	grindelwald@ui.ac.id	grindelwald	081004589213
\.


--
-- Data for Name: open_recruitment; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.open_recruitment (id_oprec, id_kepanitiaan, id_organisasi, nama, tanggal_dibuka, tanggal_ditutup, berkas_dibutuhkan, persyaratan, jumlah_pendaftar) FROM stdin;
113	K1   	E4   	Social Art	2018-10-23	2018-11-19	KPM	\N	5
124	H3   	O2   	Seminar Kesehatan Nasional	2018-11-29	2018-12-15	\N	\N	5
129	J3   	C4   	Fun Run Action	2018-10-19	2018-11-01	KPM	\N	5
115	K3   	G1   	Spartac	2018-10-13	2018-11-13	\N	Civitas Akademika UI	5
111	E1   	B3   	Seminar Internet of Things	2018-11-03	2018-12-03	KPM	Civitas Akademika UI	5
128	J2   	F4   	E-Sport Competition	2018-12-24	2018-12-29	\N	\N	5
119	G1   	I2   	Chemical Product Design Competition	2018-12-24	2018-12-27	KPM	Civitas Akademika UI	5
118	F4   	H3   	Konferensi Nasional Mahasiswa	2018-10-26	2018-10-30	KPM	Civitas Akademika UI	5
127	J1   	N2   	Line Follower Robotics	2018-11-03	2018-11-24	KPM	Civitas Akademika UI	5
125	I2   	A1   	Efestaphoria	2018-12-10	2018-10-28	KPM, CV	Civitas Akademika UI	5
123	H2   	M3   	Food Festival of Accountancy	2018-12-10	2018-12-17	\N	\N	5
116	L1   	H3   	Heroic	2018-10-04	2018-10-30	CV	Civitas Akademika UI	5
126	I3   	B3   	Futsal Competition	2018-10-19	2018-10-24	\N	Civitas Akademika UI	5
112	E2   	N2   	Lomba Desain Poster	2018-12-24	2018-12-29	\N	\N	5
121	G3   	K2   	Bedah Kampus UI	2018-11-29	2018-12-29	\N	Civitas Akademika UI	5
120	G2   	J3   	Informatic Olympiad Competition	2018-10-23	2018-11-13	KPM	\N	5
110	D4   	A1   	Seminar Nasional Jurnalistik	2018-12-20	2018-12-31	KPM, CV	Civitas Akademika UI	5
117	F3   	G1   	Mathematics Champion Cup	2018-12-03	2018-12-15	\N	\N	5
122	H1   	L2   	World Mental Health Day	2018-10-19	2018-11-19	KPM, CV	Civitas Akademika UI	5
114	K2   	D4   	Festival Budaya Indonesia	2018-12-09	2018-12-21	CV	Civitas Akademika UI	5
\.


--
-- Data for Name: organisasi; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.organisasi (id_organisasi) FROM stdin;
A1   
B3   
N2   
F4   
C4   
E4   
D4   
G1   
H3   
I2   
J3   
K2   
L2   
M3   
O2   
\.


--
-- Data for Name: pembuat_event; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pembuat_event (id, nama, email, alamat_website, tingkatan, kategori, logo, deskripsi, contact_person) FROM stdin;
A1   	anton	anton@ui.ac.id	kosong	senior1	olahraga1	kosong	kosong	081234567890
A2   	bagas	bagas@ui.ac.id	kosong	senior2	olahraga2	kosong	kosong	083333367890
A3   	dimas	dimas@ui.ac.id	kosong	senior3	olahraga3	kosong	kosong	086666667890
A4   	newt	newt@ui.ac.id	kosong	senior4	olahraga4	kosong	kosong	089999967890
B1   	anti	anti@ui.ac.id	kosong	senior1	riset1	kosong	kosong	081123467890
B2   	brook	brook@ui.ac.id	kosong	senior2	riset2	kosong	kosong	084321567890
B3   	deby	deby@ui.ac.id	kosong	senior3	riset3	kosong	kosong	087618967890
B4   	holmes	holmes@ui.ac.id	kosong	senior4	riset4	kosong	kosong	081098767890
C1   	akmal	akmal@ui.ac.id	kosong	senior1	game1	kosong	kosong	081112367890
C2   	cindy	cindy@ui.ac.id	kosong	senior2	game2	kosong	kosong	084432167890
C3   	dina	dina@ui.ac.id	kosong	senior3	game3	kosong	kosong	087761867890
C4   	naili	naili@ui.ac.id	kosong	senior4	game4	kosong	kosong	081009867890
D1   	ajmal	ajmal@ui.ac.id	kosong	senior1	usaha1	kosong	kosong	081111267890
D2   	cantika	cantika@ui.ac.id	kosong	senior2	usaha2	kosong	kosong	084443267890
D3   	eki	eki@ui.ac.id	kosong	senior3	usaha3	kosong	kosong	087776167890
D4   	vikri	vikri@ui.ac.id	kosong	senior4	usaha4	kosong	kosong	081000967890
E1   	anggara	anggara@ui.ac.id	kosong	senior1	budaya1	kosong	kosong	081111167890
E2   	cika	cika@ui.ac.id	kosong	senior2	budaya2	kosong	kosong	084444367890
E3   	elios	elios@ui.ac.id	kosong	senior3	budaya3	kosong	kosong	087777667890
E4   	gries	gries@ui.ac.id	kosong	senior4	budaya4	kosong	kosong	081000067890
F1   	angkasa	angkasa@ui.ac.id	kosong	senior1	pendidikan1	kosong	kosong	082134567890
F2   	cecep	cecep@ui.ac.id	kosong	senior2	pendidikan2	kosong	kosong	084444467890
F3   	eunsik	eunsik@ui.ac.id	kosong	senior3	pendidikan3	kosong	kosong	087777767890
F4   	latifah	latifah@ui.ac.id	kosong	senior4	pendidikan4	kosong	kosong	081099067890
G1   	andreas	andreas@ui.ac.id	kosong	senior1	lingkungan1	kosong	kosong	082213467890
G2   	cherry	cherry@ui.ac.id	kosong	senior2	lingkungan2	kosong	kosong	085432167890
G3   	ella	ella@ui.ac.id	kosong	senior3	lingkungan3	kosong	kosong	088761967890
H1   	andi	andi@ui.ac.id	kosong	senior1	makanan1	kosong	kosong	082221367890
H2   	chopper	chopper@ui.ac.id	kosong	senior2	makanan2	kosong	kosong	085543267890
H3   	farid	farid@ui.ac.id	kosong	senior3	makanan3	kosong	kosong	088876167890
I2   	doffy	doffy@ui.ac.id	kosong	senior2	kesehatan1	kosong	kosong	085554367890
I3   	ferguso	ferguso@ui.ac.id	kosong	senior3	kesehatan2	kosong	kosong	088887667890
J1   	bayu	bayu@ui.ac.id	kosong	senior1	kecantikan1	kosong	kosong	082222167890
J2   	dino	dino@ui.ac.id	kosong	senior2	kecantikan2	kosong	kosong	085555467890
J3   	fika	fika@ui.ac.id	kosong	senior3	kecantikan3	kosong	kosong	088888767890
K1   	bima	bima@ui.ac.id	kosong	senior1	musik1	kosong	kosong	082222267890
K2   	doni	doni@ui.ac.id	kosong	senior2	musik2	kosong	kosong	085555567890
K3   	tayo	tayo@ui.ac.id	kosong	senior3	musik3	kosong	kosong	088888867890
L1   	bisma	bisma@ui.ac.id	kosong	senior1	seni1	kosong	kosong	083214567890
L2   	dika	dika@ui.ac.id	kosong	senior2	seni2	kosong	kosong	086178967890
L3   	lani	lani@ui.ac.id	kosong	senior3	seni3	kosong	kosong	089876167890
M1   	betrand	betrand@ui.ac.id	kosong	senior1	peduli1	kosong	kosong	083321467890
M2   	desi	desi@ui.ac.id	kosong	senior2	peduli2	kosong	kosong	086617867890
M3   	amber	amber@ui.ac.id	kosong	senior3	peduli3	kosong	kosong	089987667890
N1   	bernard	bernard@ui.ac.id	kosong	senior1	film1	kosong	kosong	083332167890
N2   	dekwill	dekwill@ui.ac.id	kosong	senior2	film2	kosong	kosong	086661767890
N3   	jessica	jessica@ui.ac.id	kosong	senior3	film3	kosong	kosong	089998767890
O1   	bagus	bagus@ui.ac.id	kosong	senior1	anime1	kosong	kosong	083333267890
O2   	didi	didi@ui.ac.id	kosong	senior2	anime2	kosong	kosong	086666167890
O3   	liliyana	liliyana@ui.ac.id	kosong	senior3	anime3	kosong	kosong	089999867890
\.


--
-- Data for Name: pendaftaran_event; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pendaftaran_event (id_event, id_pembuat_event, username) FROM stdin;
1	A1   	anton12
2	A2   	bagas.kahfi
3	A3   	dimas.e
4	A4   	newtsalam
5	B1   	anti.a
6	B2   	brook.l
7	B3   	deby.s
8	B4   	holmes.lock
9	C1   	akmal.a
10	C2   	cindy.p
11	C3   	dina.m
12	C4   	ajmal.t
13	D1   	cantika45
14	D2   	eki.sistem
15	D3   	anggara.d
16	D4   	cika83
17	E1   	elios.l
18	E2   	angkasapura
19	E3   	cecep.j
20	E4   	eunsikorea
21	F1   	andreas.
22	F2   	cherry.buah
23	F3   	ellats
24	F4   	andibobo
25	G1   	chopper.o
26	G2   	faridtri3
27	G3   	doffy.doffy
28	H1   	ferguso90
29	H2   	bayuastra
30	H3   	dinosaurus
31	I2   	fika76
32	I3   	bimasakti
33	J1   	doniband
34	J2   	tayosibus
35	J3   	bisma.t
36	K1   	dikaradit
37	K2   	lani.b
38	K3   	betrand.h
39	L1   	desiratna
40	L2   	amber23
41	L3   	bernardbear
42	M1   	jessica
43	M2   	bagus.kaffa
44	M3   	didi.y
45	N1   	liliyana
46	N2   	muthia.f
47	N3   	fauhan.p
48	O1   	sultan.m
49	O2   	rifat.k
50	O3   	tusty.n
51	A1   	martin.n
52	A2   	akuadmin
53	A3   	imnotadmin
54	A4   	siapaaku
55	B1   	aquair
56	B2   	adminnih
57	B3   	lokerkosong
58	B4   	buani.buana
59	C1   	iffah.el
60	C2   	usernamaku
61	C3   	wisnuj
62	C4   	bellawidjaja
63	D1   	aniaty.m
64	D2   	iis.a
65	D3   	laksmita
66	D4   	im.ivan
67	E1   	inibudi
68	E2   	ichalAF
69	E3   	windy.a
70	E4   	fadhillah.z
71	F1   	annisa.m
72	F2   	hepatika.z
73	F3   	nabila.c
74	F4   	hidupandu
75	G1   	roby.al
76	G2   	grafika.j
77	G3   	mouzaqg
78	H1   	wulandasri
79	H2   	mutein
80	H3   	wanafaj
7	B3   	ayu.az
8	B4   	masjomblo
9	C1   	anugrah.f
10	C2   	aldi.umar
11	C3   	m.faat
12	C4   	cannunu
13	D1   	ikaprtwi
14	D2   	bukanhero
15	D3   	welcome
16	D4   	viking245
17	E1   	wulandasri
18	E2   	mutein
19	E3   	wanafaj
20	E4   	ayu.az
21	F1   	imnotadmin
22	F2   	siapaaku
23	F3   	aquair
24	F4   	adminnih
25	G1   	bayuastra
26	G2   	dinosaurus
\.


--
-- Data for Name: pendaftaran_oprec; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pendaftaran_oprec (id_oprec, id_kepanitiaan, id_organisasi, id_mhs, divisi, motivasi, tugas, swot, berkas) FROM stdin;
110	A1   	D4   	bisma.t	Acara	Mencari Relasi	\N	mudah emosi, rajin, supel, apatis	\N
111	B3   	E1   	dikaradit	Keamanan	Hobi	\N	overthinking, pendiam, rajin	\N
112	N2   	E2   	lani.b	Dokumentasi	Menambah pengalaman	\N	pemalu, pendiam, smart	\N
113	E4   	K1   	betrand.h	Humas	Menambah pengalaman	\N	mudah emosi, rajin, supel, apatis	\N
114	D4   	K2   	desiratna	Konsumsi	Menambah pengalaman	\N	arogan, berjiwa pemimpin, rajin	\N
115	G1   	K3   	amber23	Sponsorship	Ingin Aktif Organisasi	\N	overthinking, pendiam, rajin	\N
116	H3   	L1   	bernardbear	Konsumsi	Mencari Kegiatan Lain	\N	negosiator, visioner, suka tantangan, aktif	\N
117	G1   	F3   	jessica	Sponsorship	Mengisi Waktu Luang	\N	supel, cerewet, malas	\N
118	H3   	F4   	bagus.kaffa	Perlengkapan	Mencari Relasi	\N	negosiator, visioner, suka tantangan, aktif	\N
119	I2   	G1   	didi.y	Publikasi	Ingin Aktif Organisasi	\N	aktif, peduli sesama, teliti	\N
120	J3   	G2   	liliyana	Sponsorship	Refreshing	\N	mudah emosi, rajin, supel, apatis	\N
121	K2   	G3   	muthia.f	Konsumsi	Menambah pengalaman	\N	ceroboh, pintar, friendly	\N
122	L2   	H1   	fauhan.p	Sponsorship	Ingin Belajar	\N	mudah emosi, rajin, supel, apatis	\N
123	M3   	H2   	sultan.m	Dekorasi	Ingin Aktif Organisasi	\N	pendiam, ceroboh, pintar	\N
124	O2   	H3   	rifat.k	Acara	Mencari Relasi	\N	aktif, peduli sesama, teliti	\N
125	A1   	I2   	tusty.n	Konsumsi	Mengisi Waktu Luang	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
126	B3   	I3   	martin.n	Keamanan	Hobi	\N	negosiator, visioner, suka tantangan, aktif	\N
127	N2   	J1   	akuadmin	Dekorasi	Ingin Belajar	\N	aktif, peduli sesama, teliti	\N
128	F4   	J2   	imnotadmin	Transportasi	Mencari Kegiatan Lain	\N	suka bertanya, friendly, ceroboh	\N
129	C4   	J3   	siapaaku	Perlengkapan	Mencari Kegiatan Lain	\N	pemalu, oportunis, suka tantangan	\N
110	A1   	D4   	aquair	Acara	Turut Menyukseskan Acara	\N	mudah emosi, rajin, supel, apatis	\N
111	B3   	E1   	adminnih	Sponsorship	Ingin Aktif Organisasi	\N	ceroboh, pintar, friendly	\N
112	N2   	E2   	lokerkosong	Konsumsi	Mencari Relasi	\N	rajin, supel, easy going	\N
113	E4   	K1   	buani.buana	Publikasi	Menambah pengalaman	\N	visioner, peduli sesama, negosiator, overthinking	\N
114	D4   	K2   	iffah.el	Konsumsi	Menambah pengalaman	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
115	G1   	K3   	usernamaku	Dokumentasi	Hiburan	\N	tekun, pemalu, overthinking	\N
116	H3   	L1   	annisa.m	Konsumsi	Hobi	\N	arogan, berjiwa pemimpin, rajin	\N
117	G1   	F3   	hepatika.z	Transportasi	Hiburan	\N	pendiam, ceroboh, pintar	\N
118	H3   	F4   	nabila.c	Transportasi	Mencari Kegiatan Lain	\N	arogan, berjiwa pemimpin, rajin	\N
119	I2   	G1   	aldi.umar	Humas	Mencari Kegiatan Lain	\N	supel, cerewet, malas	\N
120	J3   	G2   	bisma.t	Keamanan	Ingin Aktif Organisasi	\N	friendly, suka bertanya, negosiator	\N
121	K2   	G3   	dikaradit	Publikasi	Mencari Relasi	\N	rajin, supel, easy going	\N
122	L2   	H1   	lani.b	Transportasi	Ingin Aktif Organisasi	\N	negosiator, visioner, suka tantangan, aktif	\N
123	M3   	H2   	betrand.h	Keamanan	Turut Menyukseskan Acara	\N	suka bertanya, friendly, ceroboh	\N
124	O2   	H3   	desiratna	Humas	Ingin Aktif Organisasi	\N	friendly, suka bertanya, negosiator	\N
125	A1   	I2   	amber23	Humas	Menambah pengalaman	\N	oportunis, peduli sesama, easy going	\N
126	B3   	I3   	bernardbear	Acara	Refreshing	\N	ceroboh, pintar, friendly	\N
127	N2   	J1   	jessica	Dekorasi	Mengisi Waktu Luang	\N	pemalu, pendiam, smart	\N
128	F4   	J2   	bagus.kaffa	Humas	Hobi	\N	friendly, suka bertanya, negosiator	\N
129	C4   	J3   	didi.y	Perlengkapan	Hiburan	\N	friendly, suka bertanya, negosiator	\N
110	A1   	D4   	liliyana	Acara	Mencari Kegiatan Lain	\N	rajin, supel, easy going	\N
111	B3   	E1   	muthia.f	Acara	Hiburan	\N	pendiam, ceroboh, pintar	\N
112	N2   	E2   	fauhan.p	Dekorasi	Mencari Kegiatan Lain	\N	serba ingin tahu, mandiri, pintar	\N
113	E4   	K1   	sultan.m	Dekorasi	Menambah pengalaman	\N	rajin, supel, easy going	\N
114	D4   	K2   	rifat.k	Perlengkapan	Ingin Belajar	\N	pintar, individualis, suka tantangan	\N
115	G1   	K3   	tusty.n	Sponsorship	Hiburan	\N	friendly, suka bertanya, negosiator	\N
116	H3   	L1   	martin.n	Keamanan	Ingin Belajar	\N	mudah emosi, rajin, supel, apatis	\N
117	G1   	F3   	akuadmin	Perlengkapan	Mengisi Waktu Luang	\N	serba ingin tahu, mandiri, pintar	\N
118	H3   	F4   	imnotadmin	Keamanan	Refreshing	\N	ceroboh, pintar, friendly	\N
119	I2   	G1   	siapaaku	Transportasi	Ingin Belajar	\N	oportunis, peduli sesama, easy going	\N
120	J3   	G2   	aquair	Acara	Menambah pengalaman	\N	pendiam, ceroboh, pintar	\N
121	K2   	G3   	adminnih	Dekorasi	Refreshing	\N	pendiam, ceroboh, pintar	\N
122	L2   	H1   	lokerkosong	Dekorasi	Ingin Aktif Organisasi	\N	arogan, berjiwa pemimpin, rajin	\N
123	M3   	H2   	buani.buana	Dokumentasi	Hobi	\N	serba ingin tahu, mandiri, pintar	\N
124	O2   	H3   	iffah.el	Humas	Turut Menyukseskan Acara	\N	negosiator, visioner, suka tantangan, aktif	\N
125	A1   	I2   	usernamaku	Konsumsi	Mencari Relasi	\N	rajin, supel, easy going	\N
126	B3   	I3   	annisa.m	Publikasi	Hobi	\N	mudah emosi, rajin, supel, apatis	\N
127	N2   	J1   	hepatika.z	Keamanan	Refreshing	\N	mudah emosi, rajin, supel, apatis	\N
128	F4   	J2   	nabila.c	Humas	Mengisi Waktu Luang	\N	arogan, berjiwa pemimpin, rajin	\N
129	C4   	J3   	aldi.umar	Keamanan	Hiburan	\N	friendly, suka bertanya, negosiator	\N
110	A1   	D4   	lani.b	Acara	Turut Menyukseskan Acara	\N	negosiator, visioner, suka tantangan, aktif	\N
111	B3   	E1   	betrand.h	Perlengkapan	Turut Menyukseskan Acara	\N	arogan, berjiwa pemimpin, rajin	\N
112	N2   	E2   	annisa.m	Publikasi	Hiburan	\N	mudah emosi, rajin, supel, apatis	\N
113	E4   	K1   	hepatika.z	Transportasi	Mengisi Waktu Luang	\N	pemalu, oportunis, suka tantangan	\N
114	D4   	K2   	nabila.c	Acara	Ingin Aktif Organisasi	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
115	G1   	K3   	aldi.umar	Konsumsi	Ingin Aktif Organisasi	\N	pemalu, oportunis, suka tantangan	\N
116	H3   	L1   	bisma.t	Perlengkapan	Mencari Kegiatan Lain	\N	supel, cerewet, malas	\N
117	G1   	F3   	dikaradit	Sponsorship	Mencari Kegiatan Lain	\N	visioner, peduli sesama, negosiator, overthinking	\N
118	H3   	F4   	lani.b	Perlengkapan	Hiburan	\N	visioner, peduli sesama, negosiator, overthinking	\N
119	I2   	G1   	betrand.h	Konsumsi	Menambah pengalaman	\N	pemalu, pendiam, smart	\N
120	J3   	G2   	desiratna	Dokumentasi	Ingin Aktif Organisasi	\N	supel, cerewet, malas	\N
121	K2   	G3   	amber23	Konsumsi	Hobi	\N	visioner, peduli sesama, negosiator, overthinking	\N
122	L2   	H1   	desiratna	Acara	Mencari Kegiatan Lain	\N	easy going, suka tantangan, pemerhati lingkungan	\N
123	M3   	H2   	didi.y	Acara	Mencari Kegiatan Lain	\N	friendly, suka bertanya, negosiator	\N
124	O2   	H3   	annisa.m	Dokumentasi	Turut Menyukseskan Acara	\N	visioner, peduli sesama, negosiator, overthinking	\N
125	A1   	I2   	hepatika.z	Perlengkapan	Turut Menyukseskan Acara	\N	negosiator, visioner, suka tantangan, aktif	\N
126	B3   	I3   	nabila.c	Perlengkapan	Mengisi Waktu Luang	\N	serba ingin tahu, mandiri, pintar	\N
127	N2   	J1   	aldi.umar	Konsumsi	Refreshing	\N	serba ingin tahu, mandiri, pintar	\N
128	F4   	J2   	bisma.t	Acara	Mencari Kegiatan Lain	\N	visioner, peduli sesama, negosiator, overthinking	\N
129	C4   	J3   	buani.buana	Publikasi	Ingin Belajar	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
110	A1   	D4   	akuadmin	Transportasi	Mengisi Waktu Luang	\N	oportunis, peduli sesama, easy going	\N
111	B3   	E1   	imnotadmin	Transportasi	Mencari Kegiatan Lain	\N	tekun, pemalu, overthinking	\N
112	N2   	E2   	siapaaku	Sponsorship	Mencari Kegiatan Lain	\N	pemalu, oportunis, suka tantangan	\N
113	E4   	K1   	aquair	Publikasi	Hiburan	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
114	D4   	K2   	adminnih	Publikasi	Ingin Aktif Organisasi	\N	ceroboh, pintar, friendly	\N
115	G1   	K3   	lokerkosong	Acara	Mencari Relasi	\N	arogan, berjiwa pemimpin, rajin	\N
116	H3   	L1   	buani.buana	Humas	Mengisi Waktu Luang	\N	negosiator, visioner, suka tantangan, aktif	\N
117	G1   	F3   	iffah.el	Konsumsi	Ingin Aktif Organisasi	\N	ceroboh, pintar, friendly	\N
118	H3   	F4   	jessica	Sponsorship	Hiburan	\N	arogan, berjiwa pemimpin, rajin	\N
119	I2   	G1   	usernamaku	Sponsorship	Hiburan	\N	mudah emosi, rajin, supel, apatis	\N
120	J3   	G2   	annisa.m	Acara	Ingin Aktif Organisasi	\N	negosiator, visioner, suka tantangan, aktif	\N
121	K2   	G3   	hepatika.z	Sponsorship	Mencari Kegiatan Lain	\N	friendly, suka bertanya, negosiator	\N
122	L2   	H1   	nabila.c	Perlengkapan	Mencari Kegiatan Lain	\N	serba ingin tahu, mandiri, pintar	\N
123	M3   	H2   	aldi.umar	Humas	Hobi	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
124	O2   	H3   	lani.b	Dekorasi	Hiburan	\N	supel, cerewet, malas	\N
125	A1   	I2   	annisa.m	Transportasi	Mengisi Waktu Luang	\N	supel, cerewet, malas	\N
126	B3   	I3   	hepatika.z	Transportasi	Ingin Aktif Organisasi	\N	mudah emosi, rajin, supel, apatis	\N
127	N2   	J1   	dikaradit	Perlengkapan	Refreshing	\N	easy going, suka tantangan, pemerhati lingkungan	\N
128	F4   	J2   	lani.b	Keamanan	Mencari Kegiatan Lain	\N	negosiator, visioner, suka tantangan, aktif	\N
129	C4   	J3   	betrand.h	Keamanan	Hobi	\N	pemalu, pendiam, smart	\N
\.


--
-- Data for Name: pengguna; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pengguna (username, password) FROM stdin;
anton12	antoni12
bagas.kahfi	bagas.kahfi
dimas.e	dimas.e
newtsalam	newtsalamander
anti.a	anti.a
brook.l	brook.l
deby.s	deby.s
holmes.lock	holmes.lock
akmal.a	akmal.a
cindy.p	cindy.p
dina.m	dina.m
naili.s	nailinaili2kali
ajmal.t	ajmal.t
cantika45	cantika45
eki.sistem	eki.sistem
vikri.a	vikri.a
anggara.d	anggara.d
cika83	cika83
elios.l	elios.l
gries.y	gries.y
angkasapura	angkasapura
cecep.j	cecep.j
eunsikorea	eunsikorea
latifah.a	latifah.a
andreas.	andreas.
cherry.buah	cherry.buah
ellats	ellats
andibobo	andibobo
chopper.o	chopper.o
faridtri3	faridtri3
doffy.doffy	doffy.doffy
ferguso90	ferguso90
bayuastra	bayuastra
dinosaurus	dinosaurus
fika76	fika76
bimasakti	bimasakti
doniband	doniband
tayosibus	tayosibus
bisma.t	bisma.t
dikaradit	dikaradit
lani.b	lani.b
betrand.h	betrand.h
desiratna	desiratna
amber23	amber23
bernardbear	bernardbear
dekwillkuh	gantengcelalu
jessica	jessica
bagus.kaffa	bagus.kaffa
didi.y	didi.y
liliyana	liliyana
muthia.f	muthia.f
fauhan.p	fauhan.p
sultan.m	sultan.m
rifat.k	rifat.k
tusty.n	tusty.n
martin.n	martin.n
akuadmin	akuadmin
imnotadmin	imnotadmin
siapaaku	siapaaku
aquair	aquair
adminnih	adminnih
lokerkosong	lokerkosong
buani.buana	buani.buana
iffah.el	iffah.el
usernamaku	usernamaku
wisnuj	wisnuj
bellawidjaja	bellawidjaja
aniaty.m	aniaty.m
iis.a	iis.a
laksmita	laksmita
im.ivan	im.ivan
inibudi	inibudi
ichalAF	ichalAF
windy.a	windy.a
fadhillah.z	fadhillah.z
annisa.m	annisa.m
hepatika.z	hepatika.z
nabila.c	nabila.c
hidupandu	hidupandu
roby.al	roby.al
grafika.j	grafika.j
mouzaqg	mouzaqg
wulandasri	wulandasri
mutein	mutein
wanafaj	wanafaj
ayu.az	ayu.az
masjomblo	masjomblo
anugrah.f	anugrah.f
aldi.umar	aldi.umar
m.faat	m.faat
cannunu	cannunu
ikaprtwi	ikaprtwi
bukanhero	bukanhero
welcome	welcome
viking245	viking245
\.


--
-- Data for Name: pengisi_acara; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pengisi_acara (id_event, id_pembuat_event, nama_pengisi_acara) FROM stdin;
1	A1   	Widiatama
2	A2   	Rudy Hartono
3	A3   	Riswanto
4	A4   	Doraemon
5	B1   	Chico Jericho
6	B2   	Dian Sastrowardoyo
7	B3   	William
8	B4   	Bijak Rabbani
9	C1   	Rahmat Rizkiyanto
10	C2   	Ajmal Kurnia
11	C3   	Ibu Susi Pujiastuti
12	C4   	Buana
13	D1   	Zidny Ilma
14	D2   	El Masrura
15	D3   	Stevanus
16	D4   	Ridho Muhammad
17	E1   	Menkominfo
18	E2   	Safira Amalia
19	E3   	Cindy Patricia
20	E4   	Milea Adnan
21	F1   	Rodhi
22	F2   	Sultan Agung
23	F3   	Bill Gate
24	F4   	Rahmat Rasyid
25	G1   	Larry Page
26	G2   	Abyan Handoko
27	G3   	Fauhan Putra
28	H1   	Cio Candra
29	H2   	Rachmat Hidayat
30	H3   	Harry Fitriana
31	I2   	Achmat Afif
32	I3   	Dede irfan
33	J1   	Defrindo Putra
34	J2   	Andri Prasetyo
35	J3   	Vivin Permatasari
36	K1   	Hanung Bramantyo
37	K2   	Bijak Rabbani
38	K3   	Sheila On 7
39	L1   	Putri Marino
40	L2   	Lavenia Qaila
41	L3   	Stevanus
42	M1   	Ridho Muhammad
43	M2   	RAN
44	M3   	Reza Rahadian
45	N1   	Rahmat Rizkiyanto
46	N2   	Ajmal Kurnia
47	N3   	El Masrura
48	O1   	Marion Jola
49	O2   	Wahyu Restuti
50	O3   	Rizky Hanggono
51	A1   	Nino Al Hakim
52	A2   	Umar Azim
53	A3   	Naura Abdilla
54	A4   	Syifa Medina
55	B1   	Waiz Ayu Nisrin
56	B2   	Dian Maharani
57	B3   	Azucena Naira
58	B4   	Ameera Risya
59	C1   	Khalisa Hazrina
60	C2   	Timothy Anggraini
61	C3   	Rachel Godard
62	C4   	Seandy Handriyanto
63	D1   	Minanul Wasik
64	D2   	Harry Santoso
65	D3   	Tasya Farasah
66	D4   	Sigit Widodo
67	E1   	Muh Rizal
68	E2   	Gigi dan Bella Hadid
69	E3   	Harvini Kusumawati
70	E4   	Didit Susanto
71	F1   	Amy Prio Pambudi
72	F2   	Agus kiswanto
73	F3   	Jovanka
74	F4   	Nino Al Hakim
75	G1   	Umar Azim
76	G2   	Mario Teguh
77	G3   	Adiwijaya Santoso
78	H1   	Avino Pradipta
79	H2   	Merry Ryana
80	H3   	Anastasia Susanto
7	B3   	Dendy dwi haryono
8	B4   	Handoko Prabowo
9	C1   	Najwa Shihab
10	C2   	Adma tomi caisar
11	C3   	Adhitya Burhan
12	C4   	Taylor Swift
13	D1   	Amy Prio Pambudi
14	D2   	Agus kiswanto
15	D3   	Gibran Raka
16	D4   	Naura Abdilla
17	E1   	Eko Noviyanto
18	E2   	Didit Susanto
19	E3   	Pandu Wicaksono
20	E4   	Diyah Puspita
21	F1   	Jovanka
22	F2   	Jovita
23	F3   	Rinawati Ghania
24	F4   	Sabria Zuhara
25	G1   	Aria Dina Tahira
26	G2   	Aqila Nadhifa
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.staff (username, nip) FROM stdin;
hidupandu	50200113001
roby.al	50200113002
grafika.j	50200113003
mouzaqg	50200113004
wulandasri	50200113005
mutein	50200113006
wanafaj	50200113007
ayu.az	50200113008
masjomblo	50200113009
anugrah.f	50200113010
\.


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (username);


--
-- Name: dosen dosen_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.dosen
    ADD CONSTRAINT dosen_pkey PRIMARY KEY (username);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id_event, id_pembuat_event);


--
-- Name: guest guest_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (username);


--
-- Name: kategori_event kategori_event_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.kategori_event
    ADD CONSTRAINT kategori_event_pkey PRIMARY KEY (nomor);


--
-- Name: kepanitiaan kepanitiaan_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.kepanitiaan
    ADD CONSTRAINT kepanitiaan_pkey PRIMARY KEY (id_kepanitiaan, id_organisasi);


--
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (username);


--
-- Name: non_admin non_admin_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.non_admin
    ADD CONSTRAINT non_admin_pkey PRIMARY KEY (username);


--
-- Name: open_recruitment open_recruitment_id_kepanitiaan_id_organisasi_key; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.open_recruitment
    ADD CONSTRAINT open_recruitment_id_kepanitiaan_id_organisasi_key UNIQUE (id_kepanitiaan, id_organisasi);


--
-- Name: open_recruitment open_recruitment_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.open_recruitment
    ADD CONSTRAINT open_recruitment_pkey PRIMARY KEY (id_oprec, id_kepanitiaan, id_organisasi);


--
-- Name: organisasi organisasi_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.organisasi
    ADD CONSTRAINT organisasi_pkey PRIMARY KEY (id_organisasi);


--
-- Name: pembuat_event pembuat_event_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pembuat_event
    ADD CONSTRAINT pembuat_event_pkey PRIMARY KEY (id);


--
-- Name: pendaftaran_event pendaftaran_event_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_event
    ADD CONSTRAINT pendaftaran_event_pkey PRIMARY KEY (id_event, id_pembuat_event, username);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_pkey PRIMARY KEY (id_oprec, id_kepanitiaan, id_organisasi, id_mhs);


--
-- Name: pengguna pengguna_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (username);


--
-- Name: pengisi_acara pengisi_acara_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pengisi_acara
    ADD CONSTRAINT pengisi_acara_pkey PRIMARY KEY (id_event, id_pembuat_event, nama_pengisi_acara);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (username);


--
-- Name: pendaftaran_event update_jumlah_peserta_daftar_event_trigger; Type: TRIGGER; Schema: simui; Owner: -
--

CREATE TRIGGER update_jumlah_peserta_daftar_event_trigger AFTER INSERT OR DELETE ON simui.pendaftaran_event FOR EACH ROW EXECUTE PROCEDURE simui.update_jumlah_daftar_event();


--
-- Name: pendaftaran_oprec update_jumlah_peserta_daftar_oprec_trigger; Type: TRIGGER; Schema: simui; Owner: -
--

CREATE TRIGGER update_jumlah_peserta_daftar_oprec_trigger AFTER INSERT OR DELETE ON simui.pendaftaran_oprec FOR EACH ROW EXECUTE PROCEDURE simui.update_jumlah_daftar_oprec();


--
-- Name: admin admin_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.admin
    ADD CONSTRAINT admin_username_fkey FOREIGN KEY (username) REFERENCES simui.pengguna(username);


--
-- Name: dosen dosen_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.dosen
    ADD CONSTRAINT dosen_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: event event_id_pembuat_event_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.event
    ADD CONSTRAINT event_id_pembuat_event_fkey FOREIGN KEY (id_pembuat_event) REFERENCES simui.pembuat_event(id);


--
-- Name: event event_nomor_kategori_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.event
    ADD CONSTRAINT event_nomor_kategori_fkey FOREIGN KEY (nomor_kategori) REFERENCES simui.kategori_event(nomor);


--
-- Name: guest guest_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.guest
    ADD CONSTRAINT guest_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: kepanitiaan kepanitiaan_id_kepanitiaan_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.kepanitiaan
    ADD CONSTRAINT kepanitiaan_id_kepanitiaan_fkey FOREIGN KEY (id_kepanitiaan) REFERENCES simui.pembuat_event(id);


--
-- Name: kepanitiaan kepanitiaan_id_organisasi_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.kepanitiaan
    ADD CONSTRAINT kepanitiaan_id_organisasi_fkey FOREIGN KEY (id_organisasi) REFERENCES simui.organisasi(id_organisasi);


--
-- Name: mahasiswa mahasiswa_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.mahasiswa
    ADD CONSTRAINT mahasiswa_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: non_admin non_admin_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.non_admin
    ADD CONSTRAINT non_admin_username_fkey FOREIGN KEY (username) REFERENCES simui.pengguna(username);


--
-- Name: open_recruitment open_recruitment_id_kepanitiaan_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.open_recruitment
    ADD CONSTRAINT open_recruitment_id_kepanitiaan_fkey FOREIGN KEY (id_kepanitiaan, id_organisasi) REFERENCES simui.kepanitiaan(id_kepanitiaan, id_organisasi);


--
-- Name: organisasi organisasi_id_organisasi_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.organisasi
    ADD CONSTRAINT organisasi_id_organisasi_fkey FOREIGN KEY (id_organisasi) REFERENCES simui.pembuat_event(id);


--
-- Name: pendaftaran_event pendaftaran_event_id_event_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_event
    ADD CONSTRAINT pendaftaran_event_id_event_fkey FOREIGN KEY (id_event, id_pembuat_event) REFERENCES simui.event(id_event, id_pembuat_event);


--
-- Name: pendaftaran_event pendaftaran_event_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_event
    ADD CONSTRAINT pendaftaran_event_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_id_kepanitiaan_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_id_kepanitiaan_fkey FOREIGN KEY (id_kepanitiaan, id_organisasi) REFERENCES simui.open_recruitment(id_organisasi, id_kepanitiaan);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_id_mhs_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_id_mhs_fkey FOREIGN KEY (id_mhs) REFERENCES simui.mahasiswa(username);


--
-- Name: pengisi_acara pengisi_acara_id_event_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pengisi_acara
    ADD CONSTRAINT pengisi_acara_id_event_fkey FOREIGN KEY (id_event, id_pembuat_event) REFERENCES simui.event(id_event, id_pembuat_event);


--
-- Name: staff staff_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.staff
    ADD CONSTRAINT staff_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- PostgreSQL database dump complete
--

