// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const MonitorClient = require('twilio').MonitorClient;
const client = new MonitorClient(accountSid, authToken);

const params = {
  startDate: '2015-04-01T00:00:00Z',
  endDate: '2015-04-30T23:59:59Z',
  logLevel: 'warning',
};

client.alerts.list(params, (err, data) => {
  data.alerts.forEach(alert => {
    console.log(alert.alertText);
  });
});
