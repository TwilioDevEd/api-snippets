// Connect a call when button clicked
document.getElementById('button-call').onclick = function() {
  // get the phone number to connect the call to
  var params = { To: '15558675309' };

  console.log('Calling ' + params.To + '...');
  Twilio.Device.connect(params);
};
