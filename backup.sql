--
-- PostgreSQL database dump
--

\restrict XmBhwfV3oElJVbcSvrK7bEnEElR8Z7WtzdZMCGZEjjnJa1y9eDbdfgIO2oIb9sT

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-09-15 17:37:20

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
-- TOC entry 246 (class 1259 OID 34417)
-- Name: ai_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_configurations (
    id bigint NOT NULL,
    config_key character varying(100) NOT NULL,
    config_value text NOT NULL,
    description text,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.ai_configurations OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 34416)
-- Name: ai_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_configurations_id_seq OWNER TO postgres;

--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 245
-- Name: ai_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_configurations_id_seq OWNED BY public.ai_configurations.id;


--
-- TOC entry 220 (class 1259 OID 25234)
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    authority character varying(50) NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25233)
-- Name: authorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authorities_id_seq OWNER TO postgres;

--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 219
-- Name: authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authorities_id_seq OWNED BY public.authorities.id;


--
-- TOC entry 239 (class 1259 OID 34308)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cart_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 34307)
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO postgres;

--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 238
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- TOC entry 237 (class 1259 OID 34291)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 34290)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 236
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 227 (class 1259 OID 34166)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    parent_id bigint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 34165)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 226
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 248 (class 1259 OID 34429)
-- Name: chat_faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_faqs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    is_active boolean,
    keywords character varying(255) NOT NULL,
    response_text text NOT NULL
);


ALTER TABLE public.chat_faqs OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 34428)
-- Name: chat_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_faqs_id_seq OWNER TO postgres;

--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 247
-- Name: chat_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_faqs_id_seq OWNED BY public.chat_faqs.id;


--
-- TOC entry 250 (class 1259 OID 34441)
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp(6) without time zone,
    sender_type character varying(255) NOT NULL,
    session_id bigint
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 34440)
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_messages_id_seq OWNER TO postgres;

--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 249
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- TOC entry 252 (class 1259 OID 34453)
-- Name: chat_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_sessions (
    id bigint NOT NULL,
    anonymous_id character varying(100),
    created_at timestamp(6) without time zone,
    is_anonymous boolean,
    status character varying(20) NOT NULL,
    updated_at timestamp(6) without time zone,
    user_id bigint NOT NULL
);


ALTER TABLE public.chat_sessions OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 34452)
-- Name: chat_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 251
-- Name: chat_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_sessions_id_seq OWNED BY public.chat_sessions.id;


--
-- TOC entry 254 (class 1259 OID 34463)
-- Name: lucky_prizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lucky_prizes (
    id bigint NOT NULL,
    color character varying(20),
    description text,
    icon character varying(50),
    name character varying(100) NOT NULL,
    text_color character varying(20),
    type character varying(50) NOT NULL,
    value integer
);


ALTER TABLE public.lucky_prizes OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 34462)
-- Name: lucky_prizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lucky_prizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lucky_prizes_id_seq OWNER TO postgres;

--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 253
-- Name: lucky_prizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lucky_prizes_id_seq OWNED BY public.lucky_prizes.id;


--
-- TOC entry 256 (class 1259 OID 34475)
-- Name: order_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_history (
    id bigint NOT NULL,
    action character varying(50) NOT NULL,
    changes text,
    new_payment_status character varying(50),
    new_status character varying(100),
    note text,
    old_payment_status character varying(50),
    old_status character varying(100),
    order_id character varying(50) NOT NULL,
    performed_at timestamp(6) without time zone,
    performed_by character varying(100) NOT NULL,
    performed_by_role character varying(50)
);


ALTER TABLE public.order_history OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 34474)
-- Name: order_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_history_id_seq OWNER TO postgres;

--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 255
-- Name: order_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_history_id_seq OWNED BY public.order_history.id;


--
-- TOC entry 243 (class 1259 OID 34377)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id character varying(50) NOT NULL,
    product_id bigint NOT NULL,
    variant_id bigint,
    product_name character varying(255) NOT NULL,
    price double precision NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 34376)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 242
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 241 (class 1259 OID 34350)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id character varying(50) NOT NULL,
    user_id bigint NOT NULL,
    full_name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    address text NOT NULL,
    total_amount double precision NOT NULL,
    discount_amount double precision DEFAULT 0,
    payable_amount double precision NOT NULL,
    payment_method character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    voucher_code character varying(50),
    vnpay_tran_no character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 34405)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    is_active boolean DEFAULT true,
    config_json text,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 34271)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    image_url text NOT NULL,
    is_featured boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 34270)
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_id_seq OWNER TO postgres;

--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 234
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- TOC entry 231 (class 1259 OID 34218)
-- Name: product_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variants (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    variant_name character varying(255) DEFAULT 'Default'::character varying,
    sku character varying(100),
    price_adjustment double precision DEFAULT 0.00,
    inventory integer DEFAULT 0 NOT NULL,
    reserved integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT product_variants_inventory_check CHECK ((inventory >= 0)),
    CONSTRAINT product_variants_reserved_check CHECK ((reserved >= 0))
);


ALTER TABLE public.product_variants OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 34217)
-- Name: product_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variants_id_seq OWNER TO postgres;

--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 230
-- Name: product_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variants_id_seq OWNED BY public.product_variants.id;


--
-- TOC entry 229 (class 1259 OID 34187)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    base_price double precision NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying,
    sold_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT products_base_price_check CHECK ((base_price >= ((0)::numeric)::double precision)),
    CONSTRAINT products_sold_count_check CHECK ((sold_count >= 0))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 34186)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 228
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 260 (class 1259 OID 34617)
-- Name: review_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_images (
    id bigint NOT NULL,
    image_url character varying(255) NOT NULL,
    review_id bigint NOT NULL
);


ALTER TABLE public.review_images OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 34616)
-- Name: review_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_images_id_seq OWNER TO postgres;

--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 259
-- Name: review_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_images_id_seq OWNED BY public.review_images.id;


--
-- TOC entry 233 (class 1259 OID 34244)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    rating integer NOT NULL,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    order_item_id bigint,
    status character varying(255),
    order_id character varying(255),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 34243)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 232
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 224 (class 1259 OID 34135)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    display_name character varying(100) NOT NULL,
    color character varying(10) DEFAULT '#6b7280'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 34134)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 223
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 225 (class 1259 OID 34148)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 34551)
-- Name: user_spin_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_spin_profiles (
    user_id bigint NOT NULL,
    last_spin_date timestamp(6) without time zone,
    points integer
);


ALTER TABLE public.user_spin_profiles OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 34557)
-- Name: user_wishlist_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_wishlist_items (
    product_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.user_wishlist_items OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 34112)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    full_name character varying(100),
    phone character varying(20),
    enabled boolean DEFAULT true,
    account_non_locked boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 34111)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 240 (class 1259 OID 34333)
-- Name: vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vouchers (
    id character varying(50) NOT NULL,
    code character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    voucher_type character varying(50) NOT NULL,
    value_amount double precision NOT NULL,
    max_discount_amount double precision,
    min_order_amount double precision DEFAULT 0,
    usage_limit integer DEFAULT 0,
    used_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expired_at character varying(255),
    start_date character varying(255),
    status character varying(255),
    target character varying(255),
    user_id bigint
);


ALTER TABLE public.vouchers OWNER TO postgres;

--
-- TOC entry 5006 (class 2604 OID 34420)
-- Name: ai_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_configurations ALTER COLUMN id SET DEFAULT nextval('public.ai_configurations_id_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 25237)
-- Name: authorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities ALTER COLUMN id SET DEFAULT nextval('public.authorities_id_seq'::regclass);


--
-- TOC entry 4994 (class 2604 OID 34311)
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 34294)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 34169)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 34432)
-- Name: chat_faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_faqs ALTER COLUMN id SET DEFAULT nextval('public.chat_faqs_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 34444)
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- TOC entry 5009 (class 2604 OID 34456)
-- Name: chat_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_sessions ALTER COLUMN id SET DEFAULT nextval('public.chat_sessions_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 34466)
-- Name: lucky_prizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lucky_prizes ALTER COLUMN id SET DEFAULT nextval('public.lucky_prizes_id_seq'::regclass);


--
-- TOC entry 5011 (class 2604 OID 34478)
-- Name: order_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history ALTER COLUMN id SET DEFAULT nextval('public.order_history_id_seq'::regclass);


--
-- TOC entry 5003 (class 2604 OID 34380)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 4989 (class 2604 OID 34274)
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- TOC entry 4981 (class 2604 OID 34221)
-- Name: product_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants ALTER COLUMN id SET DEFAULT nextval('public.product_variants_id_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 34190)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 34620)
-- Name: review_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_images ALTER COLUMN id SET DEFAULT nextval('public.review_images_id_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 34247)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 34138)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 34115)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5300 (class 0 OID 34417)
-- Dependencies: 246
-- Data for Name: ai_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ai_configurations (id, config_key, config_value, description, updated_at) FROM stdin;
1	SYSTEM_PROMPT 	Hãy xưng là 'Tiểu Nhị' và gọi khách hàng là 'Đại Hiệp'		2026-07-04 16:58:37.418792
\.


--
-- TOC entry 5274 (class 0 OID 25234)
-- Dependencies: 220
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorities (id, username, authority) FROM stdin;
4	thuan11111@gmail.com	ROLE_USER
5	nguyenvana	ROLE_USER
8	thuan11111@gmail.com	ROLE_ADMIN
9	admin@handmade.com	ROLE_USER
10	admin@handmade.com	ROLE_ADMIN
14	admin@handmade.com	ROLE_STAFF
15	admin@handmade.com	ROLE_MANAGER
16	khanhthuan	ROLE_USER
17	khanhthuan@gmail.com	ROLE_USER
20	khanhthuan@gmail.com	ROLE_ADMIN
25	khanhthua 	ROLE_USER
26	khanhthua 	ROLE_STAFF
27	khanhthua 	ROLE_MANAGER
28	khanhthua 	ROLE_ADMIN
\.


--
-- TOC entry 5293 (class 0 OID 34308)
-- Dependencies: 239
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (id, cart_id, product_id, quantity, created_at) FROM stdin;
1	1	2	1	2026-05-26 14:58:44.310258
2	1	4	2	2026-05-26 14:58:44.310258
3	1	11	1	2026-05-26 14:58:44.310258
38	3	4	8	\N
36	4	159	1	\N
37	4	148	1	\N
\.


--
-- TOC entry 5291 (class 0 OID 34291)
-- Dependencies: 237
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id, created_at) FROM stdin;
1	1	2026-05-26 14:58:44.310258
2	2	2026-05-26 14:58:44.310258
3	3	\N
4	5	\N
5	8	\N
\.


--
-- TOC entry 5281 (class 0 OID 34166)
-- Dependencies: 227
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, parent_id, created_at) FROM stdin;
1	Handmade Bag	handmade-bag	\N	2026-05-26 14:58:05.890155
2	Handmade Decor	handmade-decor	\N	2026-05-26 14:58:05.890155
3	Túi & Ví	tui-vi	1	2026-05-26 14:58:05.890155
4	Trang trí nhà cửa	trang-tri-nha-cua	2	2026-05-26 14:58:05.890155
5	Phụ kiện	phu-kien	\N	2026-05-26 14:58:05.890155
6	Trang sức	trang-suc	5	2026-05-26 14:58:05.890155
7	Gốm sứ	gom-su	\N	2026-05-26 14:58:05.890155
8	Đồ da	do-da	\N	2026-05-26 14:58:05.890155
9	Mỹ phẩm	my-pham	\N	2026-05-26 14:58:05.890155
10	Văn phòng phẩm	van-phong-pham	\N	2026-05-26 14:58:05.890155
\.


--
-- TOC entry 5302 (class 0 OID 34429)
-- Dependencies: 248
-- Data for Name: chat_faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_faqs (id, created_at, is_active, keywords, response_text) FROM stdin;
\.


--
-- TOC entry 5304 (class 0 OID 34441)
-- Dependencies: 250
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, content, created_at, sender_type, session_id) FROM stdin;
1	hi	2026-07-04 12:58:26.844644	USER	1
2	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-04 12:58:26.906267	BOT	1
3	09438294	2026-07-04 12:58:34.122244	USER	1
4	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-04 12:58:34.162519	BOT	1
5	hi	2026-07-04 16:24:46.460939	USER	2
6	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-04 16:24:46.496842	BOT	2
7	có bán tui tote không	2026-07-04 16:24:58.688983	USER	2
8	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-04 16:24:58.709063	BOT	2
9	Shop có bán túi tote không	2026-07-04 16:25:18.174065	USER	2
10	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-04 16:25:18.199274	BOT	2
11	Shop có bán túi tote không	2026-07-04 16:27:28.61253	USER	2
12	Đây là những mẫu túi đeo lưng cá tính của Handmade Shop:	2026-07-04 16:27:43.163627	BOT	2
13	xin chào 	2026-07-04 16:32:18.777677	USER	2
14	Chào bạn, mình là trợ lý AI của shop. Cảm ơn bạn đã quan tâm đến đồ thủ công mỹ nghệ Việt Nam.	2026-07-04 16:32:22.950636	BOT	2
15	có bán vòng đeo tay không	2026-07-04 16:32:32.6403	USER	2
16	Đây là các mẫu trang sức thủ công mang phong cách hiện đại 🎒	2026-07-04 16:32:35.585143	BOT	2
17	có bán túi không 	2026-07-04 16:32:52.069298	USER	2
18	Các mẫu túi và ví handmade xinh xắn đang có sẵn: 🎨\n\n- Túi đeo cổng vai nữ họa tiết hoa nhung giá 199.000 VNĐ, kích thước 24cm x 15cm. \n\n- Ví da bò đựng tiền và thẻ - mẫu túi cầm tay nhỏ gọn giá 389.000 VNĐ, kích thước 17cm x 12cm. \n\n- Túi đeo vai nữ họa tiết hoa giá 469.000 VNĐ, kích thước 25cm x 20cm.\n\nBạn có muốn đặt hàng không?	2026-07-04 16:33:09.418011	BOT	2
19	làm sao để đặt hàng 	2026-07-04 16:33:21.280487	USER	2
20	Để đặt hàng, bạn hãy chọn sản phẩm và nhấn nút "Mua ngay". Bạn cũng có thể thêm vào giỏ hàng để tham khảo trước nhé! 🛍️	2026-07-04 16:33:26.761577	BOT	2
21	tôi cần sản phẩm chi tiết nhé 	2026-07-04 16:33:57.781036	USER	2
22	Chào bạn, đây là sản phẩm Gối tựa lưng cổ gốm sứ tráng men ngọc giá 199.000 VNĐ: \n\nSản phẩm decor văn phòng, nhà cửa, shop đồ handmade. Hiện shop đang còn 25 sản phẩm trong kho ạ.\n\nDưới đây là hình ảnh chi tiết:\n\n[Ảnh gối tựa lưng cổ gốm sứ tráng men ngọc]\n\nGối tựa lưng cổ gốm sứ tráng men ngọc\n\nĐây là mẫu gối tựa lưng cổ mang vẻ đẹp nhẹ nhàng nhưng không kém phần tinh tế. Vẻ đẹp đơn giản, thanh lịch của chiếc gối này chắc chắn sẽ làm nổi bật lên bất kỳ góc nhỏ nào trong ngôi nhà thân yêu của bạn.\n\nGhế ngồi tựa lưng tựa ôm sát vào lưng người ngồi mang lại cảm giác thoải mái và dễ chịu cho người sử dụng. Dưới đây là một số sản phẩm decor tương tự, bạn có muốn xem không:\n\n[Ảnh gối tựa lưng cổ gốm sứ tráng men ngọc]\n[Ảnh Gối tựa lưng nhỏ Gốm Sứ Tráng Men Ngọc]\n\nGhế sofa đẹp với lưng tựa ôm sát vào lưng người ngồi tạo cảm giác thoải mái, dễ chịu cho người sử dụng. Hiện shop đang còn 5 sản phẩm trong kho ạ.\n\nĐể mua sản phẩm trên, bạn bấm chọn "MUA NGAY" để đặt hàng trực tiếp nhé!	2026-07-04 16:34:51.954124	BOT	2
23	vòng đeo tay đẹp nhất 	2026-07-04 16:35:21.40304	USER	2
24	Đây là những mẫu trang sức handmade độc đáo của shop:	2026-07-04 16:35:23.933653	BOT	2
25	Shop có bán túi tote không	2026-07-04 16:39:30.361984	USER	2
26	Các mẫu túi vải cotton handmade dễ thương đang có sẵn: 🎨	2026-07-04 16:39:33.358373	BOT	2
27	Tư vấn cho mình Túi Tote Vải Canvas In Chữ Vintage với."	2026-07-04 16:40:53.630154	USER	2
28	Dạ, Túi Tote Vải Canvas In Chữ Vintage là một trong những sản phẩm nổi bật của thể loại Trang sức & Đồ da. TÚI TOSE VẢI CÀ NÁO IN CHỮ VINTAGE \n\n- Chiếc túi đeo chéo vải canvas retro in logo vintage, kích thước vừa túi tiền.\n\n- Kèm móc khóa tiện lợi giúp bạn bảo quản và sử dụng thoải mái khi đi học hoặc dạo phố. Giá sản phẩm là 205.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-04 16:41:10.126787	BOT	2
29	Tư vấn cho mình Túi Tote Vải Canvas In Chữ Vintage với	2026-07-04 16:42:01.132091	USER	2
30	Dạ, Túi Tote Vải Canvas In Chữ Vintage là một trong những sản phẩm nổi bật của thể loại Văn phòng & Học tập. Túi tote vải canvas in chữ vintage - mẫu mã độc đáo, phong cách mang hơi hướng cổ điển và retro giúp lưu trữ đồ đạc một cách tiện lợi mà vẫn giữ được sự cá tính của bản thân. Kích thước: 34cm x 26cm Giá sản phẩm là 509.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-04 16:42:20.571855	BOT	2
31	cho toi link sản phẩm đó 	2026-07-04 16:42:52.237294	USER	2
32	Đây là  Hoa tai Hàn Quốc - Đen. Giá sản phẩm là 799.000 VNĐ 🛒\n\n![](https://handmade.shop/storage/app/public/product/1654823899-62405.jpg)	2026-07-04 16:43:04.018141	BOT	2
33	hi	2026-07-04 16:44:19.373808	USER	2
34	Xin chào! Shop có nhiều mẫu trang trí nhà cửa xinh xắn 🏡 Hiện shop đang còn 15 sản phẩm trong kho ạ.	2026-07-04 16:44:23.656248	BOT	2
35	cho thêm thoogn tin 15 sản phẩm 	2026-07-04 16:44:32.644731	USER	2
36	Dạ, dưới đây là 15 sản phẩm nổi bật của shop: \n\n1. Bình hoa gốm sứ dáng đứng (26038)\n2. Thuyền buồm hình thuyền buồm 3D nhỏ màu xanh dương (24970) \n3. Vỏ sò lớn vỏ trai to làm pendant dây chuyền (25138)\n4. Bình hoa hình quả tim nhỏ (26037)\n5. Sứ pha lê ốp nền tảng máy giặt (26129) \n6. Thuyền buồm hình thuyền buồm 3D lớn màu xanh dương (25842)\n7. Gốm sứ cao cấp hoa tai nhỏ dáng đứng (26040)\n8. Vỏ sò lớn làm pendant dây chuyền vàng 18k (25874)\n9. Bình hoa gốm sứ hình quả tim dài (26039) \n10. Thuyền buồm hình thuyền buồm 3D nhỏ màu xanh lá cây (25875)\n11. Vỏ sò lớn làm pendant dây chuyền bạc 925 (25849)\n12. Gốm sứ cao cấp hoa tai lớn dáng đứng (26036) \n13. Thuyền buồm hình thuyền buồm 3D lớn màu xanh lá cây (25877)\n14. Gốm sứ cao cấp hoa tai tròn dáng đứng (26035)\n15. Bình gốm sứ ốp nền tảng máy giặt (26093)\n\nBạn có muốn đặt hàng không? 💝	2026-07-04 16:45:19.275389	BOT	2
37	Vòng tay Handmade da thật	2026-07-04 16:46:38.147854	USER	2
38	Dạ, Vòng tay Handmade da thật là một trong những sản phẩm nổi bật của thể loại Đồ da. Vòng tay da bò thủ công mang đến sự cá tính và phong cách cho người dùng.. Giá sản phẩm là 179.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-04 16:46:46.855049	BOT	2
39	Balo nữ da thật Handmade độc đẹp lạ	2026-07-04 16:46:58.758663	USER	2
40	Đây là một trong những sản phẩm nổi bật của thể loại Trang trí nhà cửa: \n\nBalo nữ da thật Handmade độc đáo, với chất liệu da bò cao cấp. Kích thước nhỏ gọn, phù hợp mang theo đi học hoặc làm việc hàng ngày. Kiểu dáng thiết kế đơn giản mà vẫn cá tính, thích hợp mix đồ.. Giá sản phẩm là 299.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-04 16:47:11.874431	BOT	2
41	Thắt lưng da Cá sấu bản 3.4cm khóa tự động	2026-07-04 16:47:18.649964	USER	2
42	Dạ, Thắt lưng da Cá sấu bản 3.4cm khóa tự động là một trong những sản phẩm nổi bật của thể loại Túi và ví. Sản phẩm được làm từ chất liệu da bò cá sấu nhập khẩu cao cấp và khóa tự động chắc chắn giúp bạn luôn an tâm khi sử dụng.. Giá sản phẩm là 1.290.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-04 16:47:32.634966	BOT	2
43	Ví dài Handmade đơn giản mà chất	2026-07-04 16:47:42.338001	USER	2
44	Các mẫu ví nữ handmade tinh tế đang có sẵn:	2026-07-04 16:47:44.887933	BOT	2
45	Ví dài Handmade đơn giản mà chất	2026-07-04 16:49:36.823047	USER	2
46	Ví dài Handmade đơn giản mà chất	2026-07-04 16:51:11.142044	USER	2
47	Dạ, Ví dài Handmade đơn giản mà chất là một trong những sản phẩm nổi bật của thể loại Trang sức & Đồ da. Ví dài Handmade đơn giản mà chất\n\n- Kích thước: 20cm x 9cm\n\n- Chất liệu: Da bò nhập khẩu\n\n- Kiểu dáng: Ví đứng, khóa kéo\n\nGiá sản phẩm là 359.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-04 16:51:24.505713	BOT	2
48	Dạ, Ví dài Handmade đơn giản mà chất là một trong những sản phẩm nổi bật của thể loại Văn phòng & Học tập. Hiện shop đang còn 15 sản phẩm trong kho ạ.\n\n- Ví dài Handmade đơn giản mà chất\n\n- Kích thước : 9cm x 20cm\n\n- Chất liệu : Da bò thiên nhiên cao cấp\nGiá sản phẩm là 389.000 VNĐ 🛒	2026-07-04 16:51:41.305357	BOT	2
49	l	2026-07-04 16:52:25.744681	USER	2
50	Các mẫu ví nữ handmade tinh tế đang có sẵn: 🎨\n\n- Ví cầm tay khóa kéo dáng đứng - Dáng dài giá 265.000 VNĐ, kích thước 17cm x 9cm.\n\n- Ví đặt túi tiền - Dáng đứng giá 409.000 VNĐ, kích thước 19cm x 8cm.\n\n- Ví cầm tay khóa kéo dáng đứng - Dáng đứng giá 359.000 VNĐ, kích thước 20cm x 9cm.\n\nBạn có muốn đặt hàng không?	2026-07-04 16:52:54.550689	BOT	2
51	chào em 	2026-07-04 17:00:50.168754	USER	1
52	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-04 17:01:14.654468	BOT	1
53	có bán đồ không	2026-07-05 12:23:50.979361	USER	1
54	Shop có nhiều mẫu sản phẩm handmade tinh tế, giúp bạn sáng tạo và trau chuốt mỗi góc nhỏ trong nhà 💖. Bạn có muốn tìm hiểu không?	2026-07-05 12:24:08.990689	BOT	1
55	hi	2026-07-05 12:24:12.78091	USER	1
56	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-05 12:24:20.559463	BOT	1
57	các sản phẩm tốt nhất 	2026-07-05 12:24:27.585445	USER	1
58	Shop có nhiều mẫu sản phẩm handmade tinh tế, giúp bạn sáng tạo và trau chuốt mỗi góc nhỏ trong nhà 💖. Bạn có muốn tìm hiểu không?	2026-07-05 12:24:33.155758	BOT	1
59	có quà tặng không	2026-07-05 12:24:43.596239	USER	1
60	Các sản phẩm thủ công mỹ nghệ đều được gói cẩn thận để tặng người thân 🎁. Shop cũng thường xuyên có ưu đãi, bạn nhớ theo dõi để không bỏ lỡ nhé!	2026-07-05 12:24:49.725402	BOT	1
61	sản phẩm tốt nhất 	2026-07-05 12:26:17.052754	USER	1
62	Shop có nhiều mẫu sản phẩm handmade tinh tế, giúp bạn sáng tạo và trau chuốt mỗi góc nhỏ trong nhà 💖. Bạn có muốn tìm hiểu không?	2026-07-05 12:26:22.754097	BOT	1
63	hi	2026-07-05 12:26:26.000038	USER	1
64	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-05 12:26:34.053159	BOT	1
65	xin chào 	2026-07-05 12:26:53.717622	USER	1
66	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-05 12:26:59.059125	BOT	1
67	0966666666	2026-07-05 12:27:03.147277	USER	1
68	Đây là các sản phẩm nổi bật của shop: 🎉 Bộ dụng cụ viết truy nhập văn phòng bút lông và mực - 475.000 VNĐ 📢 Gối tựa lưng ô tô xe hơi thiết kế độc đáo - 299.000 VNĐ 💡 Thảm lau chân thông minh với nhiều công dụng tiện lợi - 189.000 VNĐ 💪 Bộ dao nhà bếp Thái Lan sang trọng chất lượng cao - 450.000 VNĐ 📖 Bộ sách học tiếng Anh từ cơ bản đến nâng cao - 269.000 VNĐ Hiện shop đang còn 3 sản phẩm trong kho ạ.	2026-07-05 12:27:27.327803	BOT	1
69	hi\\	2026-07-05 12:27:35.619512	USER	1
70	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-05 12:27:44.334647	BOT	1
71	xin chào 	2026-07-05 12:29:48.329539	USER	1
72	Cảm ơn bạn đã quan tâm! Vui lòng để lại số điện thoại, chúng tôi sẽ tư vấn cụ thể hơn ạ.	2026-07-05 12:29:53.730193	BOT	1
73	tui muốn tìm quà tặng 	2026-07-05 12:30:00.722091	USER	1
74	Shop có nhiều mẫu sản phẩm handmade tinh tế, giúp bạn sáng tạo và trau chuốt mỗi góc nhỏ trong nhà 💖. Bạn có muốn tìm hiểu không?	2026-07-05 12:30:06.758326	BOT	1
75	có quà tặng không 	2026-07-05 12:30:27.829596	USER	1
76	Các sản phẩm thủ công mỹ nghệ đều được gói cẩn thận để tặng người thân 🎁. Shop cũng thường xuyên có ưu đãi, bạn nhớ theo dõi để không bỏ lỡ nhé!	2026-07-05 12:30:35.229409	BOT	1
77	hi	2026-07-05 12:32:25.367353	USER	1
78	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-05 12:32:33.390623	BOT	1
79	sản phẩm hot nhất là gì 	2026-07-05 12:32:40.655876	USER	1
80	Shop có nhiều mẫu sản phẩm handmade tinh tế, giúp bạn sáng tạo và trau chuốt mỗi góc nhỏ trong nhà 💖. Hiện shop đang còn 20 sản phẩm trong kho ạ.	2026-07-05 12:32:48.022422	BOT	1
81	cho xem thêm sản phẩm 	2026-07-05 12:32:55.59056	USER	1
82	Đây là các sản phẩm nổi bật của shop: 🎉 Bộ dụng cụ viết truy nhập văn phòng bút lông và mực - 475.000 VNĐ 📢 Gối tựa lưng ô tô xe hơi thiết kế độc đáo - 299.000 VNĐ 💡 Thảm lau chân thông minh với nhiều công dụng tiện lợi - 189.000 VNĐ 💪 Bộ dao nhà bếp Thái Lan sang trọng chất lượng cao - 450.000 VNĐ 📖 Bộ sách học tiếng Anh từ cơ bản đến nâng cao - 269.000 VNĐ Hiện shop đang còn 3 sản phẩm trong kho ạ.	2026-07-05 12:33:20.511065	BOT	1
83	có vòng tay handmade không	2026-07-05 12:33:33.53687	USER	1
84	Shop có nhiều mẫu trang sức handmade xinh xắn, giúp bạn thêm phần nữ tính và lịch sự 🎉 Hiện shop đang còn 6 sản phẩm trong kho. Bạn có muốn đặt hàng không?	2026-07-05 12:33:40.456967	BOT	1
85	Túi xách nữ Handmade da bò retro giá bao nhiêu	2026-07-05 12:44:27.163285	USER	1
86	Dạ, Túi xách nữ Handmade da bò retro là một trong những sản phẩm nổi bật của thể loại Đồ da 🎉 Hiện shop đang còn 10 sản phẩm trong kho. Bạn có muốn đặt hàng không?	2026-07-05 12:46:01.834764	BOT	1
87	Vòng tay Handmade da thật	2026-07-05 12:46:16.401591	USER	1
88	Dạ, Vòng tay Handmade da thật là một trong những sản phẩm nổi bật của thể loại Trang sức 🎉 Hiện shop đang còn 12 sản phẩm trong kho. Bạn có muốn đặt hàng không?	2026-07-05 12:46:23.54507	BOT	1
89	giá bao nhiêu	2026-07-05 12:46:32.749657	USER	1
90	Chào bạn, sản phẩm Vòng tay Handmade da thật hiện đang có giá là 480.000 VNĐ. Chất liệu: Da bò Nhập khẩu ✔️ Size phù hợp cổ tay từ 15cm đến 23cm 💡 Hiện shop đang còn 9 sản phẩm trong kho. Bạn có muốn đặt hàng không?	2026-07-05 12:46:45.355393	BOT	1
91	ví da bò bao nhiêu 	2026-07-05 12:46:53.920905	USER	1
92	Chào bạn, sản phẩm Ví nữ Handmade da bò retro hiện đang có giá là 470.000 VNĐ 💡 Hiện shop đang còn 16 sản phẩm trong kho. Bạn có muốn đặt hàng không?	2026-07-05 12:47:05.221192	BOT	1
93	muốn mua 	2026-07-05 12:47:10.179274	USER	1
94	Chào bạn, shop đang còn 12 sản phẩm trong kho ạ. Bạn có muốn đặt hàng không?	2026-07-05 12:47:17.651156	BOT	1
95	có 	2026-07-05 12:47:22.325679	USER	1
96	Đây là thông tin chi tiết của sản phẩm Ví nữ Handmade da bò retro: 💡 Hiện shop đang còn 16 sản phẩm trong kho 💳 Mã sản phẩm: T0465 💡 Chất liệu: Da bò Nhập khẩu 💡 Size phù hợp cổ tay từ 15cm đến 23cm 💢 Giá sản phẩm là 470.000 VNĐ 💥 Để đặt hàng, bạn nhấn vào nút MUA NGAY hoặc chọn CHAT với shop để được tư vấn thêm nhé!	2026-07-05 12:47:51.16497	BOT	1
97	hi	2026-07-05 13:42:04.050642	USER	3
98	Chào bạn, shop có nhiều món đồ handmade xinh xắn. Bạn xem thử nhé:	2026-07-05 13:42:19.719773	BOT	3
99	toi muốn mua vỏ gối 	2026-07-05 13:42:28.217205	USER	3
100	Dạ, Shop đang còn 20 sản phẩm trong kho ạ. Giá sản phẩm là 75.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-05 13:42:33.722924	BOT	3
101	cần thêm thoogn tin về vỏ gối 	2026-07-05 13:42:46.273503	USER	3
102	Vỏ gối handmade cao cấp, nhiều màu sắc cho bạn lựa chọn. Giá sản phẩm là 75.000 VNĐ. Bạn có muốn đặt hàng không ạ?	2026-07-05 13:42:52.09117	BOT	3
103	có link sản phẩm không	2026-07-05 13:42:59.250419	USER	3
104	Dạ, shop vừa gửi link sản phẩm đến bạn rồi ạ. Bạn có thể bấm vào đây để xem thêm: Vỏ gối handmade cao cấp, nhiều màu sắc cho bạn lựa chọn. Giá sản phẩm là 75.000 VNĐ.	2026-07-05 13:43:06.976554	BOT	3
105	chính sách đổi trả 	2026-07-05 13:43:16.199124	USER	3
106	Shop nhận đổi/hoàn tiền trong 30 ngày nếu sản phẩm bị hư hỏng hoặc sai màu. Shop hỗ trợ vận chuyển toàn quốc và miễn phí ship đơn hàng từ 499.000 VNĐ. Bạn có thể xem chi tiết chính sách bảo hành & đổi trả tại đây: Chính sách bảo hành & đổi trả	2026-07-05 13:43:25.500453	BOT	3
107	cách mua hàng thì sao	2026-07-05 13:43:33.640579	USER	3
108	Shop hỗ trợ đặt hàng online và nhận hàng tại shop. Hiện shop đang có 5 showroom trên toàn quốc. Bạn có thể xem chi tiết tại đây: Shop vật liệu xây dựng Handmade shop	2026-07-05 13:43:39.604285	BOT	3
109	quy trình mua hàng 	2026-07-05 13:43:49.592848	USER	3
110	Để đặt hàng, bạn chọn sản phẩm cần mua trong danh sách và thêm vào giỏ hàng nhé!	2026-07-05 13:43:53.37627	BOT	3
111	có những phương thức thanh toán nào 	2026-07-05 13:44:01.135346	USER	3
112	Shop nhận chuyển khoản và COD (Thanh toán khi nhận hàng). Bạn có thể xem chi tiết tại đây: Chính sách giao hàng & thanh toán	2026-07-05 13:44:06.241019	BOT	3
113	sao chat nguuu v 	2026-07-05 13:44:11.474169	USER	3
114	Chào bạn, shop có nhiều món đồ handmade xinh xắn. Bạn xem thử nhé:	2026-07-05 13:44:15.53248	BOT	3
115	hi	2026-07-07 13:44:31.870219	USER	1
116	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-07 13:46:07.560682	BOT	1
117	mua túi ví 	2026-07-07 13:49:59.592022	USER	1
118	Đây là các sản phẩm nổi bật của thể loại Đồ da: 💡 Túi xách nữ Handmade da bò retro - Giá sản phẩm là 475.000 VNĐ 💢 Mã sản phẩm: T0463 💡 Ví nữ Handmade da bò retro - Giá sản phẩm là 470.000 VNĐ 💢 Mã sản phẩm: T0465 Hiện shop đang còn 12 sản phẩm trong kho. Bạn có muốn đặt hàng không?	2026-07-07 13:50:16.398	BOT	1
119	hi	2026-07-08 10:36:35.842441	USER	1
120	Chào bạn, mình là trợ lý AI thông minh chuyên tư vấn của shop 🎉. Mình có nhiều mẫu đồ handmade xinh xắn đang chờ bạn đến khám phá 🧡. Bạn có muốn đặt hàng không?	2026-07-08 10:38:32.946485	BOT	1
121	hi	2026-09-15 16:54:25.458011	USER	4
\.


--
-- TOC entry 5306 (class 0 OID 34453)
-- Dependencies: 252
-- Data for Name: chat_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_sessions (id, anonymous_id, created_at, is_anonymous, status, updated_at, user_id) FROM stdin;
1	\N	2026-07-04 12:58:26.737681	f	ACTIVE	2026-07-04 12:58:26.737681	3
2	\N	2026-07-04 16:24:46.398752	f	ACTIVE	2026-07-04 16:24:46.398752	5
3	\N	2026-07-05 13:42:04.001747	f	ACTIVE	2026-07-05 13:42:04.001747	1358040476
4	\N	2026-09-15 16:54:25.360546	f	ACTIVE	2026-09-15 16:54:25.360546	717404739
\.


--
-- TOC entry 5308 (class 0 OID 34463)
-- Dependencies: 254
-- Data for Name: lucky_prizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lucky_prizes (id, color, description, icon, name, text_color, type, value) FROM stdin;
1	#b43c50		🎁	Voucher 20%	#ffffff	discount	20
2	#c41e3a		🎁	Chúc may mắn	#ffffff	empty	0
3	#60c21e		🎁	Giảm 20k	#ffffff	voucher	20000
4	#c2a71e		🎁	Giảm 50%	#ffffff	discount	50
\.


--
-- TOC entry 5310 (class 0 OID 34475)
-- Dependencies: 256
-- Data for Name: order_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_history (id, action, changes, new_payment_status, new_status, note, old_payment_status, old_status, order_id, performed_at, performed_by, performed_by_role) FROM stdin;
1	STATUS_CHANGED	\N	\N	Đang xử lý		\N	Chờ thanh toán	ORD-1783094844064	2026-07-03 23:08:51.748258	ADMIN	ADMIN
2	STATUS_CHANGED	\N	\N	Đang giao hàng		\N	Đang xử lý	ORD-1783094844064	2026-07-03 23:08:55.740248	ADMIN	ADMIN
3	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Đang giao hàng	ORD-1783094844064	2026-07-03 23:09:00.162469	ADMIN	ADMIN
4	STATUS_CHANGED	\N	\N	Đang xử lý		\N	Chờ thanh toán	ORD-1783095811922	2026-07-03 23:26:06.216235	ADMIN	ADMIN
5	STATUS_CHANGED	\N	\N	Đang giao hàng		\N	Đang xử lý	ORD-1783095811922	2026-07-03 23:26:09.590601	ADMIN	ADMIN
6	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Đang giao hàng	ORD-1783095811922	2026-07-03 23:26:13.176525	ADMIN	ADMIN
7	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Thanh toán khi nhận hàng	ORD-1783095801528	2026-07-04 11:13:12.732683	ADMIN	ADMIN
8	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Thanh toán khi nhận hàng	ORD-1783158739731	2026-07-04 16:54:57.993704	ADMIN	ADMIN
9	STATUS_CHANGED	\N	\N	Đã thanh toán		\N	Chờ thanh toán	ORD-1783146437599	2026-07-04 17:12:58.598122	ADMIN	ADMIN
10	STATUS_CHANGED	\N	\N	Đang giao hàng		\N	Đã thanh toán	ORD-1783146437599	2026-07-04 17:13:02.338144	ADMIN	ADMIN
11	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Đang giao hàng	ORD-1783146437599	2026-07-04 17:13:06.101817	ADMIN	ADMIN
12	STATUS_CHANGED	\N	\N	Đã thanh toán		\N	Chờ thanh toán	ORD-1783145783112	2026-07-04 17:13:12.81204	ADMIN	ADMIN
13	STATUS_CHANGED	\N	\N	Đã thanh toán		\N	COMPLETED	ORD-1780286029804	2026-07-04 17:13:17.256773	ADMIN	ADMIN
14	STATUS_CHANGED	\N	\N	Đã thanh toán		\N	COMPLETED	ORD-1780286122738	2026-07-04 17:13:20.780932	ADMIN	ADMIN
15	STATUS_CHANGED	\N	\N	Đã thanh toán		\N	Chờ thanh toán	ORD-1783233902360	2026-07-05 13:46:16.391514	ADMIN	ADMIN
16	STATUS_CHANGED	\N	\N	Đang xử lý		\N	Đã thanh toán	ORD-1783233902360	2026-07-05 13:46:39.138683	ADMIN	ADMIN
17	STATUS_CHANGED	\N	\N	Đang giao hàng		\N	Đang xử lý	ORD-1783233902360	2026-07-05 13:46:42.645332	ADMIN	ADMIN
18	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Đang giao hàng	ORD-1783233902360	2026-07-05 13:46:57.500459	ADMIN	ADMIN
19	STATUS_CHANGED	\N	\N	Đang xử lý		\N	Đã thanh toán	ORD-1783145783112	2026-07-05 13:47:24.06386	ADMIN	ADMIN
20	STATUS_CHANGED	\N	\N	Đang xử lý		\N	Thanh toán khi nhận hàng	ORD-1783145771949	2026-07-05 13:58:40.369795	ADMIN	ADMIN
21	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Đang xử lý	ORD-1783145783112	2026-07-05 14:27:22.620071	ADMIN	ADMIN
22	STATUS_CHANGED	\N	\N	Đang giao hàng		\N	Thanh toán khi nhận hàng	ORD-1780285718370	2026-07-05 14:27:49.506374	ADMIN	ADMIN
23	STATUS_CHANGED	\N	\N	Hoàn thành		\N	Thanh toán khi nhận hàng	ORD-1780285803444	2026-07-05 14:34:19.55163	ADMIN	ADMIN
24	CANCELLED	\N	\N	Đã hủy	Hủy bởi Admin:  vcn	\N	Đang xử lý	ORD-1783145771949	2026-07-05 14:38:49.864404	ADMIN	ADMIN
\.


--
-- TOC entry 5297 (class 0 OID 34377)
-- Dependencies: 243
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, variant_id, product_name, price, quantity) FROM stdin;
1	ORD-SAMPLE01	1	1	Handmade Leather Bag	499000	1
8	ORD-1780029901734	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	16
9	ORD-1780029901734	3	22	Vòng tay Handmade da thật	180000	13
10	ORD-1780029901734	5	5	Balo nữ da bò thật Handmade đẹp	1400000	4
11	ORD-1780029901734	6	6	Ví dài Handmade đơn giản mà chất	320000	9
12	ORD-1780029901734	7	7	Balo nữ da thật Handmade độc đẹp lạ	430000	5
13	ORD-1780029901734	8	8	Thắt lưng da Cá sấu bản 3.4cm khóa tự động	1100000	1
14	ORD-1780029901734	9	9	Thắt lưng da Cá Sấu mặt chữ Z	1200000	2
15	ORD-1780030595659	3	22	Vòng tay Handmade da thật	180000	10
16	ORD-1780031790327	3	22	Vòng tay Handmade da thật	180000	10
17	ORD-1780032279236	3	22	Vòng tay Handmade da thật	180000	10
18	ORD-1780032476848	3	22	Vòng tay Handmade da thật	180000	10
19	ORD-1780032702504	3	22	Vòng tay Handmade da thật	180000	10
20	ORD-1780032838610	3	22	Vòng tay Handmade da thật	180000	10
21	ORD-1780033299260	3	22	Vòng tay Handmade da thật	180000	10
22	ORD-1780033836022	3	22	Vòng tay Handmade da thật	180000	10
23	ORD-1780033919841	3	22	Vòng tay Handmade da thật	180000	10
24	ORD-1780034043013	3	22	Vòng tay Handmade da thật	180000	10
25	ORD-1780034068812	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
26	ORD-1780034753809	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
27	ORD-1780034964524	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
28	ORD-1780042164253	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
29	ORD-1780067890733	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
30	ORD-1780068091355	3	22	Vòng tay Handmade da thật	180000	1
31	ORD-1780068091355	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
32	ORD-1780069790646	3	22	Vòng tay Handmade da thật	180000	1
33	ORD-1780069790646	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
34	ORD-1780069937279	3	22	Vòng tay Handmade da thật	180000	1
35	ORD-1780069937279	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
36	ORD-1780070164291	3	22	Vòng tay Handmade da thật	180000	1
37	ORD-1780070164291	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
38	ORD-1780070395548	3	22	Vòng tay Handmade da thật	180000	1
39	ORD-1780070395548	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
40	ORD-1780070553227	3	22	Vòng tay Handmade da thật	180000	1
41	ORD-1780070553227	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
42	ORD-1780070851881	3	22	Vòng tay Handmade da thật	180000	1
43	ORD-1780070851881	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
44	ORD-1780070943571	3	22	Vòng tay Handmade da thật	180000	1
45	ORD-1780070943571	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
46	ORD-1780071075547	3	22	Vòng tay Handmade da thật	180000	1
47	ORD-1780071075547	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
48	ORD-1780071355661	3	22	Vòng tay Handmade da thật	180000	1
49	ORD-1780071355661	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
50	ORD-1780071456884	3	22	Vòng tay Handmade da thật	180000	1
51	ORD-1780071456884	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
52	ORD-1780234698621	3	22	Vòng tay Handmade da thật	180000	1
53	ORD-1780234698621	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
54	ORD-1780236096312	3	22	Vòng tay Handmade da thật	180000	1
55	ORD-1780236096312	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
56	ORD-1780236707508	3	22	Vòng tay Handmade da thật	180000	1
57	ORD-1780236707508	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
58	ORD-1780236795242	3	22	Vòng tay Handmade da thật	180000	1
59	ORD-1780236795242	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
60	ORD-1780236982940	3	22	Vòng tay Handmade da thật	180000	1
61	ORD-1780236982940	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
62	ORD-1780237075870	3	22	Vòng tay Handmade da thật	180000	1
63	ORD-1780237075870	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
64	ORD-1780237408356	3	22	Vòng tay Handmade da thật	180000	1
65	ORD-1780237408356	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
66	ORD-1780237554538	3	22	Vòng tay Handmade da thật	180000	1
67	ORD-1780237554538	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
68	ORD-1780237648545	3	22	Vòng tay Handmade da thật	180000	1
69	ORD-1780237648545	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
70	ORD-1780237752280	3	22	Vòng tay Handmade da thật	180000	1
71	ORD-1780237752280	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
72	ORD-1780237860840	3	22	Vòng tay Handmade da thật	180000	1
73	ORD-1780237860840	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
74	ORD-1780238004376	3	22	Vòng tay Handmade da thật	180000	1
75	ORD-1780238004376	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
76	ORD-1780241189434	3	22	Vòng tay Handmade da thật	180000	1
77	ORD-1780241189434	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
78	ORD-1780241215638	3	22	Vòng tay Handmade da thật	180000	1
79	ORD-1780241965647	3	22	Vòng tay Handmade da thật	180000	1
80	ORD-1780242422725	3	22	Vòng tay Handmade da thật	180000	1
81	ORD-1780243184061	3	22	Vòng tay Handmade da thật	180000	1
82	ORD-1780243545694	3	22	Vòng tay Handmade da thật	180000	1
83	ORD-1780243724811	3	22	Vòng tay Handmade da thật	180000	1
84	ORD-1780244691496	3	22	Vòng tay Handmade da thật	180000	1
85	ORD-1780245033498	3	22	Vòng tay Handmade da thật	180000	1
86	ORD-1780245169878	3	22	Vòng tay Handmade da thật	180000	1
87	ORD-1780245473699	3	22	Vòng tay Handmade da thật	180000	1
88	ORD-1780245812675	3	22	Vòng tay Handmade da thật	180000	1
89	ORD-1780246095978	3	22	Vòng tay Handmade da thật	180000	1
90	ORD-1780246426057	3	22	Vòng tay Handmade da thật	180000	1
91	ORD-1780247129492	3	22	Vòng tay Handmade da thật	180000	1
92	ORD-1780247252209	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
93	ORD-1780247252209	3	22	Vòng tay Handmade da thật	180000	1
94	ORD-1780247784656	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
95	ORD-1780247784656	3	22	Vòng tay Handmade da thật	180000	1
96	ORD-1780247879887	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
97	ORD-1780247879887	3	22	Vòng tay Handmade da thật	180000	1
98	ORD-1780248805229	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
99	ORD-1780248805229	3	22	Vòng tay Handmade da thật	180000	1
100	ORD-1780281561077	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
101	ORD-1780281561077	3	22	Vòng tay Handmade da thật	180000	1
102	ORD-1780282139428	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
103	ORD-1780282139428	3	22	Vòng tay Handmade da thật	180000	1
104	ORD-1780282765027	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
105	ORD-1780282765027	3	22	Vòng tay Handmade da thật	180000	1
106	ORD-1780285718370	1	1	Handmade Leather Bag	499000	1
107	ORD-1780285718370	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
108	ORD-1780285718370	3	22	Vòng tay Handmade da thật	180000	1
109	ORD-1780285718370	6	6	Ví dài Handmade đơn giản mà chất	320000	1
110	ORD-1780285738925	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
111	ORD-1780285738925	3	22	Vòng tay Handmade da thật	180000	1
112	ORD-1780285803444	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	1
113	ORD-1780285803444	3	22	Vòng tay Handmade da thật	180000	1
114	ORD-1780286029804	2	2	Túi xách nữ Handmade da bò retro thời trang	9000000	2
115	ORD-1780286029804	3	22	Vòng tay Handmade da thật	180000	1
116	ORD-1780286122738	1	1	Handmade Leather Bag	499000	1
117	ORD-1780286122738	3	22	Vòng tay Handmade da thật	180000	1
118	ORD-1783094844064	1	1	Handmade Leather Bag	499000	1
119	ORD-1783094844064	3	22	Vòng tay Handmade da thật	180000	1
120	ORD-1783095801528	3	22	Vòng tay Handmade da thật	180000	1
121	ORD-1783095811922	1	1	Handmade Leather Bag	499000	1
122	ORD-1783145771949	3	22	Vòng tay Handmade da thật	180000	1
123	ORD-1783145771949	4	4	Ví dài nữ da bò handmade	210000	1
124	ORD-1783145771949	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
125	ORD-1783145783112	8	8	Thắt lưng da Cá sấu bản 3.4cm khóa tự động	1100000	1
126	ORD-1783146437599	4	4	Ví dài nữ da bò handmade	210000	1
127	ORD-1783158739731	6	6	Ví dài Handmade đơn giản mà chất	320000	1
128	ORD-1783233902360	148	148	Ghế Sofa Da Onyx Hiện Đại Tối Giản	11599000	1
129	ORD-1783233902360	159	159	Vỏ Gối Tựa Lưng Bắc Âu Nhung Nỉ In Màu 2 Mặt Đen Trắng Sang Trọng	99000	1
130	ORD-1783394116733	5	5	Balo nữ da bò thật Handmade đẹp	1400000	1
131	ORD-1783587832458	4	4	Ví dài nữ da bò handmade	210000	1
132	ORD-1783646475868	3	22	Vòng tay Handmade da thật	180000	1
133	ORD-1783646649977	3	22	Vòng tay Handmade da thật	180000	1
134	ORD-1783646657021	3	22	Vòng tay Handmade da thật	180000	1
135	ORD-1783646686198	148	148	Ghế Sofa Da Onyx Hiện Đại Tối Giản	11599000	1
136	ORD-1783646705260	148	148	Ghế Sofa Da Onyx Hiện Đại Tối Giản	11599000	1
137	ORD-1789466233318	4	4	Ví dài nữ da bò handmade	210000	8
\.


--
-- TOC entry 5295 (class 0 OID 34350)
-- Dependencies: 241
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, full_name, phone, address, total_amount, discount_amount, payable_amount, payment_method, status, voucher_code, vnpay_tran_no, created_at, updated_at) FROM stdin;
ORD-SAMPLE01	2	Người dùng Test	0987654321	123 Đường Linh Đông, Thủ Đức, HCM	499000	50000	449000	VNPAY	COMPLETED	\N	VNP1432119	2026-05-26 14:58:48.205477	2026-05-26 14:58:48.205477
ORD-1780029901734	3	Nam	0987654321	111, Phường Bình Hàn, Thành phố Hải Dương, Tỉnh Phú Thọ	160470000	100000	160370000	COD	Thanh toán khi nhận hàng	HANDMADE203	\N	2026-05-29 11:45:01.999138	2026-05-29 11:45:01.999138
ORD-1780030595659	3	THuan	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1800000	100000	1700000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 11:56:35.711604	2026-05-29 11:56:35.711604
ORD-1780031790327	3	Thuan	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	1800000	0	1800000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 12:16:30.380614	2026-05-29 12:16:30.380614
ORD-1780032279236	3	thaun	0987654321	â, Xã Tu Vũ, Huyện Thanh Thuỷ, Tỉnh Phú Thọ	1800000	0	1800000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 12:24:39.308006	2026-05-29 12:24:39.308006
ORD-1780032476848	3	t	0987654321	aaa, Xã Hồng Phong, Huyện Thanh Miện, Tỉnh Hải Dương	1800000	0	1800000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 12:27:56.85182	2026-05-29 12:27:56.85182
ORD-1780032702504	3	t	0987654321	aa, Xã Đồng Trung, Huyện Thanh Thuỷ, Tỉnh Phú Thọ	1800000	100000	1700000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 12:31:42.506792	2026-05-29 12:31:42.506792
ORD-1780032838610	3	t	0987654321	ăd, Xã Kiến Phúc, Huyện Ninh Giang, Tỉnh Hải Dương	1800000	100000	1700000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 12:33:58.666718	2026-05-29 12:33:58.666718
ORD-1780033299260	3	t	0987654321	a, Phường Liên Bảo, Thành phố Vĩnh Yên, Tỉnh Vĩnh Phúc	1800000	100000	1700000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 12:41:39.317551	2026-05-29 12:41:39.317551
ORD-1780033836022	3	t	0987654321	a, Xã Tu Vũ, Huyện Thanh Thuỷ, Tỉnh Phú Thọ	1800000	50000	1750000	VNPAY	Chờ thanh toán	WELCOME504	\N	2026-05-29 12:50:36.062996	2026-05-29 12:50:36.062996
ORD-1780033919841	3	t	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	1800000	0	1800000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 12:51:59.886708	2026-05-29 12:51:59.886708
ORD-1780034043013	3	t	0987654321	tt, Xã Quỳnh Phú, Huyện Gia Bình, Tỉnh Bắc Ninh	1800000	100000	1700000	COD	Thanh toán khi nhận hàng	HANDMADE203	\N	2026-05-29 12:54:03.15601	2026-05-29 12:54:03.15601
ORD-1780034068812	3	t	0987654321	a, Xã Hà Kỳ, Huyện Tứ Kỳ, Tỉnh Hải Dương	1400000	100000	1300000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 12:54:28.8151	2026-05-29 12:54:28.8151
ORD-1780034753809	3	t	0987654321	â, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1400000	100000	1300000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 13:05:53.855047	2026-05-29 13:05:53.855047
ORD-1780034964524	3	t	0987654321	â, Phường Đồng Xuân, Quận Hoàn Kiếm, Thành phố Hà Nội	1400000	100000	1300000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 13:09:24.578196	2026-05-29 13:09:24.578196
ORD-1780042164253	3	t	0987654321	ăd, Xã Phú Lương, Huyện Lương Tài, Tỉnh Bắc Ninh	1400000	100000	1300000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 15:09:24.3204	2026-05-29 15:09:24.3204
ORD-1780067890733	3	t	0987654321	d, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương	1400000	0	1400000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 22:18:10.806157	2026-05-29 22:18:10.806157
ORD-1780068091355	3	t	0988888888	a, Xã An Nhân, Huyện Vĩnh Tường, Tỉnh Vĩnh Phúc	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 22:21:31.392545	2026-05-29 22:21:31.392545
ORD-1780069790646	3	t	0987654321	a, Phường Đình Bảng, Thành phố Từ Sơn, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 22:49:50.6933	2026-05-29 22:49:50.6933
ORD-1780069937279	3	t	0987654321	a, Xã Tân Lập, Huyện Thanh Sơn, Tỉnh Phú Thọ	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 22:52:17.329069	2026-05-29 22:52:17.329069
ORD-1780070164291	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	50000	1530000	VNPAY	Chờ thanh toán	WELCOME504	\N	2026-05-29 22:56:04.332798	2026-05-29 22:56:04.334855
ORD-1780070395548	3	t	0987654321	a, Xã Đông Cứu, Huyện Gia Bình, Tỉnh Bắc Ninh	1580000	100000	1480000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 22:59:55.606867	2026-05-29 22:59:55.606867
ORD-1780070553227	3	t	0987654321	a, Xã Quỳnh Phú, Huyện Gia Bình, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 23:02:33.283317	2026-05-29 23:02:33.283317
ORD-1780070851881	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 23:07:31.931589	2026-05-29 23:07:31.931589
ORD-1780070943571	3	t	0987654321	a, Xã Hồng Phong, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 23:09:03.604039	2026-05-29 23:09:03.604039
ORD-1780071075547	3	t	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 23:11:15.602711	2026-05-29 23:11:15.602711
ORD-1780071355661	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-29 23:15:55.717334	2026-05-29 23:15:55.717334
ORD-1780071456884	3	t	0987654321	a, Phường Phong Châu, Thị xã Phú Thọ, Tỉnh Phú Thọ	1580000	100000	1480000	VNPAY	Chờ thanh toán	HANDMADE203	\N	2026-05-29 23:17:36.923905	2026-05-29 23:17:36.923905
ORD-1780234698621	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 20:38:18.675947	2026-05-31 20:38:18.675947
ORD-1780236096312	3	t	0987654321	a, Xã Quỳnh Phú, Huyện Gia Bình, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:01:36.344839	2026-05-31 21:01:36.344839
ORD-1780236707508	3	t	0987654321	1, Xã Kiến Phúc, Huyện Ninh Giang, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:11:47.555976	2026-05-31 21:11:47.555976
ORD-1780236795242	3	t	0987654321	a, Xã Phú Lương, Huyện Lương Tài, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:13:15.297053	2026-05-31 21:13:15.297053
ORD-1780236982940	3	t	0987654321	1, Xã Đức Bác, Huyện Sông Lô, Tỉnh Vĩnh Phúc	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:16:22.997943	2026-05-31 21:16:22.997943
ORD-1780237075870	3	t	0987654321	a, Xã Kiến Phúc, Huyện Ninh Giang, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:17:55.912209	2026-05-31 21:17:55.912209
ORD-1780237408356	3	t	0987654321	q, Xã Minh Đạo, Huyện Tiên Du, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:23:28.419604	2026-05-31 21:23:28.419604
ORD-1780237554538	3	t	0987654321	a, Xã Nghĩa Đạo, Thị xã Thuận Thành, Tỉnh Bắc Ninh	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:25:54.596061	2026-05-31 21:25:54.596061
ORD-1780237648545	3	t	0987654322	a, Xã Hưng Long, Huyện Ninh Giang, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:27:28.584691	2026-05-31 21:27:28.584691
ORD-1780237752280	3	t	0987654321	a, Xã An Nhân, Huyện Vĩnh Tường, Tỉnh Vĩnh Phúc	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:29:12.335806	2026-05-31 21:29:12.335806
ORD-1780237860840	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:31:00.875695	2026-05-31 21:31:00.875695
ORD-1780238004376	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	1580000	0	1580000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 21:33:24.376966	2026-05-31 21:33:24.376966
ORD-1780241189434	3	t	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	1580000	0	1580000	COD	Thanh toán khi nhận hàng	\N	\N	2026-05-31 22:26:29.590341	2026-05-31 22:26:29.590341
ORD-1780241215638	3	t	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 22:26:55.638899	2026-05-31 22:26:55.638899
ORD-1780241965647	3	t	0987654321	q, Xã Quỳnh Phú, Huyện Gia Bình, Tỉnh Bắc Ninh	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 22:39:25.691411	2026-05-31 22:39:25.691411
ORD-1780242422725	3	t	0987654321	a, Xã Hồng Phong, Huyện Thanh Miện, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 22:47:02.769909	2026-05-31 22:47:02.769909
ORD-1780243184061	3	t	0987654321	a, Xã Hưng Long, Huyện Ninh Giang, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 22:59:44.106837	2026-05-31 22:59:44.106837
ORD-1780243545694	3	a	0987654321	a, Xã Thanh Giang, Huyện Thanh Miện, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:05:45.743214	2026-05-31 23:05:45.743214
ORD-1780243724811	3	t	0987654321	a, Xã Kiến Phúc, Huyện Ninh Giang, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:08:44.865835	2026-05-31 23:08:44.865835
ORD-1780244691496	3	t	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:24:51.552681	2026-05-31 23:24:51.552681
ORD-1780245033498	3	t	0987654321	a, Xã Chi Lăng Nam, Huyện Thanh Miện, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:30:33.560375	2026-05-31 23:30:33.561413
ORD-1780245169878	3	t	0987654321	a, Xã Phú Lương, Huyện Lương Tài, Tỉnh Bắc Ninh	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:32:49.92193	2026-05-31 23:32:49.92193
ORD-1780245473699	3	t	0987654321	a, Xã Hồng Phong, Huyện Thanh Miện, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:37:53.753567	2026-05-31 23:37:53.753567
ORD-1780245812675	3	t	0987654321	a, Xã Kiến Phúc, Huyện Ninh Giang, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:43:32.711163	2026-05-31 23:43:32.711163
ORD-1780246095978	3	t	0987654321	a, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:48:16.033459	2026-05-31 23:48:16.033459
ORD-1780246426057	3	t	0987654321	a, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-05-31 23:53:46.103324	2026-05-31 23:53:46.103324
ORD-1780247129492	3	t	0987654321	a, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương	180000	0	180000	VNPAY	Chờ thanh toán	\N	\N	2026-06-01 00:05:29.548434	2026-06-01 00:05:29.548434
ORD-1780247214218	3	t	0987654321	a, Xã Hồng Phong, Huyện Thanh Miện, Tỉnh Hải Dương	0	0	0	VNPAY	Chờ thanh toán	\N	\N	2026-06-01 00:06:54.297443	2026-06-01 00:06:54.297443
ORD-1780247252209	3	t	0987654321	a, Xã Chi Lăng Nam, Huyện Thanh Miện, Tỉnh Hải Dương	9180000	0	9180000	VNPAY	Chờ thanh toán	\N	\N	2026-06-01 00:07:32.209762	2026-06-01 00:07:32.209762
ORD-1780247784656	3	t	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	9180000	0	9180000	VNPAY	Thanh toán thất bại	\N	\N	2026-06-01 00:16:24.717054	2026-06-01 00:16:25.34006
ORD-1780247879887	3	t	0987654321	a, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương	9180000	0	9180000	VNPAY	Chờ thanh toán	\N	\N	2026-06-01 00:17:59.921785	2026-06-01 00:17:59.921785
ORD-1780248805229	3	t	0987654321	a, Xã Lâm Thao, Huyện Lương Tài, Tỉnh Bắc Ninh	9180000	0	9180000	VNPAY	Chờ thanh toán	\N	\N	2026-06-01 00:33:25.259311	2026-06-01 00:33:25.259311
ORD-1780281561077	3	t	0987654321	a, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương	9180000	0	9180000	VNPAY	Chờ thanh toán	\N	\N	2026-06-01 09:39:21.117195	2026-06-01 09:39:21.117195
ORD-1780282139428	3	t	0987654321	a, Xã Hồng Phong, Huyện Thanh Miện, Tỉnh Hải Dương	9180000	0	9180000	VNPAY	COMPLETED	\N	15563822	2026-06-01 09:48:59.47448	2026-06-01 09:49:26.309994
ORD-1780282765027	3	t	0987654321	a, Xã Thanh Ninh, Huyện Phú Bình, Tỉnh Thái Nguyên	9180000	100000	9080000	VNPAY	COMPLETED	HANDMADE203	15563842	2026-06-01 09:59:25.077467	2026-06-01 09:59:59.230582
ORD-1780285738925	3	t	0987654321	a, Xã Liễu Đô, Huyện Lục Yên, Tỉnh Yên Bái	9180000	50000	9130000	VNPAY	COMPLETED	WELCOME504	15563943	2026-06-01 10:48:58.927565	2026-06-01 10:49:25.283427
ORD-1783094844064	3	Đỗ Khánh Thuận	0987555555	123, Phường Hai Bà Trưng, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc	679000	100000	579000	VNPAY	Hoàn thành	HANDMADE203	\N	2026-07-03 23:07:24.083029	2026-07-03 23:09:00.17198
ORD-1783095811922	3	Đỗ Khánh Thuận	0987555555	123, Phường Hai Bà Trưng, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc	499000	99800	399200	VNPAY	Hoàn thành	HANDMADE203	\N	2026-07-03 23:23:31.929344	2026-07-03 23:26:13.183974
ORD-1783095801528	3	Đỗ Khánh Thuận	0987555555	123, Phường Hai Bà Trưng, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc	180000	50000	130000	COD	Hoàn thành	WELCOME504	\N	2026-07-03 23:23:21.584057	2026-07-04 11:13:12.840251
ORD-1780286029804	3	t	0987654321	a, Xã Liễu Đô, Huyện Lục Yên, Tỉnh Yên Bái	18180000	100000	18080000	VNPAY	Đã thanh toán	HANDMADE203	15563953	2026-06-01 10:53:49.843213	2026-07-04 17:13:17.269413
ORD-1780286122738	3	t	0987654321	a, Xã Liễu Đô, Huyện Lục Yên, Tỉnh Yên Bái	679000	100000	579000	VNPAY	Đã thanh toán	HANDMADE203	15563959	2026-06-01 10:55:22.738914	2026-07-04 17:13:20.782622
ORD-1780285718370	3	t	0987654321	a, Xã Liễu Đô, Huyện Lục Yên, Tỉnh Yên Bái	9999000	100000	9899000	COD	Đang giao hàng	HANDMADE203	\N	2026-06-01 10:48:38.52428	2026-07-05 14:27:49.520382
ORD-1780285803444	3	t	0987654321	a, Xã Liễu Đô, Huyện Lục Yên, Tỉnh Yên Bái	9180000	50000	9130000	COD	Hoàn thành	WELCOME504	\N	2026-06-01 10:50:03.484476	2026-07-05 14:34:19.604414
ORD-1783145771949	5	Khánh Thuân	0333401545	159 Nguyễn Trung Trực, Xã Hoài Mỹ, Thị xã Hoài Nhơn, Tỉnh Bình Định	1790000	50000	1740000	COD	Đã hủy	WELCOME504	\N	2026-07-04 13:16:12.048105	2026-07-05 14:38:49.879204
ORD-1783158739731	5	Khánh Thuân	0333401545	159 Nguyễn Trung Trực, Xã Hoài Mỹ, Thị xã Hoài Nhơn, Tỉnh Bình Định	320000	64000	256000	COD	Hoàn thành	HANDMADE203	\N	2026-07-04 16:52:19.812726	2026-07-04 16:54:58.004996
ORD-1783146437599	5	Khánh Thuân	0333401545	159 Nguyễn Trung Trực, Xã Hoài Mỹ, Thị xã Hoài Nhơn, Tỉnh Bình Định	210000	42000	168000	VNPAY	Hoàn thành	HANDMADE203	\N	2026-07-04 13:27:17.612322	2026-07-04 17:13:06.11121
ORD-1783233902360	5	Khánh Thuận	0933023113	109 Diên Hồng, Xã Tân Dĩnh, Huyện Lạng Giang, Tỉnh Bắc Giang	11698000	50000	11648000	VNPAY	Hoàn thành	WELCOME504	\N	2026-07-05 13:45:02.378002	2026-07-05 13:46:57.508036
ORD-1783145783112	5	Khánh Thuân	0333401545	159 Nguyễn Trung Trực, Xã Hoài Mỹ, Thị xã Hoài Nhơn, Tỉnh Bình Định	1100000	100000	1000000	VNPAY	Hoàn thành	HANDMADE203	\N	2026-07-04 13:16:23.118627	2026-07-05 14:27:22.726179
ORD-1783394116733	3	Đỗ Khánh Thuận	0987555555	123, Phường Hai Bà Trưng, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc	1400000	50000	1350000	COD	Thanh toán khi nhận hàng	LUCKYB2S5J	\N	2026-07-07 10:15:16.8089	2026-07-07 10:15:16.8089
ORD-1783587832458	3	Đỗ Khánh Thuận	0987555555	123, Phường Hai Bà Trưng, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc	210000	50	209950	VNPAY	Chờ thanh toán	LUCKY_270A5F	\N	2026-07-09 16:03:52.471897	2026-07-09 16:03:52.471897
ORD-1783646475868	8	THuna	0987654321	aa, Phường Hợp Giang, Thành phố Cao Bằng, Tỉnh Cao Bằng	180000	20000	160000	COD	Thanh toán khi nhận hàng	LUCKY_8F3371	\N	2026-07-10 08:21:15.911488	2026-07-10 08:21:15.911488
ORD-1783646649977	8	THuna	0987654321	aa, Xã Bằng Vân, Huyện Ngân Sơn, Tỉnh Bắc Kạn	180000	50	179950	VNPAY	Chờ thanh toán	LUCKY_270A5F	\N	2026-07-10 08:24:09.977028	2026-07-10 08:24:09.977028
ORD-1783646657021	8	THuna	0987654321	aa, Xã Bằng Vân, Huyện Ngân Sơn, Tỉnh Bắc Kạn	180000	50	179950	COD	Thanh toán khi nhận hàng	LUCKY_270A5F	\N	2026-07-10 08:24:17.039852	2026-07-10 08:24:17.039852
ORD-1783646686198	8	THuna	0987654321	aa, Xã Thắng Mố, Huyện Yên Minh, Tỉnh Hà Giang	11599000	20	11598980	COD	Thanh toán khi nhận hàng	LUCKY_BF29EF	\N	2026-07-10 08:24:46.211317	2026-07-10 08:24:46.211317
ORD-1783646705260	8	THuna	0987654321	aa, Xã Lương Thông, Huyện Hà Quảng, Tỉnh Cao Bằng	11599000	50	11598950	COD	Thanh toán khi nhận hàng	LUCKY_00823C	\N	2026-07-10 08:25:05.276562	2026-07-10 08:25:05.276562
ORD-1789466233318	3	đâ	0987654321	123, Phường Hai Bà Trưng, Thành phố Phúc Yên, Tỉnh Vĩnh Phúc	1680000	0	1680000	VNPAY	Chờ thanh toán	\N	\N	2026-09-15 16:57:13.375011	2026-09-15 16:57:13.375011
\.


--
-- TOC entry 5298 (class 0 OID 34405)
-- Dependencies: 244
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (code, name, is_active, config_json, updated_at) FROM stdin;
VNPAY	Cổng thanh toán VNPAY (Môi trường Thật)	t	{"vnp_Url":"https://sandbox.vnpayment.vn/paymentv2/vpcpay.html","vnp_TmnCode":"HAFY0QN2","vnp_HashSecret":"WFJUM4DTUZ03PV027MNNX0E9K2FCHQMX","vnp_ReturnUrl":"http://localhost:3000/payment-success"}	2026-06-01 12:32:28.71717
COD	Thanh toán khi nhận hàng (COD)	t	{}	2026-06-01 12:57:16.222961
\.


--
-- TOC entry 5289 (class 0 OID 34271)
-- Dependencies: 235
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_url, is_featured, created_at) FROM stdin;
1	1	https://example.com/bag.jpg	t	2026-05-26 14:58:31.730679
2	2	https://product.hstatic.net/1000260559/product/tui_xach_nu__1__acaea5fbd93844ee83531408f5d294ee_grande.jpg	t	2026-05-26 14:58:31.730679
3	3	https://product.hstatic.net/1000260559/product/vong_tay_handmade_da_that__3__grande.jpg	t	2026-05-26 14:58:31.730679
4	4	https://product.hstatic.net/1000260559/product/vi_dai_nu__3__f301f02c16b24e2c83f90e0a2058ab30_grande.jpg	t	2026-05-26 14:58:31.730679
5	5	https://product.hstatic.net/1000260559/product/ghds_grande.jpg	t	2026-05-26 14:58:31.730679
6	6	https://product.hstatic.net/1000260559/product/125940__6__master.jpg	t	2026-05-26 14:58:31.730679
7	7	https://product.hstatic.net/1000260559/product/4554239993_1515578525_grande.jpg	t	2026-05-26 14:58:31.730679
8	8	https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-ban-3-4cm-khoa-tu-dong-nau-4409716__1__2e12ac4497dd41b19dfd58fe6fb04e7d_master.jpg	t	2026-05-26 14:58:31.730679
9	9	https://product.hstatic.net/1000260559/product/that_lung_da_ca_sau_mat_chu_z_ban_3_8_-_2837072__4__1f077a541f9142388345e45c6e4e2005_master.jpg	t	2026-05-26 14:58:31.730679
10	10	https://product.hstatic.net/1000260559/product/that-lung-da-bo-khoa-cai-tien-loi-4290845__4__20ac7092dca74e0b9227728cbd4882c2_master.jpg	t	2026-05-26 14:58:31.730679
11	11	https://product.hstatic.net/1000260559/product/that-lung-nam-cong-so-van-ca-sau-3014191__2__69ab0ccada804f4db85cf03ec5ddff6d_master.jpg	t	2026-05-26 14:58:31.730679
12	12	https://product.hstatic.net/1000260559/product/that-lung-da-bo-dap-van-ca-sau-mat-vuong-5_529a265de7d745e59a126e3ea43abd32_master.jpg	t	2026-05-26 14:58:31.730679
13	13	https://product.hstatic.net/1000260559/product/o1cn01l56sqm1biwda9dmjn_10120034_209e952f89564a7cbc4e430a4bfb1695_master.jpg	t	2026-05-26 14:58:31.730679
14	14	https://product.hstatic.net/1000260559/product/vi_da_cam_tay_nu_dang_gon__4__2a9ccb96ae864dbe95d8bcd07c736c1e_master.jpg	t	2026-05-26 14:58:31.730679
15	15	https://product.hstatic.net/1000260559/product/vi-da-thuoc-thao-moc-dang-dung-2366273__11__6f629bdededa444f8cff94d9bddce06d_master.jpg	t	2026-05-26 14:58:31.730679
16	16	https://product.hstatic.net/1000260559/product/vi-nu-cam-tay-mot-khoa-keo-da-bo-4516882__1__0acf6eed6cc84c67a3a9c22df7b950d6_master.jpg	t	2026-05-26 14:58:31.730679
17	17	https://product.hstatic.net/1000260559/product/cap-da-sap-cong-so-dung-laptop-15-6-2483338__1__329489d50cc6442dbe0f762e5202190a_master.jpg	t	2026-05-26 14:58:31.730679
18	18	https://product.hstatic.net/1000260559/product/vi-ngan-gap-3-da-sap-ca-tinh-3551241__1__8b3152f8c6884860ae3dfc3c2b73cf52_large.jpg	t	2026-05-26 14:58:31.730679
19	19	https://product.hstatic.net/1000260559/product/vi-dang-dung-da-bo-mem-gon-dep-3551244__6__a72465157aad4013a665ee2459145393_large.jpg	t	2026-05-26 14:58:31.730679
20	20	https://product.hstatic.net/1000260559/product/giay_luoi_cong_so_quai_ngang__2__0fcdc2a42f0a4d95aa68da2cc94fdc56_master.jpg	t	2026-05-26 14:58:31.730679
21	21	https://example.com/giay.jpg	t	2026-05-26 14:58:31.730679
22	22	https://product.hstatic.net/1000260559/product/tui_xach_nu__1__acaea5fbd93844ee83531408f5d294ee_grande.jpg	t	2026-07-05 13:00:58.133277
23	23	https://product.hstatic.net/1000260559/product/vong_tay_handmade_da_that__3__grande.jpg	t	2026-07-05 13:00:58.138728
24	25	https://product.hstatic.net/1000260559/product/tui_xach_nu__1__acaea5fbd93844ee83531408f5d294ee_grande.jpg	t	2026-07-05 13:01:22.422536
25	26	https://product.hstatic.net/1000260559/product/vong_tay_handmade_da_that__3__grande.jpg	t	2026-07-05 13:01:22.425662
26	27	https://product.hstatic.net/1000260559/product/vi_dai_nu__3__f301f02c16b24e2c83f90e0a2058ab30_grande.jpg	t	2026-07-05 13:01:22.427305
27	28	https://product.hstatic.net/1000260559/product/ghds_grande.jpg	t	2026-07-05 13:01:22.428937
28	29	https://product.hstatic.net/1000260559/product/125940__6__master.jpg	t	2026-07-05 13:01:22.431006
29	30	https://product.hstatic.net/1000260559/product/4554239993_1515578525_grande.jpg	t	2026-07-05 13:01:22.432998
30	31	https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-ban-3-4cm-khoa-tu-dong-nau-4409716__1__2e12ac4497dd41b19dfd58fe6fb04e7d_master.jpg	t	2026-07-05 13:01:22.434453
31	32	https://product.hstatic.net/1000260559/product/that_lung_da_ca_sau_mat_chu_z_ban_3_8_-_2837072__4__1f077a541f9142388345e45c6e4e2005_master.jpg	t	2026-07-05 13:01:22.436295
32	33	https://product.hstatic.net/1000260559/product/that-lung-da-bo-khoa-cai-tien-loi-4290845__4__20ac7092dca74e0b9227728cbd4882c2_master.jpg	t	2026-07-05 13:01:22.438985
33	34	https://product.hstatic.net/1000260559/product/that-lung-nam-cong-so-van-ca-sau-3014191__2__69ab0ccada804f4db85cf03ec5ddff6d_master.jpg	t	2026-07-05 13:01:22.440647
34	35	https://product.hstatic.net/1000260559/product/that-lung-da-bo-dap-van-ca-sau-mat-vuong-5_529a265de7d745e59a126e3ea43abd32_master.jpg	t	2026-07-05 13:01:22.441983
35	36	https://product.hstatic.net/1000260559/product/o1cn01l56sqm1biwda9dmjn_10120034_209e952f89564a7cbc4e430a4bfb1695_master.jpg	t	2026-07-05 13:01:22.443677
36	37	https://product.hstatic.net/1000260559/product/vi_da_cam_tay_nu_dang_gon__4__2a9ccb96ae864dbe95d8bcd07c736c1e_master.jpg	t	2026-07-05 13:01:22.445577
37	38	https://product.hstatic.net/1000260559/product/vi-da-thuoc-thao-moc-dang-dung-2366273__11__6f629bdededa444f8cff94d9bddce06d_master.jpg	t	2026-07-05 13:01:22.44695
38	39	https://product.hstatic.net/1000260559/product/vi-nu-cam-tay-mot-khoa-keo-da-bo-4516882__1__0acf6eed6cc84c67a3a9c22df7b950d6_master.jpg	t	2026-07-05 13:01:22.448404
39	40	https://product.hstatic.net/1000260559/product/cap-da-sap-cong-so-dung-laptop-15-6-2483338__1__329489d50cc6442dbe0f762e5202190a_master.jpg	t	2026-07-05 13:01:22.449738
40	41	https://product.hstatic.net/1000260559/product/vi-ngan-gap-3-da-sap-ca-tinh-3551241__1__8b3152f8c6884860ae3dfc3c2b73cf52_large.jpg	t	2026-07-05 13:01:22.451264
41	43	https://product.hstatic.net/1000260559/product/vi-dang-dung-da-bo-mem-gon-dep-3551244__6__a72465157aad4013a665ee2459145393_large.jpg	t	2026-07-05 13:01:22.453845
42	44	https://product.hstatic.net/1000260559/product/giay_luoi_cong_so_quai_ngang__2__0fcdc2a42f0a4d95aa68da2cc94fdc56_master.jpg	t	2026-07-05 13:01:22.455438
43	45	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/228/10579_16_M1.jpg.webp	t	2026-07-05 13:01:22.456946
44	46	https://cdn.chus.vn/images/thumbnails/100/100/detailed/283/1_9uko-f4.jpg.webp	t	2026-07-05 13:01:22.458041
45	47	https://cdn.chus.vn/images/thumbnails/767/767/detailed/209/235605443852bbadc1ecac060378dceb_w767_h1105.jpg.webp	t	2026-07-05 13:01:22.459373
46	48	https://cdn.chus.vn/images/thumbnails/767/767/detailed/208/ef60c5179f172e25f181817012108e28_w767_h1105.jpg.webp	t	2026-07-05 13:01:22.460623
47	49	https://cdn.chus.vn/images/thumbnails/100/100/detailed/228/10579_03_F1.jpg.webp	t	2026-07-05 13:01:22.462273
48	50	https://cdn.chus.vn/images/thumbnails/850/566/detailed/265/DSC04935.jpg.webp	t	2026-07-05 13:01:22.463845
49	51	https://cdn.chus.vn/images/thumbnails/850/566/detailed/228/10579_05_C1.jpg.webp	t	2026-07-05 13:01:22.465763
50	52	https://cdn.chus.vn/images/thumbnails/850/566/detailed/265/DSC04935.jpg.webp	t	2026-07-05 13:01:22.467899
51	53	https://cdn.chus.vn/images/thumbnails/767/767/detailed/228/10579_21_F1.jpg.webp	t	2026-07-05 13:01:22.46932
52	54	https://cdn.chus.vn/images/thumbnails/850/566/detailed/228/10579_10_C1.jpg.webp	t	2026-07-05 13:01:22.470446
53	55	https://cdn.chus.vn/images/thumbnails/850/566/detailed/220/10557_30_C1_fuon-b6.jpg.webp	t	2026-07-05 13:01:22.471907
54	56	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/175/10199_58_M1.jpg.webp	t	2026-07-05 13:01:22.473315
55	57	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/176/10207_24_M1.jpg.webp	t	2026-07-05 13:01:22.474784
56	58	https://cdn.chus.vn/images/thumbnails/850/565/product_mood_image/220/10557_32_M1_30mw-0a.jpg.webp	t	2026-07-05 13:01:22.476747
57	59	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/175/10199_54_M1.jpg.webp	t	2026-07-05 13:01:22.478317
58	60	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/175/10199_46_M1.jpg.webp	t	2026-07-05 13:01:22.479695
59	61	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/175/10199_47_M1.jpg.webp	t	2026-07-05 13:01:22.480876
60	62	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/175/10199_50_M1.jpg.webp	t	2026-07-05 13:01:22.482172
61	63	https://cdn.chus.vn/images/thumbnails/850/850/detailed/295/z6347748756102_e82b0057519d2bcc70fe5e1728e31990_jwyv-j2.jpg.webp	t	2026-07-05 13:01:22.483345
62	64	https://cdn.chus.vn/images/thumbnails/850/566/product_mood_image/175/10199_48_M1.jpg.webp	t	2026-07-05 13:01:22.484779
63	65	https://product.hstatic.net/200000928605/product/anh-600x600__1__f2fa576190434b2380492451c94b3221_1024x1024.jpg	t	2026-07-05 13:01:22.487096
64	66	https://product.hstatic.net/200000928605/product/srm-sachsau-150ml-01-600x600__1__565797efc50c4e23b89f20565c24729e_1024x1024.jpg	t	2026-07-05 13:01:22.489533
65	67	https://product.hstatic.net/200000928605/product/giam-kich-ung-600x600__1__bb1c7d1b10994831918cb010b3e576fb_1024x1024.jpg	t	2026-07-05 13:01:22.491036
66	68	https://product.hstatic.net/200000928605/product/kemduongsangda-30gr-01-600x600_e852067112e84c02b4450592cd8bf4c9_1024x1024.jpg	t	2026-07-05 13:01:22.49233
67	69	https://product.hstatic.net/200000928605/product/nuoctaytrang-tao-do-01-600x600_fe30370d668a470aac5b72b15a4c6a74_1024x1024.jpg	t	2026-07-05 13:01:22.493588
68	70	https://product.hstatic.net/200000928605/product/z5244362372198_da7c3d61800bf6e4a2c571e0f8b758aa_dc735d0f0e014fe89104fb301cfe2133_1024x1024.jpg	t	2026-07-05 13:01:22.495026
69	71	https://product.hstatic.net/200000928605/product/11_dautaytrang_1_f737f81e77b44ec8b6a2a9f3ea8cc4a7_1024x1024.jpg	t	2026-07-05 13:01:22.496276
70	72	https://product.hstatic.net/200000928605/product/botamduongthe-01-600x600_37fff916ad214f1bae9d3ee2a601e327_1024x1024.jpg	t	2026-07-05 13:01:22.497465
71	73	https://product.hstatic.net/200000928605/product/kemduongam-30gr-01-600x600_6a5609ddbc444a3fa5c7e1cee6d3b87c_1024x1024.jpg	t	2026-07-05 13:01:22.499028
72	74	https://product.hstatic.net/200000928605/product/vitaminc-1-600x600_544cdbde967b4c2eaa67dfb48a62ddfc_1024x1024.jpg	t	2026-07-05 13:01:22.500134
73	75	https://product.hstatic.net/200000928605/product/27_peptide_skin_no_logo_5e5f378d659b4d6d9d646e0e30c5128a_1024x1024.jpg	t	2026-07-05 13:01:22.501376
74	76	https://product.hstatic.net/200000928605/product/5pha-10man-01-600x600_bbdf4a3a498649e6a63a7693cb073dd0_1024x1024.jpg	t	2026-07-05 13:01:22.502704
75	77	https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_440,h_330/https://hoclammypham.com.vn/wp-content/uploads/IMG_0190.jpg	t	2026-07-05 13:01:22.503964
76	78	https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_440,h_330/https://hoclammypham.com.vn/wp-content/uploads/dau-mct-tu-dau-dua.jpg	t	2026-07-05 13:01:22.505142
77	79	https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_440,h_330/https://hoclammypham.com.vn/wp-content/uploads/dau-nu-tam-xuan-3.jpg	t	2026-07-05 13:01:22.506278
78	80	https://down-vn.img.susercontent.com/file/sg-11134253-8259w-mgcpxw2sw3yi0d.webp	t	2026-07-05 13:01:22.507492
79	81	https://down-vn.img.susercontent.com/file/67bd32a9a49660602f53c630e9fda72c.webp	t	2026-07-05 13:01:22.509241
80	82	https://down-vn.img.susercontent.com/file/cddf92118031d6c0e84e8c0ac414d50c.webp	t	2026-07-05 13:01:22.510898
81	83	https://down-vn.img.susercontent.com/file/vn-11134201-23030-romj4qg9s9nv8f.webp	t	2026-07-05 13:01:22.512007
82	84	https://down-vn.img.susercontent.com/file/b6f3e6715e766a2b39a72014ad9856c2.webp	t	2026-07-05 13:01:22.513155
83	85	https://antinh.vn/wp-content/uploads/2025/12/Day-Deo-Chu-Lang-Nghiem-800x800.jpg	t	2026-07-05 13:01:22.514734
84	86	https://antinh.vn/wp-content/uploads/2025/09/Day-Chuyen-Vong-Trang-Anh-Sao-800x800.jpg	t	2026-07-05 13:01:22.515818
85	87	https://antinh.vn/wp-content/uploads/2025/09/Day-Chuyen-Pha-Le-Anh-Trang-800x800.jpg	t	2026-07-05 13:01:22.517508
86	88	https://antinh.vn/wp-content/uploads/2025/09/Day-Chuyen-Da-Aquamarine-800x800.jpg	t	2026-07-05 13:01:22.518785
87	89	https://antinh.vn/wp-content/uploads/2025/09/Day-Chuyen-Da-Pha-Le-Chuon-Chuon-800x800.jpg	t	2026-07-05 13:01:22.520033
88	90	https://antinh.vn/wp-content/uploads/2025/09/Day-Chuyen-Da-Ma-Nao-Do-800x800.jpg	t	2026-07-05 13:01:22.521707
89	91	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Trai-Tim-Co-Bon-La-May-Man-800x800.jpg	t	2026-07-05 13:01:22.522783
90	92	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Hoa-4-La-May-Man-800x800.jpg	t	2026-07-05 13:01:22.524094
91	93	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Pha-Le-Giot-Suong-Canh-Buom-800x800.jpg	t	2026-07-05 13:01:22.525619
92	94	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Qua-Cau-Chu-Sa-Do-800x800.jpg	t	2026-07-05 13:01:22.526824
93	95	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Hat-Tron-Sap-Ong-800x800.jpg	t	2026-07-05 13:01:22.529148
94	96	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Pha-Le-Anh-Dao-Doi-800x800.jpg	t	2026-07-05 13:01:22.530687
95	97	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Ngoc-Bich-Binh-An-800x800.jpg	t	2026-07-05 13:01:22.532573
96	98	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Hoa-Nang-800x800.jpg	t	2026-07-05 13:01:22.533776
97	99	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Da-Zircon-Hinh-Trai-Tim-800x800.jpg	t	2026-07-05 13:01:22.534959
98	100	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Dong-Xu-Da-Thach-Anh-Tim-800x800.jpg	t	2026-07-05 13:01:22.536395
99	101	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Ngoc-Bich-Hinh-May-800x800.jpg	t	2026-07-05 13:01:22.537709
100	102	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Da-Thach-Anh-Xanh-Duong-800x800.jpg	t	2026-07-05 13:01:22.538917
101	103	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Pha-Le-12-Cung-Hoang-Dao-800x800.jpg	t	2026-07-05 13:01:22.540149
102	104	https://antinh.vn/wp-content/uploads/2025/08/Day-Chuyen-Pha-Le-Charm-Trai-Tim--800x800.jpg	t	2026-07-05 13:01:22.541527
103	105	https://cdn-images.kiotviet.vn/2025/05/09/thuycrystal/46ab88af0db442d2bedf441956e83462.png	t	2026-07-05 13:01:22.543684
104	106	https://cdn2-retail-images.kiotviet.vn/2025/05/09/thuycrystal/5f573d1bb5b14c3fb322926e01fc36ee.png	t	2026-07-05 13:01:22.544813
105	107	https://cdn-images.kiotviet.vn/2025/05/09/thuycrystal/e378cbf261424877b92bc29a7cef8c1b.png	t	2026-07-05 13:01:22.546226
106	108	https://cdn-images.kiotviet.vn/2025/05/06/thuycrystal/05ca6b4589e74ae4bade17d44a1da712.png	t	2026-07-05 13:01:22.547697
107	109	https://cdn-images.kiotviet.vn/2025/05/06/thuycrystal/94801499d5a647e8abb3a21fe3a7c76c.png	t	2026-07-05 13:01:22.549275
108	110	https://cdn2-retail-images.kiotviet.vn/2025/05/09/thuycrystal/c39d60d1fd0c490e9101d0d478643df0.png	t	2026-07-05 13:01:22.550969
109	111	https://cdn-images.kiotviet.vn/2025/05/09/thuycrystal/e14a6fcfa1544774951c34ad662e7d51.png	t	2026-07-05 13:01:22.552354
110	112	https://cdn-images.kiotviet.vn/thuycrystal/9445a390ae4e4df7829e3ffee13b980d.jpg	t	2026-07-05 13:01:22.55401
111	113	https://cdn-images.kiotviet.vn/thuycrystal/80254c176a9f42dcbfd801264c7206f1.jpg	t	2026-07-05 13:01:22.555497
112	114	https://cdn-images.kiotviet.vn/thuycrystal/612c23a8e0064337b85582237ff261df.jpg	t	2026-07-05 13:01:22.556935
113	115	https://cdn-images.kiotviet.vn/thuycrystal/9ef0f191577b49efabdacec5b58ed7ab.jpg	t	2026-07-05 13:01:22.558322
114	116	https://cdn-images.kiotviet.vn/thuycrystal/852ec72a05114f27ba7ff45f83749900.jpg	t	2026-07-05 13:01:22.559431
115	117	https://cdn-images.kiotviet.vn/thuycrystal/a97b20aafb384201bdeba0cf4a1bf3cf.jpg	t	2026-07-05 13:01:22.56079
116	118	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/1d76e60d16634519a1a73d8dfcbdf390.jpg	t	2026-07-05 13:01:22.5618
117	119	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/066ba85c3735444b9096b31f9e7df62e.jpg	t	2026-07-05 13:01:22.563397
118	120	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/25d6a4a04852437598ba7908e1d2f26e.jpg	t	2026-07-05 13:01:22.565105
119	121	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/c08788f8bd2d4e16a39f015d4b74ba81.jpg	t	2026-07-05 13:01:22.566966
120	122	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/198e38abd1c34304927a02c5640fec3f.jpg	t	2026-07-05 13:01:22.567928
121	123	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/63641ac0b070496bb4eb88b85d0beab8.jpg	t	2026-07-05 13:01:22.568796
122	124	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/57dfe48ea17b4d658518335d4fe4278a.jpg	t	2026-07-05 13:01:22.569665
123	125	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/1d76e60d16634519a1a73d8dfcbdf390.jpg	t	2026-07-05 13:01:22.570835
124	126	https://cdn-images.kiotviet.vn/2025/09/01/thuycrystal/066ba85c3735444b9096b31f9e7df62e.jpg	t	2026-07-05 13:01:22.572034
125	127	 https://cdn-images.kiotviet.vn/thuycrystal/2b2344db4f104157b3536853a9c479a4.jpg	t	2026-07-05 13:01:22.573401
126	128	https://cdn2-retail-images.kiotviet.vn/thuycrystal/028983ccac5346b38d202c4fd37e94f1.jpg 	t	2026-07-05 13:01:22.574523
127	129	https://cdn-images.kiotviet.vn/thuycrystal/9cbf8f72024a46d1b72a1105f218c8b0.jpg	t	2026-07-05 13:01:22.576085
128	130	 https://cdn-images.kiotviet.vn/thuycrystal/f1efe68949994a48ada839a28cc4b5d9.jpg	t	2026-07-05 13:01:22.57772
129	131	 https://cdn2-retail-images.kiotviet.vn/thuycrystal/8b92f78e285946f4bcd8f87a42db15a3.jpg	t	2026-07-05 13:01:22.578928
130	132	 	t	2026-07-05 13:01:22.580053
131	133	 https://cdn-images.kiotviet.vn/thuycrystal/5b8ab8ce73be48f38b6026defdb3dd97.jpg	t	2026-07-05 13:01:22.581026
132	134	https://cdn-images.kiotviet.vn/thuycrystal/80254c176a9f42dcbfd801264c7206f1.jpg 	t	2026-07-05 13:01:22.582285
133	135	https://cdn2-retail-images.kiotviet.vn/thuycrystal/e62aac2598ea4af7825edc39a0dd40b3.jpg 	t	2026-07-05 13:01:22.583732
134	136	https://cdn-images.kiotviet.vn/thuycrystal/4de5374b9a36451e900cb98cea3be968.jpg 	t	2026-07-05 13:01:22.584723
135	137	https://cdn-images.kiotviet.vn/thuycrystal/2b7a4295c27a4e60899c0361c4fd2f0e.jpg 	t	2026-07-05 13:01:22.586061
136	138	 	t	2026-07-05 13:01:22.588005
137	139	https://cdn-images.kiotviet.vn/thuycrystal/4545ee6d14da446e9ba59b84b2a9a927.jpg 	t	2026-07-05 13:01:22.589167
138	140	 https://cdn-images.kiotviet.vn/thuycrystal/852ec72a05114f27ba7ff45f83749900.jpg	t	2026-07-05 13:01:22.590328
139	141	https://cdn-images.kiotviet.vn/thuycrystal/9445a390ae4e4df7829e3ffee13b980d.jpg 	t	2026-07-05 13:01:22.59137
140	142	https://cdn-images.kiotviet.vn/thuycrystal/3d42d66917414ac28392efcd74feb64f.jpg 	t	2026-07-05 13:01:22.592536
141	143	https://cdn-images.kiotviet.vn/thuycrystal/c02b717336684e83b38984af1c275c5b.jpg 	t	2026-07-05 13:01:22.593782
142	144	https://cdn.hstatic.net/products/1000203256/o1cn01ijngm220n3aa07mps___2210171316893-0-cib_f082eb4d360348598d2e40e484765f07_1024x1024.jpg	t	2026-07-05 13:01:22.595355
143	145	https://product.hstatic.net/1000203256/product/dong-ho-treo-tuong-kim-loai-da-giac-cheo__9__d1d96f3a397d46cba6f4533758219852_1024x1024.jpg	t	2026-07-05 13:01:22.596609
144	146	https://product.hstatic.net/1000203256/product/o1cn01esbyc81oxkxbl7stf___3041635291-0-cib_af9e5d01ed8c4f1fbb55f8dfee537bd7_1024x1024.jpg	t	2026-07-05 13:01:22.597862
145	147	https://cdn.hstatic.net/products/1000203256/dsc07664_b1a57bcd6b4041eb8f2ed1b706107871_1024x1024.jpg	t	2026-07-05 13:01:22.599641
146	148	https://cdn.hstatic.net/products/1000203256/sofa-da-pu-cao-cap-onyx_80db2e4fcbf7441f8dae373f05cdbc90_1024x1024.jpg	t	2026-07-05 13:01:22.600749
147	149	https://cdn.hstatic.net/products/1000203256/ghe-an-bo-cong-thanh-lich_d088d71e617a436ab9f852740c4b15f8_1024x1024.jpg	t	2026-07-05 13:01:22.602072
148	150	https://cdn.hstatic.net/products/1000203256/o1cn0167i11d20n32blbk0a___2210171316893-0-cib_b937bc90c79c4880a9e422beaa942afc_1024x1024.jpg	t	2026-07-05 13:01:22.603443
149	151	https://cdn.hstatic.net/products/1000203256/binh-gom-3d-don-gian-nghe-thuat_d518fe503f1e47188297fed625220243_1024x1024.jpg	t	2026-07-05 13:01:22.604864
150	152	https://cdn.hstatic.net/products/1000203256/binh_hoa_gom_su_lon_trang_tri_phong_khach_c93321609e614f2a998d6b2b6953b4c1_1024x1024.jpg	t	2026-07-05 13:01:22.606387
151	153	https://product.hstatic.net/1000203256/product/5a_3cc6ac6595fd4f6ca5e080af4ae125ae_1024x1024.png	t	2026-07-05 13:01:22.607965
152	154	https://cdn.hstatic.net/products/1000203256/dsc03654_551076a4007042718e1a04d0fa328ad4_1024x1024.jpg	t	2026-07-05 13:01:22.609859
153	155	https://product.hstatic.net/1000203256/product/pa231020-01_88bc4f084f3c487da36ae1c964a74c2f_1024x1024.jpg	t	2026-07-05 13:01:22.611347
154	156	https://product.hstatic.net/1000203256/product/p1290318_7f01c269df214ce7ba6b90adbc473732_1024x1024.jpg	t	2026-07-05 13:01:22.612799
155	157	https://product.hstatic.net/1000203256/product/p1200258_35fe261a144d4722b0823385e61d5279_1024x1024.jpg	t	2026-07-05 13:01:22.613956
156	158	https://product.hstatic.net/1000203256/product/22044941183_1682305191.640x640_1d3154410fee4f97b7bd229c0ee5be13_1024x1024.jpg	t	2026-07-05 13:01:22.615247
157	159	https://cdn.hstatic.net/products/1000203256/dsc02035__1__3c0ee039366b47ba99f5c2c0d13bf07b_1024x1024.jpg	t	2026-07-05 13:01:22.616428
158	160	https://cdn.hstatic.net/products/1000203256/a6ba256fc9304587acce2cb23491813f_0fd20b205bfc47728f7eb1ba78641f38_1024x1024.jpg	t	2026-07-05 13:01:22.617515
159	161	https://cdn.hstatic.net/products/1000203256/13278467830_1036115113_fbdb5c1fdbde4b6790120f0bd5e7b25a_1024x1024.jpg	t	2026-07-05 13:01:22.618585
160	162	https://cdn.hstatic.net/products/1000203256/730c3b4b44ee4c0b9129b9bc17fade6d_32e978449fe04074a46aab223e4c908f_1024x1024.jpg	t	2026-07-05 13:01:22.619775
161	163	https://cdn.hstatic.net/products/1000203256/p1250318_7e36971694b04725b3289b9e5090cdbf_1024x1024.jpg	t	2026-07-05 13:01:22.62102
162	164	https://cdn.hstatic.net/products/1000203256/16239787491_372911429_82dd23d6750143b59c301378f73b2b9d_1024x1024.jpg	t	2026-07-05 13:01:22.622169
163	165	https://images.unsplash.com/photo-1544816155-12df9643f363?auto=format&fit=crop&w=500&q=80	t	2026-07-05 13:01:22.62346
164	166	https://images.unsplash.com/photo-1627123424574-724758594e93?auto=format&fit=crop&w=500&q=80	t	2026-07-05 13:01:22.624395
165	167	https://images.unsplash.com/photo-1548036328-c9fa89d128fa?auto=format&fit=crop&w=500&q=80	t	2026-07-05 13:01:22.625616
166	168	https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=500&q=80	t	2026-07-05 13:01:22.626647
167	169	https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?auto=format&fit=crop&w=500&q=80	t	2026-07-05 13:01:22.627771
168	170	https://cdn.hstatic.net/products/200000978078/img_9694_238de6df9d724d92b75b482109442fe1_grande.jpg	t	2026-07-05 13:01:22.628955
169	171	https://product.hstatic.net/200000978078/product/img_2820_0564acf96601402c9537569d754d209d_grande.jpg	t	2026-07-05 13:01:22.630142
170	172	https://cdn.hstatic.net/products/200000978078/img_2819_cf9d6177dbe24f13bc50195034bc385d_grande.jpg	t	2026-07-05 13:01:22.631648
171	173	https://product.hstatic.net/200000978078/product/img_2817_0581f997fef6427da3ee1e88956c35d6_grande.jpg	t	2026-07-05 13:01:22.633033
172	174	https://product.hstatic.net/200000978078/product/hapas_6-4-7446_39b5f76ee5f64efe8a3bd94b2370f913_grande.jpg	t	2026-07-05 13:01:22.634088
173	175	https://product.hstatic.net/200000978078/product/_mg_0355_3abc098ba58947e5bd7fbaf7dea97762_grande.jpg	t	2026-07-05 13:01:22.635092
174	176	https://product.hstatic.net/200000978078/product/_mg_0383_cc9c089cccc34e34be5c279e1b28229a_grande.jpg	t	2026-07-05 13:01:22.636157
175	177	https://product.hstatic.net/200000978078/product/_mg_0368_01c12bc82c584abdb21249e10d6e5d6b_grande.jpg	t	2026-07-05 13:01:22.637274
176	178	https://cdn.hstatic.net/products/200000978078/img_2686_28cb0380f028473d845343e3792e2204_grande.jpg	t	2026-07-05 13:01:22.638423
177	179	https://product.hstatic.net/200000978078/product/_mg_9421_d9d1f3c8124943d091aa5ac445c4cb5d_grande.jpg	t	2026-07-05 13:01:22.639598
178	180	https://cdn.hstatic.net/products/200000978078/_mg_4111_3842a7ab59fe4bd6b03957414326cb14_grande.jpg	t	2026-07-05 13:01:22.640632
179	181	https://cdn.hstatic.net/products/200000978078/hapas110641_4bba1a7fe48a4dd7ac5967085db782cd_grande.jpg	t	2026-07-05 13:01:22.641707
180	182	https://product.hstatic.net/200000978078/product/_mg_4134_ba76b99f08ce40abb7b648e1787b6d1d_grande.jpg	t	2026-07-05 13:01:22.64313
181	183	https://product.hstatic.net/200000978078/product/_mg_4111_1592d884e7544df18e082d7e2f40692c_grande.jpg	t	2026-07-05 13:01:22.644205
182	184	https://product.hstatic.net/200000978078/product/_mg_4130_0fa83b3af79e4836b3a3115a8e26de22_grande.jpg	t	2026-07-05 13:01:22.645676
183	185	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/sticker-phat-giao-1.jpg?v=1715768642130	t	2026-07-05 13:01:22.647321
184	186	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/dao-tia-3chiec-hop-nhua-1.jpg?v=1713694524920	t	2026-07-05 13:01:22.6486
185	187	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/giang-sinh-1.jpg?v=1700728714520	t	2026-07-05 13:01:22.649919
186	188	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/kit-thiep-co-ban-20-11-1.jpg?v=1698485734973	t	2026-07-05 13:01:22.651128
187	189	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/cao-su-kit-5-1.jpg?v=1698305253340	t	2026-07-05 13:01:22.652194
188	190	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/ep-hoa-kho-cao-cap-1.jpg?v=1693500389073	t	2026-07-05 13:01:22.653491
189	191	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/giay-tissue-50x70-1.jpg?v=1693207548157	t	2026-07-05 13:01:22.654785
190	192	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/ep-hoa-kho-1.jpg?v=1693498469647	t	2026-07-05 13:01:22.655987
191	193	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/hu-sua-chua-1-b40640e0-6118-4e33-ba65-d6e7153f068c.jpg?v=1690904450723	t	2026-07-05 13:01:22.657241
192	194	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/z4562885701904-49b1a9514d19ebab6f08139fcae54366.jpg?v=1690796651660	t	2026-07-05 13:01:22.65891
193	195	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/giang-sinh-1.jpg?v=1700728714520	t	2026-07-05 13:01:22.661304
194	196	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/kit-thiep-co-ban-20-11-1.jpg?v=1698485734973	t	2026-07-05 13:01:22.66346
195	197	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/ep-hoa-kho-cao-cap-1.jpg?v=1693500389073	t	2026-07-05 13:01:22.66569
196	198	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/tui-viet-xoa-1.jpg?v=1693225885023	t	2026-07-05 13:01:22.667027
197	199	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/ep-hoa-kho-1.jpg?v=1693498469647	t	2026-07-05 13:01:22.668325
198	200	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/kit-tranh-mau-giao-1.jpg?v=1686039954130	t	2026-07-05 13:01:22.669714
199	201	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/sticker-phat-giao-1.jpg?v=1715768642130	t	2026-07-05 13:01:22.670977
200	202	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/washi-noel-1-1.jpg?v=1700394281710	t	2026-07-05 13:01:22.6721
201	203	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/giay-tissue-50x70-1.jpg?v=1693207548157	t	2026-07-05 13:01:22.673498
202	204	https://bizweb.dktcdn.net/thumb/compact/100/061/358/products/sticker-meet-you-1.jpg?v=1688743516060	t	2026-07-05 13:01:22.674951
203	205	https://voocbien.com/wp-content/uploads/2024/10/DSC3871.jpg	t	2026-07-05 13:01:22.676491
204	206	https://voocbien.com/wp-content/uploads/2016/02/thuyen-buom-vo-oc-lon-tb18-2-2.jpg	t	2026-07-05 13:01:22.677877
206	208	https://voocbien.com/wp-content/uploads/2016/01/thuyen-buom-vo-oc-lon-tb13-6.jpg	t	2026-07-05 13:01:22.680562
207	209	https://voocbien.com/wp-content/uploads/2016/01/thuyen-buom-vo-oc-lon-tb12-5.jpg	t	2026-07-05 13:01:22.681686
208	210	https://voocbien.com/wp-content/uploads/2018/11/DSC1385.jpg	t	2026-07-05 13:01:22.68308
209	211	https://voocbien.com/wp-content/uploads/2018/10/thuyen-buom-nhi-bau-ngu-do-tb29-3.jpg	t	2026-07-05 13:01:22.684183
210	212	https://voocbien.com/wp-content/uploads/2016/09/thuyen-buom-vo-oc-nho-tb20-3.jpg	t	2026-07-05 13:01:22.685392
212	214	https://voocbien.com/wp-content/uploads/2016/01/thuyen-buom-vo-oc-lon-tb14-3.jpg	t	2026-07-05 13:01:22.688065
213	215	https://voocbien.com/wp-content/uploads/2015/08/DSC1343.jpg	t	2026-07-05 13:01:22.689316
214	216	https://voocbien.com/wp-content/uploads/2016/02/thuyen-buom-vo-oc-trung-tb11_t-6.jpg	t	2026-07-05 13:01:22.690507
215	217	https://voocbien.com/wp-content/uploads/2016/01/thuyen-buom-vo-oc-trung-tb11-2.jpg	t	2026-07-05 13:01:22.691545
216	218	https://voocbien.com/wp-content/uploads/2017/09/thuyen-buom-vo-so-oc-lon-tb29-5.jpg	t	2026-07-05 13:01:22.69267
217	219	https://voocbien.com/wp-content/uploads/2017/03/thuyen-buom-vo-oc-trung-tb24-07.jpg	t	2026-07-05 13:01:22.69387
218	220	https://voocbien.com/wp-content/uploads/2017/03/DSC1372.jpg	t	2026-07-05 13:01:22.695012
219	221	https://voocbien.com/wp-content/uploads/2017/03/DSC1359.jpg	t	2026-07-05 13:01:22.696023
220	222	https://voocbien.com/wp-content/uploads/2015/09/thuyen-buom-vo-oc-tb08-4.jpg	t	2026-07-05 13:01:22.697069
221	223	https://voocbien.com/wp-content/uploads/2015/08/thuyen-buom-vo-oc-tb05-6.jpg	t	2026-07-05 13:01:22.698291
\.


--
-- TOC entry 5285 (class 0 OID 34218)
-- Dependencies: 231
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variants (id, product_id, variant_name, sku, price_adjustment, inventory, reserved, created_at) FROM stdin;
10	10	Default	SKU-10	0	20	0	2026-05-26 14:58:36.747634
11	11	Default	SKU-11	0	20	0	2026-05-26 14:58:36.747634
12	12	Default	SKU-12	0	20	0	2026-05-26 14:58:36.747634
13	13	Default	SKU-13	0	20	0	2026-05-26 14:58:36.747634
14	14	Default	SKU-14	0	20	0	2026-05-26 14:58:36.747634
15	15	Default	SKU-15	0	20	0	2026-05-26 14:58:36.747634
16	16	Default	SKU-16	0	20	0	2026-05-26 14:58:36.747634
17	17	Default	SKU-17	0	20	0	2026-05-26 14:58:36.747634
18	18	Default	SKU-18	0	20	0	2026-05-26 14:58:36.747634
19	19	Default	SKU-19	0	20	0	2026-05-26 14:58:36.747634
20	20	Default	SKU-20	0	20	0	2026-05-26 14:58:36.747634
21	21	Default	SKU-21	0	20	0	2026-05-26 14:58:36.747634
7	7	Default	SKU-7	0	15	0	2026-05-26 14:58:36.747634
8	8	Default	SKU-8	0	19	0	2026-05-26 14:58:36.747634
9	9	Default	SKU-9	0	18	0	2026-05-26 14:58:36.747634
2	2	Default	SKU-2	0	0	0	2026-05-26 14:58:36.747634
4	4	Default	SKU-4	0	19	0	2026-05-26 14:58:36.747634
6	6	Default	SKU-6	0	9	0	2026-05-26 14:58:36.747634
23	22	Mặc định	\N	0	20	0	2026-07-05 13:00:58.135968
24	23	Mặc định	\N	0	20	0	2026-07-05 13:00:58.139369
25	25	Mặc định	\N	0	20	0	2026-07-05 13:01:22.423761
26	26	Mặc định	\N	0	20	0	2026-07-05 13:01:22.426226
27	27	Mặc định	\N	0	20	0	2026-07-05 13:01:22.427764
28	28	Mặc định	\N	0	20	0	2026-07-05 13:01:22.429478
29	29	Mặc định	\N	0	20	0	2026-07-05 13:01:22.431632
30	30	Mặc định	\N	0	20	0	2026-07-05 13:01:22.433505
31	31	Mặc định	\N	0	20	0	2026-07-05 13:01:22.435059
32	32	Mặc định	\N	0	20	0	2026-07-05 13:01:22.43669
33	33	Mặc định	\N	0	20	0	2026-07-05 13:01:22.439516
34	34	Mặc định	\N	0	20	0	2026-07-05 13:01:22.441001
35	35	Mặc định	\N	0	20	0	2026-07-05 13:01:22.442511
36	36	Mặc định	\N	0	20	0	2026-07-05 13:01:22.444203
37	37	Mặc định	\N	0	20	0	2026-07-05 13:01:22.446009
38	38	Mặc định	\N	0	20	0	2026-07-05 13:01:22.44739
39	39	Mặc định	\N	0	20	0	2026-07-05 13:01:22.448839
40	40	Mặc định	\N	0	20	0	2026-07-05 13:01:22.450161
41	41	Mặc định	\N	0	20	0	2026-07-05 13:01:22.451666
42	42	Mặc định	\N	0	20	0	2026-07-05 13:01:22.452512
43	43	Mặc định	\N	0	20	0	2026-07-05 13:01:22.454346
44	44	Mặc định	\N	0	20	0	2026-07-05 13:01:22.455786
45	45	Mặc định	\N	0	20	0	2026-07-05 13:01:22.457267
46	46	Mặc định	\N	0	20	0	2026-07-05 13:01:22.45839
47	47	Mặc định	\N	0	20	0	2026-07-05 13:01:22.459854
48	48	Mặc định	\N	0	20	0	2026-07-05 13:01:22.46113
49	49	Mặc định	\N	0	20	0	2026-07-05 13:01:22.462678
50	50	Mặc định	\N	0	20	0	2026-07-05 13:01:22.464397
51	51	Mặc định	\N	0	20	0	2026-07-05 13:01:22.466935
52	52	Mặc định	\N	0	20	0	2026-07-05 13:01:22.46827
53	53	Mặc định	\N	0	20	0	2026-07-05 13:01:22.469673
54	54	Mặc định	\N	0	20	0	2026-07-05 13:01:22.471126
55	55	Mặc định	\N	0	20	0	2026-07-05 13:01:22.472284
56	56	Mặc định	\N	0	20	0	2026-07-05 13:01:22.473757
57	57	Mặc định	\N	0	20	0	2026-07-05 13:01:22.475336
58	58	Mặc định	\N	0	20	0	2026-07-05 13:01:22.477185
59	59	Mặc định	\N	0	20	0	2026-07-05 13:01:22.478803
60	60	Mặc định	\N	0	20	0	2026-07-05 13:01:22.480046
61	61	Mặc định	\N	0	20	0	2026-07-05 13:01:22.481216
62	62	Mặc định	\N	0	20	0	2026-07-05 13:01:22.482573
63	63	Mặc định	\N	0	20	0	2026-07-05 13:01:22.483769
64	64	Mặc định	\N	0	20	0	2026-07-05 13:01:22.485226
65	65	Mặc định	\N	0	20	0	2026-07-05 13:01:22.488098
66	66	Mặc định	\N	0	20	0	2026-07-05 13:01:22.49002
67	67	Mặc định	\N	0	20	0	2026-07-05 13:01:22.491416
68	68	Mặc định	\N	0	20	0	2026-07-05 13:01:22.492708
69	69	Mặc định	\N	0	20	0	2026-07-05 13:01:22.49406
70	70	Mặc định	\N	0	20	0	2026-07-05 13:01:22.495417
71	71	Mặc định	\N	0	20	0	2026-07-05 13:01:22.496614
72	72	Mặc định	\N	0	20	0	2026-07-05 13:01:22.497959
73	73	Mặc định	\N	0	20	0	2026-07-05 13:01:22.499352
74	74	Mặc định	\N	0	20	0	2026-07-05 13:01:22.500535
75	75	Mặc định	\N	0	20	0	2026-07-05 13:01:22.50174
76	76	Mặc định	\N	0	20	0	2026-07-05 13:01:22.503075
77	77	Mặc định	\N	0	20	0	2026-07-05 13:01:22.504359
78	78	Mặc định	\N	0	20	0	2026-07-05 13:01:22.505496
79	79	Mặc định	\N	0	20	0	2026-07-05 13:01:22.506644
80	80	Mặc định	\N	0	20	0	2026-07-05 13:01:22.507926
81	81	Mặc định	\N	0	20	0	2026-07-05 13:01:22.509767
82	82	Mặc định	\N	0	20	0	2026-07-05 13:01:22.511237
83	83	Mặc định	\N	0	20	0	2026-07-05 13:01:22.512356
84	84	Mặc định	\N	0	20	0	2026-07-05 13:01:22.513556
85	85	Mặc định	\N	0	20	0	2026-07-05 13:01:22.515031
86	86	Mặc định	\N	0	20	0	2026-07-05 13:01:22.516383
87	87	Mặc định	\N	0	20	0	2026-07-05 13:01:22.517898
88	88	Mặc định	\N	0	20	0	2026-07-05 13:01:22.519175
89	89	Mặc định	\N	0	20	0	2026-07-05 13:01:22.520526
90	90	Mặc định	\N	0	20	0	2026-07-05 13:01:22.522044
91	91	Mặc định	\N	0	20	0	2026-07-05 13:01:22.523153
92	92	Mặc định	\N	0	20	0	2026-07-05 13:01:22.524536
93	93	Mặc định	\N	0	20	0	2026-07-05 13:01:22.52597
1	1	Default	SKU-1	0	0	0	2026-05-26 14:58:36.747634
5	5	Default	SKU-5	0	13	0	2026-05-26 14:58:36.747634
22	3	Default	SKU-3	0	18	0	2026-05-26 14:58:39.248644
94	94	Mặc định	\N	0	20	0	2026-07-05 13:01:22.527189
95	95	Mặc định	\N	0	20	0	2026-07-05 13:01:22.529556
96	96	Mặc định	\N	0	20	0	2026-07-05 13:01:22.531415
97	97	Mặc định	\N	0	20	0	2026-07-05 13:01:22.53295
98	98	Mặc định	\N	0	20	0	2026-07-05 13:01:22.534111
99	99	Mặc định	\N	0	20	0	2026-07-05 13:01:22.535382
100	100	Mặc định	\N	0	20	0	2026-07-05 13:01:22.536868
101	101	Mặc định	\N	0	20	0	2026-07-05 13:01:22.538085
102	102	Mặc định	\N	0	20	0	2026-07-05 13:01:22.539307
103	103	Mặc định	\N	0	20	0	2026-07-05 13:01:22.540672
104	104	Mặc định	\N	0	20	0	2026-07-05 13:01:22.542089
105	105	Mặc định	\N	0	20	0	2026-07-05 13:01:22.544037
106	106	Mặc định	\N	0	20	0	2026-07-05 13:01:22.545187
107	107	Mặc định	\N	0	20	0	2026-07-05 13:01:22.54668
108	108	Mặc định	\N	0	20	0	2026-07-05 13:01:22.548133
109	109	Mặc định	\N	0	20	0	2026-07-05 13:01:22.549819
110	110	Mặc định	\N	0	20	0	2026-07-05 13:01:22.551405
111	111	Mặc định	\N	0	20	0	2026-07-05 13:01:22.552708
112	112	Mặc định	\N	0	20	0	2026-07-05 13:01:22.554509
113	113	Mặc định	\N	0	20	0	2026-07-05 13:01:22.555858
114	114	Mặc định	\N	0	20	0	2026-07-05 13:01:22.557376
115	115	Mặc định	\N	0	20	0	2026-07-05 13:01:22.558668
116	116	Mặc định	\N	0	20	0	2026-07-05 13:01:22.559922
117	117	Mặc định	\N	0	20	0	2026-07-05 13:01:22.561133
118	118	Mặc định	\N	0	20	0	2026-07-05 13:01:22.562124
119	119	Mặc định	\N	0	20	0	2026-07-05 13:01:22.563817
120	120	Mặc định	\N	0	20	0	2026-07-05 13:01:22.565762
121	121	Mặc định	\N	0	20	0	2026-07-05 13:01:22.567286
122	122	Mặc định	\N	0	20	0	2026-07-05 13:01:22.568193
123	123	Mặc định	\N	0	20	0	2026-07-05 13:01:22.569096
124	124	Mặc định	\N	0	20	0	2026-07-05 13:01:22.569897
125	125	Mặc định	\N	0	20	0	2026-07-05 13:01:22.571198
126	126	Mặc định	\N	0	20	0	2026-07-05 13:01:22.572452
127	127	Mặc định	\N	0	20	0	2026-07-05 13:01:22.573743
128	128	Mặc định	\N	0	20	0	2026-07-05 13:01:22.574843
129	129	Mặc định	\N	0	20	0	2026-07-05 13:01:22.576586
130	130	Mặc định	\N	0	20	0	2026-07-05 13:01:22.5781
131	131	Mặc định	\N	0	20	0	2026-07-05 13:01:22.579327
132	132	Mặc định	\N	0	20	0	2026-07-05 13:01:22.58037
133	133	Mặc định	\N	0	20	0	2026-07-05 13:01:22.581368
134	134	Mặc định	\N	0	20	0	2026-07-05 13:01:22.582605
135	135	Mặc định	\N	0	20	0	2026-07-05 13:01:22.584014
136	136	Mặc định	\N	0	20	0	2026-07-05 13:01:22.585125
137	137	Mặc định	\N	0	20	0	2026-07-05 13:01:22.586473
138	138	Mặc định	\N	0	20	0	2026-07-05 13:01:22.588356
139	139	Mặc định	\N	0	20	0	2026-07-05 13:01:22.589576
140	140	Mặc định	\N	0	20	0	2026-07-05 13:01:22.590662
141	141	Mặc định	\N	0	20	0	2026-07-05 13:01:22.591793
142	142	Mặc định	\N	0	20	0	2026-07-05 13:01:22.592871
143	143	Mặc định	\N	0	20	0	2026-07-05 13:01:22.59416
144	144	Mặc định	\N	0	50	0	2026-07-05 13:01:22.595711
145	145	Mặc định	\N	0	24	0	2026-07-05 13:01:22.596964
146	146	Mặc định	\N	0	12	0	2026-07-05 13:01:22.598405
147	147	Mặc định	\N	0	24	0	2026-07-05 13:01:22.599999
149	149	Mặc định	\N	0	14	0	2026-07-05 13:01:22.602476
150	150	Mặc định	\N	0	4	0	2026-07-05 13:01:22.603803
151	151	Mặc định	\N	0	24	0	2026-07-05 13:01:22.605275
152	152	Mặc định	\N	0	24	0	2026-07-05 13:01:22.606948
153	153	Mặc định	\N	0	24	0	2026-07-05 13:01:22.608405
154	154	Mặc định	\N	0	24	0	2026-07-05 13:01:22.610285
155	155	Mặc định	\N	0	14	0	2026-07-05 13:01:22.611798
156	156	Mặc định	\N	0	4	0	2026-07-05 13:01:22.613172
157	157	Mặc định	\N	0	36	0	2026-07-05 13:01:22.614357
158	158	Mặc định	\N	0	14	0	2026-07-05 13:01:22.615623
159	159	Mặc định	\N	0	2	0	2026-07-05 13:01:22.616753
160	160	Mặc định	\N	0	36	0	2026-07-05 13:01:22.617842
161	161	Mặc định	\N	0	24	0	2026-07-05 13:01:22.61895
162	162	Mặc định	\N	0	24	0	2026-07-05 13:01:22.620196
163	163	Mặc định	\N	0	24	0	2026-07-05 13:01:22.621375
164	164	Mặc định	\N	0	24	0	2026-07-05 13:01:22.622476
165	165	Mặc định	\N	0	50	0	2026-07-05 13:01:22.623725
166	166	Mặc định	\N	0	24	0	2026-07-05 13:01:22.624719
167	167	Mặc định	\N	0	15	0	2026-07-05 13:01:22.625978
168	168	Mặc định	\N	0	30	0	2026-07-05 13:01:22.626963
169	169	Mặc định	\N	0	10	0	2026-07-05 13:01:22.628113
170	170	Mặc định	\N	0	50	0	2026-07-05 13:01:22.629295
171	171	Mặc định	\N	0	50	0	2026-07-05 13:01:22.630507
172	172	Mặc định	\N	0	50	0	2026-07-05 13:01:22.632149
173	173	Mặc định	\N	0	50	0	2026-07-05 13:01:22.633381
174	174	Mặc định	\N	0	50	0	2026-07-05 13:01:22.634384
175	175	Mặc định	\N	0	50	0	2026-07-05 13:01:22.635398
176	176	Mặc định	\N	0	50	0	2026-07-05 13:01:22.636547
177	177	Mặc định	\N	0	50	0	2026-07-05 13:01:22.637617
178	178	Mặc định	\N	0	50	0	2026-07-05 13:01:22.638783
179	179	Mặc định	\N	0	50	0	2026-07-05 13:01:22.639943
180	180	Mặc định	\N	0	50	0	2026-07-05 13:01:22.640932
181	181	Mặc định	\N	0	50	0	2026-07-05 13:01:22.642128
182	182	Mặc định	\N	0	50	0	2026-07-05 13:01:22.643493
183	183	Mặc định	\N	0	50	0	2026-07-05 13:01:22.6446
184	184	Mặc định	\N	0	50	0	2026-07-05 13:01:22.646095
185	185	Mặc định	\N	0	50	0	2026-07-05 13:01:22.647764
186	186	Mặc định	\N	0	50	0	2026-07-05 13:01:22.649018
187	187	Mặc định	\N	0	50	0	2026-07-05 13:01:22.650278
188	188	Mặc định	\N	0	50	0	2026-07-05 13:01:22.651474
189	189	Mặc định	\N	0	50	0	2026-07-05 13:01:22.652523
190	190	Mặc định	\N	0	50	0	2026-07-05 13:01:22.653966
191	191	Mặc định	\N	0	50	0	2026-07-05 13:01:22.655137
192	192	Mặc định	\N	0	50	0	2026-07-05 13:01:22.656365
193	193	Mặc định	\N	0	50	0	2026-07-05 13:01:22.657724
194	194	Mặc định	\N	0	50	0	2026-07-05 13:01:22.659585
195	195	Mặc định	\N	0	50	0	2026-07-05 13:01:22.662038
196	196	Mặc định	\N	0	50	0	2026-07-05 13:01:22.664198
197	197	Mặc định	\N	0	50	0	2026-07-05 13:01:22.666168
198	198	Mặc định	\N	0	50	0	2026-07-05 13:01:22.667393
199	199	Mặc định	\N	0	50	0	2026-07-05 13:01:22.668676
200	200	Mặc định	\N	0	50	0	2026-07-05 13:01:22.67009
201	201	Mặc định	\N	0	50	0	2026-07-05 13:01:22.671309
202	202	Mặc định	\N	0	50	0	2026-07-05 13:01:22.672562
203	203	Mặc định	\N	0	50	0	2026-07-05 13:01:22.673877
204	204	Mặc định	\N	0	50	0	2026-07-05 13:01:22.675399
205	205	Mặc định	\N	0	50	0	2026-07-05 13:01:22.676836
206	206	Mặc định	\N	0	50	0	2026-07-05 13:01:22.678277
208	208	Mặc định	\N	0	50	0	2026-07-05 13:01:22.680922
209	209	Mặc định	\N	0	50	0	2026-07-05 13:01:22.682152
210	210	Mặc định	\N	0	50	0	2026-07-05 13:01:22.68344
211	211	Mặc định	\N	0	50	0	2026-07-05 13:01:22.684518
212	212	Mặc định	\N	0	50	0	2026-07-05 13:01:22.685781
214	214	Mặc định	\N	0	50	0	2026-07-05 13:01:22.688488
215	215	Mặc định	\N	0	50	0	2026-07-05 13:01:22.689646
216	216	Mặc định	\N	0	50	0	2026-07-05 13:01:22.690864
217	217	Mặc định	\N	0	50	0	2026-07-05 13:01:22.691813
218	218	Mặc định	\N	0	50	0	2026-07-05 13:01:22.693113
219	219	Mặc định	\N	0	50	0	2026-07-05 13:01:22.694236
220	220	Mặc định	\N	0	50	0	2026-07-05 13:01:22.695334
221	221	Mặc định	\N	0	50	0	2026-07-05 13:01:22.696413
222	222	Mặc định	\N	0	50	0	2026-07-05 13:01:22.69743
223	223	Mặc định	\N	0	50	0	2026-07-05 13:01:22.698645
148	148	Mặc định	\N	0	0	0	2026-07-05 13:01:22.60111
\.


--
-- TOC entry 5283 (class 0 OID 34187)
-- Dependencies: 229
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, category_id, name, slug, description, base_price, status, sold_count, created_at, updated_at) FROM stdin;
10	8	Thắt lưng da bò khóa cài tiện lợi	that-lung-da-bo-khoa-cai	Da bò thật mềm mại, thiết kế thanh lịch.	350000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
11	8	Thắt lưng nam công sở vân cá sấu	that-lung-nam-cong-so-van-ca-sau	Chất liệu da bò, khóa lăn kim loại.	500000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
12	8	Thắt lưng da bò dập vân cá sấu	that-lung-da-bo-dap-van-ca-sau	Da bò cao cấp, mặt vuông sang trọng.	600000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
13	3	Ví ngắn da bò mềm cao cấp	vi-ngan-da-bo-mem-cao-cap	Ví ngắn da bò mềm màu đen.	400000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
14	3	Ví da cầm tay nữ dáng gọn	vi-da-cam-tay-nu-dang-gon	Ví nữ da bò nhiều màu sắc.	700000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
15	3	Ví da thuộc thảo mộc dáng đứng	vi-da-thuoc-thao-moc-dang-dung	Da bò cao cấp nhiều màu.	300000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
16	3	Ví nữ cầm tay một khóa kéo da bò	vi-nu-cam-tay-mot-khoa-keo	Ví nữ da bò thiết kế sang trọng.	500000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
17	8	Cặp da sáp công sở đựng Laptop	cap-da-sap-cong-so-laptop	Cặp da bò công sở cao cấp.	1600000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
18	3	Ví ngắn gấp 3 da sáp cá tính	vi-ngan-gap-3-da-sap	Ví da bò sáp nhỏ gọn.	300000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
19	3	Ví dáng đứng da bò mềm	vi-dang-dung-da-bo-mem	Thiết kế tối giản, nhỏ gọn.	250000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
20	3	Ví đứng da bò mềm gọn đẹp	vi-dung-da-bo-mem-gon-dep	Ví da bò màu nâu vàng, xanh.	300000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
21	5	Giày lười da công sở đai ngang	giay-luoi-da-cong-so	Giày da bò thật đế cao su.	600000	active	0	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
7	3	Balo nữ da thật Handmade độc đẹp lạ	balo-nu-da-that-handmade-doc-la	Thiết kế độc đáo dùng đi làm, du lịch.	430000	active	5	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
8	8	Thắt lưng da Cá sấu bản 3.4cm khóa tự động	that-lung-da-ca-sau-khoa-tu-dong	Thắt lưng da cá sấu cao cấp khóa tự động.	1100000	active	1	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
9	8	Thắt lưng da Cá Sấu mặt chữ Z	that-lung-da-ca-sau-mat-chu-z	Da cá sấu thật 100%, mặt khóa chữ Z.	1200000	active	2	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
2	3	Túi xách nữ Handmade da bò retro thời trang	tui-xach-nu-handmade-da-bo-retro	Độ bền da thật cao, không bong tróc, nứt gãy, không ra màu.	9000000	inactive	18	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
29	6	Ví dài Handmade đơn giản mà chất	ví-dài-handmade-đơn-giản-mà-chất-125	Ví dài Handmade đơn giản mà chất - 125940\n\n- Kích thước: 9cm x 19cm\n\n- Da bò thật 100%	320000	active	0	2026-07-05 13:01:22.43006	2026-07-05 13:01:22.43006
3	6	Vòng tay Handmade da thật	vong-tay-handmade-da-that	Vòng tay làm từ da bò thật phong cách cổ điển.	180000	active	30	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
4	3	Ví dài nữ da bò handmade	vi-dai-nu-da-bo-handmade	Kích thước: 19.5cm x 9.5cm x 2cm - Da bò thật 100%	210000	active	1	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
6	3	Ví dài Handmade đơn giản mà chất	vi-dai-handmade-don-gian-chat	Ví dài handmade da bò thật 100%	320000	active	11	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
22	6	Túi xách nữ Handmade da bò retro thời trang	túi-xách-nữ-handmade-da-bò-retro-thời-trang	Độ bền da thật cao, không bong tróc, nứt gãy, không ra màu, độ đàn hồi và chịu lực tốt là những ưu điểm nổi bật giúp chất liệu này được sử dụng rộng rãi trong ngành thời trang nữ	9000000	active	0	2026-07-05 13:00:58.125382	2026-07-05 13:00:58.125382
23	6	Vòng tay Handmade da thật	vòng-tay-handmade-da-thật	Vòng tay được làm từ da bò thật với thiết kế đơn giản mang hơi hướng cổ điển nhưng vẫn vô cùng cá tính . Vòng có nhiều phiên bản màu sắc cho bạn lựa chọn .\n\n	180000	active	0	2026-07-05 13:00:58.137818	2026-07-05 13:00:58.137818
25	6	Túi xách nữ Handmade da bò retro thời trang	túi-xách-nữ-handmade-da-bò-retro-thời-trang-121	Độ bền da thật cao, không bong tróc, nứt gãy, không ra màu, độ đàn hồi và chịu lực tốt là những ưu điểm nổi bật giúp chất liệu này được sử dụng rộng rãi trong ngành thời trang nữ	9000000	active	0	2026-07-05 13:01:22.418325	2026-07-05 13:01:22.418325
26	6	Vòng tay Handmade da thật	vòng-tay-handmade-da-thật-122	Vòng tay được làm từ da bò thật với thiết kế đơn giản mang hơi hướng cổ điển nhưng vẫn vô cùng cá tính . Vòng có nhiều phiên bản màu sắc cho bạn lựa chọn .\n\n	180000	active	0	2026-07-05 13:01:22.424888	2026-07-05 13:01:22.424888
27	6	Túi xách nữ Handmade da bò retro thời trang	túi-xách-nữ-handmade-da-bò-retro-thời-trang-123	- Kích thước: 19.5cm x 9.5cm x 2cm\n\n- Chất liệu: Da bò thật 100%	210000	active	0	2026-07-05 13:01:22.426735	2026-07-05 13:01:22.426735
28	6	Balo nữ da bò thật Handmade đẹp	balo-nữ-da-bò-thật-handmade-đẹp-124	Balo nữ da bò thật được làm từ chất liệu da bò thật nhập khẩu nổi tiếng nhờ sự bền bỉ, chắc chắn, có độ đàn hồi cao, không bong tróc, bứt gãy, vô cùng ấn tượng và thời trang\n\n	1400000	active	0	2026-07-05 13:01:22.428294	2026-07-05 13:01:22.428294
30	6	Balo nữ da thật Handmade độc đẹp lạ	balo-nữ-da-thật-handmade-độc-đẹp-lạ-126	Balo nữ da thật Handmade độc - 321482\n\n- Kích thước: 29cm x 25cm x 13cm\n\n- Da bò thật 100%\n\n- Kiểu dáng: Xách tay, đeo sau lưng, đeo trước bụng\n\n- Dành cho: Nữ\n\n- Mục đích sử dụng: Đi làm, đi chơi, du lịch, dạo phố, picnic	430000	active	0	2026-07-05 13:01:22.432337	2026-07-05 13:01:22.432337
31	6	Thắt lưng da Cá sấu bản 3,4cm khóa tự động	thắt-lưng-da-cá-sấu-bản-3,4cm-khóa-tự-động-127	Thắt lưng da cá sấu cao cấp, bản 3.4cm sang trọng với khóa tự động hiện đại, bền bỉ theo thời gian.	1100000	active	0	2026-07-05 13:01:22.433997	2026-07-05 13:01:22.433997
32	6	Thắt lưng da Cá Sấu mặt chữ Z bản 3,8	thắt-lưng-da-cá-sấu-mặt-chữ-z-bản-3,8-128	Chất liệu da cá sấu thật 100%, mặt khóa chữ Z tạo điểm nhấn cá tính, bản rộng 3.8cm phù hợp nhiều loại trang phục.	1200000	active	0	2026-07-05 13:01:22.435665	2026-07-05 13:01:22.435665
96	3	Dây Chuyền Pha Lê Anh Đào Đôi	dây-chuyền-pha-lê-anh-đào-đôi-52	Dây Chuyền Pha Lê Anh Đào Đôi	199000	active	0	2026-07-05 13:01:22.529941	2026-07-05 13:01:22.529941
5	3	Balo nữ da bò thật Handmade đẹp	balo-nu-da-bo-that-handmade	Balo nữ da bò thật nhập khẩu, bền đẹp.	1400000	active	7	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
33	6	Thắt lưng da bò khóa cài tiện lợi	thắt-lưng-da-bò-khóa-cài-tiện-lợi-129	Thiết kế đơn giản, khóa cài tiện dụng. Chất liệu da bò thật mềm mại, dẻo dai, phong cách thanh lịch.	350000	active	0	2026-07-05 13:01:22.437285	2026-07-05 13:01:22.437285
34	6	Thắt lưng nam công sở vân cá sấu khóa lăn 	thắt-lưng-nam-công-sở-vân-cá-sấu-khóa-lăn-130	Chất liệu : Da bò\nKhóa: Khóa lăn kim loại	500000	active	0	2026-07-05 13:01:22.440086	2026-07-05 13:01:22.440086
35	6	Thắt lưng da bò dập vân cá sấu mặt vuông	thắt-lưng-da-bò-dập-vân-cá-sấu-mặt-vuông-131	Kích thước: 115cm -130cm x 3.5cm\n\nChất liệu: Da bò\n\nMàu sắc: Mặt bạc, Mặt vàng	600000	active	0	2026-07-05 13:01:22.44141	2026-07-05 13:01:22.44141
36	6	Ví ngắn da bò mềm cao cấp	ví-ngắn-da-bò-mềm-cao-cấp-132	Kích thước: 13cm x 9,5cm\n\nChất liệu: Da bò\n\nMàu sắc: Đen	400000	active	0	2026-07-05 13:01:22.443015	2026-07-05 13:01:22.443015
37	6	Ví da cầm tay nữ dáng gọn	ví-da-cầm-tay-nữ-dáng-gọn-133	Kích thước: 19cm x 10cm x 2.5cm\n\nChất liệu: Da bò \n\nMàu sắc: Đỏ, Tím, Đen	700000	active	0	2026-07-05 13:01:22.444999	2026-07-05 13:01:22.444999
38	6	Ví da thuộc thảo mộc dáng đứng	ví-da-thuộc-thảo-mộc-dáng-đứng-134	Kích thước: 12 x 8,5 x 2 (cm)\n\nChất liệu: Da bò\n\nMàu sắc: Nâu, Đen, Xanh biển, Nâu vàng, Oliu	300000	active	0	2026-07-05 13:01:22.446405	2026-07-05 13:01:22.446405
39	6	Ví nữ cầm tay một khóa kéo da bò	ví-nữ-cầm-tay-một-khóa-kéo-da-bò-135	Kích cỡ : 19,5 x 10 x 2,5 (cm)\n\nMàu sắc: Nâu đậm, Xanh biển, Xanh lá\n\nChất liệu : Da bò	500000	active	0	2026-07-05 13:01:22.447864	2026-07-05 13:01:22.447864
40	6	XÓA MẪU Cặp da sáp công sở đựng Laptop 15,6	xóa-mẫu-cặp-da-sáp-công-sở-đựng-laptop-15,6-136	Kích thước : 42 x 30 x 8 ( cm )\n\nMàu sắc : Xanh, Nâu\n\nChất liệu : Da bò	1600000	active	0	2026-07-05 13:01:22.44925	2026-07-05 13:01:22.44925
41	6	Ví ngắn gấp 3 da sáp cá tính 	ví-ngắn-gấp-3-da-sáp-cá-tính-137	Ví ngắn gấp 3 da sáp cá tính - 3551241\nKích thước: 11cm x 8cm x 2cm\n\nChất liệu: Da bò sáp	300000	active	0	2026-07-05 13:01:22.450727	2026-07-05 13:01:22.450727
42	6	Ví dáng đứng da bò mềm gọn, đẹp	ví-dáng-đứng-da-bò-mềm-gọn,-đẹp-138	Ví đứng với thiết kế tối giản, da bò mềm mại, kích thước nhỏ gọn phù hợp bỏ túi quần thoải mái.	0	active	0	2026-07-05 13:01:22.452033	2026-07-05 13:01:22.452033
43	6	Túi xách nữ Handmade da bò retro thời trang	túi-xách-nữ-handmade-da-bò-retro-thời-trang-139	Kích thước: 11,5 cm x 9,5 cm x 1.5cm\n\nChất liệu: Da bò\n\nMàu sắc: Nâu vàng, nâu đậm, xanh	300000	active	0	2026-07-05 13:01:22.453159	2026-07-05 13:01:22.453159
44	6	Giày lười da công sở đai ngang	giày-lười-da-công-sở-đai-ngang-140	 Màu sắc : Nâu vàng\n\n Chất liệu: Da bò thật, đế cao su\n\n Size giày : 38-43	600000	active	0	2026-07-05 13:01:22.4549	2026-07-05 13:01:22.4549
45	5	Chén Chấm Dáng Thuyền	chén-chấm-dáng-thuyền-101	Không đơn điệu với màu trắng thông thường, chén chấm từ Minh Tiến Ceramics mang màu sắc tươi sáng, giúp tô điểm thêm cho bàn ăn của bạn.	70000	active	0	2026-07-05 13:01:22.456503	2026-07-05 13:01:22.456503
46	5	Cốc Ruy Băng Gốm Sứ, 330ml	cốc-ruy-băng-gốm-sứ,-330ml-102	Vẻ Ngoài Tươi Tắn Đáng Yêu, Cốc Sứ Thủ Công, Quà Tặng Cho Nữ.	299000	active	0	2026-07-05 13:01:22.45761	2026-07-05 13:01:22.45761
47	5	Tượng Gốm Sứ Hổ Nhâm Dần	tượng-gốm-sứ-hổ-nhâm-dần-103	Con Đực Màu Xanh Lam, Thủ Công Mỹ Nghệ, Độc Đáo, Không Độc Hại, Quà Tặng Doanh Nghiệp	600000	active	0	2026-07-05 13:01:22.458813	2026-07-05 13:01:22.458813
48	5	Gác Đũa Sứ, Đồ Dùng Nhà Bếp Thiết Yếu Cho Mọi Gia Đình	gác-đũa-sứ,-đồ-dùng-nhà-bếp-thiết-yếu-cho-mọi-gia-đình-104	Gác đũa là vật dụng không thể thiếu, mang đến nét đẹp tinh tế cho bàn ăn. Chúng giúp đũa không bị dơ khi không dùng đến.	27000	active	0	2026-07-05 13:01:22.460182	2026-07-05 13:01:22.460182
49	5	Bình Hoa Gốm Sứ Dã Quỳ	bình-hoa-gốm-sứ-dã-quỳ-105	Lấy cảm hứng từ nhành cây dã quỳ tràn sức sống, mẫu bình hoa Dã Quỳ tại Minh Tiến Ceramics là điểm nhấn độc đáo cho bất kỳ không gian sống nào.	279000	active	0	2026-07-05 13:01:22.461657	2026-07-05 13:01:22.461657
50	5	Bình Hoa Gốm Sứ Lá Chuối Miệng Tim	bình-hoa-gốm-sứ-lá-chuối-miệng-tim-106	Chiếc bình hình dáng độc đáo này được lấy ý tưởng từ những chiếc lá chuối - một hình ảnh quen thuộc của làng quê Việt Nam. 	239000	active	0	2026-07-05 13:01:22.463226	2026-07-05 13:01:22.463226
51	5	Bình Hoa Gốm Sứ Bích Tuyền	bình-hoa-gốm-sứ-bích-tuyền-107	Bình hoa Bích Tuyền phảng phất đâu đó nét hoài cổ của những chiếc bình gốm sứ truyền thống. Với lớp men bóng cùng màu sắc độc đáo, sản phẩm dù đặt trong không gian cổ điển hay hiện đại đều mang đến vẻ đẹp riêng.	231000	active	0	2026-07-05 13:01:22.465055	2026-07-05 13:01:22.465055
52	5	Bình Hoa Gốm Sứ Lá Chuối Miệng Tim	bình-hoa-gốm-sứ-lá-chuối-miệng-tim-108	Chiếc bình hình dáng độc đáo này được lấy ý tưởng từ những chiếc lá chuối - một hình ảnh quen thuộc của làng quê Việt Nam. 	239000	active	0	2026-07-05 13:01:22.467454	2026-07-05 13:01:22.467454
53	5	Tượng Gà Trang Trí Để Tiền, Tượng Gà Gốm Sứ	tượng-gà-trang-trí-để-tiền,-tượng-gà-gốm-sứ-109	Một mẫu tượng hình dáng độc đáo, lại có thể sử dụng như ống tiết kiệm tiền sẽ rất phù hợp để bạn tô điểm không gian sống của mình.	239000	active	0	2026-07-05 13:01:22.468822	2026-07-05 13:01:22.468822
54	5	Cốc Sứ Tím Iris, Dòng Morning	cốc-sứ-tím-iris,-dòng-morning-110	Dịu dàng và thơ mộng tựa một đóa diên vỹ, mẫu cốc màu tím nhạt này từ Minh Tiến Ceramics sẽ rất phù hợp với những ai yêu thích phong cách nhẹ nhàng.	100000	active	0	2026-07-05 13:01:22.469993	2026-07-05 13:01:22.469993
55	5	Bình Hoa Tròn Gốm Sứ	bình-hoa-tròn-gốm-sứ-111	Chiếc bình gốm nhỏ nhắn từ The Goods phù hợp để cắm hoa và trang trí trên bàn làm việc hay phòng khách.	239000	active	0	2026-07-05 13:01:22.471496	2026-07-05 13:01:22.471496
56	5	Chén Chấm Sứ Hình Hoa	chén-chấm-sứ-hình-hoa-112	Ngoài các thiết kế tối giản cho sản phẩm bát đĩa, Gốm Đông Gia còn mang đến những thiết kế tinh tế khác như sản phẩm chén chấm này.	52000	active	0	2026-07-05 13:01:22.472727	2026-07-05 13:01:22.472727
57	5	Tượng Gà Gốm Sành	tượng-gà-gốm-sành-113	Màu nước dưa là một sắc vàng có pha chút nâu, nhưng không quá đậm mà chỉ vừa đủ. Giúp làm bật lên nét đẹp mộc mạc, bình dị nhưng vẫn đủ nổi bật của mẫu tượng gốm.	239000	active	0	2026-07-05 13:01:22.474144	2026-07-05 13:01:22.474144
97	3	Dây Chuyền Ngọc Bích Bình An	dây-chuyền-ngọc-bích-bình-an-53	Dây Chuyền Ngọc Bích Bình An	289000	active	0	2026-07-05 13:01:22.53207	2026-07-05 13:01:22.53207
58	5	Bình Hoa Bầu Gốm Sứ Lớn	bình-hoa-bầu-gốm-sứ-lớn-114	Chiếc bình gốm mang sắc cam tươi sáng, với các hoa văn có hình dạng ngẫu nhiên nhưng mang đến tổng thể hài hòa và đẹp mắt.	449000	active	0	2026-07-05 13:01:22.476065	2026-07-05 13:01:22.476065
59	5	Ấm Lục Giác Sứ Cỡ Trung	ấm-lục-giác-sứ-cỡ-trung-115	Để làm đẹp cho tổ ấm yêu thương, người Việt thường tìm đến những sản phẩm gốm sứ có hoa văn tinh xảo và tính thẩm mỹ cao.	400000	active	0	2026-07-05 13:01:22.477658	2026-07-05 13:01:22.477658
60	5	Bộ Chén Bát Đĩa Sứ Crystal Green (Bộ 10 Món)	bộ-chén-bát-đĩa-sứ-crystal-green-(bộ-10-món)-116	Bộ Chén Bát Đĩa Sứ Crystal Green từ Gốm Đông Gia mang vẻ đẹp nhẹ nhàng và thanh lịch tựa như một viên pha lê trong trẻo. 	1500000	active	0	2026-07-05 13:01:22.479226	2026-07-05 13:01:22.479226
61	5	Bộ Chén Bát Đĩa Sứ Ocean Waves (Bộ 10 Món)	bộ-chén-bát-đĩa-sứ-ocean-waves-(bộ-10-món)-117	Được tạo tác thủ công đầy tinh tế cùng lớp men hoả biến màu xanh biển độc đáo, bộ Chén Bát Đĩa Sứ Ocean Waves từ Gốm Đông Gia mang nét đẹp hài hòa giữa sự hiện đại, sang trọng và thời thượng. 	1500000	active	0	2026-07-05 13:01:22.480433	2026-07-05 13:01:22.480433
62	5	Bộ Cốc & Phin Cà Phê Sứ Men Bóng	bộ-cốc-&-phin-cà-phê-sứ-men-bóng-118	Nếu bạn là một người thích uống cà phê và đặc biệt là thích tự pha cho mình một tách cà phê nóng hổi tại nhà, thì không còn gì tuyệt vời hơn một bộ sản phẩm vừa giúp pha cà phê tiện lợi, vừa tạo nét tinh tế trong căn bếp và trên góc bàn.	343000	active	0	2026-07-05 13:01:22.481611	2026-07-05 13:01:22.481611
63	5	Bát Chiết Yêu Men Cánh Gián Hỏa Biến	bát-chiết-yêu-men-cánh-gián-hỏa-biến-119	Bát Chiết Yêu được xem là một vật dụng ẩm thực gắn liền với nhiều thế hệ. Nay, vật phẩm này đã được Gomie Ceramic nâng tầm với diện mạo thật đẳng cấp.	180000	active	0	2026-07-05 13:01:22.482919	2026-07-05 13:01:22.482919
64	5	Bộ Chén Bát Đĩa Sứ Harvest Gold 10 Món Cho 1 Người	bộ-chén-bát-đĩa-sứ-harvest-gold-10-món-cho-1-người-120	Bộ Chén Bát Đĩa Sứ Harvest Gold mang đến vẻ đẹp nhẹ nhàng xen với chút xưa cũ, là sự lựa chọn lý tưởng cho những ai thích phong cách cổ điển và hoài niệm.	1290000	active	0	2026-07-05 13:01:22.484213	2026-07-05 13:01:22.484213
65	7	SPOT OUT BEAUTY CONCENTRATE – Tinh chất mờ thâm nám làm đều màu da	spot-out-beauty-concentrate-–-tinh-chất-mờ-thâm-nám-làm-đều-màu-da-141	Ức chế phản ứng oxy hóa, ngăn ngừa tổn thương tế bào DNA do tia UV gây ra. Giảm viêm, giảm hiện tượng giãn mạch, mẩn đỏ. Giải quyết vấn đề tăng sinh melanin trên da theo nhiều cơ chế: kiểm soát gen MITF – gen điều hòa chính về sự phát triển và biệt hóa của tế bào hắc tố; cản trở sự chuyển giao melanin đến các lớp da trên cùng; ngăn chặn sự tổng hợp melanin một cách thái quá dưới tác động của tia UV.	600000	active	0	2026-07-05 13:01:22.48605	2026-07-05 13:01:22.48605
66	7	PURIFYING FACIAL CLEANSER PHA & MANDELIC ACID – Sữa rửa mặt làm sạch sâu PHA và Mandelic Acid	purifying-facial-cleanser-pha-&-mandelic-acid-–-sữa-rửa-mặt-làm-sạch-sâu-pha-và-mandelic-acid-142	Có bạn sẽ đặt câu hỏi rằng những acid tẩy da chết hóa học khi sử dụng trong sữa rửa mặt – một sản phẩm chỉ dùng trên da khoảng 01 phút thì liệu có thể phát huy tác dụng không? Câu trả lời là có. Sữa rửa mặt Purifying Facial Cleanser Mandelic Acid làm sạch sâu nhưng vẫn thân thiện với lớp hàng rào bảo vệ da, loại bỏ hiệu quả bã nhờn, bụi bẩn, mỹ phẩm tồn dư trả lại làn da sạch tối ưu hóa chế độ dưỡng da phía sau.	370000	active	0	2026-07-05 13:01:22.488843	2026-07-05 13:01:22.488843
67	7	INSTANT RELIEF SKIN HEALING SERUM – Tinh chất phục hồi giảm kích ứng	instant-relief-skin-healing-serum-–-tinh-chất-phục-hồi-giảm-kích-ứng-143	Tinh chất phục hồi giảm kích ứng Instant Relief Skin Healing Serum là một sản phẩm chăm sóc đặc biệt cho những làn da bị kích ứng, dị ứng với mỹ phẩm hoặc thời tiết.\nBản chất của làn da bị kích ứng, dị ứng là sự hoạt động “năng nổ” của hệ miễn dịch dưới da để chống lại những yếu tố bên ngoài mà cơ thể cảm thấy không an toàn. Nhưng, rất nhiều khi sự tích cực này vượt khỏi khả năng chịu đựng của cơ thể và tạo ra những phản ứng vô cùng khó chịu, hoặc mất thẩm mỹ cho làn da chúng ta.	240000	active	0	2026-07-05 13:01:22.490479	2026-07-05 13:01:22.490479
68	7	BRIGHTENING HEALTHY CREAM – Kem dưỡng sáng da mờ thâm sạm	brightening-healthy-cream-–-kem-dưỡng-sáng-da-mờ-thâm-sạm-144	Silicone và Copolymer không phải là những thành phần xấu, chúng rất hữu ích trong việc tạo ra kết cấu đẹp, trơn mượt và nâng cao khả năng khóa ẩm cho các sản phẩm dưỡng da. Tuy nhiên, qua thực tế từ quá trình tư vấn vấn chăm sóc da cho khách hàng, SheaGhana nhận ra có một bộ phận không nhỏ người dùng mỹ phẩm bị dị ứng hoặc sinh mụn ẩn khi dùng mỹ phẩm có chứa các thành phần thuộc 2 nhóm này. Nhất là những làn da bị vấn đề do từng dùng rượu thuốc kem trộn.	470000	active	0	2026-07-05 13:01:22.491816	2026-07-05 13:01:22.491816
69	7	APPLE CLEANSING WATER – Nước tẩy trang táo đỏ	apple-cleansing-water-–-nước-tẩy-trang-táo-đỏ-145	- Nước tẩy trang chiết xuất táo đỏ làm sạch lớp trang điểm, kem chống nắng, bui bẩn và bã nhờn mà không làm khô da, không ảnh hưởng đến lớp màng lipid bảo vệ da. \n- Kết hợp với những thành phần tự nhiên như chiết xuất táo có khả năng loại bỏ da chết nhẹ nhàng \n- Cân bằng ẩm, bổ sung dưỡng chất chống lại các gốc tự do cho da. 	200000	active	0	2026-07-05 13:01:22.493072	2026-07-05 13:01:22.493072
70	7	SPOT OUT BEAUTY OIL – Dầu dưỡng mờ thâm nám làm đều màu da	spot-out-beauty-oil-–-dầu-dưỡng-mờ-thâm-nám-làm-đều-màu-da-146	Dầu dưỡng có kết cấu lỏng nhẹ, cực nhanh thấm. Giúp sáng đều màu da an toàn, đẩy lùi các vết thâm, điều hòa quá trình sản sinh sắc tố trên da nhịp nhàng, cân bằng giữa quá trình hình thành và phân hủy melanin, nhờ vậy tình trạng nám được cải thiện. Chiết xuất hoa nhung tuyết cùng Tinh dầu hạt cà rốt organic với khả năng chống oxy hoá mạnh mẽ sẽ duy trì nét thanh xuân thật lâu trên khuôn mặt của bạn. 	450000	active	0	2026-07-05 13:01:22.494487	2026-07-05 13:01:22.494487
98	3	Dây Chuyền Đá Hoa Nắng	dây-chuyền-đá-hoa-nắng-54	Dây Chuyền Đá Hoa Nắng	249000	active	0	2026-07-05 13:01:22.533333	2026-07-05 13:01:22.533333
99	3	Dây Chuyền Đá Zircon Hình Trái Tim	dây-chuyền-đá-zircon-hình-trái-tim-55	Dây Chuyền Đá Zircon Hình Trái Tim	299000	active	0	2026-07-05 13:01:22.53447	2026-07-05 13:01:22.53447
71	7	CLEANSING OIL BETTER NEAKED SKIN – Dầu tẩy trang làm sạch sâu bảo vệ da	cleansing-oil-better-neaked-skin-–-dầu-tẩy-trang-làm-sạch-sâu-bảo-vệ-da-147	CÔNG DỤNG: Dầu tẩy trang là sản phẩm làm sạch không thể thiếu đối với những làn da dễ bị bí tắc lỗ chân lông. Đây là phiên bản dầu tẩy trang tối ưu nhất từ trước đến nay SheaGhana từng làm.\n- Làm sạch tối ưu sebum (bã nhờn), kem chống nắng và mỹ phẩm dư thừa trên da. \n- Chỉ cần một vài thao tác rửa nước cũng giúp nhũ hóa hoàn toàn sản phẩm này. 	305000	active	0	2026-07-05 13:01:22.495799	2026-07-05 13:01:22.495799
72	7	BATH & BODY BALM SCRUB SALT COFFEE – Bơ tắm dưỡng thể cà phê muối	bath-&-body-balm-scrub-salt-coffee-–-bơ-tắm-dưỡng-thể-cà-phê-muối-148	Bơ tắm dưỡng thể cà phê muối sẽ là một loại bơ tắm mà bạn sẽ “nghiện” ngay từ lần đầu tiên sử dụng – sản phẩm có khả năng tẩy da chết, làm mềm mịn da và cải thiện hiệu quả những vấn đề của da body từ mụn đến viêm lỗ chân lông.	295000	active	0	2026-07-05 13:01:22.496959	2026-07-05 13:01:22.496959
73	7	INTENSIVE CARE 72H FACE CREAM – Kem dưỡng ẩm chuyên sâu 72h	intensive-care-72h-face-cream-–-kem-dưỡng-ẩm-chuyên-sâu-72h-149	Bạn có biết vì sao da em bé lại trông rất mịn màng và căng mọng không? Bởi vì các tế bào da của một em bé luôn chứa nước và các lipid duy trì sự ẩm mượt của da ở trạng thái cân bằng nhất.\nKhi chúng ta lớn dần, khả năng giữ nước của tế bào dần suy giảm, cơ chế tổng hợp các acid béo, collagen, elastin dần suy kiệt, các gốc tự do được dịp càn quét phá hủy các tế bào khỏe mạnh.	350000	active	0	2026-07-05 13:01:22.498529	2026-07-05 13:01:22.498529
74	7	SERUM VITAMIN C – Tinh chất sáng da chống lão hóa Vitamin C	serum-vitamin-c-–-tinh-chất-sáng-da-chống-lão-hóa-vitamin-c-150	Tinh chất sáng da chống lão hóa YOUTH TO SKIN VITAMIN C SERUM làm sáng da, mờ thâm và ngăn ngừa lão hóa với 10% vitamin C và 3% Alpha Arbutin. Có thể sử dụng cho cả da nhạy cảm.	320000	active	0	2026-07-05 13:01:22.499687	2026-07-05 13:01:22.499687
75	7	PEPTIDE DREAM SKIN SERUM- Serum tái sinh da tươi trẻ	peptide-dream-skin-serum--serum-tái-sinh-da-tươi-trẻ-151	Phiên bản tinh chất giàu dinh dưỡng đậm đặc, đáp ứng nhu cầu chăm sóc cho những làn da cần tái tạo, da tổn thương hoặc lão hóa.	590000	active	0	2026-07-05 13:01:22.500925	2026-07-05 13:01:22.500925
76	7	GENTLE EXFOLIATING SOLUTION 5% PHA & 10% MANDELIC ACID	gentle-exfoliating-solution-5%-pha-&-10%-mandelic-acid-152	Sản phẩm này có tính treatment nhưng KHÔNG HỀ THÔ BẠO, giúp cải thiện HIỆU QUẢ các vấn đề da về mụn, vết thâm, làm sáng da.	390000	active	0	2026-07-05 13:01:22.502266	2026-07-05 13:01:22.502266
77	7	Phôi xà phòng dạng vảy	phôi-xà-phòng-dạng-vảy-153	Phôi xà phòng dạng vảy là sản phẩm của quá trình xà phòng hoá các acid béo là dầu dừa bằng kiềm. Sử dụng để làm xà phòng handmade cực kỳ đơn giản.	120000	active	0	2026-07-05 13:01:22.503441	2026-07-05 13:01:22.503441
78	7	Dầu MCT 100ml	dầu-mct-100ml-154	Dầu MCT nguyên chất chiết xuất từ dầu dừa, không mùi, không màu, giúp dưỡng ẩm và làm nền cho các sản phẩm mỹ phẩm handmade.	50000	active	0	2026-07-05 13:01:22.504712	2026-07-05 13:01:22.504712
79	7	Dầu nụ tầm xuân giúp đánh thức vẻ đẹp làn da	dầu-nụ-tầm-xuân-giúp-đánh-thức-vẻ-đẹp-làn-da-155	Dầu nụ tầm xuân được chiết xuất từ nụ hoa của cây tầm xuân, mang lại hiệu quả tái tạo và phục hồi làn da vượt trội.	70000	active	0	2026-07-05 13:01:22.505862	2026-07-05 13:01:22.505862
80	7	100g bột đậu đỏ hạt nhỏ nguyên chất	100g-bột-đậu-đỏ-hạt-nhỏ-nguyên-chất-156	Bột đậu đỏ xay mịn nguyên chất, hỗ trợ dưỡng trắng, tẩy tế bào chết và ngăn ngừa mụn hiệu quả.	11000	active	0	2026-07-05 13:01:22.50699	2026-07-05 13:01:22.50699
81	7	KEM NGHỆ SỮA ONG CHÚA (HANDMADE)	kem-nghệ-sữa-ong-chúa-(handmade)-157	Sản phẩm thiên nhiên an toàn cho mẹ bầu và đang cho con bú, hỗ trợ giảm thâm nám và làm sáng da.	99000	active	0	2026-07-05 13:01:22.508374	2026-07-05 13:01:22.508374
82	7	SỮA RỬA MẶT NGHỆ GẤC BƠ (HANDMADE)	sữa-rửa-mặt-nghệ-gấc-bơ-(handmade)-158	Sữa rửa mặt 100% thiên nhiên từ gấc, nghệ và bơ. Giúp làm sạch dịu nhẹ và không gây khô da.	135000	active	0	2026-07-05 13:01:22.510241	2026-07-05 13:01:22.510241
83	7	CỐT NGHỆ HẠT GẤC HẠ THỔ FACE 500ML	cốt-nghệ-hạt-gấc-hạ-thổ-face-500ml-159	Sản phẩm hạ thổ 100 ngày, giúp mờ thâm nám, trắng da, đặc biệt tốt cho phụ nữ sau sinh.	130000	active	0	2026-07-05 13:01:22.511583	2026-07-05 13:01:22.511583
84	7	DƯỠNG MÔI DẦU GẤC 10ML THƠM XỊN	dưỡng-môi-dầu-gấc-10ml-thơm-xịn-160	Dưỡng môi dầu gấc giúp trị nẻ, làm hồng môi và cung cấp độ ẩm cần thiết cho đôi môi mềm mịn.	16000	active	0	2026-07-05 13:01:22.512697	2026-07-05 13:01:22.512697
85	3	Dây Đeo Chú Lăng Nghiêm	dây-đeo-chú-lăng-nghiêm-41	Dây Đeo Chú Lăng Nghiêm	129000	active	0	2026-07-05 13:01:22.51421	2026-07-05 13:01:22.51421
86	3	Dây Chuyền Vòng Trăng Ánh Sao	dây-chuyền-vòng-trăng-ánh-sao-42	Dây Chuyền Vòng Trăng Ánh Sao	229000	active	0	2026-07-05 13:01:22.515333	2026-07-05 13:01:22.515333
87	3	Dây Chuyền Pha Lê Ánh Trăng	dây-chuyền-pha-lê-ánh-trăng-43	Dây Chuyền Pha Lê Ánh Trăng	259000	active	0	2026-07-05 13:01:22.516981	2026-07-05 13:01:22.516981
88	3	Dây Chuyền Đá Aquamarine	dây-chuyền-đá-aquamarine-44	Dây Chuyền Đá Aquamarine	279000	active	0	2026-07-05 13:01:22.518254	2026-07-05 13:01:22.518254
89	3	Dây Chuyền Đá Pha Lê Chuồn Chuồn	dây-chuyền-đá-pha-lê-chuồn-chuồn-45	Dây Chuyền Đá Pha Lê Chuồn Chuồn	259000	active	0	2026-07-05 13:01:22.519521	2026-07-05 13:01:22.519521
90	3	Dây Chuyền Đá Mã Não Đỏ	dây-chuyền-đá-mã-não-đỏ-46	Dây Chuyền Đá Mã Não Đỏ	289000	active	0	2026-07-05 13:01:22.521167	2026-07-05 13:01:22.521167
91	3	Dây Chuyền Trái Tim Cỏ Bốn Lá May Mắn	dây-chuyền-trái-tim-cỏ-bốn-lá-may-mắn-47	Dây Chuyền Trái Tim Cỏ Bốn Lá May Mắn	189000	active	0	2026-07-05 13:01:22.52236	2026-07-05 13:01:22.52236
92	3	Dây Chuyền Hoa 4 Lá May Mắn	dây-chuyền-hoa-4-lá-may-mắn-48	Dây Chuyền Hoa 4 Lá May Mắn	219000	active	0	2026-07-05 13:01:22.523612	2026-07-05 13:01:22.523612
93	3	Dây Chuyền Pha Lê Giọt Sương Cánh Bướm	dây-chuyền-pha-lê-giọt-sương-cánh-bướm-49	Dây Chuyền Pha Lê Giọt Sương Cánh Bướm	199000	active	0	2026-07-05 13:01:22.525096	2026-07-05 13:01:22.525096
94	3	Dây Chuyền Quả Cầu Chu Sa Đỏ	dây-chuyền-quả-cầu-chu-sa-đỏ-50	Dây Chuyền Quả Cầu Chu Sa Đỏ	249000	active	0	2026-07-05 13:01:22.526315	2026-07-05 13:01:22.526315
95	3	Dây Chuyền Hạt Tròn Sáp Ong	dây-chuyền-hạt-tròn-sáp-ong-51	Dây Chuyền Hạt Tròn Sáp Ong	299000	active	0	2026-07-05 13:01:22.528619	2026-07-05 13:01:22.528619
100	3	Dây Chuyền Đồng Xu Đá Thạch Anh Tím	dây-chuyền-đồng-xu-đá-thạch-anh-tím-56	Dây Chuyền Đồng Xu Đá Thạch Anh Tím	379000	active	0	2026-07-05 13:01:22.535777	2026-07-05 13:01:22.535777
101	3	Dây Chuyền Ngọc Bích Hình Mây	dây-chuyền-ngọc-bích-hình-mây-57	Dây Chuyền Ngọc Bích Hình Mây	489000	active	0	2026-07-05 13:01:22.537269	2026-07-05 13:01:22.537269
102	3	Dây Chuyền Đá Thạch Anh Xanh Dương	dây-chuyền-đá-thạch-anh-xanh-dương-58	Dây Chuyền Đá Thạch Anh Xanh Dương	289000	active	0	2026-07-05 13:01:22.538471	2026-07-05 13:01:22.538471
103	3	Dây Chuyền Pha Lê 12 Cung Hoàng Đạo	dây-chuyền-pha-lê-12-cung-hoàng-đạo-59	Dây Chuyền Pha Lê 12 Cung Hoàng Đạo	379000	active	0	2026-07-05 13:01:22.539694	2026-07-05 13:01:22.539694
104	3	Dây Chuyền Pha Lê Charm Trái Tim	dây-chuyền-pha-lê-charm-trái-tim-60	Dây Chuyền Pha Lê Charm Trái Tim	559000	active	0	2026-07-05 13:01:22.541044	2026-07-05 13:01:22.541044
105	4	Vòng tay mã não thiên nhiên 5mm quấn 2 vòng tay	vòng-tay-mã-não-thiên-nhiên-5mm-quấn-2-vòng-tay-61	Vòng tay mã não thiên nhiên 5mm quấn 2 vòng tay	199000	active	0	2026-07-05 13:01:22.543098	2026-07-05 13:01:22.543098
106	4	Vòng tay mã não thiên nhiên 4mm quấn 3 vòng tay hoa sen bạc	vòng-tay-mã-não-thiên-nhiên-4mm-quấn-3-vòng-tay-hoa-sen-bạc-62	Vòng tay mã não thiên nhiên 4mm quấn 3 vòng tay hoa sen bạc	199000	active	0	2026-07-05 13:01:22.544383	2026-07-05 13:01:22.544383
107	4	Vòng tay mã não thiên nhiên 7mm mix cẩm thạch	vòng-tay-mã-não-thiên-nhiên-7mm-mix-cẩm-thạch-63	Vòng tay mã não thiên nhiên 7mm mix cẩm thạch	199000	active	0	2026-07-05 13:01:22.545696	2026-07-05 13:01:22.545696
108	4	Vòng tay ngọc bích thiên nhiên 8mm mix chu sa, ngọc trai và charm bạc	vòng-tay-ngọc-bích-thiên-nhiên-8mm-mix-chu-sa,-ngọc-trai-và-charm-bạc-64	Vòng tay ngọc bích thiên nhiên 8mm mix chu sa, ngọc trai và charm bạc	199000	active	0	2026-07-05 13:01:22.547147	2026-07-05 13:01:22.547147
109	4	Vòng tay đá moonstone thiên nhiên 4mm quấn 3 vòng tay mix thạch anh tím, hổ phách	vòng-tay-đá-moonstone-thiên-nhiên-4mm-quấn-3-vòng-tay-mix-thạch-anh-tím,-hổ-phách-65	Vòng tay đá moonstone thiên nhiên 4mm quấn 3 vòng tay mix thạch anh tím, hổ phách	199000	active	0	2026-07-05 13:01:22.548633	2026-07-05 13:01:22.548633
110	4	Vòng tay mã não thiên nhiên quấn 2 vòng mix bánh xe và lu	vòng-tay-mã-não-thiên-nhiên-quấn-2-vòng-mix-bánh-xe-và-lu-66	Vòng tay mã não thiên nhiên quấn 2 vòng mix bánh xe và lu	199000	active	0	2026-07-05 13:01:22.5504	2026-07-05 13:01:22.5504
111	4	Kiềng tay mã não thiên nhiên bánh xe 6mm charm sen	kiềng-tay-mã-não-thiên-nhiên-bánh-xe-6mm-charm-sen-67	Kiềng tay mã não thiên nhiên bánh xe 6mm charm sen	199000	active	0	2026-07-05 13:01:22.551886	2026-07-05 13:01:22.551886
112	4	Hoa tai Hàn Quốc 432E	hoa-tai-hàn-quốc-432e-68	Hoa tai Hàn Quốc 432E	199000	active	0	2026-07-05 13:01:22.553182	2026-07-05 13:01:22.553182
113	4	Hoa tai Hàn Quốc 648E	hoa-tai-hàn-quốc-648e-69	Hoa tai Hàn Quốc 648E	199000	active	0	2026-07-05 13:01:22.554999	2026-07-05 13:01:22.554999
114	4	Hoa tai Hàn Quốc 15EC	hoa-tai-hàn-quốc-15ec-70	Hoa tai Hàn Quốc 15EC	199000	active	0	2026-07-05 13:01:22.556376	2026-07-05 13:01:22.556376
115	4	Hoa tai Hàn Quốc 139E	hoa-tai-hàn-quốc-139e-71	Hoa tai Hàn Quốc 139E	199000	active	0	2026-07-05 13:01:22.55784	2026-07-05 13:01:22.55784
116	4	Hoa tai Hàn Quốc 446E	hoa-tai-hàn-quốc-446e-72	Hoa tai Hàn Quốc 446E	199000	active	0	2026-07-05 13:01:22.559016	2026-07-05 13:01:22.559016
117	4	Hoa tai Hàn Quốc 506E	hoa-tai-hàn-quốc-506e-73	Hoa tai Hàn Quốc 506E	199000	active	0	2026-07-05 13:01:22.560312	2026-07-05 13:01:22.560312
118	4	Hoa tai pha lê ngắn hạt tròn 5003M10	hoa-tai-pha-lê-ngắn-hạt-tròn-5003m10-74	Hoa tai pha lê ngắn hạt tròn 5003M10	199000	active	0	2026-07-05 13:01:22.561451	2026-07-05 13:01:22.561451
119	4	Hoa tai pha lê dài mix 4470M10, pendant 5650M20	hoa-tai-pha-lê-dài-mix-4470m10,-pendant-5650m20-75	Hoa tai pha lê dài mix 4470M10, pendant 5650M20	199000	active	0	2026-07-05 13:01:22.562684	2026-07-05 13:01:22.562684
120	4	Hoa tai pha lê dài mix 4470M10, pendant 5203M18	hoa-tai-pha-lê-dài-mix-4470m10,-pendant-5203m18-76	Hoa tai pha lê dài mix 4470M10, pendant 5203M18	199000	active	0	2026-07-05 13:01:22.564336	2026-07-05 13:01:22.564336
121	4	Hoa tai pha lê dài mix 4470M10, pendant 6465M25	hoa-tai-pha-lê-dài-mix-4470m10,-pendant-6465m25-77	Hoa tai pha lê dài mix 4470M10, pendant 6465M25	199000	active	0	2026-07-05 13:01:22.566357	2026-07-05 13:01:22.566357
122	4	Hoa tai pha lê dài mix 4470M12, pendant 6026M20	hoa-tai-pha-lê-dài-mix-4470m12,-pendant-6026m20-78	Hoa tai pha lê dài mix 4470M12, pendant 6026M20	199000	active	0	2026-07-05 13:01:22.567604	2026-07-05 13:01:22.567604
123	4	Hoa tai pha lê dài mix 4470M10, pendant 6791M25	hoa-tai-pha-lê-dài-mix-4470m10,-pendant-6791m25-79	Hoa tai pha lê dài mix 4470M10, pendant 6791M25	199000	active	0	2026-07-05 13:01:22.568476	2026-07-05 13:01:22.568476
124	4	Hoa tai pha lê dài mix 4470M10, pendant 6690M27	hoa-tai-pha-lê-dài-mix-4470m10,-pendant-6690m27-80	Hoa tai pha lê dài mix 4470M10, pendant 6690M27	199000	active	0	2026-07-05 13:01:22.569375	2026-07-05 13:01:22.569375
125	4	Hoa tai pha lê ngắn hạt tròn 5003M10	hoa-tai-pha-lê-ngắn-hạt-tròn-5003m10-81	Hoa tai pha lê ngắn hạt tròn 5003M10	185000	active	0	2026-07-05 13:01:22.570304	2026-07-05 13:01:22.570304
126	4	Hoa tai pha lê dài mix 4470M10, pendant 5650M20 - Đôi	hoa-tai-pha-lê-dài-mix-4470m10,-pendant-5650m20---đôi-82	Hoa tai pha lê dài mix 4470M10, pendant 5650M20 - Đôi	185000	active	0	2026-07-05 13:01:22.571627	2026-07-05 13:01:22.571627
127	4	Hoa tai Hàn Quốc T16E 	hoa-tai-hàn-quốc-t16e-83	 Hoa tai Hàn Quốc T16E	245000	active	0	2026-07-05 13:01:22.572914	2026-07-05 13:01:22.572914
128	4	Hoa tai Hàn Quốc 85E 	hoa-tai-hàn-quốc-85e-84	 Hoa tai Hàn Quốc 85E	355000	active	0	2026-07-05 13:01:22.5741	2026-07-05 13:01:22.5741
129	4	 Hoa tai Hàn Quốc 739E	hoa-tai-hàn-quốc-739e-85	 Hoa tai Hàn Quốc 739E	295000	active	0	2026-07-05 13:01:22.57549	2026-07-05 13:01:22.57549
130	4	 Hoa tai Hàn Quốc 715E	hoa-tai-hàn-quốc-715e-86	Hoa tai Hàn Quốc 715E 	755000	active	0	2026-07-05 13:01:22.577191	2026-07-05 13:01:22.577191
131	4	 Hoa tai Hàn Quốc 69E	hoa-tai-hàn-quốc-69e-87	 Hoa tai Hàn Quốc 69E	287000	active	0	2026-07-05 13:01:22.578474	2026-07-05 13:01:22.578474
132	4	 	-88	 	982000	active	0	2026-07-05 13:01:22.579694	2026-07-05 13:01:22.579694
133	4	Hoa tai Hàn Quốc 690E 	hoa-tai-hàn-quốc-690e-89	 Hoa tai Hàn Quốc 690E	123000	active	0	2026-07-05 13:01:22.580696	2026-07-05 13:01:22.580696
134	4	Hoa tai Hàn Quốc 648E 	hoa-tai-hàn-quốc-648e-90	Hoa tai Hàn Quốc 648E 	485000	active	0	2026-07-05 13:01:22.581695	2026-07-05 13:01:22.581695
135	4	 Hoa tai Hàn Quốc 5EC - Cái	hoa-tai-hàn-quốc-5ec---cái-91	Hoa tai Hàn Quốc 5EC - Cái 	189000	active	0	2026-07-05 13:01:22.582907	2026-07-05 13:01:22.582907
136	4	Hoa tai Hàn Quốc 56EC 	hoa-tai-hàn-quốc-56ec-92	Hoa tai Hàn Quốc 56EC 	279000	active	0	2026-07-05 13:01:22.584316	2026-07-05 13:01:22.584316
137	4	 Hoa tai Hàn Quốc 539E	hoa-tai-hàn-quốc-539e-93	 Hoa tai Hàn Quốc 539E	189000	active	0	2026-07-05 13:01:22.585541	2026-07-05 13:01:22.585541
138	4	 	-94	 	985000	active	0	2026-07-05 13:01:22.587083	2026-07-05 13:01:22.587083
139	4	 Hoa tai Hàn Quốc 508E	hoa-tai-hàn-quốc-508e-95	 Hoa tai Hàn Quốc 508E	1295000	active	0	2026-07-05 13:01:22.588674	2026-07-05 13:01:22.588674
140	4	 Hoa tai Hàn Quốc 446E	hoa-tai-hàn-quốc-446e-96	 Hoa tai Hàn Quốc 446E	875000	active	0	2026-07-05 13:01:22.589931	2026-07-05 13:01:22.589931
141	4	Hoa tai Hàn Quốc 432E 	hoa-tai-hàn-quốc-432e-97	 Hoa tai Hàn Quốc 432E	1185000	active	0	2026-07-05 13:01:22.590988	2026-07-05 13:01:22.590988
142	4	 Hoa tai Hàn Quốc 466E	hoa-tai-hàn-quốc-466e-98	Hoa tai Hàn Quốc 466E 	285000	active	0	2026-07-05 13:01:22.59215	2026-07-05 13:01:22.59215
143	4	 Hoa tai Hàn Quốc 470E	hoa-tai-hàn-quốc-470e-99	Hoa tai Hàn Quốc 470E 	149000	active	0	2026-07-05 13:01:22.593312	2026-07-05 13:01:22.593312
144	2	Đèn Bàn Hình Vầng Trăng Phản Quang Halo Bowl Độc Đáo	đèn-bàn-hình-vầng-trăng-phản-quang-halo-bowl-độc-đáo-20	Đèn Bàn Hình Vầng Trăng Phản Quang Halo Bowl mang đến sự sang trọng và tinh tế cho không gian sống của bạn. Thiết kế hiện đại cùng ánh sáng phản quang nhẹ nhàng giúp căn phòng trở nên ấm áp, cuốn hút và nổi bật hơn. Đây là món decor hoàn hảo để làm nổi bật bàn, kệ hay bất kỳ góc nào trong phòng khách, phòng ngủ hay không gian làm việc.	2256000	active	0	2026-07-05 13:01:22.59485	2026-07-05 13:01:22.59485
145	2	Đồng Hồ Treo Tường Kim Loại Đa Giác Chéo	đồng-hồ-treo-tường-kim-loại-đa-giác-chéo-21	Đồng hồ treo tường không chỉ là công cụ giúp bạn quản lý thời gian hiệu quả mà còn là món đồ trang trí quan trọng, góp phần định hình phong cách cho không gian sống. Một chiếc đồng hồ treo tường đẹp có thể biến không gian nhà bạn trở nên sang trọng, hiện đại và nghệ thuật hơn. Với thiết kế đa dạng từ cổ điển đến hiện đại, đồng hồ treo tường có thể phù hợp với mọi phong cách trang trí nội thất.	599000	active	0	2026-07-05 13:01:22.596155	2026-07-05 13:01:22.596155
146	2	Tranh Thảm Treo Tường Dệt Sợi Hammock Chiếc Lá Xanh	tranh-thảm-treo-tường-dệt-sợi-hammock-chiếc-lá-xanh-22	Tranh Thảm Treo Tường Dệt Sợi Hammock Chiếc Lá Xanh là một tác phẩm decor trang trí độc đáo, kết hợp giữa vẻ đẹp tự nhiên của chiếc lá xanh tươi mát và sự tinh tế của sợi dệt thủ công. Sản phẩm này không chỉ là một vật dụng trang trí mà còn mang đến một không gian sống gần gũi với thiên nhiên, thư thái và tràn đầy sức sống.	399000	active	0	2026-07-05 13:01:22.597369	2026-07-05 13:01:22.597369
147	2	Set Decor Ánh Kim Huyền Bí – Modern Luxury	set-decor-ánh-kim-huyền-bí-–-modern-luxury-23	Set Decor Ánh Kim Huyền Bí – Modern Luxury	1599000	active	0	2026-07-05 13:01:22.59907	2026-07-05 13:01:22.59907
149	2	Ghế Ăn Lót Đệm Bo Cong Sang Trọng	ghế-ăn-lót-đệm-bo-cong-sang-trọng-25	Được chế tác từ gỗ tần bì tự nhiên, chiếc ghế sở hữu độ bền chắc, khả năng chịu lực tốt và vân gỗ nổi bật mang vẻ đẹp tự nhiên. Phần lót đệm êm ái không chỉ mang lại sự thoải mái trong từng bữa ăn mà còn nâng cao trải nghiệm sử dụng lâu dài, giúp chiếc ghế trở thành người bạn đồng hành bền vững trong ngôi nhà.	1599000	active	0	2026-07-05 13:01:22.601537	2026-07-05 13:01:22.601537
150	2	Đèn Sàn Cây Đứng Chân Gỗ Thân Cong Kim Loại	đèn-sàn-cây-đứng-chân-gỗ-thân-cong-kim-loại-26	Tại Passion, chúng tôi không chỉ cung cấp những sản phẩm nội thất và đèn trang trí độc đáo, mà còn mang đến trải nghiệm mua sắm tiện lợi, an tâm và phong cách. Mỗi sản phẩm đều được tuyển chọn kỹ lưỡng, kết hợp giữa thẩm mỹ hiện đại và chất lượng bền bỉ, giúp bạn nâng tầm không gian sống một cách tinh tế.	3599000	active	0	2026-07-05 13:01:22.60285	2026-07-05 13:01:22.60285
151	2	Bình Gốm 3D Kiểu Pháp Trang Trí Xếp Ply Cong	bình-gốm-3d-kiểu-pháp-trang-trí-xếp-ply-cong-27	Hãy tưởng tượng một bình gốm 3D xếp ply cong, đặt trên bàn trà, kệ trang trí hay bàn ăn, với đường nét uốn lượn mềm mại, tinh tế và sang trọng. Bình Gốm 3D Kiểu Pháp Xếp Ply Cong không chỉ là nơi cắm hoa, mà còn là tác phẩm decor nghệ thuật, mang đến sự thanh lịch, hiện đại và độc đáo cho không gian sống. kế lấy cảm hứng từ nghệ thuật Pháp cổ điển, kết hợp kỹ thuật tráng men hiện đại, tạo cảm giác chuyển động nhẹ nhàng cho từng lớp ply, giúp bình gốm trở thành điểm nhấn tinh tế trong mọi góc phòng.	2599000	active	0	2026-07-05 13:01:22.604152	2026-07-05 13:01:22.604152
152	2	Bình Gốm 3D Kiểu Pháp Trang Trí Xếp Ply Cong	bình-gốm-3d-kiểu-pháp-trang-trí-xếp-ply-cong-28	Bình Hoa Gốm Sứ Jingdezhen Cổ Điển là sản phẩm mang đậm nét nghệ thuật truyền thống Trung Hoa, kết hợp với phong cách vintage tinh tế. Sản phẩm được chế tác từ gốm sứ cao cấp, phủ men bóng và phun mực thủ công tạo họa tiết độc đáo, không chiếc nào giống chiếc nào.	599000	active	0	2026-07-05 13:01:22.605798	2026-07-05 13:01:22.605798
153	2	Ghế Tựa thư giãn	ghế-tựa-thư-giãn-29	Trong thời đại mà thiết kế nội thất không chỉ đáp ứng nhu cầu sử dụng mà còn thể hiện gu thẩm mỹ và cá tính của gia chủ, việc lựa chọn một món nội thất phù hợp là điều vô cùng quan trọng. Ghế ngồi chân gỗ Ginger không chỉ là một sản phẩm nội thất đơn thuần mà còn là điểm nhấn nghệ thuật trong không gian sống hiện đại. Với chất liệu cao cấp, kiểu dáng tinh tế và tính ứng dụng cao, mẫu ghế này đang được ưa chuộng trong các không gian sống đậm chất cá nhân. Hãy cùng Passion xem qua sản phẩm này nhé!	599000	active	0	2026-07-05 13:01:22.6074	2026-07-05 13:01:22.6074
154	2	Đôn Ngồi Kiểu Nắp Rời Hiện Đại Daily Queen	đôn-ngồi-kiểu-nắp-rời-hiện-đại-daily-queen-30	Trong xu hướng nội thất hiện đại, những món đôn ngồi nhỏ gọn, đa năng và thẩm mỹ đang trở thành lựa chọn được nhiều gia đình yêu thích. Không chỉ mang chức năng ngồi tiện dụng, đôn ngồi nắp rời còn giúp bạn tận dụng không gian lưu trữ thông minh, đồng thời tạo nên nét điểm xuyết cho căn phòng. Đôn ngồi Daily Queen là một trong những sản phẩm nổi bật của Passion - thương hiệu tiên phong trong dòng nội thất decor hiện đại, mang đến sự kết hợp hoàn hảo giữa chất lượng, công năng và phong cách.	1599000	active	0	2026-07-05 13:01:22.609146	2026-07-05 13:01:22.609146
155	2	Bàn Trà Gỗ Mặt Kính Decor Tiện Di Chuyển 	bàn-trà-gỗ-mặt-kính-decor-tiện-di-chuyển-31	Với thiết kế mộc mạc mang phong cách Bắc Âu, sản phẩm ưu tiên về tính tiện nghi cho người sử dụng. Những bộ phần được nối liền với nhau bằng ốc vặn dễ dàng cho bạn lắp đặt và tháo gỡ để di chuyển đến nhiều vị trí khác nhau. Bạn có thể sử dụng sản phẩm để trang trí trong phòng khách, phối với ghế sofa, phòng đọc sách, làm việc hoặc làm tủ táp đầu giường,... đều rất thích hợp. 	2599000	active	0	2026-07-05 13:01:22.610703	2026-07-05 13:01:22.610703
156	2	Thảm Lau Chân Cotton Len Thấm Hút Họa Tiết Cầu Vồng Vũ Trụ	thảm-lau-chân-cotton-len-thấm-hút-họa-tiết-cầu-vồng-vũ-trụ-32	Chất lượng của những chiếc Thảm lau chân tại nhà Passion đã được kiểm chứng với hàng loạt feedback đến từ khách hàng. Với chất liệu Lông len Cotton, Thảm Lau Chân Cầu Vồng Vũ Trụ sở hữu khả năng thấm hút nhanh, mang lại đôi chân khô ráo. Bên cạnh đó, item cũng giúp người dùng cảm thấy êm ái, mềm mịn mỗi khi sử dụng và hơn hết là bảo vệ bạn khỏi những tai nạn té ngã mỗi khi sàn nhà trơn trượt	18000	active	0	2026-07-05 13:01:22.61226	2026-07-05 13:01:22.61226
157	2	Thảm Lau Chân Cotton Len Cừu Hoạt Hình	thảm-lau-chân-cotton-len-cừu-hoạt-hình-33	Thảm được sản xuất từ vật liệu cao cấp và phổ biến trên thị trường: Vải cotton len siêu thấm, hút sạch những giọt nước trên mọi bề mặt chân của người dùng, đem lại cảm giác khô thoáng vượt trội. Ngoài ra, chất liệu này còn sở hữu độ mềm, mịn cao, khá êm chân, cho bạn cảm giác thoải mái khi sử dụng. Đường may trên thảm cẩn thận, tỉ mỉ và thật chắc chắn giúp thảm không bị rụng lông khi được giặt với máy. Thêm vào đó, thảm có thể sử dụng được cho nhiều vị trí trong ngôi nhà của bạn: phòng bếp, trước cửa ra vào, trước cửa wc, trong phòng ngủ, phòng khách, cạnh máy giặt...	99000	active	0	2026-07-05 13:01:22.613559	2026-07-05 13:01:22.613559
158	2	Tranh Vải Treo Tường Hoạt Hình Đáng Yêu	tranh-vải-treo-tường-hoạt-hình-đáng-yêu-34	Bộ sản phẩm bao gồm 2 móc treo và tranh.Dùng 2 đinh định vị 2 bên đóng vào tường, sau đó móc tranh treo lên trang tríDễ dàng tháo gỡ chuyển đổi vị trí khác nhau trang trí trong nhà	69000	active	0	2026-07-05 13:01:22.614782	2026-07-05 13:01:22.614782
159	2	Vỏ Gối Tựa Lưng Bắc Âu Nhung Nỉ In Màu 2 Mặt Đen Trắng Sang Trọng	vỏ-gối-tựa-lưng-bắc-âu-nhung-nỉ-in-màu-2-mặt-đen-trắng-sang-trọng-35	Vỏ Gối Tựa Lưng Bắc Âu Nhung Nỉ In Màu 2 Mặt Đen Trắng Sang Trọng	99000	active	0	2026-07-05 13:01:22.616014	2026-07-05 13:01:22.616014
160	2	Vỏ Gối Tựa Lưng Nhuộm Sợi Phong Cách Ý Gối Sọc Phối Lá Bắc Âu	vỏ-gối-tựa-lưng-nhuộm-sợi-phong-cách-ý-gối-sọc-phối-lá-bắc-âu-36	 Vỏ Gối Tựa Lưng Nhuộm Sợi Phong Cách Ý Gối Sọc Phối Lá Bắc Âu	599000	active	0	2026-07-05 13:01:22.617134	2026-07-05 13:01:22.617134
161	2	Vỏ Gối Tựa Lưng Sofa Hoa Lụa Sọc Vàng Sang Trọng Chất Êm Ái	vỏ-gối-tựa-lưng-sofa-hoa-lụa-sọc-vàng-sang-trọng-chất-êm-ái-37	Vỏ Gối Tựa Lưng Sofa Hoa Lụa Sọc Vàng Sang Trọng Chất Êm Ái	599000	active	0	2026-07-05 13:01:22.618181	2026-07-05 13:01:22.618181
162	2	 Gấu Bông Búp Bê Khủng Long Gấu Bông Nhập Khẩu Mẫu Hot	gấu-bông-búp-bê-khủng-long-gấu-bông-nhập-khẩu-mẫu-hot-38	Gấu Bông Búp Bê Khủng Long Gấu Bông Nhập Khẩu Mẫu Hot	99000	active	0	2026-07-05 13:01:22.619348	2026-07-05 13:01:22.619348
163	2	Thảm Bếp Set 2 Chiếc Hình Chữ L Họa Tiết Chú Chó Đáng Yêu	thảm-bếp-set-2-chiếc-hình-chữ-l-họa-tiết-chú-chó-đáng-yêu-39	Thảm Bếp Set 2 Chiếc Hình Chữ L Họa Tiết Chú Chó Đáng Yêu	599000	active	0	2026-07-05 13:01:22.620582	2026-07-05 13:01:22.620582
164	2	Thảm Phủ Sofa Họa Tiết Tranh Vẽ Trừu Tượng Chiếc Lá Xanh	thảm-phủ-sofa-họa-tiết-tranh-vẽ-trừu-tượng-chiếc-lá-xanh-40	Thảm Phủ Sofa Họa Tiết Tranh Vẽ Trừu Tượng Chiếc Lá Xanh	599000	active	0	2026-07-05 13:01:22.621726	2026-07-05 13:01:22.621726
165	1	Túi Tote Vải Canvas In Chữ Vintage	túi-tote-vải-canvas-in-chữ-vintage-1	Túi vải canvas dày dặn màu kem, in typography tối giản. Kích thước 35x40cm, đựng vừa tài liệu A4 và laptop 13 inch. Phù hợp đi học, đi làm.	89000	active	0	2026-07-05 13:01:22.623044	2026-07-05 13:01:22.623044
166	1	Ví Da Nam Bifold Cổ Điển	ví-da-nam-bifold-cổ-điển-2	Ví nam dáng ngang làm từ da bò sáp nhập khẩu. Thiết kế 2 ngăn lớn đựng tiền và 6 ngăn thẻ. Càng dùng da càng bóng đẹp theo thời gian.	450000	active	0	2026-07-05 13:01:22.624011	2026-07-05 13:01:22.624011
167	1	Túi Đeo Chéo Da Nữ Mini	túi-đeo-chéo-da-nữ-mini-3	Túi đeo chéo phom hộp nhỏ xinh, chất liệu da PU cao cấp chống thấm. Dây đeo kim loại phối da sang trọng, thích hợp đi dạo phố.	320000	active	0	2026-07-05 13:01:22.625044	2026-07-05 13:01:22.625044
168	1	Balo Laptop Chống Sốc Urban	balo-laptop-chống-sốc-urban-4	Balo thiết kế hiện đại, có ngăn chống sốc riêng cho laptop 15.6 inch. Chất liệu vải Oxford chống thấm nước, đệm lưng thoáng khí.	550000	active	0	2026-07-05 13:01:22.626308	2026-07-05 13:01:22.626308
169	1	Ví Cầm Tay Clutch Dự Tiệc	ví-cầm-tay-clutch-dự-tiệc-5	Clutch cầm tay đính đá tinh tế, khóa cài kim loại mạ vàng. Kích thước vừa điện thoại và son phấn, điểm nhấn hoàn hảo cho trang phục dạ hội.	680000	active	0	2026-07-05 13:01:22.627355	2026-07-05 13:01:22.627355
170	1	Ví Da Đen Classic	ví-da-đen-classic-6	Ví da đen classic, bền bỉ, phù hợp cho cả nam và nữ.	199000	active	0	2026-07-05 13:01:22.628529	2026-07-05 13:01:22.628529
171	1	Ví Da Màu Kem Nhẹ Nhàng	ví-da-màu-kem-nhẹ-nhàng-7	Ví da màu kem thanh lịch, thích hợp đi làm và dạo phố.	399000	active	0	2026-07-05 13:01:22.629636	2026-07-05 13:01:22.629636
172	1	Ví Da Màu Nâu Vintage	ví-da-màu-nâu-vintage-8	Ví da nâu phong cách vintage, mang vẻ đẹp cổ điển.	599000	active	0	2026-07-05 13:01:22.631066	2026-07-05 13:01:22.631066
173	1	Ví Da Đen Trơn Cao Cấp	ví-da-đen-trơn-cao-cấp-9	Ví da đen trơn, thiết kế đơn giản nhưng sang trọng.	699000	active	0	2026-07-05 13:01:22.632572	2026-07-05 13:01:22.632572
174	1	Ví Dài Da Jean Phong Cách Trẻ	ví-dài-da-jean-phong-cách-trẻ-10	Ví dài da jean cá tính, phù hợp học sinh sinh viên.	599000	active	0	2026-07-05 13:01:22.633728	2026-07-05 13:01:22.633728
175	1	Ví Da Đen Phong Cách Hiện Đại	ví-da-đen-phong-cách-hiện-đại-11	Ví da đen hiện đại, phù hợp sử dụng hằng ngày.	499000	active	0	2026-07-05 13:01:22.634738	2026-07-05 13:01:22.634738
176	1	Ví Da Trắng Thanh Lịch	ví-da-trắng-thanh-lịch-12	Ví da trắng thanh lịch, thiết kế tinh tế.	299000	active	0	2026-07-05 13:01:22.635719	2026-07-05 13:01:22.635719
177	1	Ví Da Hồng Thời Trang	ví-da-hồng-thời-trang-13	Ví da màu hồng thời trang, phù hợp phong cách nữ tính.	899000	active	0	2026-07-05 13:01:22.636882	2026-07-05 13:01:22.636882
178	1	Ví Da Bạc Ánh Kim	ví-da-bạc-ánh-kim-14	Ví da màu bạc ánh kim nổi bật, phong cách hiện đại.	399000	active	0	2026-07-05 13:01:22.638023	2026-07-05 13:01:22.638023
179	1	Ví Da Bạc Gương Cao Cấp	ví-da-bạc-gương-cao-cấp-15	Ví da bạc gương sang trọng, tạo điểm nhấn thời trang.	199000	active	0	2026-07-05 13:01:22.639184	2026-07-05 13:01:22.639184
180	1	Ví Da Đen Phom Dáng Gọn	ví-da-đen-phom-dáng-gọn-16	Ví da đen gọn nhẹ, tiện lợi khi mang theo.	799000	active	0	2026-07-05 13:01:22.640285	2026-07-05 13:01:22.640285
181	1	Ví Da Trắng Tinh Tế	ví-da-trắng-tinh-tế-17	Ví da trắng tinh tế, phù hợp nhiều phong cách.	699000	active	0	2026-07-05 13:01:22.641244	2026-07-05 13:01:22.641244
182	1	Ví Da Trắng Trẻ Trung	ví-da-trắng-trẻ-trung-18	Ví da trắng trẻ trung, dễ phối trang phục.	289000	active	0	2026-07-05 13:01:22.642589	2026-07-05 13:01:22.642589
183	1	Ví Da Đen Basic	ví-da-đen-basic-19	Ví da đen basic, thiết kế đơn giản, dễ sử dụng.	299000	active	0	2026-07-05 13:01:22.643814	2026-07-05 13:01:22.643814
184	1	Ví Da Hồng Nhạt Nữ Tính	ví-da-hồng-nhạt-nữ-tính-20	Ví da hồng nhạt nữ tính, phù hợp làm quà tặng.	399000	active	0	2026-07-05 13:01:22.645076	2026-07-05 13:01:22.645076
185	8	Sticker chủ đề Phật Giáo - (9.5cm x 21cm) - Set 02 tờ	sticker-chủ-đề-phật-giáo---(9.5cm-x-21cm)---set-02-tờ-161	Sticker chủ đề Phật Giáo - (9.5cm x 21cm) - Set 02 tờ	399000	active	0	2026-07-05 13:01:22.646772	2026-07-05 13:01:22.646772
186	8	Dụng cụ khắc, tỉa họa tiết - Bộ 03 chiếc	dụng-cụ-khắc,-tỉa-họa-tiết---bộ-03-chiếc-162	Dụng cụ khắc, tỉa họa tiết - Bộ 03 chiếc	199000	active	0	2026-07-05 13:01:22.648093	2026-07-05 13:01:22.648093
187	8	Kit thiệp Giáng sinh tự trang trí- Kit 10 phôi thiệp_HK37	kit-thiệp-giáng-sinh-tự-trang-trí--kit-10-phôi-thiệp_hk37-163	Kit thiệp Giáng sinh tự trang trí- Kit 10 phôi thiệp_HK37	699000	active	0	2026-07-05 13:01:22.649464	2026-07-05 13:01:22.649464
188	8	Kit thiệp tặng thầy, cô ngày 20/11 tự trang trí- Kit 10 phôi thiệp_HTK36	kit-thiệp-tặng-thầy,-cô-ngày-20/11-tự-trang-trí--kit-10-phôi-thiệp_htk36-164	Kit thiệp tặng thầy, cô ngày 20/11 tự trang trí- Kit 10 phôi thiệp_HTK36	599000	active	0	2026-07-05 13:01:22.650661	2026-07-05 13:01:22.650661
189	8	Kit nguyên liệu cao su khắc, tỉa hình handmade Junesix (02 dao khắc cán gỗ)_CSK05	kit-nguyên-liệu-cao-su-khắc,-tỉa-hình-handmade-junesix-(02-dao-khắc-cán-gỗ)_csk05-165	Kit nguyên liệu cao su khắc, tỉa hình handmade Junesix (02 dao khắc cán gỗ)_CSK05	399000	active	0	2026-07-05 13:01:22.651799	2026-07-05 13:01:22.651799
190	8	Bộ dụng cụ ép hoa khô cao cấp - 01 bộ	bộ-dụng-cụ-ép-hoa-khô-cao-cấp---01-bộ-166	Bộ dụng cụ ép hoa khô cao cấp - 01 bộ	899000	active	0	2026-07-05 13:01:22.652858	2026-07-05 13:01:22.652858
191	8	Tissue paper - Giấy làm hoa PomPom, gói quà, gói hoa, phông nên chụp ảnh (50cm x 70cm) - Số lượng 10 tờ/ 1 màu	tissue-paper---giấy-làm-hoa-pompom,-gói-quà,-gói-hoa,-phông-nên-chụp-ảnh-(50cm-x-70cm)---số-lượng-10-tờ/-1-màu-167	Tissue paper - Giấy làm hoa PomPom, gói quà, gói hoa, phông nên chụp ảnh (50cm x 70cm) - Số lượng 10 tờ/ 1 màu	799000	active	0	2026-07-05 13:01:22.654347	2026-07-05 13:01:22.654347
192	8	Bộ dụng cụ ép hoa khô - Sổ ép hoa khô - 01 bộ	bộ-dụng-cụ-ép-hoa-khô---sổ-ép-hoa-khô---01-bộ-168	Bộ dụng cụ ép hoa khô - Sổ ép hoa khô - 01 bộ	699000	active	0	2026-07-05 13:01:22.655621	2026-07-05 13:01:22.655621
193	8	Hũ sữa chua nhựa Zin - Tiêu chuẩn chất lượng về Vệ Sinh An Toàn Thực Phẩm - (100ml hoặc 120ml)	hũ-sữa-chua-nhựa-zin---tiêu-chuẩn-chất-lượng-về-vệ-sinh-an-toàn-thực-phẩm---(100ml-hoặc-120ml)-169	Hũ sữa chua nhựa Zin - Tiêu chuẩn chất lượng về Vệ Sinh An Toàn Thực Phẩm - (100ml hoặc 120ml)	199000	active	0	2026-07-05 13:01:22.656791	2026-07-05 13:01:22.656791
194	8	Album, scrapbook chủ đề Thanh xuân vườn trường, couple - Set nguyên liệu tự trang trí	album,-scrapbook-chủ-đề-thanh-xuân-vườn-trường,-couple---set-nguyên-liệu-tự-trang-trí-170	Album, scrapbook chủ đề Thanh xuân vườn trường, couple - Set nguyên liệu tự trang trí	299000	active	0	2026-07-05 13:01:22.658284	2026-07-05 13:01:22.658284
195	8	Kit thiệp Giáng sinh tự trang trí- Kit 10 phôi thiệp_HK37	kit-thiệp-giáng-sinh-tự-trang-trí--kit-10-phôi-thiệp_hk37-171	Kit thiệp Giáng sinh tự trang trí- Kit 10 phôi thiệp_HK37	999000	active	0	2026-07-05 13:01:22.660236	2026-07-05 13:01:22.660236
196	8	Kit thiệp tặng thầy, cô ngày 20/11 tự trang trí- Kit 10 phôi thiệp_HTK36	kit-thiệp-tặng-thầy,-cô-ngày-20/11-tự-trang-trí--kit-10-phôi-thiệp_htk36-172	Kit thiệp tặng thầy, cô ngày 20/11 tự trang trí- Kit 10 phôi thiệp_HTK36	699000	active	0	2026-07-05 13:01:22.662745	2026-07-05 13:01:22.662745
197	8	Bộ dụng cụ ép hoa khô cao cấp - 01 bộ	bộ-dụng-cụ-ép-hoa-khô-cao-cấp---01-bộ-173	Bộ dụng cụ ép hoa khô cao cấp - 01 bộ	499000	active	0	2026-07-05 13:01:22.665104	2026-07-05 13:01:22.665104
198	8	Túi viết xóa - Dry erase pocket - (Màu giao ngẫu nhiên)	túi-viết-xóa---dry-erase-pocket---(màu-giao-ngẫu-nhiên)-174	Túi viết xóa - Dry erase pocket - (Màu giao ngẫu nhiên)	199000	active	0	2026-07-05 13:01:22.666584	2026-07-05 13:01:22.666584
199	8	Bộ dụng cụ ép hoa khô - Sổ ép hoa khô - 01 bộ	bộ-dụng-cụ-ép-hoa-khô---sổ-ép-hoa-khô---01-bộ-175	Bộ dụng cụ ép hoa khô - Sổ ép hoa khô - 01 bộ	399000	active	0	2026-07-05 13:01:22.667912	2026-07-05 13:01:22.667912
200	8	Kit in tranh vân tay độ tuổi 3+	kit-in-tranh-vân-tay-độ-tuổi-3+-176	Kit in tranh vân tay độ tuổi 3+	299000	active	0	2026-07-05 13:01:22.669168	2026-07-05 13:01:22.669168
201	8	Sticker chủ đề Phật Giáo - (9.5cm x 21cm) - Set 02 tờ	sticker-chủ-đề-phật-giáo---(9.5cm-x-21cm)---set-02-tờ-177	Sticker chủ đề Phật Giáo - (9.5cm x 21cm) - Set 02 tờ	299000	active	0	2026-07-05 13:01:22.670562	2026-07-05 13:01:22.670562
202	8	Washi Tap Noel_S201	washi-tap-noel_s201-178	Washi Tap Noel_S201	299000	active	0	2026-07-05 13:01:22.671636	2026-07-05 13:01:22.671636
203	8	Tissue paper - Giấy làm hoa PomPom, gói quà, gói hoa, phông nên chụp ảnh (50cm x 70cm) - Số lượng 10 tờ/ 1 màu	tissue-paper---giấy-làm-hoa-pompom,-gói-quà,-gói-hoa,-phông-nên-chụp-ảnh-(50cm-x-70cm)---số-lượng-10-tờ/-1-màu-179	Tissue paper - Giấy làm hoa PomPom, gói quà, gói hoa, phông nên chụp ảnh (50cm x 70cm) - Số lượng 10 tờ/ 1 màu	399000	active	0	2026-07-05 13:01:22.673019	2026-07-05 13:01:22.673019
204	8	Sticker chữ Meet You - Set 04 tờ	sticker-chữ-meet-you---set-04-tờ-180	Sticker chữ Meet You - Set 04 tờ	499000	active	0	2026-07-05 13:01:22.674369	2026-07-05 13:01:22.674369
205	8	TRANH TRANG TRÍ “VỎ SÒ HUYẾT” TO63	tranh-trang-trí-“vỏ-sò-huyết”-to63-181	TRANH TRANG TRÍ “VỎ SÒ HUYẾT” TO63	299000	active	0	2026-07-05 13:01:22.675946	2026-07-05 13:01:22.675946
206	8	Thuyền buồm vỏ ốc lớn TB18	thuyền-buồm-vỏ-ốc-lớn-tb18-182	Thuyền buồm vỏ ốc lớn TB18	699000	active	0	2026-07-05 13:01:22.677307	2026-07-05 13:01:22.677307
208	8	Thuyền buồm vỏ ốc lớn TB13	thuyền-buồm-vỏ-ốc-lớn-tb13-184	Thuyền buồm vỏ ốc lớn TB13	1299000	active	0	2026-07-05 13:01:22.680019	2026-07-05 13:01:22.680019
209	8	Thuyền buồm vỏ ốc lớn TB12	thuyền-buồm-vỏ-ốc-lớn-tb12-185	Thuyền buồm vỏ ốc lớn TB12	799000	active	0	2026-07-05 13:01:22.681265	2026-07-05 13:01:22.681265
210	8	Thuyền buồm vỏ ốc nhỏ TB09_T	thuyền-buồm-vỏ-ốc-nhỏ-tb09_t-186	Thuyền buồm vỏ ốc nhỏ TB09_T	479000	active	0	2026-07-05 13:01:22.682648	2026-07-05 13:01:22.682648
211	8	Thuyền buồm nhí bàu ngư đỏ TB30	thuyền-buồm-nhí-bàu-ngư-đỏ-tb30-187	Thuyền buồm nhí bàu ngư đỏ TB30	389000	active	0	2026-07-05 13:01:22.683781	2026-07-05 13:01:22.683781
212	8	Thuyền buồm vỏ ốc nhỏ TB20	thuyền-buồm-vỏ-ốc-nhỏ-tb20-188	Thuyền buồm vỏ ốc nhỏ TB20	699000	active	0	2026-07-05 13:01:22.684952	2026-07-05 13:01:22.684952
214	8	Thuyền buồm vỏ ốc nhỏ TB79	thuyền-buồm-vỏ-ốc-nhỏ-tb79-190	Thuyền buồm vỏ ốc nhỏ TB79	14799000	active	0	2026-07-05 13:01:22.687588	2026-07-05 13:01:22.687588
215	8	Thuyền buồm vỏ ốc trung TB10	thuyền-buồm-vỏ-ốc-trung-tb10-191	Thuyền buồm vỏ ốc trung TB10	999000	active	0	2026-07-05 13:01:22.688896	2026-07-05 13:01:22.688896
216	8	Thuyền buồm vỏ ốc trung TB11_T	thuyền-buồm-vỏ-ốc-trung-tb11_t-192	Thuyền buồm vỏ ốc trung TB11_T	299000	active	0	2026-07-05 13:01:22.690048	2026-07-05 13:01:22.690048
217	8	Thuyền buồm vỏ ốc trung TB11_N	thuyền-buồm-vỏ-ốc-trung-tb11_n-193	Thuyền buồm vỏ ốc trung TB11_N	399000	active	0	2026-07-05 13:01:22.6912	2026-07-05 13:01:22.6912
218	8	Thuyền buồm vỏ sò ốc lớn TB29 	thuyền-buồm-vỏ-sò-ốc-lớn-tb29-194	Thuyền buồm vỏ sò ốc lớn TB29	399000	active	0	2026-07-05 13:01:22.692106	2026-07-05 13:01:22.692106
219	8	Thuyền buồm vỏ ốc trung TB24	thuyền-buồm-vỏ-ốc-trung-tb24-195	Thuyền buồm vỏ ốc trung TB24	299000	active	0	2026-07-05 13:01:22.693505	2026-07-05 13:01:22.693505
220	8	Thuyền buồm vỏ ốc trung TB22	thuyền-buồm-vỏ-ốc-trung-tb22-196	Thuyền buồm vỏ ốc trung TB22	699000	active	0	2026-07-05 13:01:22.694626	2026-07-05 13:01:22.694626
221	8	Thuyền buồm vỏ ốc trung TB23	thuyền-buồm-vỏ-ốc-trung-tb23-197	Thuyền buồm vỏ ốc trung TB23	479000	active	0	2026-07-05 13:01:22.695653	2026-07-05 13:01:22.695653
222	8	THUYỀN BUỒM VỎ ỐC TRUNG TB08	thuyền-buồm-vỏ-ốc-trung-tb08-198	THUYỀN BUỒM VỎ ỐC TRUNG TB08	899000	active	0	2026-07-05 13:01:22.696739	2026-07-05 13:01:22.696739
223	8	THUYỀN BUỒM VỎ ỐC TRUNG TB05	thuyền-buồm-vỏ-ốc-trung-tb05-199	THUYỀN BUỒM VỎ ỐC TRUNG TB05	459000	active	0	2026-07-05 13:01:22.697805	2026-07-05 13:01:22.697805
1	8	Handmade Leather Bag	handmade-leather-bag	Premium handmade leather bag	499000	inactive	1	2026-05-26 14:58:26.805096	2026-05-26 14:58:26.805096
148	2	Ghế Sofa Da Onyx Hiện Đại Tối Giản	ghế-sofa-da-onyx-hiện-đại-tối-giản-24	Sofa Onyx mang phong cách tối giản hiện đại kết hợp electric đầy sáng tạo. Với kích thước 2480 x 900 x 850mm dành cho 3 người ngồi, sản phẩm được tính toán kỹ lưỡng để đảm bảo sự cân đối trong từng đường nét. Thiết kế gọn gàng, sắc sảo nhưng vẫn mềm mại, biến sofa trở thành tâm điểm trong không gian phòng khách.	11599000	active	2	2026-07-05 13:01:22.600341	2026-07-05 13:01:22.600341
\.


--
-- TOC entry 5314 (class 0 OID 34617)
-- Dependencies: 260
-- Data for Name: review_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_images (id, image_url, review_id) FROM stdin;
\.


--
-- TOC entry 5287 (class 0 OID 34244)
-- Dependencies: 233
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, product_id, rating, comment, created_at, order_item_id, status, order_id) FROM stdin;
1	1	1	5	Very beautiful handmade product!	2026-05-26 14:58:44.310258	\N	\N	\N
2	5	5	5	sản phẩm tốt	2026-07-04 13:17:32.432341	\N	\N	\N
3	3	5	4	ok	2026-07-07 11:54:10.920384	130	\N	ORD-1783394116733
\.


--
-- TOC entry 5278 (class 0 OID 34135)
-- Dependencies: 224
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, display_name, color, created_at) FROM stdin;
1	ROLE_ADMIN	🛡️ Quản trị viên	#ef4444	2026-05-26 14:57:26.758371
3	ROLE_STAFF	👔 Nhân viên vận hành	#3b82f6	2026-05-26 14:57:26.758371
4	ROLE_USER	👤 Khách hàng/User	#10b981	2026-05-26 14:57:26.758371
\.


--
-- TOC entry 5279 (class 0 OID 34148)
-- Dependencies: 225
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
1	1
1	4
2	4
3	4
3	1
5	4
8	4
\.


--
-- TOC entry 5311 (class 0 OID 34551)
-- Dependencies: 257
-- Data for Name: user_spin_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_spin_profiles (user_id, last_spin_date, points) FROM stdin;
5	2026-07-05 14:49:39.799044	0
3	2026-07-08 10:38:51.258091	0
8	2026-07-10 08:21:41.047607	0
\.


--
-- TOC entry 5312 (class 0 OID 34557)
-- Dependencies: 258
-- Data for Name: user_wishlist_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wishlist_items (product_id, user_id, created_at) FROM stdin;
4	5	2026-07-04 13:15:16.39244
5	5	2026-07-04 13:15:16.39244
5	3	2026-07-07 10:41:39.095522
3	8	2026-07-10 08:20:53.480648
\.


--
-- TOC entry 5276 (class 0 OID 34112)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, full_name, phone, enabled, account_non_locked, created_at, updated_at) FROM stdin;
3	admin@handmade.com	admin@handmade.com	$2a$10$S5oyEzc0F8HQ/J.SuaJHpu289ToWf4rNxgUm11SZtlzFWGwUx/eAK	admin@handmade.com	0987654321	t	t	2026-05-26 15:01:53.035401	2026-05-26 15:01:53.035401
1	admin	admin@gmail.com	$2a$10$Xl0yS.y6L.vN8A6J.u.Y8O1G4R3U.Kx8H4W6z9F2R3l/O2k/Wq5Wy	Administrator	0123456789	t	t	2026-05-26 14:57:30.010196	2026-05-26 14:57:30.010196
2	test02	test02@gmail.com	$2a$10$Xl0yS.y6L.vN8A6J.u.Y8O1G4R3U.Kx8H4W6z9F2R3l/O2k/Wq5Wy	Người dùng Test	0987654321	t	t	2026-05-26 14:57:30.010196	2026-05-26 14:57:30.010196
5	demo1@gmail.com	demo1@gmail.com	$2a$10$LMYvvUbyJi7FafMWogAiE.jHjwIpQ8ZY9cJqw2DwIjMtwIb14r1V.	DoKhanhThuan	0333401545	t	t	2026-07-04 13:14:55.547516	2026-07-04 13:14:55.547516
8	phumaihoang45@gmail.com	phumaihoang45@gmail.com	$2a$10$eL4SI8jC9/PTEUvrpoqlj.AE1jRXZt7rWRU0CtW96MmKHZ.lvwbR.	phumai	0854593887	t	t	2026-07-10 08:20:26.347262	2026-07-10 08:20:26.347262
\.


--
-- TOC entry 5294 (class 0 OID 34333)
-- Dependencies: 240
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vouchers (id, code, title, voucher_type, value_amount, max_discount_amount, min_order_amount, usage_limit, used_count, created_at, expired_at, start_date, status, target, user_id) FROM stdin;
VOU-004	WELCOME504	Giảm ngay 50k cho thành viên mới	CASH	50000	\N	150000	100	3	2026-05-26 14:58:48.205477	2026-07-04	2026-07-03	ACTIVE	ALL	\N
VOU-003	HANDMADE203	Giảm 20% cho đơn hàng túi xách	PERCENT	20	100000	200000	50	4	2026-05-26 14:58:48.205477	2099-12-31	2000-01-01	EXPIRED	ALL	\N
VC_LUCKY_1783096111174	LUCKYB2S5J	Voucher 20%	PERCENT	20	50000	0	1	1	2026-07-03 23:28:31.517474	2026-08-03	2026-07-03	ACTIVE	SPECIFIC_USER	3
2a6bd195-0e0f-4eee-9837-48940bc7fe7f	LUCKY_8F3371	Voucher Vòng Quay: Giảm 20k	FIXED_AMOUNT	20000	\N	\N	1	1	2026-07-05 14:39:19.066311	2026-08-04	2026-07-05	ACTIVE	PERSONAL	3
753b1961-d4d5-4659-9439-6e156da348cb	LUCKY_270A5F	Voucher Vòng Quay: Giảm 50%	PERCENTAGE	50	\N	\N	1	1	2026-07-04 13:15:28.653954	2026-08-03	2026-07-04	ACTIVE	PERSONAL	5
bd9563f7-d2d7-487e-83bf-9d38b52d5cd5	LUCKY_BF29EF	Voucher Vòng Quay: Voucher 20%	PERCENTAGE	20	\N	\N	1	1	2026-07-08 10:38:51.227702	2026-08-07	2026-07-08	ACTIVE	PERSONAL	3
93ee91ec-c16c-4791-9e3c-2a0976fde644	LUCKY_00823C	Voucher Vòng Quay: Giảm 50%	PERCENTAGE	50	\N	\N	1	1	2026-07-10 08:21:41.037087	2026-08-09	2026-07-10	ACTIVE	PERSONAL	8
\.


--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 245
-- Name: ai_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ai_configurations_id_seq', 1, true);


--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 219
-- Name: authorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorities_id_seq', 28, true);


--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 238
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 40, true);


--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 236
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 5, true);


--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 226
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 247
-- Name: chat_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_faqs_id_seq', 1, false);


--
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 249
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 121, true);


--
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 251
-- Name: chat_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_sessions_id_seq', 4, true);


--
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 253
-- Name: lucky_prizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lucky_prizes_id_seq', 4, true);


--
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 255
-- Name: order_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_history_id_seq', 24, true);


--
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 242
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 137, true);


--
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 234
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 222, true);


--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 230
-- Name: product_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variants_id_seq', 224, true);


--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 228
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 224, true);


--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 259
-- Name: review_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_images_id_seq', 1, false);


--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 232
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 3, true);


--
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 223
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- TOC entry 5089 (class 2606 OID 34427)
-- Name: ai_configurations ai_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_configurations
    ADD CONSTRAINT ai_configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 5021 (class 2606 OID 25242)
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);


--
-- TOC entry 5070 (class 2606 OID 34319)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5066 (class 2606 OID 34299)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 5068 (class 2606 OID 34301)
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- TOC entry 5038 (class 2606 OID 34177)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 5040 (class 2606 OID 34179)
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- TOC entry 5093 (class 2606 OID 34439)
-- Name: chat_faqs chat_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_faqs
    ADD CONSTRAINT chat_faqs_pkey PRIMARY KEY (id);


--
-- TOC entry 5095 (class 2606 OID 34451)
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 5097 (class 2606 OID 34461)
-- Name: chat_sessions chat_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_sessions
    ADD CONSTRAINT chat_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5099 (class 2606 OID 34473)
-- Name: lucky_prizes lucky_prizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lucky_prizes
    ADD CONSTRAINT lucky_prizes_pkey PRIMARY KEY (id);


--
-- TOC entry 5103 (class 2606 OID 34486)
-- Name: order_history order_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT order_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5085 (class 2606 OID 34389)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5082 (class 2606 OID 34368)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 5087 (class 2606 OID 34415)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (code);


--
-- TOC entry 5064 (class 2606 OID 34283)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- TOC entry 5052 (class 2606 OID 34234)
-- Name: product_variants product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (id);


--
-- TOC entry 5054 (class 2606 OID 34236)
-- Name: product_variants product_variants_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_sku_key UNIQUE (sku);


--
-- TOC entry 5046 (class 2606 OID 34206)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 5048 (class 2606 OID 34208)
-- Name: products products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);


--
-- TOC entry 5109 (class 2606 OID 34625)
-- Name: review_images review_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT review_images_pkey PRIMARY KEY (id);


--
-- TOC entry 5058 (class 2606 OID 34257)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 5032 (class 2606 OID 34147)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 5034 (class 2606 OID 34145)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5091 (class 2606 OID 34593)
-- Name: ai_configurations uk_83j10fqcejyvvxfgru5bs3bnk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_configurations
    ADD CONSTRAINT uk_83j10fqcejyvvxfgru5bs3bnk UNIQUE (config_key);


--
-- TOC entry 5060 (class 2606 OID 34627)
-- Name: reviews uk_96f6ovfc9wn4579incehx4gra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT uk_96f6ovfc9wn4579incehx4gra UNIQUE (order_item_id);


--
-- TOC entry 5073 (class 2606 OID 34321)
-- Name: cart_items uq_cart_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT uq_cart_product UNIQUE (cart_id, product_id);


--
-- TOC entry 5036 (class 2606 OID 34154)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 5105 (class 2606 OID 34556)
-- Name: user_spin_profiles user_spin_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_spin_profiles
    ADD CONSTRAINT user_spin_profiles_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5107 (class 2606 OID 34563)
-- Name: user_wishlist_items user_wishlist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wishlist_items
    ADD CONSTRAINT user_wishlist_items_pkey PRIMARY KEY (product_id, user_id);


--
-- TOC entry 5026 (class 2606 OID 34131)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5028 (class 2606 OID 34127)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5030 (class 2606 OID 34129)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 5076 (class 2606 OID 34348)
-- Name: vouchers vouchers_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_code_key UNIQUE (code);


--
-- TOC entry 5078 (class 2606 OID 34346)
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 5071 (class 1259 OID 34332)
-- Name: idx_cart_items_cart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_items_cart ON public.cart_items USING btree (cart_id);


--
-- TOC entry 5041 (class 1259 OID 34185)
-- Name: idx_categories_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_categories_parent ON public.categories USING btree (parent_id);


--
-- TOC entry 5100 (class 1259 OID 34594)
-- Name: idx_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_id ON public.order_history USING btree (order_id);


--
-- TOC entry 5083 (class 1259 OID 34400)
-- Name: idx_order_items_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order ON public.order_items USING btree (order_id);


--
-- TOC entry 5079 (class 1259 OID 34375)
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- TOC entry 5080 (class 1259 OID 34374)
-- Name: idx_orders_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user ON public.orders USING btree (user_id);


--
-- TOC entry 5101 (class 1259 OID 34595)
-- Name: idx_performed_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_performed_at ON public.order_history USING btree (performed_at);


--
-- TOC entry 5061 (class 1259 OID 34402)
-- Name: idx_product_images_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_images_featured ON public.product_images USING btree (product_id) WHERE (is_featured = true);


--
-- TOC entry 5062 (class 1259 OID 34289)
-- Name: idx_product_images_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_images_product ON public.product_images USING btree (product_id);


--
-- TOC entry 5049 (class 1259 OID 34403)
-- Name: idx_product_variants_pid_inv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_variants_pid_inv ON public.product_variants USING btree (product_id, inventory);


--
-- TOC entry 5050 (class 1259 OID 34242)
-- Name: idx_product_variants_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_variants_product ON public.product_variants USING btree (product_id);


--
-- TOC entry 5042 (class 1259 OID 34214)
-- Name: idx_products_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_category ON public.products USING btree (category_id);


--
-- TOC entry 5043 (class 1259 OID 34401)
-- Name: idx_products_name_lower; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_name_lower ON public.products USING btree (lower((name)::text));


--
-- TOC entry 5044 (class 1259 OID 34215)
-- Name: idx_products_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_status ON public.products USING btree (status);


--
-- TOC entry 5055 (class 1259 OID 34540)
-- Name: idx_reviews_pid_rating; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_pid_rating ON public.reviews USING btree (product_id, rating);


--
-- TOC entry 5056 (class 1259 OID 34268)
-- Name: idx_reviews_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_product ON public.reviews USING btree (product_id);


--
-- TOC entry 5023 (class 1259 OID 34133)
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email ON public.users USING btree (email);


--
-- TOC entry 5024 (class 1259 OID 34132)
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- TOC entry 5074 (class 1259 OID 34349)
-- Name: idx_vouchers_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vouchers_code ON public.vouchers USING btree (code);


--
-- TOC entry 5022 (class 1259 OID 25248)
-- Name: ix_auth_username_authority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_auth_username_authority ON public.authorities USING btree (username, authority);


--
-- TOC entry 5125 (class 2606 OID 34628)
-- Name: review_images fk3aayo5bjciyemf3bvvt987hkr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT fk3aayo5bjciyemf3bvvt987hkr FOREIGN KEY (review_id) REFERENCES public.reviews(id);


--
-- TOC entry 5118 (class 2606 OID 34302)
-- Name: carts fk_carts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_carts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5112 (class 2606 OID 34180)
-- Name: categories fk_category_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_category_parent FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- TOC entry 5119 (class 2606 OID 34322)
-- Name: cart_items fk_items_carts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_items_carts FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- TOC entry 5120 (class 2606 OID 34327)
-- Name: cart_items fk_items_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_items_products FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5122 (class 2606 OID 34390)
-- Name: order_items fk_order_items_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 5123 (class 2606 OID 34395)
-- Name: order_items fk_order_items_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE RESTRICT;


--
-- TOC entry 5121 (class 2606 OID 34369)
-- Name: orders fk_orders_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- TOC entry 5113 (class 2606 OID 34209)
-- Name: products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE RESTRICT;


--
-- TOC entry 5117 (class 2606 OID 34284)
-- Name: product_images fk_product_images_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fk_product_images_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5114 (class 2606 OID 34237)
-- Name: product_variants fk_product_variants_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT fk_product_variants_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5115 (class 2606 OID 34263)
-- Name: reviews fk_reviews_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_reviews_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 5116 (class 2606 OID 34258)
-- Name: reviews fk_reviews_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5110 (class 2606 OID 34160)
-- Name: user_roles fk_user_roles_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_role FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5111 (class 2606 OID 34155)
-- Name: user_roles fk_user_roles_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5124 (class 2606 OID 34596)
-- Name: user_spin_profiles fkd0vp73cbk11y96i2qmjfhpmay; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_spin_profiles
    ADD CONSTRAINT fkd0vp73cbk11y96i2qmjfhpmay FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-09-15 17:37:20

--
-- PostgreSQL database dump complete
--

\unrestrict XmBhwfV3oElJVbcSvrK7bEnEElR8Z7WtzdZMCGZEjjnJa1y9eDbdfgIO2oIb9sT

