// Connect a call when button clicked
document.getElementById('button-call').onclick = function() {
  // get the phone number to connect the call to
  let params = { To: 'jenny' };

  console.log('Calling ' + params.To + '...');
  Twilio.Device.connect(params);
};
