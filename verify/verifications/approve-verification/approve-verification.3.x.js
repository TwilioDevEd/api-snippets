// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.verify.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
             .verifications('+15017122661')
             .update({status: 'approved'})
             .then(verification => console.log(verification.to));
