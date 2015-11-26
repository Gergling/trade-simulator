--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2015-11-26 21:27:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 184 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 16394)
-- Name: economy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE economy (
    economy_label character varying(75) NOT NULL,
    economy_id integer NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 16439)
-- Name: economy_economy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE economy_economy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 174
-- Name: economy_economy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE economy_economy_id_seq OWNED BY economy.economy_id;


--
-- TOC entry 173 (class 1259 OID 16411)
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product (
    product_label character varying(75) NOT NULL,
    economy_id integer,
    product_id integer NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 16448)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 175
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_product_id_seq OWNED BY product.product_id;


--
-- TOC entry 176 (class 1259 OID 16457)
-- Name: world; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE world (
    world_id integer NOT NULL,
    world_label character varying(75) NOT NULL,
    economy_id integer NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 16514)
-- Name: world_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE world_product (
    world_id integer NOT NULL,
    product_id integer NOT NULL,
    world_product_quantity integer NOT NULL
);


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE world_product; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE world_product IS 'This is supposed to be an abstract (inherited) table which includes quantities associated with a world and a product.';


--
-- TOC entry 180 (class 1259 OID 16522)
-- Name: world_product_consumption; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE world_product_consumption (
)
INHERITS (world_product);


--
-- TOC entry 179 (class 1259 OID 16517)
-- Name: world_product_storage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE world_product_storage (
)
INHERITS (world_product);


--
-- TOC entry 181 (class 1259 OID 16545)
-- Name: world_production; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE world_production (
    world_production_id integer NOT NULL
)
INHERITS (world_product);


--
-- TOC entry 182 (class 1259 OID 16548)
-- Name: world_production_cost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE world_production_cost (
    world_production_id integer NOT NULL
)
INHERITS (world_product);


--
-- TOC entry 183 (class 1259 OID 16551)
-- Name: world_production_world_production_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE world_production_world_production_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 183
-- Name: world_production_world_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE world_production_world_production_id_seq OWNED BY world_production.world_production_id;


--
-- TOC entry 177 (class 1259 OID 16460)
-- Name: world_world_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE world_world_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 177
-- Name: world_world_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE world_world_id_seq OWNED BY world.world_id;


--
-- TOC entry 1915 (class 2604 OID 16441)
-- Name: economy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY economy ALTER COLUMN economy_id SET DEFAULT nextval('economy_economy_id_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 16450)
-- Name: product_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product ALTER COLUMN product_id SET DEFAULT nextval('product_product_id_seq'::regclass);


--
-- TOC entry 1917 (class 2604 OID 16462)
-- Name: world_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY world ALTER COLUMN world_id SET DEFAULT nextval('world_world_id_seq'::regclass);


--
-- TOC entry 1918 (class 2604 OID 16553)
-- Name: world_production_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_production ALTER COLUMN world_production_id SET DEFAULT nextval('world_production_world_production_id_seq'::regclass);


--
-- TOC entry 1920 (class 2606 OID 16443)
-- Name: economy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY economy
    ADD CONSTRAINT economy_pkey PRIMARY KEY (economy_id);


--
-- TOC entry 1922 (class 2606 OID 16452)
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 1924 (class 2606 OID 16464)
-- Name: world_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world
    ADD CONSTRAINT world_pkey PRIMARY KEY (world_id);


--
-- TOC entry 1928 (class 2606 OID 16526)
-- Name: world_product_consumption_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_product_consumption
    ADD CONSTRAINT world_product_consumption_pkey PRIMARY KEY (world_id, product_id);


--
-- TOC entry 1926 (class 2606 OID 16521)
-- Name: world_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_product
    ADD CONSTRAINT world_product_pkey PRIMARY KEY (world_id, product_id);


--
-- TOC entry 1932 (class 2606 OID 16560)
-- Name: world_production_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_production_cost
    ADD CONSTRAINT world_production_cost_pkey PRIMARY KEY (world_id, product_id, world_production_id);


--
-- TOC entry 1930 (class 2606 OID 16558)
-- Name: world_production_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_production
    ADD CONSTRAINT world_production_pkey PRIMARY KEY (world_production_id);


--
-- TOC entry 1933 (class 2606 OID 16469)
-- Name: economy_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product
    ADD CONSTRAINT economy_id FOREIGN KEY (economy_id) REFERENCES economy(economy_id);


--
-- TOC entry 1934 (class 2606 OID 16474)
-- Name: economy_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world
    ADD CONSTRAINT economy_id FOREIGN KEY (economy_id) REFERENCES economy(economy_id);


--
-- TOC entry 1935 (class 2606 OID 16532)
-- Name: product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_product
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- TOC entry 1936 (class 2606 OID 16537)
-- Name: world_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY world_product
    ADD CONSTRAINT world_id FOREIGN KEY (world_id) REFERENCES world(world_id);


-- Completed on 2015-11-26 21:27:08

--
-- PostgreSQL database dump complete
--

