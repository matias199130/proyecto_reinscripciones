// models/inscripcionesModel.js
const pool = require('../config/db');

// Obtener todas las inscripciones
const getInscripciones = () => {
  return pool.query('SELECT * FROM reinscripciones');
};

// Crear una nueva reinscripción
const createInscripcion = (alumno_id, area_id, ciclo_academico) => {
  return pool.query(
    'INSERT INTO reinscripciones (alumno_id, area_id, ciclo_academico) VALUES (?, ?, ?)',
    [alumno_id, area_id, ciclo_academico]
  );
};

// Actualizar una reinscripción
const updateInscripcion = (id, alumno_id, area_id, ciclo_academico) => {
  return pool.query(
    'UPDATE reinscripciones SET alumno_id = ?, area_id = ?, ciclo_academico = ? WHERE id = ?',
    [alumno_id, area_id, ciclo_academico, id]
  );
};

// Eliminar una reinscripción
const deleteInscripcion = (id) => {
  return pool.query('DELETE FROM reinscripciones WHERE id = ?', [id]);
};

module.exports = {
  getInscripciones,
  createInscripcion,
  updateInscripcion,
  deleteInscripcion
};
