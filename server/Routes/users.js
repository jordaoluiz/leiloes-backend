const express = require('express');
const usuariosController = require('../controllers/userController')
const app = express();

app.post('/', usuariosController.insert)
module.exports = app