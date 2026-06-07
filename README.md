<div align="center">

# 🍽️ Sistema de Gestión de Restaurante

### Trabajo Práctico Integrador - Entrega Final

<img src="images/logo_UNLA.jpg" alt="UNLa" width="50"/>

<br>

**Universidad Nacional de Lanús**

**Carrera:** Licenciatura en Sistemas

**Materia:** Ingeniería de Software I (Introducción a las Bases de Datos)

<hr>

### 👥 Grupo N° 1

**Integrantes**

**Pergola Ana Laura**
**Leandro Lucas Garcia Kristeff Secoff**
**Sebastian Nogues**

<hr>

### 👨‍🏫 Docentes
**Lic. Javier Vescio**
**Lic. Marcelo Wolf**

<hr>

📅 **Año 2026**

</div>

<hr>

## 📖 Descripción del Proyecto

Este trabajo práctico consiste en el análisis, diseño e implementación de una base de datos para la gestión integral de un restaurante, La Casona.

La solución propuesta permite administrar mesas, mozos, productos, categorías y pedidos, centralizando la información y mejorando el seguimiento de la operación diaria del establecimiento.

<hr>

## 📂 Contenido del Repositorio

```text
📦 La_Casona
 ┣ 📂 Diagramas
 ┃ ┣ 📄 DER-La-Casona.pdf
 ┃ ┗ 📄 diagrama_conceptual_la_casona.pdf
 ┣ 📂 SQL
 ┃ ┣ 📄 01_creacion_de_tablas_restaurante.sql
 ┃ ┣ 📄 02_insercion_datos_restaurante.sql
 ┃ ┗ 📄 03_consultas.sql
 ┗ 📄 README.md
```

<hr>

## 📊 Consultas SQL

##### 📝 Consulta 1
<p>
    <strong style="color:#1b2d49">Productos de Bebidas o Postres cuyo precio no sea $1500 ni $2000, de mayor a menor precio.</strong>
</p>

##### 💻 Código SQL

```sql
SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE categoria.nombre
IN ('Bebidas', 'Postres') AND producto.precio NOT IN (1500, 2000)
ORDER BY producto.precio DESC;
```

##### 📷 Resultado

<p align="center">
  <img src="images/consultas/consulta_1.png"
       alt="Resultado de la consulta total generado por mesa"
       width="800">
</p>

<hr>

##### 📝 Consulta 2
<p>
    <strong style="color:#1b2d49">Productos con la palabra Pizza en el nombre y precio mayor a $12000</strong>
</p>

##### 💻 Código SQL

```sql
SELECT producto.nombre, producto.precio, categoria.nombre AS categoría FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE producto.nombre LIKE '%Pizza%' AND producto.precio > 12000
ORDER BY producto.precio DESC;
```

##### 📷 Resultado

<p align="center">
  <img src="images/consultas/consulta_2.png"
       alt="Resultado de la consulta total generado por mesa"
       width="800">
</p>

<hr>

##### 📝 Consulta 3
<p>
    <strong style="color:#1b2d49">Productos de Entradas con precio mayor a $3000, o que pertenezcan a Pizzas</strong>
</p>

##### 💻 Código SQL

```sql
SELECT categoria.nombre,producto.nombre,detalle_de_pedido.cantidad, pedido.fecha FROM categoria
INNER JOIN producto ON categoria.id_categoria = producto.id_categoria
INNER JOIN detalle_de_pedido ON producto.id_producto = detalle_de_pedido.id_producto
INNER JOIN pedido ON detalle_de_pedido.id_pedido = pedido.id_pedido;
```

##### 📷 Resultado

<p align="center">
  <img src="images/consultas/consulta_3.png"
       alt="Resultado de la consulta total generado por mesa"
       width="800">
</p>

<hr>

##### 📝 Consulta 4
<p>
    <strong style="color:#1b2d49">Nombre de cada producto con su categoría y precio, ordenado por categoría</strong>
</p>

##### 💻 Código SQL

```sql
SELECT categoria.nombre AS categoria, producto.nombre AS producto, producto.precio FROM producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
ORDER BY categoria.nombre, producto.nombre;
```

##### 📷 Resultado

<p align="center">
  <img src="images/consultas/consulta_4.png"
       alt="Resultado de la consulta total generado por mesa"
       width="800">
</p>

<hr>

