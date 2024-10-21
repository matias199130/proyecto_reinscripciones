// routes/docentesRoutes.js
const express = require('express');
const { getAllDocentes, postDocente, putDocente, deleteDocente } = require('../controllers/docentesController');
const router = express.Router();

router.get('/', getAllDocentes);
router.post('/', postDocente);
router.put('/:id', putDocente);
router.delete('/:id', deleteDocente);

module.exports = router;
