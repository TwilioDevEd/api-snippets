// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const MonitorClient = require('twilio').MonitorClient;
const client = new MonitorClient(accountSid, authToken);

const params = {
  sourceIpAddress: '104.14.155.29',
  startDate: '2015-04-25T00:00:00Z',
  endDate: '2015-04-25T23:59:59Z',
};
client.events.list(params, (error, events) => {
  for (const e in events) {
    process.stdout.write(e);
  }
});
