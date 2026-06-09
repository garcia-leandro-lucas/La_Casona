USE La_Casona_Restaurante;

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
(12,8,'Reservada',4),
(13, 4, 'Libre', 1),
(14, 6, 'Libre', 2);

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
('2026-04-05','12:00:00','Cobrado',1,1),
('2026-04-05','12:30:00','Cobrado',3,2),
('2026-04-05','13:00:00','Cancelado',6,3),
('2026-04-10','20:00:00','Cobrado',8,1),
('2026-04-10','20:45:00','Cobrado',11,4),
('2026-04-15','13:15:00','Cobrado',2,5),
('2026-04-15','21:00:00','Cobrado',5,1),
('2026-04-20','12:30:00','Cancelado',7,NULL),
('2026-04-20','21:30:00','Cobrado',9,2),
('2026-04-25','20:00:00','Cobrado',10,6),
('2026-04-25','20:30:00','Cancelado',12,7),
('2026-04-30','13:00:00','Cobrado',4,1),
('2026-05-03','12:00:00','Cobrado',1,1),
('2026-05-03','12:30:00','Cancelado',3,2),
('2026-05-07','20:00:00','Cobrado',5,1),
('2026-05-07','20:45:00','Cobrado',8,3),
('2026-05-12','13:00:00','Cobrado',2,1),
('2026-05-12','21:00:00','Cobrado',11,4),
('2026-05-18','12:30:00','Cobrado',4,5),
('2026-05-18','21:30:00','Cancelado',9,NULL),
('2026-05-22','20:00:00','Cobrado',7,1),
('2026-05-22','20:30:00','Cobrado',10,6),
('2026-05-28','13:00:00','Cancelado',6,7),
('2026-05-28','21:00:00','Cobrado',12,8),
('2026-05-31','12:00:00','Cobrado',3,1),
('2026-05-31','20:30:00','Cobrado',8,2),
('2026-06-01','12:15:00','Cobrado',3,1),
('2026-06-01','12:40:00','Cobrado',5,2),
('2026-06-01','13:10:00','Servido',8,3),
('2026-06-02','20:05:00','Pendiente',10,4),
('2026-06-02','20:30:00','En preparacion',11,5),
('2026-06-02','21:00:00','Cancelado',4,NULL),
('2026-06-03','21:15:00','Cobrado',3,1),
('2026-06-03','22:00:00','Cobrado',8,2),
('2026-06-04','13:20:00','Servido',5,NULL),
('2026-06-04','20:45:00','Pendiente',10,6),
('2026-06-05','12:00:00','Cobrado',2,1),
('2026-06-05','12:30:00','Cobrado',6,3),
('2026-06-05','20:00:00','Cancelado',9,5),
('2026-06-06','13:00:00','Cobrado',1,1),
('2026-06-06','21:00:00','Cobrado',7,2);

--
-- Inserción de detalle_de_pedido
--
INSERT INTO detalle_de_pedido (id_pedido,id_producto,cantidad,precio_unitario) VALUES
(1,4,1,22000),
(1,22,2,3200),
(2,10,1,12000),
(2,23,1,3200),
(2,21,2,2500),
(4,6,1,21000),
(4,24,2,3800),
(4,25,2,2200),
(5,14,2,13500),
(5,22,2,3200),
(6,7,1,13500),
(6,8,1,14500),
(6,21,2,2500),
(7,5,1,19000),
(7,24,1,3800),
(7,25,2,2200),
(9,11,1,13500),
(9,23,2,3200),
(10,13,1,11000),
(10,16,1,9500),
(10,22,2,3200),
(12,4,2,2500),
(12,1,2,2500),
(12,22,1,3200),
(13,15,2,15500),
(13,24,2,3800),
(15,6,1,21000),
(15,25,2,2200),
(16,12,1,15000),
(16,22,2,3200),
(16,18,2,4500),
(17,7,1,13500),
(17,21,2,2500),
(18,9,2,12500),
(18,22,2,3200),
(19,4,1,22000),
(19,23,1,3200),
(21,14,1,13500),
(21,16,1,9500),
(22,22,2,3200),
(25,5,1,19000),
(25,22,1,3200),
(25,25,2,2200),
(26,13,2,11000),
(26,24,2,3800),
(27,4,1,22000),
(27,22,2,3200),
(28,8,1,14500),
(28,22,2,3200),
(30,9,2,12500),
(30,25,2,2200),
(33,6,1,21000),
(33,24,2,3800),
(33,23,1,3200),
(34,15,1,15500),
(34,24,2,3800),
(37,4,1,22000),
(37,22,2,3200),
(38,8,1,14500),
(38,22,2,3200),
(40,9,2,12500),
(40,25,2,2200),
(41,6,1,21000),
(41,24,2,3800);