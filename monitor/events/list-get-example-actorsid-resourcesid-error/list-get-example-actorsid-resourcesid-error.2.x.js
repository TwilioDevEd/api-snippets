// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const MonitorClient = require('twilio').MonitorClient;
const client = new MonitorClient(accountSid, authToken);

const params = {
  actorSid: 'USd0afd67cddff4ec7cb0022771a203cb1',
  resourceSid: 'PN4aa51b930717ea83c91971b86d99018f',
};
client.events.list(params, (error, events) => {
  for (const e in events) {
    process.stdout.write(e);
  }
});
