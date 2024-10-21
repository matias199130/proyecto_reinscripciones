const pool = require('../config/db');

// Obtener todas las áreas
const getAreas = () => {
  return pool.query('SELECT * FROM areas');
};

// Crear una nueva área
const createArea = (nombre_area) => {
  return pool.query(
    'INSERT INTO areas (nombre_area) VALUES (?)',
    [nombre_area]
  );
};

// Actualizar un área
const updateArea = (id, nombre_area) => {
  return pool.query(
    'UPDATE areas SET nombre_area = ? WHERE id = ?',
    [nombre_area, id]
  );
};

// Eliminar un área
const deleteArea = (id) => {
  return pool.query('DELETE FROM areas WHERE id = ?', [id]);
};

module.exports = {
  getAreas,
  createArea,
  updateArea,
  deleteArea
};
