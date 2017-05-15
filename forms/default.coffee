attendee =
  honorificPrefix:
    type: "string", displayName: "Titel", required: false
  familyName:
    type: "string", displayName: "Nachname", required: true
  givenName:
    type: "string", displayName: "Vorname", required: true
  gender:
    type: "radio", displayName: "Anrede", required: true # Joi.valid("male", "female").required()
  birthDate:
    type: "date", displayName: "Geburtstag", required: false # Joi.date().format("YYYY-MM-DD").allow("").raw().default("")
  jobTitle:
    type: "string", displayName: "Beruf", required: false
  email:
    type: "string", displayName: "Email", required: true  # Joi.string().email().min(1).trim().required().default("")
  telephone:
    type: "string", displayName: "Telefon", required: true
  "address.streetAddress":
    type: "string", displayName: "Strasse", required: false
  "address.postalCode":
    type: "number", displayName: "PLZ", required: false
  "address.addressLocality":
    type: "dropdown", displayName: "Ort", required: false # hier sollten automatisch die möglichen Orte von dir eingefügt werden
  "address.addressCountry":
    type: "string", displayName: "Land", required: false

schema =
  id:
    type: "string", required: true # Joi.string().required()
  attendee:
    type: "array", keys: "attendee" # Joi.array().items(attendee)


module.exports = schema
