// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const Twilio = require('twilio');
const client = new Twilio(accountSid, authToken);

const outgoingCalledIdSid = 'PNe536d32a3c49700934481addd5ce1659';

client
  .outgoingCallerIds(outgoingCalledIdSid)
  .remove()
  .then(() => console.log(`Sid ${outgoingCalledIdSid} deleted successfully.`))
  .done();
