// Get your Account SID and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

// Download the Node.js helper library from twilio.com/docs/libraries/node
const client = require('twilio')(accountSid, authToken);

client.lookups.v1
  .phoneNumbers('+16502530000')
  .fetch({
    addOns: 'payfone_tcpa_compliance',
    addOnsData: {
      'payfone_tcpa_compliance.RightPartyContactedDate': '20160101',
    },
  })
  .then(number => console.log(number.addOns));
