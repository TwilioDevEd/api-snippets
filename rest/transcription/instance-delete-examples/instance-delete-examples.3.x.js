// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const transcriptionSid = 'TR8c61027b709ffb038236612dc5af8723';

client.transcriptions(transcriptionSid)
  .remove()
  .then(() => console.log(`Sid ${transcriptionSid} deleted successfully.`))
  .catch((err) => {
    console.log(err.status);
    throw err;
  });
