// controllers/inscripcionesController.js
const { getInscripciones, createInscripcion, updateInscripcion, deleteInscripcion: deleteInscripcionFromDB } = require('../models/inscripcionesModel');

const getAllInscripciones = async (req, res) => {
  try {
    const [inscripciones] = await getInscripciones();
    res.json(inscripciones);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener las inscripciones', error });
  }
};

const postInscripcion = async (req, res) => {
  const { alumno_id, area_id, ciclo_academico } = req.body;
  try {
    const [result] = await createInscripcion(alumno_id, area_id, ciclo_academico);
    res.status(201).json({ message: 'Reinscripción registrada', id: result.insertId });
  } catch (error) {
    res.status(500).json({ message: 'Error al registrar la reinscripción', error });
  }
};

const putInscripcion = async (req, res) => {
  const { id } = req.params;
  const { alumno_id, area_id, ciclo_academico } = req.body;
  try {
    await updateInscripcion(id, alumno_id, area_id, ciclo_academico);
    res.json({ message: 'Reinscripción actualizada' });
  } catch (error) {
    res.status(500).json({ message: 'Error al actualizar la reinscripción', error });
  }
};

const deleteInscripcion = async (req, res) => {
  const { id } = req.params;
  try {
    await deleteInscripcion(id);
    res.json({ message: 'Reinscripción eliminada' });
  } catch (error) {
    res.status(500).json({ message: 'Error al eliminar la reinscripción', error });
  }
};

module.exports = {
  getAllInscripciones,
  postInscripcion,
  putInscripcion,
  deleteInscripcion
};
