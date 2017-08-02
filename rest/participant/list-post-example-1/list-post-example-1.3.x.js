// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.conferences('AgentConf12')
  .participants.create({
    to: '+15624421212',
    from: '+18180021216'
  })
  .then((participant) => console.log(participant.sid));
