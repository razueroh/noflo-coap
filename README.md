# CoAP for NoFlo
[![Build Status](https://secure.travis-ci.org/razueroh/noflo-coap.png?branch=master)](http://travis-ci.org/razueroh/noflo-coap) [![npm version](https://badge.fury.io/js/noflo-coap.svg)](https://badge.fury.io/js/noflo-coap)

This package provides utility components to create clients and servers for CoAP in the NoFlo Node.js runtime. Based on [node-coap](https://www.npmjs.com/package/coap).

## Package Installation

    npm install noflo-coap --save

## Component Usage

### ConfigRequest

Create an object with a few request properties

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | href | `string` | String specifying the URL for the request. It should be of the form `'coap://<hostname>:<port>/<path>?<query>'`
InPort | method | `string` | A string specifying the CoAP request method. Defaults to `'GET'`
InPort | confirmable | `boolean` | Send a CoAP confirmable message (CON). Defaults to `true`
InPort | observe | `boolean` | Send a CoAP observe message, allowing the streaming of updates from the server. Defaults to `false`
OutPort | url | `object` | Object with request properties

You can use [noflo-objects](https://www.npmjs.com/package/noflo-objects) to add more properties to the `url` object.

### CreateServer

Create CoAP server

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | port | `number` | Port of remote server. Defaults to `5683`
InPort | hostname | `string` | Domain name or IP address of the server. Defaults to `localhost`
InPort | type | `string` |  Create IPv4 connections (`udp4`) or IPv6 connections (`udp6`). Defaults to `udp4`.
InPort | proxy | `boolean` | Behave like a proxy for incoming requests containing the `Proxy-Uri` header. Defaults to `false`
OutPort | out | `object` | Object with server parameters

### ReceiveRequest

On request event

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | server | `object` | Object with server parameters
OutPort | observe | `boolean` | Prepare the server for streaming data to the client. Defaults to `false`.
OutPort | response | `object` | Object with response parameters
OutPort | request | `object` | Object with request parameters

### ReceiveResponse

On response event

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | request | `object` | Object with request parameters
OutPort | response | `string` | Raw data received from the server
OutPort | message | `string` | Payload of the data received from the server

### SendRequest

Send request

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | url | `all` | `object` or `string`. If it is an `object`, this should have the properties described [here](https://www.npmjs.com/package/coap#requesturl). (You can use the ConfigRequest component to build an `url` object with a few basic properties). If it is a `string`, this should be of the form `'coap://<hostname>:<port>/<path>?<query>'`
InPort | data | `bang` | Data to write in the body of the request
InPort | start | `bang` | Signal to send the request
OutPort | request | `object` | Object with request parameters

### SendResponse

Send response

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | message | `string` | Payload sent to the client
InPort | observe | `boolean` | Prepare the server for streaming data to the client. Defaults to `false`
InPort | response | `object` | Object with response parameters
InPort | start | `bang` | Signal to send the response
OutPort | out | `bang` | It fires if the message was sent and `observe` is `true`. Use it to send the next message to the client

## Examples

Name | Gist | Flowhub
-----|------|--------
CoAP Client | [code](https://gist.github.com/razueroh/2a062aa901601c2f6648) | [example](https://app.flowhub.io/#example/2a062aa901601c2f6648)
CoAP Server | [code](https://gist.github.com/razueroh/257190cb2e2d62a0328d) | [example](https://app.flowhub.io/#example/257190cb2e2d62a0328d)
