noflo = require 'noflo'
coap = require 'coap'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send request'

  options = null
  req = null
  data = ''
  # Add input ports
  c.inPorts.add 'url',
    datatype: 'all'
    require: yes
  c.inPorts.add 'data',
    datatype: 'string'
    require: no
  c.inPorts.add 'start',
    datatype: 'bang'
    require: yes
  # Add output ports
  c.outPorts.add 'request',
    datatype: 'object'

  c.inPorts.url.on 'data', (payload) ->
    options = payload
  c.inPorts.data.on 'data', (payload) ->
    data = payload
  c.inPorts.start.on 'data', ->
    req = coap.request options
    switch options.method
      when 'POST', 'PUT' then req.write data
    req.end ->
      c.outPorts.request.send req

  # Finally return the component instance
  c
