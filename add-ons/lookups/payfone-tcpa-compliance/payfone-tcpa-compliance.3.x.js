// Get your Account SID and Auth Token from twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

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
