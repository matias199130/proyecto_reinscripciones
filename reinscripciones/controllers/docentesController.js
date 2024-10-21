// controllers/docentesController.js
const { getDocentes, createDocente, updateDocente, deleteDocente: deleteDocenteFromDB  } = require('../models/docentesModel');

const getAllDocentes = async (req, res) => {
  try {
    const [docentes] = await getDocentes();
    res.json(docentes);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener los docentes', error });
  }
};

const postDocente = async (req, res) => {
  const { nombre, apellido, area_id, puesto } = req.body;
  try {
    const [result] = await createDocente(nombre, apellido, area_id, puesto);
    res.status(201).json({ message: 'Docente registrado', id: result.insertId });
  } catch (error) {
    res.status(500).json({ message: 'Error al registrar el docente', error });
  }
};

const putDocente = async (req, res) => {
  const { id } = req.params;
  const { nombre, apellido, area_id, puesto } = req.body;
  try {
    await updateDocente(id, nombre, apellido, area_id, puesto);
    res.json({ message: 'Docente actualizado' });
  } catch (error) {
    res.status(500).json({ message: 'Error al actualizar el docente', error });
  }
};

const deleteDocente = async (req, res) => {
  const { id } = req.params;
  try {
    await deleteDocenteFromDB(id);
    res.json({ message: 'Docente eliminado' });
  } catch (error) {
    res.status(500).json({ message: 'Error al eliminar el docente', error });
  }
};

module.exports = {
  getAllDocentes,
  postDocente,
  putDocente,
  deleteDocente
};
