USE La_Casona_restaurante;

--
-- Inserción de categoria
--
INSERT INTO categoria (nombre) VALUES
('Entradas'),
('Parrilla'),
('Pastas'),
('Pizzas'),
('Hamburguesas'),
('Ensaladas'),
('Postres'),
('Bebidas');

--
-- Inserción de producto
--
INSERT INTO producto (nombre, descripcion, precio, id_categoria) VALUES
('Empanada de Carne','Empanada casera horneada',2500,1),
('Empanada de Jamon y Queso','Empanada casera horneada',2500,1),
('Provoleta','Queso provolone a la parrilla',7500,1),

('Bife de Chorizo','Corte premium acompañado con papas fritas',22000,2),
('Vacio','Vacio a la parrilla con guarnicion',19000,2),
('Asado de Tira','Asado tradicional argentino',21000,2),

('Ravioles de Ricota','Con salsa filetto o mixta',13500,3),
('Sorrentinos de JyQ','Salsa a elección',14500,3),
('Ñoquis Caseros','Con salsa bolognesa',12500,3),

('Pizza Muzzarella','Pizza tradicional',12000,4),
('Pizza Napolitana','Tomate fresco y ajo',13500,4),
('Pizza Especial','Jamon, morron y aceitunas',15000,4),

('Hamburguesa Clasica','Carne, lechuga y tomate',11000,5),
('Hamburguesa Completa','Con huevo y panceta',13500,5),
('Hamburguesa Doble','Doble medallon y cheddar',15500,5),

('Caesar Salad','Pollo grillado y croutons',9500,6),
('Ensalada Mixta','Lechuga, tomate y cebolla',6500,6),

('Flan Casero','Con dulce de leche',4500,7),
('Budin de Pan','Receta tradicional',4800,7),
('Helado Artesanal','3 bochas',5500,7),

('Agua Mineral','500ml',2500,8),
('Coca Cola','500ml',3200,8),
('Sprite','500ml',3200,8),
('Quilmes','Porron 340ml',3800,8),
('Cafe','Cafe expreso',2200,8);

--
-- Inserción de salon
--
INSERT INTO salon (nombre) VALUES
('Salon Principal'),
('Patio'),
('Terraza'),
('VIP');

--
-- Inserción de mesa
--
-- Tipo de Estados: Libre, Ocupada, Reservada
INSERT INTO mesa (numero, capacidad, estado, id_salon) VALUES
(1,2,'Libre',1),
(2,2,'Libre',1),
(3,4,'Ocupada',1),
(4,4,'Libre',1),
(5,6,'Reservada',1),
(6,2,'Libre',2),
(7,4,'Libre',2),
(8,6,'Ocupada',2),
(9,4,'Libre',3),
(10,8,'Libre',3),
(11,6,'Libre',4),
(12,8,'Reservada',4);

--
-- Inserción de mozo
--
INSERT INTO mozo (nombre, apellido, legajo, apodo) VALUES
('Juan','Perez',1001,'Juani'),
('Martin','Gomez',1002,NULL),
('Lucia','Fernandez',1003,'Lu'),
('Nicolas','Rodriguez',1004,NULL),
('Carla','Martinez',1005,'Carli'),
('Matias','Lopez',1006,NULL),
('Sofia','Diaz',1007,'Sofi'),
('Franco','Torres',1008,NULL);

--
-- Inserción de pedido
--
INSERT INTO pedido (fecha,hora,estado,id_mesa,id_mozo) VALUES
('2026-06-01','12:15:00','Cobrado',3,1),
('2026-06-01','12:40:00','Cobrado',5,2),
('2026-06-01','13:10:00','Servido',8,3),
('2026-06-02','20:05:00','Pendiente',10,4),
('2026-06-02','20:30:00','En preparación',11,5),
('2026-06-02','21:00:00','Cancelado',4,NULL),
('2026-06-03','21:15:00','Cobrado',3,1),
('2026-06-03','22:00:00','Cobrado',8,2),
('2026-06-04','13:20:00','Servido',5,NULL),
('2026-06-04','20:45:00','Pendiente',10,6);

--
-- Inserción de detalle_de_pedido
--
INSERT INTO detalle_de_pedido (id_pedido,id_producto,cantidad,precio_unitario) VALUES
(1,4,1,22000),
(1,22,2,3200),
(2,5,1,19000),
(2,24,2,3800),
(3,10,1,12000),
(3,23,2,3200),
(4,14,2,13500),
(5,7,1,13500),
(5,21,2,2500),
(6,1,3,2500),
(7,6,1,21000),
(7,25,2,2200),
(8,11,1,13500),
(9,18,2,4500),
(10,13,1,11000),
(10,22,2,3200);






