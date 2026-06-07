USE La_Casona_Restaurante;

--
-- INSERT
--
-- Registrar una nueva mesa con capacidad 6 y estado "Libre" en el Salón Principal (id_salon = 1).
INSERT INTO mesa (numero, capacidad, estado, id_salon)
VALUES (13, 6, 'Libre', 1);

-- Se crear una nueva categoría llamada "Menú Ejecutivo" e insertar al menos un producto asociados, incluyendo su descripción, precio y categoría correspondiente.
INSERT INTO categoria (nombre)
VALUES ('Menú Ejecutivo');

INSERT INTO producto (nombre, descripcion, precio, id_categoria)
	VALUES ('Menú Ejecutivo Milanesa 1', 'Milanesa con guarnición y bebida incluida', 4500,
	(SELECT id_categoria FROM categoria WHERE nombre = 'Menú Ejecutivo'));

--
-- UPDATE
--
-- Cambiar un pedido de Pendiente a En preparación
UPDATE pedido SET estado = 'En preparación'
WHERE id_pedido = 4 AND estado = 'Pendiente';

-- Modificar el nombre de una categoría (Ensaladas -> Ensaladas y Verdes)
UPDATE categoría SET nombre = 'Ensaladas y Verdes' WHERE nombre = 'Ensaladas';

-- Modificar el precio de todos los productos de la categoría "Bebidas", aumentando un 10%.
UPDATE producto SET precio = precio * 1.10
WHERE id_categoria IN (SELECT id_categoria FROM categoría WHERE nombre = 'Bebidas');

-- Aumentar en 2 la capacidad de las mesas del salón "Terraza"
UPDATE mesa SET capacidad = capacidad + 2 WHERE id_salon IN (SELECT id_salon FROM salon WHERE nombre = 'Terraza');

--
-- DELETE
--
-- Eliminar detalles de pedido con cantidad igual a cero
DELETE FROM detalle_de_pedido
WHERE cantidad = 0;

-- Eliminar los pedidos que se encuentren en estado "Cancelado".
DELETE FROM pedido
WHERE estado = 'Cancelado';

-- Eliminar las mesas que no tengan pedidos registrados
DELETE FROM mesa WHERE id_mesa NOT IN (SELECT id_mesa FROM pedido);
