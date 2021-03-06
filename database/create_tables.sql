-- Table: public.book

-- DROP TABLE public.book;

CREATE TABLE public.book
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    author_first_name character varying(255) COLLATE pg_catalog."default",
    author_last_name character varying(255) COLLATE pg_catalog."default",
    pictureurl character varying(255) COLLATE pg_catalog."default",
    publication_date date NOT NULL,
    synopsis character varying(1000) COLLATE pg_catalog."default",
    title character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT book_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.book
    OWNER to postgres;
   
-- Table: public.library

-- DROP TABLE public.library;

CREATE TABLE public.library
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT library_pkey PRIMARY KEY (id),
    CONSTRAINT uk_btd9wd6dhllibwb82n1nohm2m UNIQUE (name)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.library
    OWNER to postgres;
   
-- Table: public.registered_user

-- DROP TABLE public.registered_user;

CREATE TABLE public.registered_user
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(255) COLLATE pg_catalog."default",
    first_name character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    roles character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT registered_user_pkey PRIMARY KEY (id),
    CONSTRAINT uk_4qkjfwb01bh3q0r5x8uy5o67v UNIQUE (email)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.registered_user
    OWNER to postgres;
    


-- Table: public.available_copie

-- DROP TABLE public.available_copie;

CREATE TABLE public.available_copie
(
    book_id integer NOT NULL,
    library_id integer NOT NULL,
    available_quantity integer NOT NULL,
    owned_quantity integer NOT NULL,
    CONSTRAINT available_copie_pkey PRIMARY KEY (book_id, library_id),
    CONSTRAINT fk3cypfs2ivaoigc6eofcsu4mn5 FOREIGN KEY (book_id)
        REFERENCES public.book (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkps56tmxe7vcjvfdececjdqlhu FOREIGN KEY (library_id)
        REFERENCES public.library (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.available_copie
    OWNER to postgres;
    

   
-- Table: public.borrow

-- DROP TABLE public.borrow;

CREATE TABLE public.borrow
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    book_returned boolean NOT NULL,
    borrow_date date NOT NULL,
    extended_duration boolean NOT NULL,
    return_date date NOT NULL,
    book_id integer NOT NULL,
    library_id integer NOT NULL,
    registered_user_id integer NOT NULL,
    CONSTRAINT borrow_pkey PRIMARY KEY (id),
    CONSTRAINT fk4o1lami9uaoanv2yutyx4e5rx FOREIGN KEY (library_id)
        REFERENCES public.library (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkgqh01ty3c1u7ja2rjdua05c36 FOREIGN KEY (book_id)
        REFERENCES public.book (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkmgvxfg4n767u28y21y5miyvm0 FOREIGN KEY (registered_user_id)
        REFERENCES public.registered_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.borrow
    OWNER to postgres;
   
