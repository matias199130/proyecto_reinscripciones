// routes/inscripcionesRoutes.js
const express = require('express');
const { getAllInscripciones, postInscripcion, putInscripcion, deleteInscripcion } = require('../controllers/inscripcionesController');
const router = express.Router();

router.get('/', getAllInscripciones);
router.post('/', postInscripcion);
router.put('/:id', putInscripcion);
router.delete('/:id', deleteInscripcion);

module.exports = router;
