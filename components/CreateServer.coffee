noflo = require 'noflo'
coap = require 'coap'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Create CoAP server'

  # Add input ports
  c.inPorts.add 'port',
    datatype: 'number'
    default: 5683
  c.inPorts.add 'address',
    datatype: 'string'
    default: 'localhost'
  c.inPorts.add 'type',
    datatype: 'string'
    values: ['udp4', 'udp6']
    default: 'udp4'
  c.inPorts.add 'proxy',
    datatype: 'boolean'
  # Add output ports
  c.outPorts.add 'out',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: ['port', 'address']
    params: [
      'type'
      'proxy'
    ]
    out: 'out'
    forwardGroups: true
  , (data, groups, out) ->
    # Create Server
    options =
      type: c.params.type
      proxy: c.params.proxy

    server = coap.createServer options

    server.listen data.port, data.address, ->
      out.send server

  # Finally return the component instance
  c
