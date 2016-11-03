// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

let client = require('twilio')(accountSid, authToken);

client.tokens.create({}, function(err, token) {
    process.stdout.write(token.username);
});
