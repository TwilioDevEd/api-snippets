// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.transcriptions("TR8c61027b709ffb038236612dc5af8723").get(function(err, transcription) {
    console.log(transcription.transcriptionText);
});