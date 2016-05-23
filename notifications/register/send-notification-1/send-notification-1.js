require('dotenv').load();
var post = require('request').post;

// Twilio User Notifications Service Endpoint
var serviceUrl = 'https://notify.twilio.com';

// Notifications creation endpoint
var notificationUrl = serviceUrl + '/v1/Services/'
  + 'TWILIO_SERVICE_SID' + '/Notifications';

// Send a notification 
post(notificationUrl, {
  auth: {
    username: 'TWILIO_ACCOUNT_SID',
    password: 'TWILIO_AUTH_TOKEN'
  },
  form: { 
    Tags: 'new_user' + process.argv.slice(2), 
    Body: 'Hello, ' + process.argv.slice(2) + '!'
  }
}, function(err, httpResponse, body) {
  console.log(body);
});