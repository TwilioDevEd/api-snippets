const https = require('https');
const url = require('url').parse(
  'https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/?AddOns=payfone_tcpa_compliance&AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101'
);
url.auth = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:your_auth_token';

https
  .get(url, res => {
    res.on('data', jsonString => {
      const lookup = JSON.parse(jsonString);
      const numberMatch =
        lookup.add_ons.results &&
        lookup.add_ons.results.payfone_tcpa_compliance.result.Response
          .NumberMatch;
      console.log(
        `Phone Number ${lookup.phone_number} is currently owned : ${numberMatch}`
      );
    });
  })
  .on('error', e => {
    console.log(`Got error: ${e.message}`);
  });
