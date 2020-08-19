const express = require('express');
const lieloes = require('./Routes/leiloes')
const usuarios = require('./Routes/users')
const cors = require('cors')
const app = express();
const bodyParser = require('body-parser')

app.use(bodyParser.json());
app.use(cors());

app.use(bodyParser.urlencoded({ extended: true }))

app.use('/leiloes', lieloes )
app.use('/usuarios', usuarios)
module.exports = app;
