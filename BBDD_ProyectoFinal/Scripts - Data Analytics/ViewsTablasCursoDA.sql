USE CursoDataAnalytics2023;


/*Vista 1*/
/*Se desea visualizar los pedidos rechazados por estar "mal facturados" */ 
CREATE VIEW order_rejected AS
SELECT * FROM retornos WHERE id_cause = 3;

SELECT * FROM order_rejected;
SELECT * FROM retornos;


/*Vista 2*/
/*Se desea visualizar los pedidos con fecha de orden mayor al 2021-10-01  */ 
CREATE VIEW sales_date AS
SELECT * FROM ordenes WHERE order_date > '2021-10-01';

SELECT * FROM sales_date;
SELECT * FROM ordenes;


/*Vista 3*/
/*Se desea visualizar los productos cuya subcategoria sea 1  */ 
CREATE VIEW order_by_prod_names AS
(SELECT id_product, name_prod, id_subcateg FROM productos WHERE id_subcateg = 1);

SELECT * FROM order_by_prod_names;
SELECT * FROM productos;


/*Vista 4*/
/*Se desea visualizar 10 clientes ordenados alfabeticamente descendente  */ 
CREATE VIEW order_customer AS
SELECT TOP 10 id_cust, name_cust FROM cliente 
ORDER BY name_cust DESC;

SELECT * FROM order_customer;
SELECT * FROM cliente;


/*Vista 5*/
/*Se desea visualizar 10 clientes ordenados alfabeticamente descendente  */ 
CREATE VIEW order_customer_Offset AS
SELECT id_cust, name_cust FROM cliente 
ORDER BY name_cust DESC 
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT * FROM order_customer_Offset;
SELECT * FROM cliente;


/*Vista 6*/
/*Se desea visualizar las causas de retornos de las ordenes  */ 
CREATE VIEW returns_cause AS
SELECT cr.id_cause,cr.descrip_causeret,r.id_order
FROM retornos r
INNER JOIN causa_retorno cr
ON cr.id_cause=r.id_cause;

SELECT * FROM returns_cause;
SELECT * FROM causa_retorno;
SELECT * FROM retornos;


/*Vista 7*/
/*Se desea visualizar las regiones de las ordenes junto oon el id de vendedor, id de cliente y fecha  */ 
CREATE VIEW orders_region AS
SELECT r.id_region,r.name_region,r.id_salesman,o.id_order,o.order_date,o.id_cust
FROM ordenes o
INNER JOIN region r
ON o.id_region=r.id_region;

SELECT * FROM orders_region;
SELECT * FROM ordenes;
SELECT * FROM region;


/*Vista 8*/
/*Se desea visualizar las regiones de las ordenes junto oon el id de vendedor + Nombre y apellido, id de cliente y fecha  */ 
CREATE VIEW orders_region_salesman AS
SELECT orr.id_region,orr.name_region,orr.id_order,orr.order_date,orr.id_salesman,orr.id_cust,v.name_salesman
FROM orders_region orr
INNER JOIN vendedor v
ON orr.id_salesman=v.id_salesman;

SELECT * FROM orders_region_salesman;
SELECT * FROM ordenes;
SELECT * FROM region;
SELECT * FROM vendedor;


/*Vista 9*/
/*Se desea visualizar las regiones de las ordenes junto con el id de vendedor + Nombre y apellido, id de cliente + Nombre y fecha  */ 
CREATE VIEW orders_region_salesman_cust AS
SELECT orrs.id_region,orrs.name_region,orrs.id_order,orrs.order_date,orrs.id_salesman,orrs.name_salesman,orrs.id_cust,c.name_cust
FROM orders_region_salesman orrs
INNER JOIN cliente c
ON orrs.id_cust=c.id_cust;

SELECT * FROM orders_region_salesman_cust;
SELECT * FROM ordenes;
SELECT * FROM region;
SELECT * FROM vendedor;
SELECT * FROM cliente;


/*Vista 10*/
/*Se desea visualizar los productos que contiene cada orden (id + descripcion) y los USD facturados  */ 
CREATE VIEW order_prod_name AS
SELECT op.id_order,p.id_product,p.name_prod,op.sales,op.profit
FROM ordenes_productos op
INNER JOIN productos p
ON op.id_product=p.id_product;

SELECT * FROM order_prod_name;
SELECT * FROM ordenes_productos;
SELECT * FROM productos;


/*Vista 11*/
/*Se desea visualizar los productos que contiene cada orden (id + descripcion), el cliente (id + nombre) y los USD facturados  */ 
CREATE VIEW order_prod_name_cust AS
SELECT opn.id_order,orsc.id_cust,orsc.name_cust,opn.id_product,opn.name_prod,opn.sales,opn.profit
FROM orders_region_salesman_cust orsc
INNER JOIN order_prod_name opn
ON orsc.id_order=opn.id_order;

SELECT * FROM order_prod_name_cust;
SELECT * FROM ordenes_productos;
SELECT * FROM productos;
SELECT * FROM cliente;



/*Vista 12*/
/*Se desea visualizar los RETORNOS con el detalle de los productos que contiene cada orden (id + descripcion), el cliente (id + nombre), las cantidades y los USD facturados  */ 
CREATE VIEW return_order_prod_name_cust AS
SELECT ret.id_retorno,ret.id_cause,opnc.id_order,opnc.id_cust,opnc.name_cust,opnc.id_product,opnc.name_prod,opnc.sales
FROM retornos ret 
INNER JOIN order_prod_name_cust opnc
ON ret.id_order=opnc.id_order;

SELECT * FROM return_order_prod_name_cust;
SELECT * FROM retornos;
SELECT * FROM productos;
SELECT * FROM cliente;