create database Proyecto_Reinscripciones;

use Proyecto_Reinscripciones;

CREATE TABLE alumnos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  telefono VARCHAR(255),
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO alumnos (nombre, apellido, email, telefono) 
VALUES ('Juan', 'Pérez', 'juan.perez@mail.com', '1234567890');


CREATE TABLE areas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_area VARCHAR(255)
);

INSERT INTO areas (nombre_area) 
VALUES ('Electrónica'), ('Mecatrónica'), ('Sistemas Informáticos');

CREATE TABLE reinscripciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  alumno_id INT,
  area_id INT,
  fecha_reinscripcion DATETIME DEFAULT CURRENT_TIMESTAMP,
  ciclo_academico VARCHAR(255),  -- Para identificar el ciclo o año
  FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
  FOREIGN KEY (area_id) REFERENCES areas(id)
);

INSERT INTO reinscripciones (alumno_id, area_id, ciclo_academico) 
VALUES (1, 2, '2024');

CREATE TABLE docentes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  telefono VARCHAR(15),
  cargo VARCHAR(50), -- Puede ser 'Docente', 'Jefe de Área', 'Preceptor', 'Director', etc.
  area_id INT, -- Para asociar a qué área pertenece el docente
  FOREIGN KEY (area_id) REFERENCES areas(id) -- Relación con la tabla 'areas'
);

INSERT INTO docentes (nombre, apellido, email, telefono, cargo, area_id) 
VALUES ('Juan', 'Gómez', 'juan.gomez@mail.com', '1234567890', 'Docente', 1);


SELECT * FROM alumnos;
SELECT * FROM areas;
SELECT * FROM docentes;
SELECT * FROM reinscripciones;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


