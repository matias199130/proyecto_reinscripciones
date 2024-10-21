// controllers/areasController.js
const { getAreas, createArea, updateArea, deleteArea: deleteAreaFromDB  } = require('../models/areasModel');

const getAllAreas = async (req, res) => {
  try {
    const [areas] = await getAreas();
    res.json(areas);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener las áreas', error });
  }
};

const postArea = async (req, res) => {
  const { nombre, descripcion } = req.body;
  try {
    const [result] = await createArea(nombre, descripcion);
    res.status(201).json({ message: 'Área registrada', id: result.insertId });
  } catch (error) {
    res.status(500).json({ message: 'Error al registrar el área', error });
  }
};

const putArea = async (req, res) => {
  const { id } = req.params;
  const { nombre, descripcion } = req.body;
  try {
    await updateArea(id, nombre, descripcion);
    res.json({ message: 'Área actualizada' });
  } catch (error) {
    res.status(500).json({ message: 'Error al actualizar el área', error });
  }
};

const deleteArea = async (req, res) => {
  const { id } = req.params;
  try {
    await deleteAreaFromDB(id);
    res.json({ message: 'Área eliminada' });
  } catch (error) {
    res.status(500).json({ message: 'Error al eliminar el área', error });
  }
};

module.exports = {
  getAllAreas,
  postArea,
  putArea,
  deleteArea
};
