module.exports = ->
  {
    id: null
    # person data
    attendee:[
      {
        gender:             "male" # male or female
        honorificPrefix:    "Dr."
        familyName:         "Simpson"
        givenName:          "Homer"
        email:              "asdf@foo.de"
        telephone:          "1234123 "
        birthDate:          "1989-12-17"
        address:
          "@type":            "PostalAddress"
          streetAddress:      "744 Evergreen Terrace"
          postalCode:         "0001"
          addressLocality:    "Springfield"
          addressCountry:     "de" #https://en.wikipedia.org/wiki/ISO_3166-1
      }
      {
        gender:             "female"
        honorificPrefix:    "Drs."
        familyName:         "Reiter"
        givenName:          "franziska"
        email:              "fran@reiter.at"
        telephone:          "160 / 34234243"
        birthDate:          "2016-05-12"
        address:
          "@type":            "PostalAddress"
          streetAddress:      "heustadl"
          postalCode:         "1234"
          addressLocality:    "Villach"
          #addressCountry:     "at" #https://en.wikipedia.org/wiki/ISO_3166-1
      }
    ]

  additionalData:
    acceptPolicy: true
    description: "PERSONEN: 3\nPfarre Althofen"
    # XXX needs different validation, like in contacts because otherwise birthdate could be empty.
    children: [{ name: "Franzi", birthDate: "2013-01-13" }, { name: "Hans", birthDate: "2011-01-13" }]
  }
