Twilio.Device.setup(token);

Twilio.Device.ready(function(device) {
  console.log('Ready');
});

Twilio.Device.error(function(error) {
  console.log('Error: ' + error.message);
});
