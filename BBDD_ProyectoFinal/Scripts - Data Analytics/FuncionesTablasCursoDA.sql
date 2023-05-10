USE CursoDataAnalytics2023;

/* FUNCIONES 1 : Se pretende contar la cantidad de clientes por cada segmento de venta definidos en la Base de datos*/
CREATE FUNCTION count_customers(@segm INT) 
RETURNS INT
AS
BEGIN
    DECLARE @result INT
    SELECT @result = COUNT(*) FROM cliente WHERE id_Segm = @segm
    RETURN @result
END;

SELECT dbo.count_customers(1) AS Segmento1
UNION ALL
SELECT dbo.count_customers(2) AS Segmento2
UNION ALL
SELECT dbo.count_customers(3) AS Segmento3;

SELECT * FROM cliente;



/* FUNCIONES 2 Se pretende obtener el nombre de los productos a partir de su ID*/
CREATE FUNCTION Obtener_nombre (@id_product VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @name_prod VARCHAR(100);
    SELECT @name_prod = name_prod FROM productos WHERE id_product = @id_product;
    RETURN @name_prod;
END;

SELECT dbo.Obtener_nombre('FUR-BO-10000112');
SELECT dbo.Obtener_nombre('FUR-BO-10000330');
SELECT dbo.Obtener_nombre('FUR-BO-10000362');

SELECT * FROM productos;



/* FUNCIONES 3  Se pretende contar la cantidad de PEDIDOS de un cliente, tomando como parametro su nombre*/
CREATE FUNCTION count_orders (@name_cust VARCHAR(100)) 
RETURNS INT
AS
BEGIN
    DECLARE @count_orders INT;
    SELECT @count_orders = count(o.id_cust) FROM ordenes o
		JOIN cliente c
		ON o.id_cust = c.id_cust
		WHERE LOWER(c.name_cust) = LOWER(@name_cust);
	RETURN @count_orders;
END;



SELECT dbo.count_orders('Alex Avila');
SELECT dbo.count_orders('Alejandro Grove');
SELECT dbo.count_orders('Pete Kriz');
SELECT * FROM cliente;
SELECT * FROM ordenes;
