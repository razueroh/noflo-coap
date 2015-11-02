noflo = require 'noflo'
chai = require 'chai' unless chai
ReceiveResponse = require '../components/ReceiveResponse.coffee'

describe 'ReceiveResponse component', ->
  c = null
  request = null

  beforeEach ->
    c = ReceiveResponse.getComponent()
    request = noflo.internalSocket.createSocket()
    response = noflo.internalSocket.createSocket()
    message = noflo.internalSocket.createSocket()

    c.inPorts.request.attach request
    c.outPorts.response.attach response
    c.outPorts.message.attach message

  describe 'when instantiated', ->
    it 'should have a "request" inport', ->
      chai.expect(c.inPorts.request).to.be.an 'object'
    it 'should have a "response" outport', ->
      chai.expect(c.outPorts.response).to.be.an 'object'
    it 'should have a "message" outport', ->
      chai.expect(c.outPorts.message).to.be.an 'object'
