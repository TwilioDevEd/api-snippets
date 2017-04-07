
const request = require('request');

// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const options = {
    url: 'https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    auth: {
      user: accountSid,
      pass: authToken
    }
}

request.get(options, (error, response, body) => {
    console.log(JSON.parse(body).mediaUrl);
});
