USE CursoDataAnalytics2023;

/*INSERCION EN TABLAS DIMENSIONALES*/

/*tabla 1*/
INSERT INTO segmento(descrip_seg) VALUES
('Consumer'),
('Corporate'),
('Home Office');

SELECT * FROM segmento;


/*tabla 2*/
INSERT INTO condicion_pago(descrip_pay) VALUES
('Cash'),
('Check'),
('Transfer');

SELECT * FROM condicion_pago;


/*tabla 3*/
INSERT INTO causa_retorno(descrip_causeret) VALUES
('Broken product'),
('Missing product'),
('Misbilled'),
('Price error');

SELECT * FROM causa_retorno;

/*tabla 4*/
INSERT INTO categoria(name_cat) VALUES
('Furniture'),
('Office Supplies'),
('Technology');

SELECT * FROM categoria;


/*tabla 5*/
INSERT INTO pais(name_count) VALUES
('United States');

SELECT * FROM pais;


/*tabla 6*/
INSERT INTO ship_mode(descrip_ship) VALUES
('First Class'),
('Same Day'),
('Second Class'),
('Standard Class');

SELECT * FROM ship_mode;


/*tabla 7*/
INSERT INTO vendedor(name_salesman) VALUES
('Anna Andreadi'),
('Cassandra Brandow'),
('Chuck Magee'),
('Kelly Williams');

SELECT * FROM vendedor;


/*INSERCION EN TABLAS DE HECHOS*/

/*tabla 8*/
INSERT INTO estado(name_state, id_country) VALUES
('Alabama', 1),
('Arizona', 1),
('Arkansas', 1),
('California', 1),
('Colorado', 1),
('Connecticut', 1),
('Delaware', 1),
('District of Columbia', 1),
('Florida', 1),
('Georgia', 1),
('Idaho', 1),
('Illinois', 1),
('Indiana', 1),
('Iowa', 1),
('Kansas', 1),
('Kentucky', 1),
('Louisiana', 1),
('Maine', 1),
('Maryland', 1),
('Massachusetts', 1),
('Michigan', 1),
('Minnesota', 1),
('Mississippi', 1),
('Missouri', 1),
('Montana', 1),
('Nebraska', 1),
('Nevada', 1),
('New Hampshire', 1),
('New Jersey', 1),
('New Mexico', 1),
('New York', 1),
('North Carolina', 1),
('North Dakota', 1),
('Ohio', 1),
('Oklahoma', 1),
('Oregon', 1),
('Pennsylvania', 1),
('Rhode Island', 1),
('South Carolina', 1),
('South Dakota', 1),
('Tennessee', 1),
('Texas', 1),
('Utah', 1),
('Vermont', 1),
('Virginia', 1),
('Washington', 1),
('West Virginia', 1),
('Wisconsin', 1),
('Wyoming', 1);

SELECT * FROM estado;


/*tabla 9*/
INSERT INTO subcategoria(name_subcat, id_categ) VALUES
('Accessories', 3),
('Appliances', 2),
('Art', 2),
('Binders', 2),
('Bookcases', 1),
('Chairs', 1),
('Copiers', 3),
('Envelopes', 2),
('Fasteners', 2),
('Furnishings', 1),
('Labels', 2),
('Machines', 3),
('Paper', 2),
('Phones', 3),
('Storage', 2),
('Supplies', 2),
('Tables', 1);

SELECT * FROM subcategoria;



/*tabla 10*/
INSERT INTO region(name_region, id_salesman) VALUES
('Central', 3),
('East', 2),
('South', 4),
('West', 1);

SELECT * FROM region;

/*tabla 11*/
SELECT * FROM cliente;

/*tabla 12*/
SELECT * FROM productos;

/*tabla 13*/
SELECT * FROM ordenes;

/*tabla 14*/
SELECT * FROM ordenes_productos;

/*tabla 15*/
SELECT * FROM retornos;

/*tabla 16*/
SELECT * FROM ciudad;

/*tabla 17*/
SELECT * FROM codigo_postal;




