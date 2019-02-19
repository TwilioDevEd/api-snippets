// Connect a call when button clicked
document.getElementById('button-hangup').onclick = function() {
  console.log('Hanging up...');
  Twilio.Device.disconnectAll();
};
