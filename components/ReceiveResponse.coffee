noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'On request event'

  # Add input ports
  c.inPorts.add 'request',
    datatype: 'object'

  # Add output ports
  c.outPorts.add 'response',
    datatype: 'string'
  c.outPorts.add 'message',
    datatype: 'string'

  noflo.helpers.WirePattern c,
    in: 'request'
    out: ['response', 'message']
    forwardGroups: true
  , (data, groups, out) ->
    data.on 'response', (res) ->
      out.response.send res
      out.message.send res.read().toString()
  # Finally return the component instance
  c
