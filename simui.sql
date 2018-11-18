--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: simui; Type: SCHEMA; Schema: -; Owner: vikri.aulia
--

CREATE SCHEMA simui;


ALTER SCHEMA simui OWNER TO vikri.aulia;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.admin (
    username character varying(15) NOT NULL
);


ALTER TABLE simui.admin OWNER TO vikri.aulia;

--
-- Name: dosen; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.dosen (
    username character varying(15) NOT NULL,
    nidn character varying(20) NOT NULL
);


ALTER TABLE simui.dosen OWNER TO vikri.aulia;

--
-- Name: event; Type: TABLE; Schema: simui; Owner: vikri.aulia
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
    nomor_kategori character(5)
);


ALTER TABLE simui.event OWNER TO vikri.aulia;

--
-- Name: guest; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.guest (
    username character varying(15) NOT NULL,
    pekerjaan character varying(50) NOT NULL,
    alamat text
);


ALTER TABLE simui.guest OWNER TO vikri.aulia;

--
-- Name: kategori_event; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.kategori_event (
    nomor character(5) NOT NULL,
    nama character varying(50) NOT NULL
);


ALTER TABLE simui.kategori_event OWNER TO vikri.aulia;

--
-- Name: kepanitiaan; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.kepanitiaan (
    id_kepanitiaan character(5) NOT NULL,
    id_organisasi character(5) NOT NULL
);


ALTER TABLE simui.kepanitiaan OWNER TO vikri.aulia;

--
-- Name: mahasiswa; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.mahasiswa (
    username character varying(15) NOT NULL,
    npm character varying(20) NOT NULL
);


ALTER TABLE simui.mahasiswa OWNER TO vikri.aulia;

--
-- Name: non_admin; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.non_admin (
    username character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    nama character varying(50) NOT NULL,
    no_telepon character varying(20) NOT NULL
);


ALTER TABLE simui.non_admin OWNER TO vikri.aulia;

--
-- Name: open_recruitment; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.open_recruitment (
    id_oprec integer NOT NULL,
    id_kepanitiaan character(5) NOT NULL,
    id_organisasi character(5) NOT NULL,
    nama character varying(50) NOT NULL,
    tanggal_dibuka date NOT NULL,
    tanggal_ditutup date NOT NULL,
    berkas_dibutuhkan text,
    persyaratan text
);


ALTER TABLE simui.open_recruitment OWNER TO vikri.aulia;

--
-- Name: organisasi; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.organisasi (
    id_organisasi character(5) NOT NULL
);


ALTER TABLE simui.organisasi OWNER TO vikri.aulia;

--
-- Name: pembuat_event; Type: TABLE; Schema: simui; Owner: vikri.aulia
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


ALTER TABLE simui.pembuat_event OWNER TO vikri.aulia;

--
-- Name: pendaftaran_event; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.pendaftaran_event (
    id_event integer NOT NULL,
    id_pembuat_event character(5) NOT NULL,
    username character varying(15) NOT NULL
);


ALTER TABLE simui.pendaftaran_event OWNER TO vikri.aulia;

--
-- Name: pendaftaran_oprec; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.pendaftaran_oprec (
    id_oprec integer NOT NULL,
    id_kepanitiaan character(5) NOT NULL,
    id_organisasi character(5) NOT NULL,
    id_mhs character(5) NOT NULL,
    divisi character varying(100) NOT NULL,
    motivasi text NOT NULL,
    tugas text,
    swot text NOT NULL,
    berkas text
);


ALTER TABLE simui.pendaftaran_oprec OWNER TO vikri.aulia;

--
-- Name: pengguna; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.pengguna (
    username character varying(15) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE simui.pengguna OWNER TO vikri.aulia;

--
-- Name: pengisi_acara; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.pengisi_acara (
    id_event integer NOT NULL,
    id_pembuat_event character(5) NOT NULL,
    nama_pengisi_acara character varying(20) NOT NULL
);


ALTER TABLE simui.pengisi_acara OWNER TO vikri.aulia;

--
-- Name: staff; Type: TABLE; Schema: simui; Owner: vikri.aulia
--

CREATE TABLE simui.staff (
    username character varying(15) NOT NULL,
    nip character varying(20) NOT NULL
);


ALTER TABLE simui.staff OWNER TO vikri.aulia;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.admin (username) FROM stdin;
\.


--
-- Data for Name: dosen; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.dosen (username, nidn) FROM stdin;
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.event (id_event, id_pembuat_event, nama, tanggal, waktu, kapasitas, harga_tiket, lokasi, sifat_event, deskripsi_singkat, nomor_kategori) FROM stdin;
\.


--
-- Data for Name: guest; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.guest (username, pekerjaan, alamat) FROM stdin;
\.


--
-- Data for Name: kategori_event; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.kategori_event (nomor, nama) FROM stdin;
\.


--
-- Data for Name: kepanitiaan; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.kepanitiaan (id_kepanitiaan, id_organisasi) FROM stdin;
\.


--
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.mahasiswa (username, npm) FROM stdin;
\.


--
-- Data for Name: non_admin; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.non_admin (username, email, nama, no_telepon) FROM stdin;
\.


--
-- Data for Name: open_recruitment; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.open_recruitment (id_oprec, id_kepanitiaan, id_organisasi, nama, tanggal_dibuka, tanggal_ditutup, berkas_dibutuhkan, persyaratan) FROM stdin;
\.


--
-- Data for Name: organisasi; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.organisasi (id_organisasi) FROM stdin;
\.


--
-- Data for Name: pembuat_event; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.pembuat_event (id, nama, email, alamat_website, tingkatan, kategori, logo, deskripsi, contact_person) FROM stdin;
\.


--
-- Data for Name: pendaftaran_event; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.pendaftaran_event (id_event, id_pembuat_event, username) FROM stdin;
\.


--
-- Data for Name: pendaftaran_oprec; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.pendaftaran_oprec (id_oprec, id_kepanitiaan, id_organisasi, id_mhs, divisi, motivasi, tugas, swot, berkas) FROM stdin;
\.


--
-- Data for Name: pengguna; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.pengguna (username, password) FROM stdin;
\.


--
-- Data for Name: pengisi_acara; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.pengisi_acara (id_event, id_pembuat_event, nama_pengisi_acara) FROM stdin;
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: simui; Owner: vikri.aulia
--

COPY simui.staff (username, nip) FROM stdin;
\.


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (username);


--
-- Name: dosen dosen_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.dosen
    ADD CONSTRAINT dosen_pkey PRIMARY KEY (username);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id_event, id_pembuat_event);


--
-- Name: guest guest_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (username);


--
-- Name: kategori_event kategori_event_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.kategori_event
    ADD CONSTRAINT kategori_event_pkey PRIMARY KEY (nomor);


--
-- Name: kepanitiaan kepanitiaan_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.kepanitiaan
    ADD CONSTRAINT kepanitiaan_pkey PRIMARY KEY (id_kepanitiaan, id_organisasi);


--
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (username);


--
-- Name: non_admin non_admin_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.non_admin
    ADD CONSTRAINT non_admin_pkey PRIMARY KEY (username);


--
-- Name: open_recruitment open_recruitment_id_kepanitiaan_id_organisasi_key; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.open_recruitment
    ADD CONSTRAINT open_recruitment_id_kepanitiaan_id_organisasi_key UNIQUE (id_kepanitiaan, id_organisasi);


--
-- Name: open_recruitment open_recruitment_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.open_recruitment
    ADD CONSTRAINT open_recruitment_pkey PRIMARY KEY (id_oprec, id_kepanitiaan, id_organisasi);


--
-- Name: organisasi organisasi_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.organisasi
    ADD CONSTRAINT organisasi_pkey PRIMARY KEY (id_organisasi);


--
-- Name: pembuat_event pembuat_event_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pembuat_event
    ADD CONSTRAINT pembuat_event_pkey PRIMARY KEY (id);


--
-- Name: pendaftaran_event pendaftaran_event_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pendaftaran_event
    ADD CONSTRAINT pendaftaran_event_pkey PRIMARY KEY (id_event, id_pembuat_event, username);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_pkey PRIMARY KEY (id_oprec, id_kepanitiaan, id_organisasi, id_mhs);


--
-- Name: pengguna pengguna_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (username);


--
-- Name: pengisi_acara pengisi_acara_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pengisi_acara
    ADD CONSTRAINT pengisi_acara_pkey PRIMARY KEY (id_event, id_pembuat_event, nama_pengisi_acara);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (username);


--
-- Name: admin admin_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.admin
    ADD CONSTRAINT admin_username_fkey FOREIGN KEY (username) REFERENCES simui.pengguna(username);


--
-- Name: dosen dosen_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.dosen
    ADD CONSTRAINT dosen_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: event event_id_pembuat_event_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.event
    ADD CONSTRAINT event_id_pembuat_event_fkey FOREIGN KEY (id_pembuat_event) REFERENCES simui.pembuat_event(id);


--
-- Name: event event_nomor_kategori_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.event
    ADD CONSTRAINT event_nomor_kategori_fkey FOREIGN KEY (nomor_kategori) REFERENCES simui.kategori_event(nomor);


--
-- Name: guest guest_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.guest
    ADD CONSTRAINT guest_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: kepanitiaan kepanitiaan_id_kepanitiaan_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.kepanitiaan
    ADD CONSTRAINT kepanitiaan_id_kepanitiaan_fkey FOREIGN KEY (id_kepanitiaan) REFERENCES simui.pembuat_event(id);


--
-- Name: kepanitiaan kepanitiaan_id_organisasi_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.kepanitiaan
    ADD CONSTRAINT kepanitiaan_id_organisasi_fkey FOREIGN KEY (id_organisasi) REFERENCES simui.organisasi(id_organisasi);


--
-- Name: mahasiswa mahasiswa_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.mahasiswa
    ADD CONSTRAINT mahasiswa_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: non_admin non_admin_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.non_admin
    ADD CONSTRAINT non_admin_username_fkey FOREIGN KEY (username) REFERENCES simui.pengguna(username);


--
-- Name: open_recruitment open_recruitment_id_kepanitiaan_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.open_recruitment
    ADD CONSTRAINT open_recruitment_id_kepanitiaan_fkey FOREIGN KEY (id_kepanitiaan, id_organisasi) REFERENCES simui.kepanitiaan(id_kepanitiaan, id_organisasi);


--
-- Name: organisasi organisasi_id_organisasi_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.organisasi
    ADD CONSTRAINT organisasi_id_organisasi_fkey FOREIGN KEY (id_organisasi) REFERENCES simui.pembuat_event(id);


--
-- Name: pendaftaran_event pendaftaran_event_id_event_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pendaftaran_event
    ADD CONSTRAINT pendaftaran_event_id_event_fkey FOREIGN KEY (id_event, id_pembuat_event) REFERENCES simui.event(id_event, id_pembuat_event);


--
-- Name: pendaftaran_event pendaftaran_event_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pendaftaran_event
    ADD CONSTRAINT pendaftaran_event_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_id_kepanitiaan_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_id_kepanitiaan_fkey FOREIGN KEY (id_kepanitiaan, id_organisasi) REFERENCES simui.open_recruitment(id_organisasi, id_kepanitiaan);


--
-- Name: pendaftaran_oprec pendaftaran_oprec_id_mhs_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pendaftaran_oprec
    ADD CONSTRAINT pendaftaran_oprec_id_mhs_fkey FOREIGN KEY (id_mhs) REFERENCES simui.mahasiswa(username);


--
-- Name: pengisi_acara pengisi_acara_id_event_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.pengisi_acara
    ADD CONSTRAINT pengisi_acara_id_event_fkey FOREIGN KEY (id_event, id_pembuat_event) REFERENCES simui.event(id_event, id_pembuat_event);


--
-- Name: staff staff_username_fkey; Type: FK CONSTRAINT; Schema: simui; Owner: vikri.aulia
--

ALTER TABLE ONLY simui.staff
    ADD CONSTRAINT staff_username_fkey FOREIGN KEY (username) REFERENCES simui.non_admin(username);


--
-- PostgreSQL database dump complete
--

