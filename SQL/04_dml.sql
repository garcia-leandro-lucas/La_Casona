USE La_Casona_Restaurante;

--
-- INSERT
--
-- DML 1
-- Se registra una nueva mesa con capacidad 6 y estado "Libre" en el Salón Principal (id_salon = 1).
INSERT INTO mesa (numero, capacidad, estado, id_salon)
VALUES (13, 6, 'Libre', 1);

-- DML 2
-- Se crear una nueva categoría llamada "Menú Ejecutivo" e insertar al menos un producto asociados, incluyendo su descripción, precio y categoría correspondiente.
INSERT INTO categoria (nombre)
VALUES ('Menú Ejecutivo');

INSERT INTO producto (nombre, descripcion, precio, id_categoria)
	VALUES ('Menú Ejecutivo Milanesa 1', 'Milanesa con guarnición y bebida incluida', 4500,
	(SELECT id_categoria FROM categoria WHERE nombre = 'Menú Ejecutivo'));

-- DML 3
-- Se registra un nuevo mozo en el sistema
INSERT INTO mozo (nombre, apellido, legajo, apodo) VALUES ('Pedro', 'Gonzalez', 1009, 'Pepo');

-- DML 4
-- Se registra un nuevo producto en el sistema
INSERT INTO producto (nombre, descripcion, precio, id_categoria) VALUES ('Tiramisú', 'Postre italiano con café, crema y cacao', 6500, 7);


--
-- UPDATE
--
-- DML 1
-- Se cambia un pedido de "Pendiente" a "En preparación"
select * from pedido;
UPDATE pedido SET estado = 'En preparación' WHERE id_pedido = 4;

-- DML 2
-- Modificar el nombre de una categoría (Ensaladas -> Ensaladas y Verdes)
select * from categoria;
UPDATE categoria SET nombre = 'Ensaladas y Verdes' WHERE id_categoria = 6;

-- DML 3
-- Aumentar en 2 la capacidad de las mesas del salón "Terraza"
UPDATE mesa SET capacidad = capacidad + 2 WHERE id_salon IN (SELECT id_salon FROM salon WHERE nombre = 'Terraza');

-- DML 4
-- Modificar el precio de todos los productos de la categoría "Bebidas", aumentando un 10%.
UPDATE producto SET precio = precio * 1.10
WHERE id_categoria IN (SELECT id_categoria FROM categoria WHERE nombre = 'Bebidas');

--
-- DELETE
--

-- DML 1
-- Eliminar los pedidos que se encuentren en estado "Cancelado".
Select * from pedido;
DELETE FROM pedido
WHERE estado = "Cancelado";

-- DML 2
-- Eliminar las mesas que no tengan pedidos registrados
DELETE FROM mesa WHERE id_mesa NOT IN (SELECT id_mesa FROM pedido);

-- DML 3
-- Eliminar los pedidos cancelados realizados antes del 1 de junio de 2026.
DELETE FROM pedido WHERE estado = 'Cancelado' AND fecha < '2026-06-01';

