CREATE DATABASE CursoDataAnalytics2023;
USE CursoDataAnalytics2023;

-- TABLAS DIMENSIONALES --

CREATE TABLE segmento(
id_segm INT NOT NULL IDENTITY PRIMARY KEY,
descrip_seg VARCHAR(100) NOT NULL
);

CREATE TABLE condicion_pago(
id_payment INT NOT NULL IDENTITY PRIMARY KEY,
descrip_pay VARCHAR(100) NOT NULL
);

CREATE TABLE causa_retorno(
id_cause INT NOT NULL IDENTITY PRIMARY KEY,
descrip_causeret VARCHAR(100) NOT NULL
);

CREATE TABLE categoria(
id_categ INT NOT NULL IDENTITY PRIMARY KEY,
name_cat VARCHAR(100) NOT NULL
);

CREATE TABLE pais(
id_country INT NOT NULL IDENTITY PRIMARY KEY,
name_count VARCHAR(100) NOT NULL
);

CREATE TABLE ship_mode(
id_ship INT NOT NULL IDENTITY PRIMARY KEY,
descrip_ship VARCHAR(100) NOT NULL
);

CREATE TABLE vendedor(
id_salesman INT NOT NULL IDENTITY PRIMARY KEY,
name_salesman VARCHAR(100) NOT NULL,
);



-- TABLAS DE HECHOS --

CREATE TABLE cliente(
id_cust VARCHAR(100) NOT NULL PRIMARY KEY,
name_cust VARCHAR(100) NOT NULL,
id_Segm INT NOT NULL,
FOREIGN KEY (id_Segm) REFERENCES segmento(id_segm)
);


CREATE TABLE subcategoria(
id_subcateg INT NOT NULL IDENTITY PRIMARY KEY,
name_subcat VARCHAR(100) NOT NULL,
id_categ INT NOT NULL,
FOREIGN KEY (id_categ) REFERENCES categoria(id_categ)
);


CREATE TABLE productos(
id_product VARCHAR(100) NOT NULL PRIMARY KEY,
name_prod VARCHAR(100) NOT NULL,
id_subcateg INT NOT NULL,
FOREIGN KEY (id_subcateg) REFERENCES subcategoria(id_subcateg)
);


CREATE TABLE estado(
id_state INT NOT NULL IDENTITY PRIMARY KEY,
name_state VARCHAR(100) NOT NULL,
id_country INT NOT NULL,
FOREIGN KEY (id_country) REFERENCES pais(id_country)
);


CREATE TABLE ciudad(
id_city INT NOT NULL IDENTITY PRIMARY KEY,
name_city VARCHAR(100) NOT NULL,
id_state INT NOT NULL,
FOREIGN KEY (id_state) REFERENCES estado(id_state)
);


CREATE TABLE codigo_postal(
id_pc INT NOT NULL IDENTITY PRIMARY KEY,
name_pc VARCHAR(100) NOT NULL,
id_city INT NOT NULL,
FOREIGN KEY (id_city) REFERENCES ciudad(id_city)
);


CREATE TABLE region(
id_region INT NOT NULL IDENTITY PRIMARY KEY,
name_region VARCHAR(100) NOT NULL,
id_salesman INT NOT NULL,
FOREIGN KEY (id_salesman) REFERENCES vendedor(id_salesman)
);


CREATE TABLE ordenes(
id_order VARCHAR(100) NOT NULL PRIMARY KEY,
order_date DATE NOT NULL,
id_ship INT NOT NULL,
id_cust VARCHAR(100) NOT NULL,
id_pc INT NOT NULL,
id_region INT NOT NULL,
id_payment INT NOT NULL,
FOREIGN KEY (id_ship) REFERENCES ship_mode(id_ship),
FOREIGN KEY (id_cust) REFERENCES cliente(id_cust),
FOREIGN KEY (id_pc) REFERENCES codigo_postal(id_pc),
FOREIGN KEY (id_region) REFERENCES region(id_region),
FOREIGN KEY (id_payment) REFERENCES condicion_pago(id_payment)
);


CREATE TABLE retornos(
id_retorno INT NOT NULL IDENTITY PRIMARY KEY,
id_order VARCHAR(100) NOT NULL,
id_cause INT NOT NULL,
FOREIGN KEY (id_order) REFERENCES ordenes(id_order),
FOREIGN KEY (id_cause) REFERENCES causa_retorno(id_cause),
);


CREATE TABLE ordenes_productos(
Id_vta_order_prod INT NOT NULL IDENTITY PRIMARY KEY,
id_order VARCHAR(100) NOT NULL,
id_product VARCHAR(100) NOT NULL,
sales DECIMAL NOT NULL,
qty INT NOT NULL,
discount DECIMAL NOT NULL,
profit DECIMAL NOT NULL,
FOREIGN KEY (id_order) REFERENCES ordenes(id_order),
FOREIGN KEY (id_product) REFERENCES productos(id_product)
);
