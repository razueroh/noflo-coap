noflo = require 'noflo'
chai = require 'chai' unless chai
ConfigRequest = require '../components/ConfigRequest.coffee'

describe 'ConfigRequest component', ->
  c = null
  href = null
  method = null
  confirmable = null
  observe = null

  beforeEach ->
    c = ConfigRequest.getComponent()
    href = noflo.internalSocket.createSocket()
    method = noflo.internalSocket.createSocket()
    confirmable = noflo.internalSocket.createSocket()
    observe = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()

    c.inPorts.href.attach href
    c.inPorts.method.attach method
    c.inPorts.confirmable.attach confirmable
    c.inPorts.observe.attach observe
    c.outPorts.url.attach out

  describe 'when instantiated', ->
    it 'should have a "href" inport', ->
      chai.expect(c.inPorts.href).to.be.an 'object'
    it 'should have a "method" inport', ->
      chai.expect(c.inPorts.method).to.be.an 'object'
    it 'should have a "confirmable" inport', ->
      chai.expect(c.inPorts.confirmable).to.be.an 'object'
    it 'should have a "observe" inport', ->
      chai.expect(c.inPorts.observe).to.be.an 'object'
    it 'should have a "url" outport', ->
      chai.expect(c.outPorts.url).to.be.an 'object'
