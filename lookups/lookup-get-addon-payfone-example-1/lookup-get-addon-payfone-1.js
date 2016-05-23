var https = require('https');
var url = require('url').parse('https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/?AddOns=payfone_tcpa_compliance&AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101');
url.auth = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:{{ auth_token }}';

https.get(url, (res) => {
  res.on('data', (jsonString) => {
    var lookup = JSON.parse(jsonString);
    console.log(`Phone Number ${lookup.phone_number} is currently owned : ${lookup.add_ons.results.payfone_tcpa_compliance.result.Response.NumberMatch}`);
  });
}).on('error', (e) => {
  console.log(`Got error: ${e.message}`);
});