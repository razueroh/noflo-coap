noflo = require 'noflo'
coap = require 'coap'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send request'

  url = null
  req = null
  # Add input ports
  c.inPorts.add 'url',
    datatype: 'all'
    require: yes
  c.inPorts.add 'start',
    datatype: 'bang'
    require: yes

  # Add output ports
  c.outPorts.add 'request',
    datatype: 'object'

  c.inPorts.url.on 'data', (payload) ->
    url = payload
  c.inPorts.start.on 'data', ->
    req = coap.request url
    req.end ->
      c.outPorts.request.send req

  # Finally return the component instance
  c
