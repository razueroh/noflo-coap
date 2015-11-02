noflo = require 'noflo'
chai = require 'chai' unless chai
CreateServer = require '../components/CreateServer.coffee'

describe 'CreateServer component', ->
  c = null
  port = null
  address = null
  type = null
  proxy = null

  beforeEach ->
    c = CreateServer.getComponent()
    port = noflo.internalSocket.createSocket()
    address = noflo.internalSocket.createSocket()
    type = noflo.internalSocket.createSocket()
    proxy = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()

    c.inPorts.port.attach port
    c.inPorts.address.attach address
    c.inPorts.type.attach type
    c.inPorts.proxy.attach proxy
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have a "port" inport', ->
      chai.expect(c.inPorts.port).to.be.an 'object'
    it 'should have a "address" inport', ->
      chai.expect(c.inPorts.address).to.be.an 'object'
    it 'should have a "type" inport', ->
      chai.expect(c.inPorts.type).to.be.an 'object'
    it 'should have a "proxy" inport', ->
      chai.expect(c.inPorts.proxy).to.be.an 'object'
    it 'should have a "out" outport', ->
      chai.expect(c.outPorts.out).to.be.an 'object'
