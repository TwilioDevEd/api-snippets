// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const memberSid = 'CA386025c9bf5d6052a1d1ea42b4d16662';

client
  .queues('QU5ef8732a3c49700934481addd5ce1659')
  .members(memberSid)
  .fetch()
  .then(member => console.log(member.waitTime));
