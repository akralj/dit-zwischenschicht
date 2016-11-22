var payload, registerOpts, registerUrl;

registerUrl = "https://api.dioezese-linz.at/events";

payload = {
  id: null,
  attendee: [
    {
      gender: "female",
      honorificPrefix: "Drs.",
      familyName: "Reiter",
      givenName: "franziska",
      email: "fran@reiter.at",
      telephone: "160 / 34234243",
      birthDate: "2016-05-12",
      address: {
        "@type": "PostalAddress",
        streetAddress: "heustadl",
        postalCode: "1234",
        addressLocality: "Villach"
      }
    }, {
      gender: "male",
      honorificPrefix: "",
      familyName: "Bailey",
      givenName: "Bill",
      email: "bill@bailey.uk",
      telephone: "+41 160 / 34234243",
      birthDate: "1960-05-12",
      address: {
        "@type": "PostalAddress",
        streetAddress: "Buckingham Palace",
        postalCode: "1313",
        addressLocality: "Queenstown"
      }
    }
  ]
};

registerOpts = {
  method: 'post',
  body: null,
  headers: {
    "content-type": "application/json; charset=utf-8"
  }
};

payload.id = "test-validation";

registerOpts.body = JSON.stringify(payload);

fetch(registerUrl, registerOpts).then(function(res) {
  return res.json();
}).then(function(json) {
  return console.log(json);
});
