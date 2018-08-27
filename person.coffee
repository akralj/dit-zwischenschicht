#
#
#

BaseJoi = require("joi")
Extension = require('joi-date-extensions')
Joi = BaseJoi.extend(Extension)


attendee = Joi.object().keys({
  gender:             Joi.valid("male", "female").required()
  honorificPrefix:    Joi.string().min(1).trim().allow("")
  familyName:         Joi.string().min(1).trim().required()
  givenName:          Joi.string().min(1).trim().required()
  email:              Joi.string().email().min(1).trim().required().default("")
  telephone:          Joi.string().min(3).trim().required().default("")
  birthDate:          Joi.date().format("YYYY-MM-DD").allow("").raw().default("")
  jobTitle:           Joi.string().allow("").min(1).trim().default("")
  address:            Joi.object().keys({
    "@type":            Joi.string().default("PostalAddress")
    streetAddress:      Joi.string().min(1).trim().allow("").default("")
    postalCode:         Joi.string().min(4).trim().allow("").default("") # use Joi.integer and test
    addressLocality:    Joi.string().min(1).trim().allow("").default("")
    # https://en.wikipedia.org/wiki/ISO_3166-1
    addressCountry:     Joi.string().allow("").default("at")
  })
})


children = Joi.object().keys({
  name:       Joi.string().min(1).trim().allow("")
  birthDate:  Joi.date().format("YYYY-MM-DD").allow("").raw().default("")
})

additionalData = Joi.object().keys({
  children:       Joi.array().items(children)
  acceptPolicy:   Joi.boolean().required().valid(true) # allows: 1 or true
  description:    Joi.string().allow("").min(1).trim().default("")
})


schema = Joi.object().keys({
  id:             Joi.string().required()
  attendee:       Joi.array().items(attendee)
  additionalData: additionalData
})


module.exports = schema
