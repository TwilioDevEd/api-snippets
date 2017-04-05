// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var env = require('./config.json');
var twilio = require('twilio');

// Authenticate with Twilio
var client = new twilio(env.TWILIO_ACCOUNT_SID,  env.TWILIO_AUTH_TOKEN);

// Create a reference to the user notification service
var service = client.notifications.services(env.TWILIO_NOTIFICATION_SERVICE_SID);

// Send a notification
service.notifications
  .create({
    'identity':'' + process.argv.slice(2),
    'body':'Hello, ' + process.argv.slice(2) + '!'
  }).then(function(notification) {
    console.log(notification);
  }).catch(function(error) {
    console.log(error);
  })
  .done();
