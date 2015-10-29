noflo = require 'noflo'
coap = require 'coap'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send response'

  # Add input ports
  c.inPorts.add 'hostname',
    datatype: 'string'
    require: yes
    default: 'localhost'
  c.inPorts.add 'port',
    datatype: 'number'
    require: yes
    default: 5683
  c.inPorts.add 'method',
    datatype: 'string'
    require: yes
    values: ['GET', 'POST', 'PUT', 'DELETE']
    default: 'GET'
  c.inPorts.add 'confirmable',
    datatype: 'boolean'
    require: yes
    default: true
  c.inPorts.add 'observe',
    datatype: 'boolean'
    require: yes
    default: false
  c.inPorts.add 'pathname',
    datatype: 'string'
    require: yes
    default: '/'
  c.inPorts.add 'query',
    datatype: 'string'
    require: yes
    default: ''
  c.inPorts.add 'options',
    datatype: 'object'
  c.inPorts.add 'blockwise',
    datatype: 'boolean'
    default: false
  c.inPorts.add 'agent',
    datatype: 'string'
    require: yes
    values: ['undefined', 'udp4', 'udp6', 'false']
    default: 'undefined'
  c.inPorts.add 'proxy_uri',
    datatype: 'string'
  c.inPorts.add 'start',
    datatype: 'bang'
    require: yes

  # Add output ports
  c.outPorts.add 'request',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: ['hostname', 'port']
    params: [
      'method'
      'confirmable'
      'observe'
      'pathname'
      'query'
      'options'
      'agent'
      'proxy_uri'
      'blockwise'
    ]
    out: 'request'
    forwardGroups: true
    ordered: true
  , (data, groups, out) ->
    req =
      hostname: data.hostname
      port: data.port
      method: c.params.method
      confirmable: c.params.confirmable
      observe: c.params.observe
      pathname: c.params.pathname
      query: c.params.query
      options: c.params.options
      agent: c.params.agent
      proxyUri: c.params.proxy_uri

    blockwise = c.params.blockwise

    console.log(req, blockwise)

    request = coap.request('coap://localhost/Matteo')

    request.end ->
      out.send request

  # Finally return the component instance
  c
