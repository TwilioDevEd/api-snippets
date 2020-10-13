// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const particantSid = 'CA386025c9bf5d6052a1d1ea42b4d16662';

client
  .conferences('CFbbe4632a3c49700934481addd5ce1659')
  .participants(particantSid)
  .remove(() => console.log(`Sid ${particantSid} deleted successfully.`))
  .catch(err => {
    console.log(err.status);
    throw err;
  });
