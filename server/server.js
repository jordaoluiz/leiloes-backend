const http = require('http');
const aplication = require('./app')
const server = http.createServer(aplication);
const port = 3000;

server.listen(port);