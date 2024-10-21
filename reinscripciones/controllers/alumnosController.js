// controllers/alumnosController.js
const { getAlumnos, createAlumno, updateAlumno, deleteAlumno: deleteAlumnoFromDB } = require('../models/alumnosModel');
const getAllAlumnos = async (req, res) => {
  try {
    const [alumnos] = await getAlumnos();
    res.json(alumnos);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener los alumnos', error });
  }
};

const postAlumno = async (req, res) => {
  const { nombre, apellido, email, telefono } = req.body;
  console.log("datos recibidos:", req.body);
  try {
    const [result] = await createAlumno(nombre, apellido, email, telefono);
    res.status(201).json({ message: 'Alumno registrado', id: result.insertId });
  } catch (error) {
    res.status(500).json({ message: 'Error al registrar el alumno', error });
  }
};

const putAlumno = async (req, res) => {
  const { id } = req.params;
  const { nombre, apellido, email, telefono } = req.body;
  try {
    await updateAlumno(id, nombre, apellido, email, telefono);
    res.json({ message: 'Alumno actualizado' });
  } catch (error) {
    res.status(500).json({ message: 'Error al actualizar el alumno', error });
  }
};

const deleteAlumno = async (req, res) => {
  const { id } = req.params;
  try {
    await deleteAlumnoFromDB(id);  // Llamamos a la función correcta del modelo
    res.json({ message: 'Alumno eliminado' });
  } catch (error) {
    res.status(500).json({ message: 'Error al eliminar el alumno', error });
  }
};

module.exports = {
  getAllAlumnos,
  postAlumno,
  putAlumno,
  deleteAlumno
};
