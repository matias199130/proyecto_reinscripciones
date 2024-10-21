-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS comisionDB;

-- Usar la base de datos creada
USE comisionDB;

-- Eliminar la tabla proyectos si ya existe para evitar conflictos
DROP TABLE IF EXISTS usuarios;

-- Crear la tabla categorias
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(255) NOT NULL
);

-- Insertar las categorías existentes en la nueva tabla
INSERT INTO categorias (nombre_categoria) VALUES 
('Salud y Medio Ambiente'), 
('Obras Públicas, Servicios e Infraestructura'), 
('Seguridad y Legislación'), 
('Obras, Servicios, Transportes'), 
('Presupuesto y Hacienda'), 
('RR.HH., Minoridad y Familia');

-- Crear la tabla proyectos con una clave foránea apuntando a categorias
CREATE TABLE IF NOT EXISTS proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(255) NOT NULL,
    fecha_ingresada DATE NOT NULL,
    proyeccion ENUM('HCD','CAMPAÑA 2025','CAMPAÑA 2027') NOT NULL,
    estado ENUM('Pendiente', 'En Proceso', 'Completado') NOT NULL,
    archivo_documento VARCHAR(255) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Insertar algunos proyectos de ejemplo vinculados a las categorías
INSERT INTO proyectos (nombre_proyecto, fecha_ingresada, proyeccion, estado, archivo_documento, categoria_id)
VALUES 
('Proyecto X', '2024-08-06', 'HCD', 'Pendiente', 'documento.pdf', 1),
('Proyecto Y', '2024-08-06', 'CAMPAÑA 2027', 'Pendiente', 'documento.pdf', 5),
('ALSKDNA', '2024-08-06', 'HCD', 'Pendiente', 'asdlajsna.pdf', 1);

-- Crear la tabla usuarios si no existe
CREATE TABLE IF NOT EXISTS usuarios (
  id SERIAL PRIMARY KEY,
  documento INT NOT NULL,
  rol TEXT NOT NULL
);

-- Insertar usuarios de ejemplo
INSERT INTO usuarios (documento, rol) VALUES 
('36493747', 'admin'), 
('15669633', 'user');

select * from usuarios;
select * from categorias;
select * from proyectos;


SELECT * FROM proyectos WHERE categoria = 'Salud y Medio Ambiente';
SELECT id FROM categorias WHERE nombre_categoria = 'salud y medio ambiente';
SELECT * FROM proyectos WHERE categoria_id = 1;

