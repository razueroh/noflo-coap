noflo = require 'noflo'
chai = require 'chai' unless chai
SendRequest = require '../components/SendRequest.coffee'

describe 'SendRequest component', ->
  c = null
  url = null
  start = null

  beforeEach ->
    c = SendRequest.getComponent()
    url = noflo.internalSocket.createSocket()
    start = noflo.internalSocket.createSocket()
    request = noflo.internalSocket.createSocket()

    c.inPorts.url.attach url
    c.inPorts.start.attach start
    c.outPorts.request.attach request

  describe 'when instantiated', ->
    it 'should have a "url" inport', ->
      chai.expect(c.inPorts.url).to.be.an 'object'
    it 'should have a "start" outport', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have a "request" outport', ->
      chai.expect(c.outPorts.request).to.be.an 'object'