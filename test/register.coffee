#
#
#

test      = require('prova')
_         = require('lodash')
fetch     = require('isomorphic-fetch')
uuid      = require('uuid')

# !!! kiribati-progress muss auf dev maschine laufen !!!
registerUrl   = "http://localhost:7030/events"
# production
#registerUrl = "https://api.dioezese-linz.at/events" #


registerOpts  =
  method: 'post'
  body: null
  headers:
    "content-type":"application/json; charset=utf-8"


test "test with nonexisten event ID ", (t) ->
  t.plan 1
  payload    = require("./data/correctRegisterRecord")()
  payload.id = "test-event-not-exists"
  registerOpts.body = JSON.stringify payload
  fetch(registerUrl, registerOpts).then((res) -> res.json())
  .then((json) -> t.equals(json.message, "Event does not exist!") )


test "validation: error, 'cause no id", (t) ->
  t.plan 1
  payload    = require("./data/correctRegisterRecord")()
  registerOpts.body = JSON.stringify payload
  fetch(registerUrl, registerOpts).then((res) -> res.json())
  .then((json) ->
    #console.log json
    t.equals(json.message, "ValidationError")
  )


test "validation: error", (t) ->
  t.plan 1
  payload    = require("./data/correctRegisterRecord")()
  # createdAt needs to be here, because request never reaches rest endpoint
  payload.createdAt = "11.11.2016 12:12"
  payload.id = "test-validation"
  registerOpts.body = JSON.stringify payload
  fetch(registerUrl, registerOpts).then((res) -> res.json())
  .then((json) ->
    #console.log json
    t.equals(json.message, "ValidationError")
  )


test "validation: success", (t) ->
  t.plan 1
  payload    = require("./data/correctRegisterRecord")()
  payload.id = "test-validation"
  registerOpts.body = JSON.stringify payload

  fetch(registerUrl, registerOpts).then((res) -> res.json())
  .then((json) -> t.ok(json?.id) )


test "register progress: success", (t) ->
  t.plan 2
  payload    = require("./data/correctRegisterRecord")()
  payload.id = "DIOKV_2" # for now js testing: "DIOJS_340"
  payload.attendee = payload.attendee.map (item) ->
    item.familyName = "name:#{uuid.v1()}"
    item
  payload.attendee = payload.attendee[0...2]
  registerOpts.body = JSON.stringify payload

  fetch(registerUrl, registerOpts).then((res) -> res.json())
  .then((json) ->
    #console.log json
    t.equals(json?.code, 201)
    t.equals(json?.data?.billing?.bic, "BIC0000000")
  ).catch (err) -> console.log err

###
test "register kiribati: success", (t) ->
  t.plan 1
  payload    = require("./data/correctRegisterRecord")()

  payload.id = "999_13758"
  registerOpts.body = JSON.stringify payload

  fetch(registerUrl, registerOpts).then((res) -> res.json())
  .then((json) ->
    #console.log json
    t.equal(json.code, 201)
  ).catch (err) -> console.log "ERROR:", err
###