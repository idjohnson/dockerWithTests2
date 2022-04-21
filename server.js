const ronin = require('ronin-server')
const mocks = require('ronin-mocks')

const server = ronin.server()
const port = 1234

server.use('/', mocks.server(server.Router(), false, true))
server.start()
