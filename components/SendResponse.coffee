noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Send response'

  message = ''
  response = null
  observe = false

  # Add input ports
  c.inPorts.add 'message',
    datatype: 'string'
  c.inPorts.add 'observe',
    datatype: 'boolean'
  c.inPorts.add 'response',
    datatype: 'object'
  c.inPorts.add 'start',
    datatype: 'bang'

  c.outPorts.add 'out',
    datatype: 'bang'

  c.inPorts.message.on 'data', (payload) ->
    message = payload
  c.inPorts.observe.on 'data', (payload) ->
    observe = payload
  c.inPorts.response.on 'data', (payload) ->
    response = payload
  c.inPorts.start.on 'data', ->
    console.log "Resp: " + observe
    if observe isnt true
      console.log "Resp no observe: " + observe
      response.end message
    else
      console.log "Resp observe: " + observe
      response.write message
      c.outPorts.out.send true

  # Finally return the component instance
  c
