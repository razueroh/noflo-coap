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
    default: 'localhost'
    require: yes
  c.inPorts.add 'port',
    datatype: 'number'
    default: 5683
    require: yes
  c.inPorts.add 'method',
    datatype: 'string'
    values: ['GET', 'POST', 'PUT', 'DELETE']
    default: 'GET'
    require: yes
  c.inPorts.add 'confirmable',
    datatype: 'boolean'
    default: true
    require: yes
  c.inPorts.add 'observe',
    datatype: 'boolean'
    default: false
    require: yes
  c.inPorts.add 'pathname',
    datatype: 'string'
    default: '/'
    require: yes
  c.inPorts.add 'query',
    datatype: 'string'
    default: ''
    require: yes
  # Add output ports
  c.outPorts.add 'url',
    datatype: 'object'
  c.outPorts.add 'coap',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: [
      'hostname'
      'port'
      'method'
      'confirmable'
      'observe'
      'pathname'
      'query'
    ]
    out: ['url', 'coap']
    forwardGroups: true
  , (data, groups, out) ->
    req =
      hostname: data.hostname
      port: data.port
      method: data.method
      confirmable: data.confirmable
      observe: data.observe
      pathname: data.pathname
      query: data.query

    out.url.send req
    out.coap.send coap

  # Finally return the component instance
  c
