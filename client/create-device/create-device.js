Twilio.Device.setup(token);

Twilio.Device.ready(device => {
  console.log('Ready');
});

Twilio.Device.error(error => {
  console.log('Error: ' + error.message);
});
