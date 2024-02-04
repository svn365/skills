CREATE TABLE public.calendar_dim (
  dateid serial NOT NULL,
  year integer NOT NULL,
  quarter integer NOT NULL,
  month integer NOT NULL,
  week integer NOT NULL,
  date date NOT NULL,
  week_day varchar(20) NOT NULL,
  leap varchar(20) NOT NULL,
  CONSTRAINT pk_calendar_dim PRIMARY KEY (dateid)
);

CREATE TABLE public.customer_dim (
  cust_id serial NOT NULL,
  customer_id varchar(8) NOT NULL,
  customer_name varchar(22) NOT NULL,
  CONSTRAINT pk_customer_dim PRIMARY KEY (cust_id)
);

CREATE TABLE public.people_dim (
  person_id serial NOT NULL,
  person varchar(17) NOT NULL,
  region varchar(7) NOT NULL,
  CONSTRAINT pk_people_dim PRIMARY KEY (person_id)
);

CREATE TABLE public.product_dim (
  prod_id serial NOT NULL,
  product_id varchar(50) NOT NULL,
  product_name varchar(127) NOT NULL,
  category varchar(15) NOT NULL,
  sub_category varchar(11) NOT NULL,
  segment varchar(11) NOT NULL,
  CONSTRAINT pk_product_dim PRIMARY KEY (prod_id)
);

CREATE TABLE public.returns_dim (
  return_id serial NOT NULL,
  returned varchar(10) NOT NULL,
  order_id varchar(25) NOT NULL,
  CONSTRAINT pk_returns_dim PRIMARY KEY (return_id)
);

CREATE TABLE public.shipping_dim (
  ship_id serial NOT NULL,
  shipping_mode varchar(14) NOT NULL,
  CONSTRAINT pk_shipping_dim PRIMARY KEY (ship_id)
);

CREATE TABLE public.geo_dim (
  geo_id serial NOT NULL,
  country varchar(13) NOT NULL,
  city varchar(17) NOT NULL,
  person_id integer NOT NULL,
  state varchar(20) NOT NULL,
  postal_code varchar(20) DEFAULT NULL,
  CONSTRAINT pk_geo_dim PRIMARY KEY (geo_id),
  CONSTRAINT geo_dim_person_id_fkey FOREIGN KEY (person_id) REFERENCES people_dim (person_id)
);

CREATE TABLE public.sales_fact (
  sales_id serial NOT NULL,
  cust_id integer NOT NULL,
  dateid integer NOT NULL,
  order_date_id integer NOT NULL,
  ship_date_id integer NOT NULL,
  prod_id integer NOT NULL,
  ship_id integer NOT NULL,
  geo_id integer NOT NULL,
  return_id integer NOT NULL,
  order_id varchar(25) NOT NULL,
  sales numeric NOT NULL,
  profit numeric NOT NULL,
  quantity integer NOT NULL,
  discount numeric NOT NULL,
  CONSTRAINT pk_sales_fact PRIMARY KEY (sales_id),
  CONSTRAINT sales_fact_cust_id_fkey FOREIGN KEY (cust_id) REFERENCES customer_dim (cust_id),
  CONSTRAINT sales_fact_dateid_fkey FOREIGN KEY (dateid) REFERENCES calendar_dim (dateid),
  CONSTRAINT sales_fact_geo_id_fkey FOREIGN KEY (geo_id) REFERENCES geo_dim (geo_id),
  CONSTRAINT sales_fact_prod_id_fkey FOREIGN KEY (prod_id) REFERENCES product_dim (prod_id),
  CONSTRAINT sales_fact_return_id_fkey FOREIGN KEY (return_id) REFERENCES returns_dim (return_id),
  CONSTRAINT sales_fact_ship_id_fkey FOREIGN KEY (ship_id) REFERENCES shipping_dim (ship_id)
);