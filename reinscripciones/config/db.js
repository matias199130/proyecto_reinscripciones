// config/db.js
const mysql = require('mysql2');

const pool = mysql.createPool({
  host: '127.0.0.1',      // Cambia a tu host
  user: 'root',           // Cambia por tu usuario de MySQL
  password: '1234',           // Cambia por tu contraseña
  database: 'Proyecto_Reinscripciones', // Nombre de tu base de datos
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool.promise();
