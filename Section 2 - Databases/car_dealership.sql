BEGIN;


CREATE TABLE IF NOT EXISTS public.car
(
    car_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 ),
    car_details_id integer NOT NULL,
    serial_number text NOT NULL,
    CONSTRAINT car_id_pk PRIMARY KEY (car_id)
);

CREATE TABLE IF NOT EXISTS public.sales
(
    sales_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 ),
    car_id integer NOT NULL,
    customer_name text NOT NULL,
    customer_phone text NOT NULL,
    sales_person text NOT NULL,
    sales_date timestamp without time zone NOT NULL,
    CONSTRAINT sales_id_pk PRIMARY KEY (sales_id)
);

CREATE TABLE IF NOT EXISTS public.car_details
(
    car_details_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 ),
    manufacturer text NOT NULL,
    model_name text NOT NULL,
    weight integer NOT NULL,
    price real NOT NULL,
    CONSTRAINT car_details_id_pk PRIMARY KEY (car_details_id)
);

ALTER TABLE IF EXISTS public.car
    ADD CONSTRAINT car_details_id_fk FOREIGN KEY (car_details_id)
    REFERENCES public.car_details (car_details_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.sales
    ADD CONSTRAINT car_id_fk FOREIGN KEY (car_id)
    REFERENCES public.car (car_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


INSERT INTO car_details(manufacturer, model_name, weight, price)
VALUES ('Honda', 'Civic', 4000, 20000), ('Toyata', 'Camry', 4200, 25000), ('Audi', 'E300', 4500, 50000);

INSERT INTO car(car_details_id, serial_number)
VALUES (1, 'ABC123'), (1, 'XYZ123'), (2, 'ABC456'), (2, 'XYZ456'), (3, 'ABC789'), (3, 'XYZ789');

INSERT INTO sales(car_id, customer_name, customer_phone, sales_person, sales_date)
VALUES (1, 'Mr. Tan', 81234567, 'Salesperson A', '2021-11-11 10:00:00'), (2, 'Ms. Lian', 91234567, 'Salesperson B', '2021-11-25 14:00:00'), (3, 'Ahmad', 98765432, 'Salesperson A', '2021-12-12 10:00:00'), (5, 'Ahmad', 88765432, 'Salesperson B', '2021-12-25 14:00:00');


END;