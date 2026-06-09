USE La_Casona_Restaurante;

-- Consultas SQL(JOINs entre múltiples tablas)

-- consulta 1
-- Mostrar el nombre de la categoría, el nombre del producto, la cantidad solicitada y la fecha del pedido
SELECT categoria.nombre,producto.nombre,detalle_de_pedido.cantidad, pedido.fecha FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
INNER JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
INNER JOIN pedido ON detalle_de_pedido.id_pedido = pedido.id_pedido;

-- Consulta 2
-- Nombre de cada producto con su categoría y precio, ordenado por categoría

SELECT categoria.nombre AS categoria, producto.nombre AS producto, producto.precio FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
ORDER BY categoria.nombre, producto.nombre;

-- Consulta 3
-- Mostrar ID y fecha del pedido, nombre del producto, cantidad solicitada y apellido del mozo

SELECT pedido.id_pedido, pedido.fecha, producto.nombre, detalle_de_pedido.cantidad, mozo.apellido
FROM pedido
INNER JOIN detalle_de_pedido ON pedido.id_pedido = detalle_de_pedido.id_pedido
INNER JOIN producto ON detalle_de_pedido.id_producto = producto.id_producto
LEFT JOIN mozo ON pedido.id_mozo = mozo.id_mozo;

-- Consulta 4
-- Listar todas las mesas y los IDs de los pedidos realizados en cada una

SELECT mesa.numero, mesa.capacidad, pedido.id_pedido
FROM mesa
LEFT JOIN pedido ON mesa.id_mesa = pedido.id_mesa
ORDER BY mesa.numero;

-- Consulta 5
-- Mostrar el detalle de todos los pedidos con número de pedido, nombre del producto, cantidad, precio unitario y subtotal

SELECT detalle_de_pedido.id_pedido,
       producto.nombre AS producto,
       detalle_de_pedido.cantidad,
       producto.precio AS Precio_unitario,
       detalle_de_pedido.cantidad * producto.precio AS Subtotal
FROM detalle_de_pedido
INNER JOIN producto
    ON detalle_de_pedido.id_producto = producto.id_producto
ORDER BY detalle_de_pedido.id_pedido;

-- Consulta 6
-- Mostrar todos los pedidos con número de pedido, nombre del mozo, su legajo y el número de mesa asociada

SELECT pedido.id_pedido AS Pedido, mozo.nombre, mozo.legajo, pedido.id_mesa AS Mesa
FROM pedido
INNER JOIN mozo ON pedido.id_mozo = mozo.id_mozo
INNER JOIN mesa ON pedido.id_mesa = mesa.id_mesa;

-- -Consultas SQL(Filtros (WHERE))

-- Consulta 1
-- Productos de Bebidas o Postres cuyo precio no sea $1500 ni $2000, de mayor a menor precio

SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE categoria.nombre
IN ('Bebidas', 'Postres') AND producto.precio NOT IN (1500, 2000)
ORDER BY producto.precio DESC;

-- Consulta 2
-- Productos con la palabra Pizza en el nombre y precio mayor a $12000

SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE producto.nombre LIKE '%Pizza%' AND producto.precio > 12000
ORDER BY producto.precio DESC;

-- Consulta 3
-- Productos con precio mayor al promedio general, de mayor a menor

SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
WHERE producto.precio > (SELECT AVG(precio) FROM producto)
ORDER BY producto.precio DESC;

-- Consulta 4
-- Mostrar los productos que fueron pedidos alguna vez

SELECT nombre
FROM producto
WHERE id_producto IN (SELECT id_producto FROM detalle_de_pedido);

-- Consulta 5
-- Mostrar los mozos que registraron pedidos en estado 'Cobrado'

SELECT nombre, apellido FROM mozo
WHERE id_mozo IN (SELECT id_mozo FROM pedido WHERE estado = 'Cobrado');

-- Consulta 6
-- Mostrar el nombre de los productos que fueron solicitados en mesas con capacidad mayor a 6 personas

SELECT nombre FROM producto
WHERE id_producto IN (SELECT id_producto FROM detalle_de_pedido WHERE id_pedido
IN (SELECT id_pedido FROM pedido WHERE id_mesa
IN (SELECT id_mesa FROM mesa WHERE capacidad > 6)));

-- Consulta 7
-- Pedidos realizados durante mayo que no estén cancelados y que hayan sido registrados por un mozo

SELECT *
FROM pedido
WHERE MONTH(fecha) = 5
  AND (estado != 'Cancelado')
  AND (id_mozo IS NOT NULL);

-- Consulta 8
-- Productos cuyo precio se encuentre entre $2500 y $5000 y que hayan sido vendidos al menos una vez

SELECT producto.nombre AS Producto, producto.precio
FROM producto
INNER JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
WHERE producto.precio BETWEEN 2500 AND 5000;

-- Consulta 9
-- Pedidos en estado "Cobrado" atendidos por los mozos 3 o 5, con número de pedido, fecha, hora, estado y datos del mozo

SELECT pedido.id_pedido, mozo.nombre, mozo.apellido, pedido.fecha, pedido.hora, pedido.estado
FROM pedido
INNER JOIN mozo ON pedido.id_mozo = mozo.id_mozo
WHERE (mozo.id_mozo = 3 OR mozo.id_mozo = 5)
  AND estado = 'Cobrado';

-- Consulta 10
-- Mostrar todos los datos de los productos que incluyan la palabra "Pizza" en su nombre y cuyo precio supere los $3500

SELECT nombre, precio
FROM producto
WHERE nombre LIKE '%Pizza%'
  AND precio > 3500;

-- Consulta 11
-- Productos pertenecientes a la categoría cuyo precio promedio sea el más alto

SELECT p.nombre,
       p.precio,(
           SELECT c.nombre
           FROM categoria c
           WHERE c.id_categoria = p.id_categoria) AS categoria
FROM producto p
WHERE p.id_categoria = ( SELECT id_categoria FROM producto
    GROUP BY id_categoria
    ORDER BY AVG(precio) DESC
    LIMIT 1 );

-- consulta 12
-- Productos de Entradas con precio mayor a $3000, o que pertenezcan a Pizzas

SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE (categoria.nombre = 'Entradas' AND producto.precio > 3000) OR categoria.nombre = 'Pizzas';

-- consulta 13
-- Mostrar los productos que no contengan la palabra "Jamon y Queso" en el nombre y que pertenezcan a la categoría "Entradas"

SELECT p.nombre, p.descripcion, p.precio FROM producto p 
INNER JOIN categoria c
ON p.id_categoria = c.id_categoria
WHERE p.nombre NOT LIKE '%Jamon y Queso%' AND c.nombre = 'Entradas';

-- consulta 14
-- Listar los pedidos cuyo estado sea "Pendiente" o "En preparación" y que hayan sido realizados durante una fecha determinada.
SELECT * FROM pedido
WHERE (estado = 'Pendiente' OR estado = 'En preparación') AND fecha = '2026-06-02';


-- Consultas SQL(Ordenamientos (ORDER BY))

-- Consulta 1
-- Cantidad de productos por categoría, de mayor a menor

SELECT categoria.nombre AS categoria, COUNT(producto.id_producto) AS cantidad_productos FROM categoria
LEFT JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.id_categoria, categoria.nombre
ORDER BY cantidad_productos DESC;

-- Consulta 2
-- Recaudación potencial de cada categoría (suma de precios de sus productos), de mayor a menor

SELECT categoria.nombre AS categoria, SUM(producto.precio) AS recaudacion_potencial
FROM categoria
JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.id_categoria, categoria.nombre
ORDER BY recaudacion_potencial DESC;

-- Consulta 3
-- Mostrar el nombre de cada producto y la cantidad total vendida

SELECT producto.nombre, SUM(detalle_de_pedido.cantidad) AS cantidad_vendida
FROM producto
INNER JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
GROUP BY producto.id_producto, producto.nombre
ORDER BY cantidad_vendida DESC;

-- Consulta 4
-- Listar los mozos ordenados por la cantidad de pedidos atendidos

SELECT mozo.nombre, mozo.apellido, COUNT(pedido.id_pedido) AS pedidos_atendidos
FROM mozo
LEFT JOIN pedido ON mozo.id_mozo = pedido.id_mozo
GROUP BY mozo.id_mozo, mozo.nombre, mozo.apellido
ORDER BY pedidos_atendidos DESC;

-- Consulta 5
-- Mostrar cuántas mesas fueron atendidas por cada mozo, con cantidad de pedidos registrados, ordenado de mayor a menor
SELECT mozo.nombre, mozo.apellido,
       COUNT(DISTINCT pedido.id_mesa) AS mesas_atendidas,
       COUNT(pedido.id_pedido) AS pedidos_registrados
FROM mozo
INNER JOIN pedido ON mozo.id_mozo = pedido.id_mozo
GROUP BY mozo.id_mozo, mozo.nombre, mozo.apellido
ORDER BY COUNT(pedido.id_pedido) DESC;

-- Consulta 6
-- Mostrar cuánto dinero generó cada mesa durante el período analizado

SELECT mesa.numero AS numero_de_mesa, MONTH(pedido.fecha) AS mes,
       SUM(detalle_de_pedido.cantidad * detalle_de_pedido.precio_unitario) AS total_generado
FROM mesa
INNER JOIN pedido
    ON mesa.id_mesa = pedido.id_mesa
INNER JOIN detalle_de_pedido
    ON pedido.id_pedido = detalle_de_pedido.id_pedido
GROUP BY mesa.id_mesa, mesa.numero, MONTH(pedido.fecha)
ORDER BY total_generado DESC;

-- Consultas SQL( GROUP BY y funciones de agregacion)

-- Consulta 1
-- Categorías vendidas en cada pedido con cantidad total de productos solicitados

SELECT pedido.id_pedido, categoria.nombre AS categoria, SUM(detalle_de_pedido.cantidad) AS total_productos FROM pedido
JOIN detalle_de_pedido ON pedido.id_pedido = detalle_de_pedido.id_pedido
JOIN producto ON detalle_de_pedido.id_producto = producto.id_producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
GROUP BY pedido.id_pedido, categoria.id_categoria, categoria.nombre
ORDER BY pedido.id_pedido;

-- Consulta 2
-- Listar todos los mozos y la cantidad de pedidos que atendieron

SELECT mozo.nombre, mozo.apellido, COUNT(pedido.id_pedido) AS total_pedidos
FROM mozo
LEFT JOIN pedido ON mozo.id_mozo = pedido.id_mozo
GROUP BY mozo.id_mozo, mozo.nombre, mozo.apellido
ORDER BY total_pedidos DESC;

-- Consulta 3
-- Cantidad total de productos vendidos por categoría

SELECT categoria.nombre AS categoria, SUM(detalle_de_pedido.cantidad) AS total_vendido
FROM categoria
JOIN producto ON categoria.id_categoria = producto.id_categoria
JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
GROUP BY categoria.id_categoria, categoria.nombre
ORDER BY total_vendido DESC;

-- Consulta 4
-- Mostrar cada salón y la cantidad de pedidos realizados en sus mesas

SELECT salon.nombre, COUNT(pedido.id_pedido) AS cantidad_pedidos
FROM salon
INNER JOIN mesa ON salon.id_salon = mesa.id_salon
LEFT JOIN pedido ON mesa.id_mesa = pedido.id_mesa
GROUP BY salon.id_salon, salon.nombre
ORDER BY cantidad_pedidos DESC;

-- Consulta 5
-- Calcular el precio promedio de los productos de cada categoría

SELECT categoria.nombre, AVG(producto.precio) AS precio_promedio
FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.nombre
ORDER BY precio_promedio DESC;

-- Consulta 6
-- Cuál es el producto más caro de cada categoría

SELECT categoria.nombre, MAX(producto.precio) AS precio_maximo
FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.nombre;

-- Consulta 7
-- Mostrar la capacidad mínima de las mesas de cada salón

SELECT salon.nombre, MIN(mesa.capacidad) AS capacidad_minima
FROM salon
INNER JOIN mesa ON salon.id_salon = mesa.id_salon
GROUP BY salon.nombre;

-- Consulta 8
-- Mostrar qué productos fueron solicitados en la mesa número 8 con cantidad, precio unitario y total por producto

SELECT mesa.numero AS numero_de_mesa, producto.nombre,
       SUM(detalle_de_pedido.cantidad) AS cantidad_solicitada,
       detalle_de_pedido.precio_unitario,
       SUM(detalle_de_pedido.cantidad * detalle_de_pedido.precio_unitario) AS total
FROM detalle_de_pedido
INNER JOIN pedido ON detalle_de_pedido.id_pedido = pedido.id_pedido
INNER JOIN producto ON detalle_de_pedido.id_producto = producto.id_producto
INNER JOIN mesa ON pedido.id_mesa = mesa.id_mesa
WHERE mesa.numero = 8
GROUP BY mesa.numero, producto.nombre, detalle_de_pedido.precio_unitario;


