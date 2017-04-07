
const request = require('request');

// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const options = {
    url: 'https://fax.twilio.com/v1/Faxes',
    auth: {
        user: accountSid,
        pass: authToken
    },
    form: {
        'To': "+15558675309",
        'From': "+15017250604",
        'MediaUrl': "https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf"
    }
}

request.post(options, (error, response, body) => {
    console.log(JSON.parse(body).sid);
});
