// app.js
const express = require('express');
const app = express();
const alumnosRoutes = require('./routes/alumnosRoutes');
const areasRoutes = require('./routes/areasRoutes');
const docentesRoutes = require('./routes/docentesRoutes');
const inscripcionesRoutes = require('./routes/inscripcionesRoutes'); // Añadir esta línea

app.use(express.json());

app.use('/alumnos', alumnosRoutes);
app.use('/areas', areasRoutes);
app.use('/docentes', docentesRoutes);
app.use('/inscripciones', inscripcionesRoutes); // Añadir esta línea



app.listen(3000, () => {
  console.log('Servidor en puerto 3000');
});
