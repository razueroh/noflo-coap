noflo = require 'noflo'
chai = require 'chai' unless chai
ConfigRequest = require '../components/ConfigRequest.coffee'

describe 'ConfigRequest component', ->
  c = null
  hostname = null
  port = null
  method = null
  confirmable = null
  observe = null
  pathname = null
  query = null

  beforeEach ->
    c = ConfigRequest.getComponent()
    hostname = noflo.internalSocket.createSocket()
    port = noflo.internalSocket.createSocket()
    method = noflo.internalSocket.createSocket()
    confirmable = noflo.internalSocket.createSocket()
    observe = noflo.internalSocket.createSocket()
    pathname = noflo.internalSocket.createSocket()
    query = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()

    c.inPorts.hostname.attach hostname
    c.inPorts.port.attach port
    c.inPorts.method.attach method
    c.inPorts.confirmable.attach confirmable
    c.inPorts.observe.attach observe
    c.inPorts.pathname.attach pathname
    c.inPorts.query.attach query
    c.outPorts.url.attach out

  describe 'when instantiated', ->
    it 'should have a "hostname" inport', ->
      chai.expect(c.inPorts.hostname).to.be.an 'object'
    it 'should have a "port" inport', ->
      chai.expect(c.inPorts.port).to.be.an 'object'
    it 'should have a "method" inport', ->
      chai.expect(c.inPorts.method).to.be.an 'object'
    it 'should have a "confirmable" inport', ->
      chai.expect(c.inPorts.confirmable).to.be.an 'object'
    it 'should have a "observe" inport', ->
      chai.expect(c.inPorts.observe).to.be.an 'object'
    it 'should have a "pathname" inport', ->
      chai.expect(c.inPorts.pathname).to.be.an 'object'
    it 'should have a "query" inport', ->
      chai.expect(c.inPorts.query).to.be.an 'object'
    it 'should have a "url" outport', ->
      chai.expect(c.outPorts.url).to.be.an 'object'
