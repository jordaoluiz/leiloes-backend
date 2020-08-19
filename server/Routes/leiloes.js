const express = require('express');
const app = express();
const leiloesController = require('../controllers/leiloesController')


app.get('/',leiloesController.getAll)
app.post('/insert',leiloesController.insert)
app.post('/darlance',leiloesController.darLance)
app.get('/lances',leiloesController.getAllLances)
module.exports = app