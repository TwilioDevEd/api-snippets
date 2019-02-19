// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio');
const client = new Twilio(accountSid, authToken);

const outgoingCalledIdSid = 'PNe536d32a3c49700934481addd5ce1659';

client
  .outgoingCallerIds(outgoingCalledIdSid)
  .remove()
  .then(() => console.log(`Sid ${outgoingCalledIdSid} deleted successfully.`))
  .done();
