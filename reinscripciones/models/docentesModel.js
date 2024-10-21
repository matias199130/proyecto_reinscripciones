const pool = require('../config/db');

// Obtener todos los docentes
const getDocentes = () => {
  return pool.query('SELECT * FROM docentes');
};

// Crear un nuevo docente
const createDocente = (nombre, apellido, email, telefono, cargo, area_id) => {
  return pool.query(
    'INSERT INTO docentes (nombre, apellido, email, telefono, cargo, area_id) VALUES (?, ?, ?, ?, ?, ?)',
    [nombre, apellido, email, telefono, cargo, area_id]
  );
};

// Actualizar un docente
const updateDocente = (id, nombre, apellido, email, telefono, cargo, area_id) => {
  return pool.query(
    'UPDATE docentes SET nombre = ?, apellido = ?, email = ?, telefono = ?, cargo = ?, area_id = ? WHERE id = ?',
    [nombre, apellido, email, telefono, cargo, area_id, id]
  );
};

// Eliminar un docente
const deleteDocente = (id) => {
  return pool.query('DELETE FROM docentes WHERE id = ?', [id]);
};

module.exports = {
  getDocentes,
  createDocente,
  updateDocente,
  deleteDocente
};
