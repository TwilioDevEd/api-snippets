// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let MonitorClient = require('twilio').MonitorClient;
let client = new MonitorClient(accountSid, authToken);

let params = {
  sourceIpAddress: '104.14.155.29',
  startDate: '2015-04-25T00:00:00Z',
  endDate: '2015-04-25T23:59:59Z',
};
client.events.list(params, function(error, events) {
  for (let e in events) {
    process.stdout.write(e);
  }
});
