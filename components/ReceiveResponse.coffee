noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'On request event'

  # Add input ports
  c.inPorts.add 'request',
    datatype: 'object'
    require: yes

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
      res.on 'data', ->
        out.message.send res.payload.toString()
        out.response.send res


  # Finally return the component instance
  c
