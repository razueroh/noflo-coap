noflo = require 'noflo'
url = require 'url'
# @runtime noflo-nodejs

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Create object with request parameters'

  # Add input ports
  c.inPorts.add 'href',
    datatype: 'string'
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

  # Add output ports
  c.outPorts.add 'url',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: 'href'
    params: [
      'method'
      'confirmable'
      'observe'
    ]
    out: 'url'
    forwardGroups: true
  , (data, groups, out) ->
    options = url.parse(data)
    options.method = c.params.method
    options.confirmable = c.params.confirmable
    options.observe = c.params.observe

    out.send options

  # Finally return the component instance
  c
