# consultas
USE jardineria;

# Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT O.codigo_oficina AS CodOficina, O.ciudad AS Ciudad
FROM oficina O;

# Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

SELECT O.ciudad AS Ciudad, O.telefono AS Telefono
FROM oficina O
WHERE O.pais = "España";

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

SELECT E.nombre, E.apellido1, E.apellido2, E.email
FROM empleado E
WHERE E.codigo_jefe = 7;

# Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT E.puesto, E.nombre, E.apellido1, E.apellido2, E.email
FROM empleado E
WHERE codigo_jefe IS NULL;

# Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

SELECT E.nombre, E.apellido1, E.apellido2, E.puesto
FROM empleado E
WHERE E.puesto <> "Representante Ventas";

# Devuelve un listado con el nombre de los todos los clientes españoles.

SELECT C.nombre_cliente AS NombreCliente
FROM cliente AS C
WHERE C.pais = "Spain";

# Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT P.estado
FROM pedido AS P
GROUP BY P.estado;

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

--     Utilizando la función YEAR de MySQL.
--     Utilizando la función DATE_FORMAT de MySQL.
--     Sin utilizar ninguna de las funciones anteriores.


SELECT P.codigo_cliente
FROM pago AS P
WHERE YEAR(P.fecha_pago)=2008;

SELECT P.codigo_cliente
FROM pago AS P
WHERE DATE_FORMAT(P.fecha_pago,"%Y")=2008;

SELECT P.codigo_cliente
FROM pago AS P
WHERE P.fecha_pago LIKE "2008%";

# Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM pedido P
WHERE DATEDIFF(P.fecha_entrega,P.fecha_esperada) > 1;


-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

--     Utilizando la función ADDDATE de MySQL.
--     Utilizando la función DATEDIFF de MySQL.
--     ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM pedido P
WHERE ADDDATE(P.fecha_esperada, INTERVAL -2 DAY) >= P.fecha_entrega;

SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM pedido P
WHERE DATEDIFF(P.fecha_esperada,P.fecha_entrega) >= 2;

SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM pedido P
WHERE ();

# Devuelve un listado de todos los pedidos que fueron en 2009.

SELECT *
FROM pedido
WHERE fecha_pedido LIKE "2009%";

-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

SELECT * FROM pedido
WHERE fecha_pedido LIKE "%-01-%";

-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

SELECT *
FROM pago
WHERE forma_pago = "PayPal"
ORDER BY total DESC;

# Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

SELECT forma_pago
FROM pago
GROUP BY forma_pago;

# Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
 
SELECT * FROM gama_producto;

SELECT nombre AS Producto, precio_venta AS Precio, cantidad_en_stock AS Unidades
FROM producto
WHERE gama LIKE "Orna%" AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

#Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

SELECT * FROM cliente;

SELECT nombre_cliente AS Nombre
FROM cliente 
WHERE ciudad = "Madrid" AND (codigo_empleado_rep_ventas = 11 OR codigo_empleado_rep_ventas = 30);

# Consultas multitabla:

# Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

SELECT C.nombre_cliente AS Cliente, E.nombre AS EmpleadoNombre, E.apellido1 AS EmpleadoApellido
FROM cliente AS C
INNER JOIN empleado AS E ON C.codigo_empleado_rep_ventas = codigo_empleado;

# Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT C.nombre_cliente AS Cliente, E.nombre AS EmpleadoNombre, E.apellido1 AS EmpleadoApellido
FROM pago AS P
INNER JOIN cliente AS C ON P.codigo_cliente = C.codigo_cliente
INNER JOIN empleado AS E ON C.codigo_empleado_rep_ventas = E.codigo_empleado;

-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT C.nombre_cliente AS Cliente, E.nombre AS EmpleadoNombre, E.apellido1 AS EmpleadoApellido, O.ciudad AS CiudadVendedor
FROM pago AS P
INNER JOIN cliente AS C ON P.codigo_cliente = C.codigo_cliente
INNER JOIN empleado AS E ON C.codigo_empleado_rep_ventas = E.codigo_empleado
INNER JOIN oficina AS O ON E.codigo_oficina = O.codigo_oficina;

-- Devuelve el nombre de los clientes que hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT C.nombre_cliente AS Cliente, E.nombre AS EmpleadoNombre, E.apellido1 AS EmpleadoApellido, O.ciudad AS CiudadVendedor, IF(O.ciudad = "Fuenlabrada", O.linea_direccion1, "")
FROM pago AS P
INNER JOIN cliente AS C ON P.codigo_cliente = C.codigo_cliente
INNER JOIN empleado AS E ON C.codigo_empleado_rep_ventas = E.codigo_empleado
INNER JOIN oficina AS O ON E.codigo_oficina = O.codigo_oficina;

# Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT C.nombre_cliente AS Cliente, CONCAT(E.nombre, " ", E.apellido1) AS Vendedor, O.ciudad
FROM cliente AS C
INNER JOIN empleado AS E ON C.codigo_empleado_rep_ventas = E.codigo_empleado
INNER JOIN oficina AS O ON E.codigo_oficina = O.codigo_oficina;

# Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT CONCAT(E.nombre, " ", E.apellido1) AS Empleado, CONCAT(J.nombre, " ",J.apellido1) AS Jefe, E.puesto AS PuestoEmpleado
FROM empleado AS E
INNER JOIN empleado AS J ON E.codigo_jefe = J.codigo_empleado;

# Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

SELECT CONCAT(E.nombre, " ", E.apellido1) AS Empleado, CONCAT(J.nombre, " ",J.apellido1) AS Jefe, CONCAT(JM.nombre," ",JM.apellido1) AS JefeDeJefes
FROM empleado AS E
INNER JOIN empleado AS J ON E.codigo_jefe = J.codigo_empleado
INNER JOIN empleado AS JM ON J.codigo_jefe = JM.codigo_empleado;


# Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

SELECT C.nombre_cliente
FROM pedido AS P
INNER JOIN cliente AS C ON P.codigo_cliente = C.codigo_cliente
WHERE P.fecha_esperada > P.fecha_entrega;


-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT G.gama
FROM cliente AS C
INNER JOIN pedido AS P ON C.codigo_cliente = P.codigo_cliente
INNER JOIN detalle_pedido AS DP ON P.codigo_pedido = DP.codigo_pedido
INNER JOIN producto AS PR ON DP.codigo_producto = PR.codigo_producto
INNER JOIN gama_producto AS G ON PR.gama = G.gama
GROUP BY G.gama;


# Desarrollado por Santiago Sandoval CC 1 XXXXXXXX 789