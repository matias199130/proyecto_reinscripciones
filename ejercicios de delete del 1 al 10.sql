create database ChatGPT2;

use ChatGPT2;

/*Tabla Productos:  */

CREATE TABLE Productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2)
);

INSERT INTO Productos (id, nombre, categoria, precio)
VALUES
(1, 'Laptop', 'Tecnología', 1200.00),
(2, 'Teléfono', 'Tecnología', 800.00),
(3, 'Tablet', 'Tecnología', 600.00),
(4, 'Monitor', 'Tecnología', 300.00),
(5, 'Teclado', 'Accesorios', 50.00);

/*
Peticiones:
Agregar el sufijo " - Nuevo" a todos los nombres de productos
Agregar el prefijo "Premium " a todos los nombres de productos en la categoría 'Tecnología'
Combinar la categoría y el nombre del producto en un solo campo de nombre
Agregar el texto "(Edición Limitada)" a los productos con un precio mayor a 500
Agregar el prefijo "OFERTA: " al nombre de los productos en la categoría 'Accesorios'
select * from Productos;
*/

select * from Productos;

UPDATE Productos SET nombre = CONCAT(nombre, ' - Nuevo');
UPDATE Productos SET nombre = CONCAT('Premium ', nombre) WHERE categoria = 'Tecnología';
UPDATE Productos SET nombre = CONCAT(categoria, ' ', nombre);
UPDATE Productos SET nombre = CONCAT(nombre, ' (Edición Limitada)') WHERE precio > 500;
UPDATE Productos SET nombre = CONCAT('OFERTA: ', nombre) WHERE categoria = 'Accesorios';
 
 
 /*Tabla Clientes:*/  


CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(100)
);

INSERT INTO Clientes (id, nombre, apellido, correo)
VALUES
(1, 'Juan', 'Perez', 'juan.perez@hotmail.com'),
(2, 'Ana', 'Gomez', 'ana.gomez@yahoo.com'),
(3, 'Luis', 'Lopez', 'luis.lopez@google.com'),
(4, 'Maria', 'Martinez', 'maria.martinez@example.com'),
(5, 'Carlos', 'Sanchez', 'carlos.sanchez@example.com');

/*Peticiones:

Combinar nombre y apellido en un solo campo de nombre completo
Agregar el texto "Cliente: " antes del nombre Luis
Combinar el nombre completo y el correo electrónico si contiene "yahoo.com"
Agregar el sufijo " - VIP" a los nombres de clientes que tienen un correo que contiene "example.com"
Agregar el prefijo "Sr./Sra. " a todos los nombres

*/
drop table Clientes;

select * from Clientes;

UPDATE Clientes SET nombre = CONCAT(nombre, ' ', apellido);
UPDATE Clientes SET nombre = CONCAT('Cliente: ', nombre) WHERE nombre LIKE '%Luis%';
UPDATE Clientes SET nombre = CONCAT(nombre, ' - ', correo) WHERE correo LIKE '%yahoo.com%';
UPDATE Clientes SET nombre = CONCAT(nombre, ' - VIP') WHERE correo LIKE '%example.com%';
UPDATE Clientes SET nombre = CONCAT('Sr./Sra. ', nombre);

alter table Clientes add nombre_completo varchar(100);
update Clientes set nombre_completo = concat(nombre, ' ', apellido);
update Clientes set nombre_completo = concat('Cliente: ', nombre_completo);
update Clientes set nombre_completo = concat(nombre_completo, ' ', correo);
update Clientes set nombre = concat(nombre, ' ', '- VIP') where correo like '%example.com';
update Clientes set nombre = concat('Sr./Sra. ',nombre);



create database ChatGPT;

use ChatGPT;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INT,
    fecha_venta DATE,
    id_cliente INT,
    deuda_cliente DECIMAL(10, 2)
);

INSERT INTO productos (nombre, categoria, precio, cantidad, fecha_venta, id_cliente, deuda_cliente)
VALUES 
('Laptop', 'Electrónica', 1500.00, 2, '2023-09-01', 101, 500.00),
('Teléfono', 'Electrónica', 800.00, 5, '2023-08-15', 102, 0.00),
('Mouse', 'Accesorios', 25.00, 10, '2023-07-20', 103, 1000.00),
('Teclado', 'Accesorios', 45.00, 8, '2023-06-30', 104, 200.00),
('Tablet', 'Electrónica', 500.00, 1, '2022-12-15', 105, 1500.00),
('Cargador', 'Accesorios', 20.00, 4, '2023-05-10', 106, 0.00),
('Audífonos', 'Accesorios', 35.00, 7, '2023-09-25', 107, 0.00),
('Monitor', 'Electrónica', 300.00, 3, '2023-07-10', 108, 100.00),
('Impresora', 'Electrónica', 200.00, 2, '2023-03-05', 109, 100.00),
('Altavoz', 'Accesorios', 100.00, 6, '2022-11-11', 110, 1000.00),
('Smartwatch', 'Electrónica', 150.00, 5, '2024-02-15', 111, 200.00),
('Bocina Bluetooth', 'Accesorios', 80.00, 10, '2024-03-01', 112, 0.00),
('Cámara de seguridad', 'Electrónica', 120.00, 3, '2024-01-10', 113, 500.00),
('Mochila para laptop', 'Accesorios', 30.00, 12, '2024-04-20', 114, 100.00),
('Gafas VR', 'Electrónica', 250.00, 4, '2023-11-25', 115, 300.00);



SET SQL_SAFE_UPDATES = 0;
/*
1- Eliminar el producto con el ID 3 de la tabla productos.
2- Eliminar todos los clientes que tengan una deuda mayor a 1000 en la tabla productos.
3- Eliminar todos los productos vendidos antes del 1 de enero de 2023 en la tabla productos.
4- Eliminar todas las ventas realizadas por el cliente con el id_cliente 101 de la tabla productos.
5- Eliminar todas las ventas del producto con id_producto 7 cuya fecha de venta sea anterior al 30 de octubre de 2023 en la tabla productos.
6- Eliminar todos los productos cuyo precio esté por debajo del precio promedio de todos los productos en la tabla productos. -este esta relacionado con el de subconsulta-
7- Eliminar todos los productos cuyo nombre tenga menos de 8 caracteres en la tabla productos.
8- Eliminar todos los productos en la tabla productos que sus ventas sean menor o igual a 3.
9- Eliminar los productos cuyas fechas de venta estén entre la fecha actual y el 1 de marzo de 2024.
10- Eliminar todos los productos cuyo nombre contiene una palabra específica.
*/

select * from productos;


DELETE FROM productos WHERE id_producto = 3;
DELETE FROM productos WHERE deuda_cliente > 1000;
DELETE FROM productos WHERE fecha_venta < '2023-01-01';
DELETE FROM productos WHERE id_cliente = 101;
DELETE FROM productos WHERE precio > (SELECT * FROM (SELECT AVG(precio) FROM productos) AS avg_precio); /*este elimina *//*---------------*//*SET @avg_precio = (SELECT AVG(precio) FROM productos); /* esta es una alternativa a la eliminacion con subconsulta ya que no se puede hacer un delete con subconsulta esto evita la referencia directa a la tabla en la subconsulta. *//*DELETE FROM productos WHERE precio > @avg_precio;*//*-----------------*/
DELETE FROM productos WHERE id_producto = 7 AND fecha_venta < '2023-09-30';/*/modificacion del ejercicio: para eliminar el id 8 tiene que coincidir la fecha que en este caso seria 2023-07-15 ya que la fecha es 2023-07-10/*/
DELETE FROM productos WHERE LENGTH(nombre) < 8; /*/ el original decia 6 y se cambio por 8 /*/
DELETE FROM productos WHERE cantidad <= 3;
DELETE FROM productos WHERE fecha_venta > SUBDATE(CURDATE(), INTERVAL 6 MONTH);
DELETE FROM productos WHERE fecha_venta < CURDATE() - INTERVAL 6 MONTH;
DELETE FROM productos 
WHERE nombre LIKE '%Laptop%';

drop database ChatGPT;


CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE,
    estado VARCHAR(20)
);

INSERT INTO empleados (nombre, departamento, salario, fecha_contratacion, estado)
VALUES
('Juan Pérez', 'Ventas', 3500.00, '2021-05-15', 'Activo'),
('Raúl Fernández', 'Marketing', 5000.00, '2018-05-18', 'Jubilado'),
('Ana Gómez', 'Marketing', 4500.00, '2019-03-10', 'Activo'),
('Carlos Ruiz', 'IT', 5500.00, '2020-11-01', 'Inactivo'),
('Pedro García', 'Ventas', 3500.00, '2020-05-25', 'Suspendido'),
('Laura Torres', 'Ventas', 3000.00, '2022-06-20', 'Activo'),
('Luis Fernández', 'IT', 6200.00, '2018-09-17', 'Inactivo'),
('Marta Sánchez', 'Marketing', 4000.00, '2021-07-30', 'Activo'),
('Carlos Pérez', 'Ventas', 3200.00, '2020-02-12', 'Activo'),
('Patricia Gómez', 'IT', 5700.00, '2023-01-05', 'Activo'),
('José López', 'Ventas', 3800.00, '2017-12-02', 'Inactivo'),
('Verónica Castro', 'Ventas', 3000.00, '2020-11-12', 'Contratista'),
('Raúl Díaz', 'Marketing', 4600.00, '2019-08-18', 'Inactivo'),
('Sara López', 'Marketing', 4200.00, '2022-03-10', 'Licencia'),
('Tomás Martínez', 'IT', 4800.00, '2021-09-01', 'Pendiente');

/*
1. Eliminar al empleado con el id_empleado 5 de la tabla empleados.
2. Eliminar todos los empleados del departamento de Ventas.
3. Eliminar todos los empleados que tengan un salario menor a 4600.
4. Eliminar todos los empleados cuyo estado sea activo.
5. Eliminar a todos los empleados que hayan sido contratados antes del 1 de enero de 2020.

*/

select * from empleados;

DELETE FROM empleados WHERE id_empleado = 5;
DELETE FROM empleados WHERE departamento = 'Ventas';
DELETE FROM empleados WHERE salario < 4600;
DELETE FROM empleados WHERE estado = 'Activo';
DELETE FROM empleados WHERE fecha_contratacion < '2021-01-31';


CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE,
    estado VARCHAR(20)
);

INSERT INTO empleados (nombre, departamento, salario, fecha_contratacion, estado)
VALUES
('Andrés Martín', 'Ventas', 3300.00, '2021-02-18', 'Activo'),
('Lucía Pérez', 'Marketing', 4600.00, '2019-10-05', 'Activo'),
('Fernando Gómez', 'IT', 6000.00, '2017-01-25', 'Inactivo'),
('Elena Rodríguez', 'Ventas', 4000.00, '2022-04-20', 'Activo'),
('José García', 'IT', 5800.00, '2020-07-12', 'Inactivo'),
('Daniela López', 'Marketing', 4500.00, '2021-08-13', 'Activo'),
('Raúl Morales', 'Ventas', 3500.00, '2020-11-30', 'Activo'),
('Ana Pérez', 'Marketing', 4200.00, '2022-02-15', 'Activo'),
('Carlos Díaz', 'Ventas', 5000.00, '2018-12-01', 'Inactivo'),
('Ricardo Sánchez', 'IT', 6500.00, '2021-06-10', 'Activo'),
('María Hernández', 'Ventas', 3700.00, '2019-03-12', 'Suspendido'),
('Carlos Rivera', 'Marketing', 4100.00, '2023-01-22', 'Licencia'),
('Marta Ruiz', 'IT', 5400.00, '2022-08-05', 'Pendiente'),
('José Martínez', 'Ventas', 3800.00, '2020-12-01', 'Activo'),
('Clara López', 'IT', 6000.00, '2021-10-10', 'Contratista'),
('Pedro Álvarez', 'Marketing', 4700.00, '2018-06-28', 'Activo'),
('Antonio Jiménez', 'Ventas', 3300.00, '2019-07-19', 'Inactivo'),
('Laura García', 'IT', 5900.00, '2022-11-22', 'Activo'),
('Sergio Fernández', 'Marketing', 4400.00, '2020-02-14', 'Activo'),
('Raquel Sánchez', 'Ventas', 3600.00, '2021-04-01', 'Jubilado'),
('Luis Pérez', 'Marketing', 4800.00, '2023-02-12', 'Activo'),
('Carolina Díaz', 'IT', 5500.00, '2021-05-18', 'Inactivo'),
('Alberto Ruiz', 'Ventas', 3500.00, '2020-09-10', 'Activo'),
('Beatriz Castro', 'Marketing', 4600.00, '2021-01-30', 'Inactivo'),
('Cristina Martínez', 'IT', 6200.00, '2018-10-11', 'Activo'),
('Carlos Sánchez', 'Ventas', 3400.00, '2021-07-19', 'Suspendido'),
('José Álvarez', 'IT', 6300.00, '2020-03-30', 'Licencia'),
('Isabel Fernández', 'Marketing', 4200.00, '2019-11-02', 'Pendiente'),
('Esteban Gómez', 'Ventas', 4100.00, '2022-12-05', 'Contratista'),
('Miguel López', 'Marketing', 4500.00, '2021-05-21', 'Activo'),
('Eva Torres', 'Ventas', 3300.00, '2022-09-15', 'Inactivo'),
('Sonia Ruiz', 'IT', 6000.00, '2023-03-05', 'Activo'),
('Ricardo Pérez', 'Ventas', 3800.00, '2020-04-18', 'Activo');


/*
6. Eliminar todos los empleados del departamento Marketing que tengan un salario mayor a 4500.
7. Eliminar a todos los empleados cuyo nombre comience con la letra "C".
8. Eliminar todos los empleados que tengan más de 5 años de antigüedad en la empresa.
9. Eliminar todos los empleados cuyo salario esté entre 3000 y 5000.
10. Eliminar todos los empleados del departamento IT cuyo estado sea Activo.
*/

select * from empleados;

DELETE FROM empleados WHERE departamento = 'Marketing' AND salario > 4500;
DELETE FROM empleados WHERE nombre LIKE 'C%';
DELETE FROM empleados WHERE fecha_contratacion < CURDATE() - INTERVAL 5 YEAR;
DELETE FROM empleados WHERE salario BETWEEN 3000 AND 4000;
DELETE FROM empleados WHERE departamento = 'IT' AND estado = 'Activo';

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100),
    edad INT,
    fecha_registro DATE,
    estado_cuenta VARCHAR(20)
);

INSERT INTO clientes (nombre, ciudad, edad, fecha_registro, estado_cuenta)
VALUES
('Juan Pérez', 'Madrid', 32, '2021-03-15', 'Activo'),
('Ana Gómez', 'Barcelona', 28, '2020-05-10', 'Inactivo'),
('Carlos Ruiz', 'Valencia', 45, '2019-11-01', 'Activo'),
('Laura Torres', 'Sevilla', 38, '2022-06-20', 'Activo'),
('Luis Fernández', 'Madrid', 52, '2018-07-12', 'Activo'),
('Marta Sánchez', 'Barcelona', 30, '2021-02-25', 'Inactivo'),
('Carlos Pérez', 'Valencia', 41, '2020-10-10', 'Suspendido'),
('Patricia Gómez', 'Sevilla', 29, '2023-01-15', 'Activo'),
('José López', 'Madrid', 60, '2017-08-10', 'Activo'),
('Raúl Díaz', 'Barcelona', 50, '2019-12-01', 'Inactivo'),
('Luis Martín', 'Madrid', 25, '2021-04-05', 'Activo'),
('Sofía Ortega', 'Valencia', 35, '2022-03-12', 'Inactivo'),
('Felipe García', 'Sevilla', 47, '2021-08-30', 'Activo'),
('Ricardo Pérez', 'Madrid', 55, '2020-07-22', 'Activo'),
('Raquel López', 'Barcelona', 31, '2021-11-01', 'Suspendido'),
('Antonio Martínez', 'Valencia', 60, '2020-12-10', 'Activo'),
('Beatriz Gómez', 'Sevilla', 40, '2019-02-18', 'Inactivo'),
('David Torres', 'Madrid', 27, '2023-05-25', 'Activo'),
('Cristina Hernández', 'Barcelona', 39, '2021-06-30', 'Activo'),
('Miguel Sánchez', 'Valencia', 29, '2021-01-15', 'Activo'),
('Lucía Pérez', 'Sevilla', 45, '2022-04-20', 'Inactivo'),
('Javier Ruiz', 'Madrid', 32, '2021-07-22', 'Activo'),
('Silvia Martín', 'Barcelona', 33, '2020-09-10', 'Suspendido'),
('Ricardo González', 'Valencia', 50, '2022-08-05', 'Activo'),
('Isabel López', 'Sevilla', 29, '2023-02-12', 'Activo'),
('Francisco García', 'Madrid', 41, '2021-10-10', 'Inactivo'),
('Pedro Sánchez', 'Valencia', 35, '2022-01-01', 'Activo'),
('Andrea Torres', 'Sevilla', 28, '2020-11-01', 'Suspendido'),
('Luis González', 'Madrid', 50, '2019-04-01', 'Activo'),
('Laura Hernández', 'Barcelona', 38, '2021-09-14', 'Activo');

/*
1-Eliminar al cliente con ID 30 de la tabla clientes.
2-Eliminar todos los clientes cuyo estado de cuenta sea "Inactivo".
3-Eliminar todos los clientes que tengan una edad superior a 50 años.
4-Eliminar todos los clientes registrados antes de 2021.
5-Eliminar todos los clientes de la ciudad 'Madrid' que estén "Activo".
6-Eliminar todos los clientes cuyo nombre empiece con 'M'.
7-Eliminar todos los clientes cuya edad esté entre 30 y 40 años.
8-Eliminar todos los clientes cuyo nombre contenga la palabra 'Garcia'.
9-Eliminar todos los clientes que sean de la ciudad 'Valencia'.
10-Eliminar todos los clientes cuyo estado este "Activo".
*/

select * FROM clientes;

DELETE FROM clientes WHERE id_cliente = 30;
DELETE FROM clientes WHERE estado_cuenta = 'Inactivo';
DELETE FROM clientes WHERE edad > 50;
DELETE FROM clientes WHERE fecha_registro < '2021-01-01';
DELETE FROM clientes WHERE ciudad = 'Madrid' AND estado_cuenta = 'Activo';
DELETE FROM clientes WHERE nombre LIKE 'M%';
DELETE FROM clientes WHERE edad BETWEEN 30 AND 40;
DELETE FROM clientes WHERE nombre LIKE '%Garcia%';
DELETE FROM clientes WHERE ciudad = 'Valencia';
DELETE FROM clientes WHERE estado_cuenta = 'Activo';

create database lolo;
use lolo;

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    categoria VARCHAR(50),
    fecha_modificacion DATE
);

INSERT INTO Clientes (id, nombre, correo, categoria, fecha_modificacion)
VALUES
(1, 'Ana Gomez', 'ana@gmail1.com', 'Regular', '2024-08-01'),
(2, 'Luis Lopez', 'luis@hotmail.net', 'Premium', '2024-08-01'),
(3, 'Marta Diaz', 'marta@yahoo.com', 'Regular', '2024-08-01'),
(4, 'Carlos Perez', 'carlos@gmail1.net', 'Regular', '2024-08-01'),
(5, 'Laura Sanchez', 'laura@ho.com', 'Regular', '2024-08-10'),
(6, 'Martina Lorenciano', 'martina@ho.com', 'Regular', '2024-08-11'),
(7, 'Tamara Martinez', 'tamara@ho.net', 'Regular', '2024-08-31');

select * from Clientes;


UPDATE Clientes
SET categoria = 'Nuevo'
WHERE correo LIKE '%@__%.com';
