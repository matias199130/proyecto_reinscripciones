// routes/alumnosRoutes.js
const express = require('express');
const { getAllAlumnos, postAlumno, putAlumno, deleteAlumno } = require('../controllers/alumnosController');
const router = express.Router();

router.get('/', getAllAlumnos);
router.post('/', postAlumno);
router.put('/:id', putAlumno);
router.delete('/:id', deleteAlumno);

module.exports = router;
