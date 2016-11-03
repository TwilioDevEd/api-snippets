// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const filterOpts = {
  dateCreatedBefore: '2016-10-15',
  dateCreatedAfter: '2016-10-12',
};

client.recordings
  .each(filterOpts, (recording) => console.log(recording.duration));
