#
#
#

Joi = require("joi")


attendee = Joi.object().keys({
  gender:             Joi.valid("male", "female").required() # male or female
  honorificPrefix:    Joi.string().min(1).trim().allow("")
  familyName:         Joi.string().min(1).trim().required()
  givenName:          Joi.string().min(1).trim().required()
  email:              Joi.string().email().min(1).trim().required().default("")
  telephone:          Joi.string().min(3).trim().required().default("")
  birthDate:          Joi.date().format("YYYY-MM-DD").allow("").raw().default("")
  jobTitle:           Joi.string().min(1).trim().default("")
  address:            Joi.object().keys({
    "@type":            Joi.string().default("PostalAddress")
    streetAddress:      Joi.string().min(1).trim().allow("").default("")
    postalCode:         Joi.string().min(4).trim().allow("").default("")
    addressLocality:    Joi.string().min(1).trim().allow("").default("")
    addressCountry:     Joi.string().default("at") #https://en.wikipedia.org/wiki/ISO_3166-1
  })
})


schema = Joi.object().keys({
  id:         Joi.string().required()
  attendee:   Joi.array().items(attendee)
})


module.exports = schema
