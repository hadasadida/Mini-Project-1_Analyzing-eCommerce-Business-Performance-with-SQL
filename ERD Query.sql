-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.customers_dataset
(
    customer_id character varying COLLATE pg_catalog."default",
    customer_unique_id character varying COLLATE pg_catalog."default",
    customer_zip_code_prefix bigint,
    customer_city character varying COLLATE pg_catalog."default",
    customer_state character varying COLLATE pg_catalog."default",
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS public.geolocation_dataset
(
    geolocation_zip_code_prefix bigint,
    geolocation_lat double precision,
    geolocation_lng double precision,
    geolocation_city character varying COLLATE pg_catalog."default",
    geolocation_state character varying COLLATE pg_catalog."default",
    PRIMARY KEY (geolocation_zip_code_prefix)
);

CREATE TABLE IF NOT EXISTS public.order_items_dataset
(
    order_id character varying COLLATE pg_catalog."default",
    order_item_id integer,
    product_id character varying COLLATE pg_catalog."default",
    seller_id character varying COLLATE pg_catalog."default",
    shipping_limit_date timestamp with time zone,
    price double precision,
    freight_value double precision,
    PRIMARY KEY (seller_id)
);

CREATE TABLE IF NOT EXISTS public.order_payments_dataset
(
    order_id character varying COLLATE pg_catalog."default",
    payment_sequential integer,
    payment_type character varying COLLATE pg_catalog."default",
    payment_installments integer,
    payment_value double precision
);

CREATE TABLE IF NOT EXISTS public.order_reviews_dataset
(
    review_id character varying COLLATE pg_catalog."default",
    order_id character varying COLLATE pg_catalog."default",
    review_score integer,
    review_comment_title character varying COLLATE pg_catalog."default",
    review_comment_message character varying COLLATE pg_catalog."default",
    review_creation_date timestamp with time zone,
    review_answer_timestamp timestamp with time zone
);

CREATE TABLE IF NOT EXISTS public.orders_dataset
(
    order_id character varying COLLATE pg_catalog."default",
    customer_id character varying COLLATE pg_catalog."default",
    order_status character varying COLLATE pg_catalog."default",
    order_purchase_timestamp timestamp with time zone,
    order_approved_at timestamp with time zone,
    order_delivered_carrier_date timestamp with time zone,
    order_delivered_customer_date timestamp with time zone,
    order_estimated_delivery_date timestamp with time zone,
    PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS public.product_dataset
(
    no_ integer,
    product_id character varying COLLATE pg_catalog."default",
    product_category_name character varying COLLATE pg_catalog."default",
    product_name_lenght double precision,
    product_description_lenght double precision,
    product_photos_qty double precision,
    product_weight_g double precision,
    product_length_cm double precision,
    product_height_cm double precision,
    product_width_cm double precision,
    PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS public.sellers_dataset
(
    seller_id character varying COLLATE pg_catalog."default",
    seller_zip_code_prefix bigint,
    seller_city character varying COLLATE pg_catalog."default",
    seller_state character varying COLLATE pg_catalog."default"
);

ALTER TABLE IF EXISTS public.customers_dataset
    ADD FOREIGN KEY (customer_zip_code_prefix)
    REFERENCES public.geolocation_dataset (geolocation_zip_code_prefix) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_items_dataset
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders_dataset (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_items_dataset
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product_dataset (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_payments_dataset
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders_dataset (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_reviews_dataset
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders_dataset (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders_dataset
    ADD FOREIGN KEY (customer_id)
    REFERENCES public.customers_dataset (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sellers_dataset
    ADD FOREIGN KEY (seller_id)
    REFERENCES public.order_items_dataset (seller_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sellers_dataset
    ADD FOREIGN KEY (seller_zip_code_prefix)
    REFERENCES public.geolocation_dataset (geolocation_zip_code_prefix) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;