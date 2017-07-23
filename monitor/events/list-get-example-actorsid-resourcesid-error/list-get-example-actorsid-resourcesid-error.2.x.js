// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let MonitorClient = require('twilio').MonitorClient;
let client = new MonitorClient(accountSid, authToken);

let params = {
  actorSid: 'USd0afd67cddff4ec7cb0022771a203cb1',
  resourceSid: 'PN4aa51b930717ea83c91971b86d99018f',
};
client.events.list(params, function(error, events) {
  for (let e in events) {
    process.stdout.write(e);
  }
});
