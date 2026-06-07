DROP DATABASE IF EXISTS La_Casona_Restaurante;
CREATE DATABASE La_Casona_Restaurante;
USE La_Casona_Restaurante;

--
-- Tabla de categoria
--
CREATE TABLE categoria (
	id_categoria INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_categoria)
);

--
-- Tabla de producto
--
CREATE TABLE producto (
	id_producto INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

--
-- Tabla de salon
--
CREATE TABLE salon (
	id_salon INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_salon)
);

--
-- Tabla de mesa
--
CREATE TABLE mesa (
	id_mesa INT AUTO_INCREMENT NOT NULL,
    numero INT UNIQUE NOT NULL,
    capacidad INT NOT NULL,
    estado VARCHAR(45) NOT NULL,
    id_salon INT NOT NULL,
    PRIMARY KEY (id_mesa),
    FOREIGN KEY(id_salon) REFERENCES salon(id_salon)
);

--
-- Tabla de mozo
--
CREATE TABLE mozo (
	id_mozo INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    legajo INT UNIQUE NOT NULL,
    apodo VARCHAR(45),
    PRIMARY KEY (id_mozo)
);

--
-- Tabla de pedido
--
CREATE TABLE pedido (
	id_pedido INT AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado VARCHAR(45) NOT NULL,
    id_mesa INT NOT NULL,
    id_mozo INT,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa),
    FOREIGN KEY (id_mozo) REFERENCES mozo(id_mozo)
);

--
-- Tabla de detalle_de_pedido
--
CREATE TABLE detalle_de_pedido (
	id_detalle_de_pedido INT AUTO_INCREMENT NOT NULL,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_detalle_de_pedido),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);