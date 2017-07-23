// Connect a call when button clicked
document.getElementById('button-call').onclick = function() {
  console.log('Calling...');
  Twilio.Device.connect();
};
