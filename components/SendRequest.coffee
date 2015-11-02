noflo = require 'noflo'
coap = require 'coap'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send request'

  # Add input ports
  c.inPorts.add 'url',
    datatype: 'object'
    require: yes

  # Add output ports
  c.outPorts.add 'request',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: 'url'
    out: 'request'
    forwardGroups: true
  , (data, groups, out) ->

    req = coap.request data

    req.end ->
      out.send req

  # Finally return the component instance
  c
