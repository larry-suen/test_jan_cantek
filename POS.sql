-- Table: customer

CREATE TABLE customer
(
    customer_id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    create_on date,
    gender character varying(1),
    age integer,
    CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);

-- Table: type

CREATE TABLE type
(
    type_id integer NOT NULL,
    type_title character varying(100),
    CONSTRAINT type_pkey PRIMARY KEY (type_id)
);

-- Table: menu

CREATE TABLE menu
(
    menu_item_id integer NOT NULL,
    item_type integer NOT NULL,
    item_title character varying(255) NOT NULL,
    price numeric(5,2) NOT NULL,
    cal integer,
    CONSTRAINT menu_pkey PRIMARY KEY (orderable_id)
);

-- Table: order_header

CREATE TABLE order_header
(
    order_header_id integer NOT NULL,
    customer_id integer NOT NULL,
    total_order_amount numeric(5,2) NOT NULL DEFAULT 0,
    order_timestamp timestamp without time zone NOT NULL,
    last_update_timestamp time without time zone,
    cancel_by character(20),
    cancel_timestamp timestamp without time zone,
    CONSTRAINT order_pkey PRIMARY KEY (order_header_id)
);

-- Table: order_item

CREATE TABLE order_item
(
    header_id integer NOT NULL,
    item_id integer NOT NULL,
    qty integer NOT NULL,
    order_timestamp timestamp without time zone NOT NULL,
    cancel_timestamp timestamp without time zone,
    cancel_by_staff_id integer,
    item_unit_price integer NOT NULL,
    CONSTRAINT order_item_pkey PRIMARY KEY (header_id, item_id)
);

-- sample data for customer table
INSERT INTO customer(
	customer_id, first_name, last_name, create_on, gender, age)
	VALUES ('1', 'Peter', 'Jackon', '20230214', 'M', '30'),
		 ('2', 'Mary', 'Johnson', '20230308', 'F', '18'),
		 ('3', 'Tom', 'Iverson', '20230402', 'M', '55');

-- sample data for type table
INSERT INTO type(
	type_id, type_title)
	VALUES ('1', 'Appetizer'),
	('2', 'Pasta'),
	('3', 'Pizza'),
	('4', 'Drink'),
	('5', 'Dessert');

-- sample data for menu table
INSERT INTO public.menu(
	menu_item_id, item_type, item_title, price, cal)
	VALUES ('1', '1', 'Buffalo Cauliflower Wings', '10', '199'),
	('2', '1', 'Taquitos', '9', '199'),
	('3', '1', 'Stuffed Mushrooms', '8', '100'),
	('4', '2', 'Spaghetti Bolognaise', '13', '250'),
	('5', '2', 'Lasagne', '14', '300'),
	('6', '2', 'Ravioli', '12', '250'),
	('7', '3', 'Neapolitan Pizza', '14', '400'),
	('8', '3', 'California Pizza', '15', '450'),
	('9', '3', 'New York-Style Pizza', '16', '400'),
	('10', '4', 'Lemonade', '5', '400'),
	('11', '4', 'Cola', '5', '400'),
	('12', '4', 'Ice tea', '5', '100'),
	('13', '5', 'Classic New York Cheesecake', '8', '200'),
	('14', '5', 'Italian Tiramisu', '9', '200'),
	('15', '5', 'Fudge Brownies', '8', '150');

-- sample data for order_header table
INSERT INTO order_header(
	order_header_id, customer_id, total_order_amount, order_timestamp, last_update_timestamp, cancel_by, cancel_timestamp)
	VALUES ('1', '1', '31', '20230402 11:01:00', null, null, null),
	('2', '2', '37', '20230403 12:01:00', null, null, null),
	('3', '3', '39', '20230404 10:01:00', null, null, null);

-- sample data for order_item table
INSERT INTO order_item(
	header_id, item_id, qty, order_timestamp, cancel_timestamp, cancel_by_staff_id, item_unit_price)
	VALUES ('1', '1', '1', '20230402 11:01:00', null , null, '10'),
	('1', '8', '1', '20230402 11:01:00', null , null, '16'),
	('1', '11', '1', '20230402 11:01:00', null , null, '5'),
	('2', '4', '1', '20230403 12:01:00', null , null, '13'),
	('2', '9', '1', '20230403 12:01:00', null , null, '16'),
	('2', '15', '1', '20230403 12:01:00', null , null, '8'),
	('3', '5', '1', '20230404 10:01:00', null , null, '14'),
	('3', '9', '1', '20230404 10:01:00', null , null, '16'),
	('3', '14', '1', '20230404 10:01:00', null , null, '9');
	