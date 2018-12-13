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
13	P005 	Seminar Nasional Jurnalistik	2019-02-27	2019-02-27 08:00:00	200	50000	VOKASI	Umum	Event Tahunan UI	KE6  	0
24	P046 	Workshop Photography	2019-02-26	2019-02-26 09:00:00	100	50000	FASILKOM	Privat	Event Terbesar UI	KE9  	0
65	P031 	Seminar Internet of Things	2019-11-02	2019-11-02 11:00:00	400	50000	Balairung	Umum	Event Terbesar UI	KE8  	0
23	P002 	Gala Concert Mahasiswa	2019-08-06	2019-08-06 13:00:00	300	25000	Balairung	Umum	Pemilihan Mahasiswa Terbaik	KE2  	0
38	P008 	Indonesia Economic Outlook	2019-11-28	2019-11-28 19:00:00	150	45000	FKG	Privat	Kompetisi Tahunan	KE8  	0
53	P039 	Workshop Cyber	2019-06-06	2019-06-06 09:00:00	400	30000	FKM	Umum	Pentas Hiburan	KE9  	0
62	P010 	World Mental Health Day	2019-06-09	2019-06-09 10:00:00	150	50000	Balairung	Umum	Kompetisi Tahunan	KE5  	0
24	P040 	Best Accountancy Student	2019-12-04	2019-12-04 09:00:00	500	150000	FT	Umum	Pagelaran Seni	KE10 	0
68	P020 	Seminar Nasional Civil Week	2019-11-13	2019-11-13 18:00:00	200	50000	Balairung	Umum	Pentas Hiburan	KE1  	1
36	P003 	Job Fair IT 2019	2019-09-12	2019-09-12 13:00:00	250	100000	FKM	Umum	Pemilihan Mahasiswa Terbaik	KE1  	1
79	P024 	Diesnatalis Fakultas Hukum UI	2019-09-12	2019-09-12 19:00:00	150	100000	FKM	Privat	Event Tahunan UI	KE10 	1
93	P050 	Pesta Sains Nasional	2019-08-14	2019-08-14 14:00:00	80	100000	FIB	Privat	Bazar Terbesar	KE3  	1
77	P020 	Born To Be The Next Web Developer	2019-08-08	2019-08-08 11:00:00	500	60000	FK	Umum	Pentas Hiburan	KE6  	2
39	P017 	Ruang Kreasi Mahasiswa	2019-09-18	2019-09-18 16:00:00	150	50000	FIB	Umum	Event Terbesar UI	KE6  	2
63	P037 	Festival Olahraga Teknik	2019-08-03	2019-08-03 14:00:00	50	150000	VOKASI	Privat	Pentas Hiburan	KE3  	1
55	P021 	Badminton Competition	2019-10-24	2019-10-24 13:00:00	50	50000	FT	Umum	Kompetisi Tahunan	KE6  	2
52	P017 	Fun Run Action	2019-01-10	2019-01-10 07:00:00	200	75000	FISIP	Privat	Event Terbesar UI	KE6  	1
47	P046 	Line Follower Robotics	2019-05-18	2019-05-18 14:00:00	50	50000	Balairung	Privat	Pagelaran Seni	KE3  	2
88	P011 	Futsal Competition	2019-09-17	2019-09-17 12:00:00	100	30000	FIB	Privat	Pagelaran Seni	KE6  	2
86	P036 	Electrical and Computer Competition	2019-08-10	2019-08-10 14:00:00	250	100000	FMIPA	Umum	Bazar Terbesar	KE3  	1
64	P038 	Gelar Diksi	2019-09-09	2019-09-09 08:00:00	50	25000	FK	Privat	Event Terbesar UI	KE6  	8
64	P036 	Scholarship and Job Festival	2019-07-23	2019-07-23 17:00:00	200	100000	FIB	Privat	Kompetisi Tahunan	KE1  	8
87	P007 	Pesta Mahasiswa Manajemen	2019-09-17	2019-09-17 15:00:00	300	25000	FK	Privat	Pemilihan Mahasiswa Terbaik	KE7  	8
87	P049 	Mathematics Champion Cup	2019-12-26	2019-12-26 08:00:00	100	70000	FIB	Umum	Pemilihan Mahasiswa Terbaik	KE9  	8
10	P039 	Lomba Band	2019-05-02	2019-05-02 09:00:00	400	25000	Balairung	Privat	Event Terbesar UI	KE3  	2
56	P037 	Call For Paper Kedokteran	2019-07-06	2019-07-06 14:00:00	500	100000	VOKASI	Umum	Pemilihan Mahasiswa Terbaik	KE1  	6
56	P030 	Angklung in Concert	2019-02-23	2019-02-23 12:00:00	150	40000	FASILKOM	Umum	Bazar Terbesar	KE9  	6
56	P036 	Technoblast	2019-05-19	2019-05-19 20:00:00	250	50000	FASILKOM	Umum	Pentas Hiburan	KE5  	6
89	P006 	Management Job Corner	2019-01-31	2019-01-31 18:00:00	100	100000	FISIP	Umum	Event Terbesar UI	KE8  	1
34	P009 	The Untold Horizon Concert by Paragita	2019-12-23	2019-12-23 10:00:00	80	30000	Balairung	Umum	Kompetisi Tahunan	KE8  	4
34	P043 	Seminar Kesehatan Nasional	2019-06-15	2019-06-15 20:00:00	50	100000	FMIPA	Umum	Pemilihan Mahasiswa Terbaik	KE3  	4
67	P032 	Konferensi Nasional Mahasiswa	2019-04-12	2019-04-12 12:00:00	150	100000	FKG	Privat	Pemilihan Mahasiswa Terbaik	KE2  	12
67	P049 	English Competition	2019-02-15	2019-02-15 17:00:00	250	75000	FASILKOM	Umum	Pagelaran Seni	KE10 	12
67	P010 	E-Sport Competition	2019-04-19	2019-04-19 08:00:00	150	100000	FIB	Privat	Pagelaran Seni	KE10 	12
67	P043 	Food Festival of Accountancy	2019-12-04	2019-12-04 12:00:00	400	100000	FASILKOM	Umum	Event Terbesar UI	KE2  	12
98	P010 	Lomba Film Pendek	2019-08-26	2019-08-26 11:00:00	250	25000	FISIP	Umum	Pentas Hiburan	KE3  	2
98	P016 	Mechanical Job Fair	2019-04-23	2019-04-23 10:00:00	400	50000	FKG	Privat	Pentas Hiburan	KE1  	2
91	P023 	Spartac	2019-12-03	2019-12-03 15:00:00	500	100000	FISIP	Umum	Pentas Hiburan	KE9  	1
61	P011 	Efestaphoria	2019-06-27	2019-06-27 10:00:00	200	50000	FK	Privat	Bazar Terbesar	KE8  	2
57	P003 	Festival Budaya Indonesia	2019-07-05	2019-07-05 19:00:00	300	50000	FIB	Privat	Event Tahunan UI	KE4  	1
27	P034 	Dental Festival	2019-12-10	2019-12-10 16:00:00	250	100000	FASILKOM	Privat	Pagelaran Seni	KE5  	2
70	P016 	Moeslim Fest	2019-11-26	2019-11-26 11:00:00	80	80000	FKM	Privat	Bazar Terbesar	KE2  	3
71	P031 	Biology Festival	2019-11-08	2019-11-08 19:00:00	300	100000	FT	Privat	Event Tahunan UI	KE1  	2
46	P043 	Economic Sport	2019-08-13	2019-08-13 17:00:00	500	50000	FISIP	Privat	Bazar Terbesar	KE9  	4
46	P032 	Civil Engineering National Summit	2019-12-17	2019-12-17 16:00:00	400	40000	FK	Privat	Pesta Pendidikan	KE10 	4
50	P045 	Design Innovation Project	2019-08-08	2019-08-08 20:00:00	50	25000	Balairung	Umum	Pentas Hiburan	KE8  	2
11	P032 	Festival Kreasi Anak Bangsa	2019-02-24	2019-02-24 07:00:00	50	25000	FASILKOM	Privat	Event Tahunan UI	KE7  	4
11	P018 	Fasilkom Fest	2019-05-06	2019-05-06 18:00:00	50	50000	VOKASI	Umum	Kompetisi Tahunan	KE6  	4
15	P027 	Techno Fair and Seminar	2019-05-02	2019-05-02 07:00:00	50	75000	FIB	Umum	Pagelaran Seni	KE2  	3
44	P014 	Festival Bahasa dan Sastra Indonesia	2019-10-20	2019-10-20 09:00:00	100	50000	FKG	Privat	Bazar Terbesar	KE1  	2
14	P036 	Social Art	2019-10-24	2019-10-24 16:00:00	300	50000	FK	Privat	Pesta Pendidikan	KE3  	1
17	P043 	Career Day	2019-03-25	2019-03-25 11:00:00	100	50000	VOKASI	Umum	Event Tahunan UI	KE1  	4
78	P005 	Seminar Nasional Pekan HAM	2019-03-10	2019-03-10 18:00:00	200	50000	FIB	Umum	Event Terbesar UI	KE9  	4
78	P048 	Rapmafest	2019-02-22	2019-02-22 18:00:00	250	20000	FKG	Umum	Event Tahunan UI	KE2  	4
35	P001 	Talkshow Nasional Kewirausahaan	2019-02-24	2019-02-24 10:00:00	250	100000	FE	Privat	Event Terbesar UI	KE5  	2
35	P045 	Informatic Olympiad Competition	2019-02-23	2019-02-23 07:00:00	150	50000	Balairung	Privat	Pesta Pendidikan	KE4  	2
40	P030 	Audisi Mahasiswa Berprestasi	2019-01-22	2019-01-22 10:00:00	500	50000	FT	Privat	Bazar Terbesar	KE4  	6
40	P005 	Electrical Evolution	2019-12-18	2019-12-18 17:00:00	250	50000	FASILKOM	Umum	Event Tahunan UI	KE1  	6
99	P016 	Labma Scientific Fair	2019-11-26	2019-11-26 19:00:00	200	100000	FT	Privat	Pemilihan Mahasiswa Terbaik	KE2  	2
74	P027 	Bedah Kampus UI	2019-06-26	2019-06-26 10:00:00	80	25000	FT	Umum	Event Terbesar UI	KE9  	1
95	P007 	Telkom Job Fair	2019-10-14	2019-10-14 17:00:00	80	50000	FE	Privat	Pagelaran Seni	KE1  	15
95	P018 	Jurnalist Job Fair	2019-04-15	2019-04-15 07:00:00	200	100000	VOKASI	Privat	Bazar Terbesar	KE10 	15
95	P024 	Atma Expression Lights Out	2019-01-02	2019-01-02 15:00:00	150	50000	FASILKOM	Umum	Event Terbesar UI	KE5  	15
18	P018 	Musikologi	2019-06-21	2019-06-21 09:00:00	50	100000	FH	Privat	Event Terbesar UI	KE10 	1
48	P004 	Festival Film Sosiologi	2019-12-06	2019-12-06 13:00:00	500	30000	FKM	Privat	Bazar Terbesar	KE5  	1
82	P050 	Gema Lomba Karya Esai	2019-06-13	2019-06-13 15:00:00	300	100000	FKG	Privat	Kompetisi Tahunan	KE6  	1
42	P020 	Pekan Olahraga Kampus	2019-05-22	2019-05-22 17:00:00	400	50000	Balairung	Privat	Kompetisi Tahunan	KE2  	4
42	P017 	Doctor's Career Update	2019-10-09	2019-10-09 13:00:00	500	50000	FISIP	Privat	Pentas Hiburan	KE10 	4
69	P022 	Edsa Art Show	2019-10-12	2019-10-12 20:00:00	200	50000	FKG	Privat	Pemilihan Mahasiswa Terbaik	KE4  	2
90	P044 	Diesnatalis Fasilkom UI	2019-09-08	2019-09-08 07:00:00	100	100000	FT	Privat	Event Terbesar UI	KE4  	2
96	P012 	Workshop Public Speaking	2019-05-13	2019-05-13 09:00:00	400	100000	FH	Privat	Pentas Hiburan	KE6  	6
96	P020 	Chemical Product Design Competition	2019-05-22	2019-05-22 16:00:00	500	100000	VOKASI	Umum	Pesta Pendidikan	KE1  	6
29	P026 	Beasiswa S2 dan S3 di Jerman	2019-05-17	2019-05-17 08:00:00	150	50000	FT	Privat	Event Tahunan UI	KE2  	6
29	P044 	Teater Kami Bercerita	2019-08-08	2019-08-08 15:00:00	200	50000	FE	Privat	Event Terbesar UI	KE10 	6
83	P041 	Heroic	2019-02-13	2019-02-13 18:00:00	250	60000	FISIP	Umum	Event Tahunan UI	KE6  	2
43	P008 	Lomba Desain Poster	2019-07-08	2019-07-08 12:00:00	150	25000	VOKASI	Umum	Pesta Pendidikan	KE5  	6
43	P044 	Journalist's Starting Point	2019-03-12	2019-03-12 20:00:00	250	50000	VOKASI	Privat	Kompetisi Tahunan	KE5  	6
43	P004 	UI Music Fair	2019-01-28	2019-01-28 12:00:00	250	100000	FIB	Privat	Kompetisi Tahunan	KE6  	6
75	P047 	TechnoWars	2019-01-02	2019-01-02 11:00:00	100	100000	FASILKOM	Privat	Pagelaran Seni	KE4  	2
76	P002 	Workshop Ilustrasi Digital	2019-02-09	2019-02-09 08:00:00	100	100000	Balairung	Umum	Event Terbesar UI	KE7  	2
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
P030 	P001 
P032 	P002 
P033 	P003 
P034 	P004 
P029 	P005 
P036 	P006 
P037 	P007 
P027 	P008 
P039 	P009 
P024 	P010 
P041 	P011 
P042 	P012 
P026 	P013 
P044 	P014 
P045 	P015 
P023 	P016 
P047 	P017 
P048 	P018 
P007 	P019 
P050 	P022 
P008 	P023 
P009 	P024 
P010 	P025 
P011 	P026 
P012 	P027 
P013 	P028 
P014 	P029 
P015 	P030 
P006 	P031 
P004 	P032 
P018 	P033 
P019 	P034 
P020 	P035 
P003 	P036 
P022 	P037 
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
31	P044 	P014 	Seminar Nasional Jurnalistik	2018-12-20	2018-12-31	KPM, CV	Civitas Akademika UI	0
36	P007 	P019 	Spartac	2018-10-13	2018-11-13	\N	Civitas Akademika UI	4
11	P036 	P006 	Informatic Olympiad Competition	2018-10-23	2018-11-13	KPM	\N	9
20	P022 	P037 	Fun Run Action	2018-10-19	2018-11-01	KPM	\N	5
15	P024 	P010 	Seminar Kesehatan Nasional	2018-11-29	2018-12-15	\N	\N	4
16	P026 	P013 	Efestaphoria	2018-12-10	2018-10-28	KPM, CV	Civitas Akademika UI	3
14	P039 	P009 	Food Festival of Accountancy	2018-12-10	2018-12-17	\N	\N	6
17	P019 	P034 	Futsal Competition	2018-10-19	2018-10-24	\N	Civitas Akademika UI	6
39	P009 	P024 	Konferensi Nasional Mahasiswa	2018-10-26	2018-10-30	KPM	Civitas Akademika UI	8
33	P023 	P016 	Lomba Desain Poster	2018-12-24	2018-12-29	\N	\N	1
35	P048 	P018 	Festival Budaya Indonesia	2018-12-09	2018-12-21	CV	Civitas Akademika UI	3
37	P050 	P022 	Heroic	2018-10-04	2018-10-30	CV	Civitas Akademika UI	7
12	P037 	P007 	Bedah Kampus UI	2018-11-29	2018-12-29	\N	Civitas Akademika UI	7
40	P010 	P025 	Chemical Product Design Competition	2018-12-24	2018-12-27	KPM	Civitas Akademika UI	9
13	P027 	P008 	World Mental Health Day	2018-10-19	2018-11-19	KPM, CV	Civitas Akademika UI	7
19	P003 	P036 	E-Sport Competition	2018-12-24	2018-12-29	\N	\N	5
32	P045 	P015 	Seminar Internet of Things	2018-11-03	2018-12-03	KPM	Civitas Akademika UI	1
38	P008 	P023 	Mathematics Champion Cup	2018-12-03	2018-12-15	\N	\N	7
34	P047 	P017 	Social Art	2018-10-23	2018-11-19	KPM	\N	3
18	P020 	P035 	Line Follower Robotics	2018-11-03	2018-11-24	KPM	Civitas Akademika UI	5
\.


--
-- Data for Name: organisasi; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.organisasi (id_organisasi) FROM stdin;
P001 
P002 
P003 
P004 
P005 
P006 
P007 
P008 
P009 
P010 
P011 
P012 
P013 
P014 
P015 
P016 
P017 
P018 
P019 
P022 
P023 
P024 
P025 
P026 
P027 
P028 
P029 
P030 
P031 
P032 
P033 
P034 
P035 
P036 
P037 
\.


--
-- Data for Name: pembuat_event; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pembuat_event (id, nama, email, alamat_website, tingkatan, kategori, logo, deskripsi, contact_person) FROM stdin;
P001 	Olahraga	olahraga@ui.ac.id	uiolahraga.com	BEM	olahraga1	NULL	NULL	081234567890
P002 	Berkuda	kudaui@ui.ac.id	uiberkuda.com	BEM	olahraga2	NULL	NULL	083333367890
P003 	Adipiscing Lobortis Risus Ltd	adipiscing@ui.ac.id	adipiscinglobortisrisusltd.com	BEM	olahraga3	NULL	NULL	086666667890
P004 	Proin Nisl Sem Consulting	proin@ui.ac.id	proinnislsemconsulting.com	BEM	olahraga4	NULL	NULL	089999967890
P005 	Riset dan Teknologi	ristek@ui.ac.id	risetdanteknologiui.com	FASILKOM	riset1	NULL	NULL	081123467890
P006 	Mattis PC	mattis@ui.ac.id	mattispc.com	FASILKOM	riset2	NULL	NULL	084321567890
P007 	Dolor Incorporated	dolor@ui.ac.id	dolorincorporated.com	FASILKOM	riset3	NULL	NULL	087618967890
P008 	Massa Suspendisse Company	massa@ui.ac.id	massasuspendissecompany.com	FASILKOM	riset4	NULL	NULL	081098767890
P009 	Elite8	elite8@ui.ac.id	elite8indonesia.com	BEM	game1	NULL	NULL	081112367890
P010 	Phasellus Corp.	phasellus@ui.ac.id	phaselluscorp.com	BEM	game2	NULL	NULL	084432167890
P011 	Habitant Morbi Tristique Company	habitant@ui.ac.id	habitantmorbitristiquecompany.com	BEM	game3	NULL	NULL	087761867890
P012 	Odio Nam Associates	odio@ui.ac.id	odionamassociates.com	BEM	game4	NULL	NULL	081009867890
P013 	Sed LLP	sed@ui.ac.id	sedllp.com	FEB	usaha1	NULL	NULL	081111267890
P014 	Euismod Urna Consulting	euismod@ui.ac.id	euismodurnaconsulting.com	FEB	usaha2	NULL	NULL	084443267890
P015 	Sodales At LLP	sodales@ui.ac.id	sodalesatllp.com	FEB	usaha3	NULL	NULL	087776167890
P016 	pengusaha muda indonesia	pmiusaha@ui.ac.id	pengusahamudaindonesia.com	FEB	usaha4	NULL	NULL	081000967890
P017 	hiburanku	hiburanindo@ui.ac.id	hiburanku.com	BEM	hiburan1	NULL	NULL	081111167890
P018 	Et Netus Institute	et@ui.ac.id	etnetusinstitute.com	BEM	hiburan2	NULL	NULL	084444367890
P019 	In Faucibus Orci LLP	in@ui.ac.id	infaucibusorcillp.com	BEM	hiburan3	NULL	NULL	087777667890
P020 	Aenean Euismod Consulting	aenean@ui.ac.id	aeneaneuismodconsulting.com	BEM	hiburan4	NULL	NULL	081000067890
P021 	Sekolah Koding	hilman@ui.ac.id	sekolahkoding.com	FH	pendidikan1	NULL	NULL	082134567890
P022 	Dui Limited	dui@ui.ac.id	duilimited.com	FH	pendidikan2	NULL	NULL	084444467890
P023 	Cras Corporation	cras@ui.ac.id	crascorporation.com	FH	pendidikan3	NULL	NULL	087777767890
P024 	Ridiculus Mus Aenean Company	ridiculus@ui.ac.id	ridiculusmusaeneancompany.com	FH	pendidikan4	NULL	NULL	081099067890
P025 	green peace	greenpeace@ui.ac.id	greenpeace.com	FKM	lingkungan1	NULL	NULL	082213467890
P026 	Dolor Nonummy Ac Consulting	dolor@ui.ac.id	dolornonummyacconsulting.com	FKM	lingkungan2	NULL	NULL	085432167890
P027 	Aliquam LLP	aliquam@ui.ac.id	aliquamllp.com	FKM	lingkungan3	NULL	NULL	088761967890
P028 	cemilan enak	cemilen@ui.ac.id	cemilanenak.com	FKM	makanan1	NULL	NULL	082221367890
P029 	Magna Tellus Faucibus Corporation	magna@ui.ac.id	magnatellusfaucibuscorporation.com	FKM	makanan2	NULL	NULL	085543267890
P030 	Tincidunt Ltd	tincidunt@ui.ac.id	tinciduntltd.com	FKM	makanan3	NULL	NULL	088876167890
P031 	halo sehat	sehat@ui.ac.id	sehatui.com	FK	kesehatan1	NULL	NULL	085554367890
P032 	Risus Inc.	risus@ui.ac.id	Risusinc.com	FK	kesehatan2	NULL	NULL	088887667890
P033 	Sed Eget Corporation	sed@ui.ac.id	sedegetcorporation.com	FK	kecantikan1	NULL	NULL	082222167890
P034 	Et Ipsum Ltd	et@ui.ac.id	etipsumltd.com	FK	kecantikan2	NULL	NULL	085555467890
P035 	syantik selalu	ss@ui.ac.id	syantikselalu.com	FK	kecantikan3	NULL	NULL	088888767890
P036 	Sed Tortor Corporation	sed@ui.ac.id	sedtortorcorporation.com	BEM	musik1	NULL	NULL	082222267890
P037 	Phasellus Corporation	phasellus@ui.ac.id	phaselluscorporation.com	BEM	musik2	NULL	NULL	085555567890
P038 	m u s i k	musikindo@ui.ac.id	musikui.com	BEM	musik3	NULL	NULL	088888867890
P039 	Mauris Morbi Consulting	mauris@ui.ac.id	maurismorbiconsulting.com	FIB	seni1	NULL	NULL	083214567890
P040 	seni budaya esa	sbe@ui.ac.id	senibudayaesa.com	FIB	seni2	NULL	NULL	086178967890
P041 	Ipsum Phasellus Company	ipsum@ui.ac.id	ipsumphaselluscompany.com	FIB	seni3	NULL	NULL	089876167890
P042 	Ridiculus Foundation	ridiculus@ui.ac.id	ridiculusfoundation.com	FPSi	peduli1	NULL	NULL	083321467890
P043 	peduli indonesia	pedin@ui.ac.id	peduliIndonesia.com	FPSi	peduli2	NULL	NULL	086617867890
P044 	Scelerisque Lorem Associates	scelerisque@ui.ac.id	scelerisqueloremassociates.com	FPSi	peduli3	NULL	NULL	089987667890
P045 	Ante Maecenas Mi Corporation	ante@ui.ac.id	antemaecenasmicorporation.com	FISIP	film1	NULL	NULL	083332167890
P046 	film bangsa	filmbangsa@ui.ac.id	filmbangsa.com	FISIP	film2	NULL	NULL	086661767890
P047 	Euismod Mauris Eu Ltd	euismod@ui.ac.id	euismodmauriseultd.com	FISIP	film3	NULL	NULL	089998767890
P048 	Sociosqu Ad Litora Ltd	sociosqu@ui.ac.id	sociosquadlitoraltd.com	FASILKOM	anime1	NULL	NULL	083333267890
P049 	anime til die	anime.til@ui.ac.id	animetildie.com	FASILKOM	anime2	NULL	NULL	086666167890
P050 	Mi Foundation	mi@ui.ac.id	mifoundation.com	FASILKOM	anime3	NULL	NULL	089999867890
\.


--
-- Data for Name: pendaftaran_event; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pendaftaran_event (id_event, id_pembuat_event, username) FROM stdin;
87	P007 	anton12
14	P036 	bagas.kahfi
46	P043 	dimas.e
78	P005 	newtsalam
42	P020 	anti.a
57	P003 	brook.l
43	P044 	deby.s
90	P044 	holmes.lock
64	P038 	akmal.a
10	P039 	cindy.p
34	P009 	dina.m
75	P047 	ajmal.t
56	P030 	cantika45
36	P003 	eki.sistem
86	P036 	anggara.d
91	P023 	cika83
39	P017 	elios.l
95	P007 	angkasapura
83	P041 	cecep.j
71	P031 	eunsikorea
50	P045 	andreas.
95	P018 	cherry.buah
87	P049 	ellats
96	P012 	andibobo
40	P030 	chopper.o
70	P016 	faridtri3
17	P043 	doffy.doffy
15	P027 	ferguso90
39	P017 	bayuastra
95	P007 	dinosaurus
83	P041 	fika76
71	P031 	bimasakti
50	P045 	doniband
95	P018 	tayosibus
87	P049 	bisma.t
96	P012 	dikaradit
40	P030 	lani.b
70	P016 	betrand.h
17	P043 	desiratna
15	P027 	amber23
76	P002 	bernardbear
44	P014 	jessica
61	P011 	bagus.kaffa
77	P020 	didi.y
88	P011 	liliyana
55	P021 	muthia.f
47	P046 	fauhan.p
29	P044 	sultan.m
27	P034 	rifat.k
64	P036 	tusty.n
11	P018 	martin.n
99	P016 	akuadmin
69	P022 	imnotadmin
17	P043 	siapaaku
15	P027 	aquair
76	P002 	adminnih
44	P014 	lokerkosong
61	P011 	buani.buana
77	P020 	iffah.el
88	P011 	usernamaku
55	P021 	wisnuj
47	P046 	bellawidjaja
29	P044 	aniaty.m
27	P034 	iis.a
64	P036 	laksmita
11	P018 	im.ivan
99	P016 	inibudi
69	P022 	ichalAF
52	P017 	windy.a
67	P010 	fadhillah.z
90	P044 	annisa.m
64	P038 	hepatika.z
10	P039 	nabila.c
34	P009 	hidupandu
75	P047 	roby.al
70	P016 	grafika.j
67	P032 	mouzaqg
42	P017 	wulandasri
63	P037 	mutein
82	P050 	wanafaj
96	P020 	ayu.az
87	P049 	masjomblo
89	P006 	anugrah.f
79	P024 	aldi.umar
56	P036 	m.faat
35	P045 	cannunu
29	P026 	ikaprtwi
18	P018 	bukanhero
74	P027 	welcome
17	P043 	viking245
43	P004 	wulandasri
48	P004 	mutein
93	P050 	wanafaj
95	P024 	ayu.az
46	P032 	imnotadmin
40	P005 	siapaaku
68	P020 	aquair
67	P043 	adminnih
78	P048 	bayuastra
98	P016 	dinosaurus
\.


--
-- Data for Name: pendaftaran_oprec; Type: TABLE DATA; Schema: simui; Owner: -
--

COPY simui.pendaftaran_oprec (id_oprec, id_kepanitiaan, id_organisasi, id_mhs, divisi, motivasi, tugas, swot, berkas) FROM stdin;
39	P009 	P024 	bisma.t	Konsumsi	Mencari Kegiatan Lain	\N	suka bertanya, friendly, ceroboh	\N
40	P010 	P025 	dikaradit	Acara	Mencari Kegiatan Lain	\N	tekun, pemalu, overthinking	\N
11	P036 	P006 	lani.b	Acara	Turut Menyukseskan Acara	\N	pemalu, pendiam, smart	\N
12	P037 	P007 	betrand.h	Dokumentasi	Mengisi Waktu Luang	\N	serba ingin tahu, mandiri, pintar	\N
11	P036 	P006 	desiratna	Dekorasi	Mengisi Waktu Luang	\N	pemalu, pendiam, smart	\N
12	P037 	P007 	amber23	Dokumentasi	Menambah pengalaman	\N	pendiam, ceroboh, pintar	\N
37	P050 	P022 	bernardbear	Perlengkapan	Turut Menyukseskan Acara	\N	overthinking, pendiam, rajin	\N
38	P008 	P023 	jessica	Publikasi	Ingin Belajar	\N	supel, cerewet, malas	\N
39	P009 	P024 	bagus.kaffa	Acara	Ingin Aktif Organisasi	\N	suka bertanya, friendly, ceroboh	\N
40	P010 	P025 	didi.y	Konsumsi	Mengisi Waktu Luang	\N	supel, cerewet, malas	\N
11	P036 	P006 	liliyana	Dekorasi	Mencari Relasi	\N	pendiam, ceroboh, pintar	\N
12	P037 	P007 	muthia.f	Konsumsi	Mengisi Waktu Luang	\N	negosiator, visioner, suka tantangan, aktif	\N
13	P027 	P008 	fauhan.p	Keamanan	Mencari Kegiatan Lain	\N	negosiator, visioner, suka tantangan, aktif	\N
14	P039 	P009 	sultan.m	Transportasi	Hobi	\N	serba ingin tahu, mandiri, pintar	\N
15	P024 	P010 	rifat.k	Sponsorship	Mencari Relasi	\N	pintar, individualis, suka tantangan	\N
16	P026 	P013 	tusty.n	Dekorasi	Ingin Belajar	\N	suka bertanya, friendly, ceroboh	\N
17	P019 	P034 	martin.n	Humas	Mencari Kegiatan Lain	\N	ceroboh, pintar, friendly	\N
18	P020 	P035 	akuadmin	Dokumentasi	Menambah pengalaman	\N	pintar, individualis, suka tantangan	\N
19	P003 	P036 	imnotadmin	Transportasi	Mengisi Waktu Luang	\N	rajin, supel, easy going	\N
20	P022 	P037 	siapaaku	Transportasi	Mencari Kegiatan Lain	\N	mudah emosi, rajin, supel, apatis	\N
40	P010 	P025 	aquair	Sponsorship	Hiburan	\N	rajin, supel, easy going	\N
13	P027 	P008 	adminnih	Humas	Refreshing	\N	tekun, pemalu, overthinking	\N
14	P039 	P009 	lokerkosong	Dekorasi	Refreshing	\N	supel, cerewet, malas	\N
15	P024 	P010 	buani.buana	Dokumentasi	Refreshing	\N	negosiator, visioner, suka tantangan, aktif	\N
16	P026 	P013 	iffah.el	Acara	Mengisi Waktu Luang	\N	mudah emosi, rajin, supel, apatis	\N
17	P019 	P034 	usernamaku	Publikasi	Hobi	\N	negosiator, visioner, suka tantangan, aktif	\N
18	P020 	P035 	annisa.m	Sponsorship	Mencari Kegiatan Lain	\N	pemalu, pendiam, smart	\N
19	P003 	P036 	hepatika.z	Acara	Hobi	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
20	P022 	P037 	nabila.c	Perlengkapan	Mencari Relasi	\N	arogan, berjiwa pemimpin, rajin	\N
37	P050 	P022 	aldi.umar	Konsumsi	Mencari Relasi	\N	suka bertanya, friendly, ceroboh	\N
38	P008 	P023 	bisma.t	Dekorasi	Hiburan	\N	arogan, berjiwa pemimpin, rajin	\N
39	P009 	P024 	dikaradit	Transportasi	Ingin Belajar	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
40	P010 	P025 	lani.b	Acara	Refreshing	\N	pemalu, oportunis, suka tantangan	\N
11	P036 	P006 	betrand.h	Perlengkapan	Refreshing	\N	pendiam, ceroboh, pintar	\N
36	P007 	P019 	desiratna	Sponsorship	Mencari Relasi	\N	negosiator, visioner, suka tantangan, aktif	\N
37	P050 	P022 	amber23	Acara	Turut Menyukseskan Acara	\N	ceroboh, pintar, friendly	\N
38	P008 	P023 	bernardbear	Dokumentasi	Mencari Relasi	\N	suka bertanya, friendly, ceroboh	\N
39	P009 	P024 	jessica	Konsumsi	Ingin Belajar	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
40	P010 	P025 	bagus.kaffa	Keamanan	Hiburan	\N	negosiator, visioner, suka tantangan, aktif	\N
11	P036 	P006 	didi.y	Acara	Turut Menyukseskan Acara	\N	negosiator, visioner, suka tantangan, aktif	\N
12	P037 	P007 	liliyana	Transportasi	Ingin Aktif Organisasi	\N	mudah emosi, rajin, supel, apatis	\N
13	P027 	P008 	muthia.f	Dokumentasi	Ingin Aktif Organisasi	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
14	P039 	P009 	fauhan.p	Publikasi	Mengisi Waktu Luang	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
15	P024 	P010 	sultan.m	Dokumentasi	Hiburan	\N	pendiam, ceroboh, pintar	\N
16	P026 	P013 	rifat.k	Dekorasi	Hobi	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
17	P019 	P034 	tusty.n	Dokumentasi	Mencari Kegiatan Lain	\N	serba ingin tahu, mandiri, pintar	\N
18	P020 	P035 	martin.n	Konsumsi	Mencari Kegiatan Lain	\N	supel, cerewet, malas	\N
32	P045 	P015 	akuadmin	Humas	Turut Menyukseskan Acara	\N	serba ingin tahu, mandiri, pintar	\N
33	P023 	P016 	imnotadmin	Dokumentasi	Turut Menyukseskan Acara	\N	rajin, supel, easy going	\N
34	P047 	P017 	siapaaku	Konsumsi	Menambah pengalaman	\N	pemalu, oportunis, suka tantangan	\N
35	P048 	P018 	aquair	Konsumsi	Mencari Kegiatan Lain	\N	pemalu, pendiam, smart	\N
36	P007 	P019 	adminnih	Perlengkapan	Mencari Relasi	\N	rajin, supel, easy going	\N
37	P050 	P022 	lokerkosong	Humas	Hobi	\N	ceroboh, pintar, friendly	\N
38	P008 	P023 	buani.buana	Humas	Mengisi Waktu Luang	\N	aktif, peduli sesama, teliti	\N
39	P009 	P024 	iffah.el	Transportasi	Mencari Relasi	\N	pemalu, pendiam, smart	\N
40	P010 	P025 	usernamaku	Transportasi	Turut Menyukseskan Acara	\N	oportunis, peduli sesama, easy going	\N
11	P036 	P006 	annisa.m	Konsumsi	Ingin Belajar	\N	easy going, suka tantangan, pemerhati lingkungan	\N
12	P037 	P007 	hepatika.z	Acara	Ingin Belajar	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
17	P019 	P034 	nabila.c	Acara	Hobi	\N	suka bertanya, friendly, ceroboh	\N
18	P020 	P035 	aldi.umar	Dokumentasi	Turut Menyukseskan Acara	\N	pemalu, pendiam, smart	\N
19	P003 	P036 	bisma.t	Konsumsi	Menambah pengalaman	\N	oportunis, peduli sesama, easy going	\N
20	P022 	P037 	dikaradit	Humas	Mengisi Waktu Luang	\N	visioner, peduli sesama, negosiator, overthinking	\N
36	P007 	P019 	lani.b	Transportasi	Refreshing	\N	supel, cerewet, malas	\N
37	P050 	P022 	betrand.h	Konsumsi	Turut Menyukseskan Acara	\N	pendiam, ceroboh, pintar	\N
38	P008 	P023 	desiratna	Transportasi	Ingin Aktif Organisasi	\N	friendly, suka bertanya, negosiator	\N
39	P009 	P024 	amber23	Konsumsi	Hiburan	\N	individualis, selalu ingin tahu, dapat diandalkan	\N
40	P010 	P025 	bernardbear	Publikasi	Hiburan	\N	ceroboh, pintar, friendly	\N
11	P036 	P006 	jessica	Perlengkapan	Ingin Belajar	\N	pintar, individualis, suka tantangan	\N
12	P037 	P007 	bagus.kaffa	Transportasi	Mencari Kegiatan Lain	\N	pintar, individualis, suka tantangan	\N
13	P027 	P008 	didi.y	Transportasi	Ingin Belajar	\N	pendiam, ceroboh, pintar	\N
14	P039 	P009 	liliyana	Humas	Ingin Belajar	\N	oportunis, peduli sesama, easy going	\N
34	P047 	P017 	muthia.f	Transportasi	Ingin Belajar	\N	visioner, peduli sesama, negosiator, overthinking	\N
35	P048 	P018 	fauhan.p	Perlengkapan	Hobi	\N	oportunis, peduli sesama, easy going	\N
36	P007 	P019 	sultan.m	Transportasi	Mencari Kegiatan Lain	\N	tekun, pemalu, overthinking	\N
37	P050 	P022 	rifat.k	Humas	Ingin Aktif Organisasi	\N	tekun, pemalu, overthinking	\N
38	P008 	P023 	tusty.n	Publikasi	Mencari Relasi	\N	overthinking, pendiam, rajin	\N
39	P009 	P024 	martin.n	Dokumentasi	Ingin Aktif Organisasi	\N	pemalu, pendiam, smart	\N
40	P010 	P025 	akuadmin	Dokumentasi	Ingin Belajar	\N	pemalu, oportunis, suka tantangan	\N
11	P036 	P006 	imnotadmin	Keamanan	Ingin Belajar	\N	rajin, supel, easy going	\N
37	P050 	P022 	siapaaku	Perlengkapan	Hiburan	\N	pintar, individualis, suka tantangan	\N
38	P008 	P023 	aquair	Acara	Mengisi Waktu Luang	\N	rajin, supel, easy going	\N
39	P009 	P024 	adminnih	Dokumentasi	Refreshing	\N	mudah emosi, rajin, supel, apatis	\N
40	P010 	P025 	lokerkosong	Dekorasi	Mengisi Waktu Luang	\N	mudah emosi, rajin, supel, apatis	\N
11	P036 	P006 	buani.buana	Konsumsi	Turut Menyukseskan Acara	\N	arogan, berjiwa pemimpin, rajin	\N
12	P037 	P007 	iffah.el	Konsumsi	Menambah pengalaman	\N	suka bertanya, friendly, ceroboh	\N
13	P027 	P008 	usernamaku	Acara	Ingin Belajar	\N	supel, cerewet, malas	\N
17	P019 	P034 	annisa.m	Perlengkapan	Refreshing	\N	rajin, supel, easy going	\N
18	P020 	P035 	hepatika.z	Keamanan	Menambah pengalaman	\N	aktif, peduli sesama, teliti	\N
19	P003 	P036 	nabila.c	Transportasi	Hobi	\N	pemalu, oportunis, suka tantangan	\N
20	P022 	P037 	aldi.umar	Konsumsi	Menambah pengalaman	\N	serba ingin tahu, mandiri, pintar	\N
34	P047 	P017 	bisma.t	Keamanan	Turut Menyukseskan Acara	\N	friendly, suka bertanya, negosiator	\N
35	P048 	P018 	dikaradit	Dekorasi	Hobi	\N	pintar, individualis, suka tantangan	\N
17	P019 	P034 	lani.b	Perlengkapan	Refreshing	\N	pemalu, oportunis, suka tantangan	\N
19	P003 	P036 	betrand.h	Keamanan	Mengisi Waktu Luang	\N	suka bertanya, friendly, ceroboh	\N
20	P022 	P037 	desiratna	Perlengkapan	Mencari Kegiatan Lain	\N	supel, cerewet, malas	\N
13	P027 	P008 	amber23	Acara	Mencari Kegiatan Lain	\N	supel, cerewet, malas	\N
14	P039 	P009 	bernardbear	Keamanan	Hobi	\N	serba ingin tahu, mandiri, pintar	\N
13	P027 	P008 	jessica	Keamanan	Mengisi Waktu Luang	\N	visioner, peduli sesama, negosiator, overthinking	\N
14	P039 	P009 	bagus.kaffa	Sponsorship	Refreshing	\N	arogan, berjiwa pemimpin, rajin	\N
15	P024 	P010 	didi.y	Sponsorship	Hobi	\N	negosiator, visioner, suka tantangan, aktif	\N
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
87	P007 	Widiatama
14	P036 	Rudy Hartono
46	P043 	Riswanto
78	P005 	Doraemon
42	P020 	Chico Jericho
57	P003 	Dian Sastrowardoyo
43	P044 	William
90	P044 	Bijak Rabbani
64	P038 	Rahmat Rizkiyanto
10	P039 	Ajmal Kurnia
34	P009 	Ibu Susi Pujiastuti
75	P047 	Buana
56	P030 	Zidny Ilma
36	P003 	El Masrura
86	P036 	Stevanus
91	P023 	Ridho Muhammad
39	P017 	Menkominfo
95	P007 	Safira Amalia
83	P041 	Cindy Patricia
71	P031 	Milea Adnan
50	P045 	Rodhi
95	P018 	Sultan Agung
87	P049 	Bill Gate
96	P012 	Rahmat Rasyid
40	P030 	Larry Page
70	P016 	Abyan Handoko
17	P043 	Fauhan Putra
15	P027 	Cio Candra
76	P002 	Rachmat Hidayat
44	P014 	Harry Fitriana
61	P011 	Achmat Afif
77	P020 	Dede irfan
88	P011 	Defrindo Indria
55	P021 	Andri Prasetyo
47	P046 	Vivin Permatasari
29	P044 	Hanung Bramantyo
27	P034 	Bijak Rabbani
64	P036 	Sheila On 7
11	P018 	Putri Marino
99	P016 	Lavenia Qaila
69	P022 	Stevanus
52	P017 	Ridho Muhammad
67	P010 	RAN
38	P008 	Reza Rahadian
17	P043 	Rahmat Rizkiyanto
15	P027 	Ajmal Kurnia
76	P002 	El Masrura
44	P014 	Marion Jola
61	P011 	Wahyu Restuti, Phd
77	P020 	Rizky Hanggono
88	P011 	Nino Al Hakim
55	P021 	Umar Azim
47	P046 	Naura Abdilla
29	P044 	Syifa Medina
27	P034 	Waiz Ayu Nisrin
17	P043 	Dian Maharani, S.Kom
15	P027 	Azucena Naira
76	P002 	Ameera Risya
44	P014 	Khalisa Hazrina
61	P011 	Timothy,  S.H.
77	P020 	Rachel Godard
88	P011 	Seandy Handriyanto
55	P021 	Minanul Wasik
47	P046 	Harry Santoso
29	P044 	Tasya Farasah
27	P034 	Sigit Widodo
64	P036 	Muh Rizal
11	P018 	Gigi dan Bella Hadid
99	P016 	Harvini Kusumawati
69	P022 	Didit Susanto
52	P017 	Amy Prio Pambudi
67	P010 	Agus kiswanto
90	P044 	Jovanka
64	P038 	Nino Al Hakim
10	P039 	Umar Azim
34	P009 	Mario Teguh
75	P047 	Adiwijaya Santoso
70	P016 	Mohamad Avino
67	P032 	Merry Ryana
42	P017 	Anastasia Susanto
63	P037 	Dendy dwi haryono
82	P050 	Handoko Prabowo
96	P020 	Najwa Shihab
87	P049 	Adma tomi caisar
89	P006 	Adhitya Burhan
79	P024 	Taylor Swift
56	P036 	Amy Prio Pambudi
35	P045 	Agus kiswanto
29	P026 	Gibran Raka Buming
18	P018 	Naura Abdilla
74	P027 	Eko Noviyanto
17	P043 	Didit Susanto
43	P004 	Pandu Wicaksono
48	P004 	DR. Diyah Puspita
93	P050 	Jovanka
95	P024 	Jovita
46	P032 	Rinawati Ghania
40	P005 	Sabria Zuhara
68	P020 	Aria Irdina Tahira
38	P008 	Aqila Ulfa Nadhifa
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
-- Name: pendaftaran_oprec pendaftaran_oprec_id_mhs_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_id_mhs_fkey FOREIGN KEY (id_mhs) REFERENCES simui.mahasiswa(username);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_id_oprec_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: -
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_id_oprec_fkey FOREIGN KEY (id_oprec, id_organisasi, id_kepanitiaan) REFERENCES simui.open_recruitment(id_oprec, id_organisasi, id_kepanitiaan);


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

