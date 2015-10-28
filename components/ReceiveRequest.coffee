noflo = require 'noflo'

# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'On request event'

  # Add input ports
  c.inPorts.add 'server',
    datatype: 'object'

  # Add output ports
  c.outPorts.add 'observe',
    datatype: 'boolean'
  c.outPorts.add 'response',
    datatype: 'object'
  c.outPorts.add 'request',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: 'server'
    out: ['request', 'response', 'observe']
    forwardGroups: true
  , (data, groups, out) ->
    data.on 'request', (request, response) ->
      observe = false
      header = request.headers['Observe']
      console.log "Req " + header
      if header is 0
        observe = true
      else
        observe = false

      console.log "obs " + observe
      out.observe.send observe
      out.request.send request
      out.response.send response


  # Finally return the component instance
  c
