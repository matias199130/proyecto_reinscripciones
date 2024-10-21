const pool = require('../config/db');

// Obtener todos los alumnos
const getAlumnos = () => {
  return pool.query('SELECT * FROM alumnos');
};

// Crear un nuevo alumno
const createAlumno = (nombre, apellido, email, telefono) => {
  return pool.query(
    'INSERT INTO alumnos (nombre, apellido, email, telefono) VALUES (?, ?, ?, ?)',
    [nombre, apellido, email, telefono]
  );
};

// Actualizar un alumno
const updateAlumno = async (id, nombre, apellido, email, telefono) => {
  const result = await pool.query(
    'UPDATE alumnos SET nombre = ?, apellido = ?, email = ?, telefono = ? WHERE id = ?',
    [nombre, apellido, email, telefono, id, ]);
  console.log('Resultado de la consulta:', result);
};

// Eliminar un alumno
const deleteAlumno = async (id) => {
  const connection = await pool.getConnection();
  try {
    await connection.beginTransaction();
    // Establecer el alumno_id a NULL en la tabla 'reinscripciones'
    await connection.query('UPDATE reinscripciones SET alumno_id = NULL WHERE alumno_id = ?', [id]);
    // Eliminar el alumno
    await connection.query('DELETE FROM alumnos WHERE id = ?', [id]);
    await connection.commit();
    return { message: 'Alumno eliminado y registros actualizados con éxito' };
  } catch (error) {
    await connection.rollback();
    throw error;
  } finally {
    connection.release();
  }
};


module.exports = {
  getAlumnos,
  createAlumno,
  updateAlumno,
  deleteAlumno
};
