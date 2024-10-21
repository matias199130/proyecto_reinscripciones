// routes/areasRoutes.js
const express = require('express');
const { getAllAreas, postArea, putArea, deleteArea } = require('../controllers/areasController');
const router = express.Router();

router.get('/', getAllAreas);
router.post('/', postArea);
router.put('/:id', putArea);
router.delete('/:id', deleteArea);

module.exports = router;
