USE La_Casona_restaurante;
-- Filtros where

-- Productos de Bebidas o Postres cuyo precio no sea $1500 ni $2000, de mayor a menor precio
SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE categoria.nombre
IN ('Bebidas', 'Postres') AND producto.precio NOT IN (1500, 2000)
ORDER BY producto.precio DESC;

-- Productos con la palabra Pizza en el nombre y precio mayor a $12000
SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE producto.nombre LIKE '%Pizza%' AND producto.precio > 12000
ORDER BY producto.precio DESC;

-- Productos de Entradas con precio mayor a $3000, o que pertenezcan a Pizzas
SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
WHERE (categoria.nombre = 'Entradas' AND producto.precio > 3000) OR categoria.nombre = 'Pizzas';

-- Algunas con joins entre multiples tablas

-- Mostrar el nombre de la categoría, el nombre del producto, la cantidad solicitada y la fecha del pedido.
SELECT categoria.nombre,producto.nombre,detalle_de_pedido.cantidad, pedido.fecha FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
INNER JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
INNER JOIN pedido ON detalle_de_pedido.id_pedido = pedido.id_pedido;

-- Nombre de cada producto con su categoría y precio, ordenado por categoría
SELECT categoria.nombre AS categoria, producto.nombre AS producto, producto.precio FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
ORDER BY categoria.nombre, producto.nombre;

-- Categorías vendidas en cada pedido con cantidad total de productos solicitados
SELECT pedido.id_pedido, categoria.nombre AS categoria, SUM(detalle_de_pedido.cantidad) AS total_productos FROM pedido
JOIN detalle_de_pedido ON pedido.id_pedido = detalle_de_pedido.id_pedido
JOIN producto ON detalle_de_pedido.id_producto = producto.id_producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
GROUP BY pedido.id_pedido, categoria.id_categoria, categoria.nombre
ORDER BY pedido.id_pedido;

-- Mostrar ID y fecha del pedido, nombre del producto, cantidad solicitada y apellido del mozo.
SELECT pedido.id_pedido,pedido.fecha, producto.nombre, detalle_de_pedido.cantidad, mozo.apellido FROM pedido
INNER JOIN detalle_de_pedido ON pedido.id_pedido = detalle_de_pedido.id_pedido
INNER JOIN producto ON detalle_de_pedido.id_producto = producto.id_producto
LEFT JOIN mozo ON pedido.id_mozo = mozo.id_mozo;
 
-- Listar todos los mozos y la cantidad de pedidos que atendieron.
SELECT mozo.nombre, mozo.apellido, COUNT(pedido.id_pedido) AS total_pedidos FROM mozo
LEFT JOIN pedido ON mozo.id_mozo = pedido.id_mozo
GROUP BY mozo.id_mozo, mozo.nombre, mozo.apellido
ORDER BY total_pedidos DESC;

-- Listar todas las mesas y los IDs de los pedidos realizados en cada una.
SELECT mesa.numero,mesa.capacidad, pedido.id_pedido FROM mesa
LEFT JOIN pedido ON mesa.id_mesa = pedido.id_mesa
ORDER BY mesa.numero;

-- Subconsultas

-- Productos con precio mayor al promedio general, de mayor a menor
SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
WHERE producto.precio > (SELECT AVG(precio) FROM producto)
ORDER BY producto.precio DESC;

-- Mostrar los productos que fueron pedidos alguna vez
SELECT nombre FROM producto
WHERE id_producto IN (SELECT id_producto FROM detalle_de_pedido);

-- Mostrar los mozos que registraron pedidos en estado 'Cobrado'.
SELECT nombre, apellido FROM mozo
WHERE id_mozo IN (SELECT id_mozo FROM pedido WHERE estado = 'Cobrado');

-- Mostrar el nombre de los productos que fueron solicitados en mesas con capacidad mayor a 6 personas.
SELECT nombre FROM producto
WHERE id_producto IN (SELECT id_producto FROM detalle_de_pedido WHERE id_pedido
IN (SELECT id_pedido FROM pedido WHERE id_mesa
IN (SELECT id_mesa FROM mesa WHERE capacidad > 6)));

-- Group by

-- Cantidad de productos por categoría, de mayor a menor
SELECT categoria.nombre AS categoria, COUNT(producto.id_producto) AS cantidad_productos FROM categoria
LEFT JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.id_categoria, categoria.nombre
ORDER BY cantidad_productos DESC;

-- Cantidad total de productos vendidos por categoría
SELECT categoria.nombre AS categoria, SUM(detalle_de_pedido.cantidad) AS total_vendido
FROM categoria
JOIN producto ON categoria.id_categoria = producto.id_categoria
JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
GROUP BY categoria.id_categoria, categoria.nombre
ORDER BY total_vendido DESC;

-- SUM

-- Recaudación potencial de cada categoría (suma de precios de sus productos), de mayor a menor
SELECT categoria.nombre AS categoria, SUM(producto.precio) AS recaudacion_potencial FROM categoria
JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.id_categoria, categoria.nombre
ORDER BY recaudacion_potencial DESC;

-- Mostrar el nombre de cada producto y la cantidad total vendida.
SELECT producto.nombre,SUM(detalle_de_pedido.cantidad) AS cantidad_vendida FROM producto
INNER JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
GROUP BY producto.id_producto, producto.nombre
ORDER BY cantidad_vendida DESC;

-- Count

-- Mostrar cada salón y la cantidad de pedidos realizados en sus mesas.
SELECT salon.nombre, COUNT(pedido.id_pedido) AS cantidad_pedidos FROM salon
INNER JOIN mesa ON salon.id_salon = mesa.id_salon
LEFT JOIN pedido ON mesa.id_mesa = pedido.id_mesa
GROUP BY salon.id_salon,salon.nombre
ORDER BY cantidad_pedidos DESC;

-- Listar los mozos ordenados por la cantidad de pedidos atendidos.
SELECT mozo.nombre, mozo.apellido, COUNT(pedido.id_pedido) AS pedidos_atendidos FROM mozo
LEFT JOIN pedido ON mozo.id_mozo = pedido.id_mozo
GROUP BY mozo.id_mozo, mozo.nombre, mozo.apellido
ORDER BY pedidos_atendidos DESC;

-- AVG
-- Calcular el precio promedio de los productos de cada categoría
SELECT categoria.nombre,AVG(producto.precio) AS precio_promedio FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.nombre
ORDER BY precio_promedio DESC;

-- MAX

-- Cuál es el producto más caro de cada categoría
SELECT categoria.nombre, MAX(producto.precio) AS precio_maximo FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
GROUP BY categoria.nombre;

-- Mostrar la capacidad mínima de las mesas de cada salón.
SELECT salon.nombre, MIN(mesa.capacidad) AS capacidad_minima FROM salon
INNER JOIN mesa ON salon.id_salon = mesa.id_salon
GROUP BY salon.nombre;


