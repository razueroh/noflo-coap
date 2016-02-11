# CoAP for NoFlo
[![Build Status](https://secure.travis-ci.org/razueroh/noflo-coap.png?branch=master)](http://travis-ci.org/razueroh/noflo-coap)

This package provides utility components to create clients and servers for CoAP in the NoFlo Node.js runtime. Based on [node-coap](https://www.npmjs.com/package/coap).

## Package Installation

    npm install noflo-coap --save

## Component Usage

### ConfigRequest

Create an object with request parameters

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | hostname | `string` | Domain name or IP address of the server. Defaults to `localhost`
InPort | port | `number` | Port of remote server. Defaults to `5683`
InPort | method | `string` | A string specifying the CoAP request method. Defaults to `'GET'`
InPort | confirmable | `boolean` | Send a CoAP confirmable message (CON). Defaults to `true`
InPort | observe | `boolean` | Send a CoAP observe message, allowing the streaming of updates from the server. Defaults to `false`
InPort | pathname | `string` | Request path. Defaults to `"/"`
InPort | query | `string` | Query string. Defaults to `''`
OutPort | url | `object` | Object with request parameters
