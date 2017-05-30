# http://jsfiddle.net/rbt6r8ve/
# denn attendee gibt es als json, der rest ist nur zum verdeutlichen
attendee = [
  {name: "honorificPrefix",         view: "text", type: "string", label: "Titel",     required: false}
  {name: "familyName",              view: "text", type: "string", label: "Nachname",  required: true}
  {name: "givenName",               view: "text", type: "string", label: "Vorname",   required: true}
  {name: "gender",                  view: "radio",type: "radio",  label: "Anrede",    required: true, options:[ {id: "male", value:"männlich"}, {id: "female", value:"weiblich"} ], invalidMessage: "Geschlecht wird benötigt"}
  {name: "birthDate",               view: "text", type: "date",   label: "Geburtstag",required: false } # format("YYYY-MM-DD")
  {name: "jobTitle",                view: "text", type: "string", label: "Beruf",     required: true}
  {name: "email",                   view: "text", type: "email",  label: "Email",     required: true}
  {name: "telephone",               view: "text", type: "string", label: "Telefon",   required: true}
  {name: "address.streetAddress",   view: "text", type: "string", label: "Strasse",   required: false}
  {name: "address.postalCode",      view: "text", type: "number", label: "PLZ",       required: false}
  {name: "address.addressLocality", view: "text", type: "select", label: "Ort",       required: false}
  {name: "address.addressCountry",  view: "text", type: "string", label: "Land",      required: true, value: "Österreich"}
]

window.postFormValues = ->
  registerUrl = "https://api.dioezese-linz.at/events"
  console.log payload = {attendee: [$$("personForm").getValues()]}
  registerOpts =
    method: 'post'
    body: null
    headers:
      'content-type': 'application/json; charset=utf-8'
  payload.id = 'test-validation'

  registerOpts.body = JSON.stringify(payload)
  fetch(registerUrl, registerOpts).then((res) -> res.json()).then((json) -> console.log json).catch((err) -> console.log err)


webix.ui({
  view: "form"
  complexData: true
  id: "personForm"
  rows: attendee.concat([{view: "button", value:"Abschicken", type: "form", click: -> postFormValues()}])
})



###  eine validierungsmöglichkeit
    view:"form1",
    elements:[
        { view:"text", label:'Username', name:"login" },
        { view:"text", label:'E-mail address', name:"email"},
        { view:"text", label:'Password', name:"password"},
        { view:"checkbox", labelRight:'I accept terms of use', name:"accept"}
    ],
    rules:{
        login: webix.rules.isNotEmpty,
        email: webix.rules.isEmail,
        password: webix.rules.isNumber,
        accept: webix.rules.isChecked
    }
###