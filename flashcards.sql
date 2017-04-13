--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: interview; Type: DATABASE; Schema: -; Owner: forestnewark
--

CREATE DATABASE interview WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE interview OWNER TO forestnewark;

\connect interview

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: flashcards; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE flashcards (
    flashcardid integer NOT NULL,
    question text NOT NULL,
    answer text NOT NULL
);


ALTER TABLE flashcards OWNER TO forestnewark;

--
-- Name: flashcards_flashcardid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE flashcards_flashcardid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flashcards_flashcardid_seq OWNER TO forestnewark;

--
-- Name: flashcards_flashcardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE flashcards_flashcardid_seq OWNED BY flashcards.flashcardid;


--
-- Name: flashcards flashcardid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY flashcards ALTER COLUMN flashcardid SET DEFAULT nextval('flashcards_flashcardid_seq'::regclass);


--
-- Data for Name: flashcards; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY flashcards (flashcardid, question, answer) FROM stdin;
1	What is OOPS?	OOPS is abbreviated as Object Oriented Programming system in which programs are considered as a collection of objects. Each object is nothing but an instance of a class.
2	What is a class?	A class is simply a representation of a type of object. It is the blueprint/ plan/ template that describe the details of an object.
3	What is the JVM?	JVM is an acronym for Java Virtual Machine, it is an abstract machine which provides the runtime environment in which java bytecode can be executed.
4	What is the JRE	JRE stands for Java Runtime Environment. It is the implementation of JVM.
5	What is the JDK	JDK is an acronym for Java Development Kit.It contains JRE + development tools.
6	What is JIT compiler?	Just-In-Time(JIT) compiler:It is used to improve the performance. JIT compiles parts of the byte code that have similar functionality at the same time, and hence reduces the amount of time needed for compilation.Here the term “compiler” refers to a translator from the instruction set of a Java virtual machine (JVM) to the instruction set of a specific CPU.
7	What gives Java its 'write once and run anywhere' nature?	The bytecode. Java is compiled to be a byte code which is the intermediate language between source code and machine code. This byte code is not platform specific and hence can be fed to any platform.
8	What is a constructor?	a method that is used to initialize the state of an object. It is invoked at the time of object creation.
9	Can you make a constructor final?	No!
10	What is static variable?	used to refer the common property of all objects
\.


--
-- Name: flashcards_flashcardid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('flashcards_flashcardid_seq', 21, true);


--
-- Name: flashcards flashcards_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY flashcards
    ADD CONSTRAINT flashcards_pkey PRIMARY KEY (flashcardid);


--
-- Name: flashcards_flashcardid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX flashcards_flashcardid_uindex ON flashcards USING btree (flashcardid);


--
-- PostgreSQL database dump complete
--

