noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send response'

  # Add input ports
  c.inPorts.add 'url',
    datatype: 'object'
    require: yes
  c.inPorts.add 'coap',
    datatype: 'object'
    require: yes

  # Add output ports
  c.outPorts.add 'request',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: 'coap'
    params: 'url'
    out: 'request'
    forwardGroups: true
  , (data, groups, out) ->

    req = data.request c.params.url

    req.end ->
      out.send req

  # Finally return the component instance
  c
