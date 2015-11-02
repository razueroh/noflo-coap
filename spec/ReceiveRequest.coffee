noflo = require 'noflo'
chai = require 'chai' unless chai
ReceiveRequest = require '../components/ReceiveRequest.coffee'

describe 'ReceiveRequest component', ->
  c = null
  server = null

  beforeEach ->
    c = ReceiveRequest.getComponent()
    server = noflo.internalSocket.createSocket()
    observe = noflo.internalSocket.createSocket()
    response = noflo.internalSocket.createSocket()
    request = noflo.internalSocket.createSocket()

    c.inPorts.server.attach server
    c.outPorts.observe.attach observe
    c.outPorts.response.attach response
    c.outPorts.request.attach request

  describe 'when instantiated', ->
    it 'should have a "server" inport', ->
      chai.expect(c.inPorts.server).to.be.an 'object'
    it 'should have a "observe" outport', ->
      chai.expect(c.outPorts.observe).to.be.an 'object'
    it 'should have a "response" outport', ->
      chai.expect(c.outPorts.response).to.be.an 'object'
    it 'should have a "request" outport', ->
      chai.expect(c.outPorts.request).to.be.an 'object'
