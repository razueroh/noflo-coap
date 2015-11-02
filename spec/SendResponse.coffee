noflo = require 'noflo'
chai = require 'chai' unless chai
SendResponse = require '../components/SendResponse.coffee'

describe 'SendResponse component', ->
  c = null
  message = null
  observe = null
  response = null
  start = null

  beforeEach ->
    c = SendResponse.getComponent()
    message = noflo.internalSocket.createSocket()
    observe = noflo.internalSocket.createSocket()
    response = noflo.internalSocket.createSocket()
    start = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()

    c.inPorts.message.attach message
    c.inPorts.observe.attach observe
    c.inPorts.response.attach response
    c.inPorts.start.attach start
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have a "message" inport', ->
      chai.expect(c.inPorts.message).to.be.an 'object'
    it 'should have a "observe" outport', ->
      chai.expect(c.inPorts.observe).to.be.an 'object'
    it 'should have a "response" inport', ->
      chai.expect(c.inPorts.response).to.be.an 'object'
    it 'should have a "start" inport', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have a "out" outport', ->
      chai.expect(c.outPorts.out).to.be.an 'object'
