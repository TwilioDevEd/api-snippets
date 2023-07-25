// Download the helper library from https://www.twilio.com/docs/node/install
// Find your Account SID and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
     shortenUrls: true,
     messagingServiceSid: 'MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
     body: 'Visit this link to start earning rewards today! https://example.com/N6uAirXeREkpV2MW7kpV2MW7TAvh1zn4gEFMTAvh1zn4gEFMN6uAirXeRE',
     to: 'whatsapp:+15551212121'
   })
  .then(message => console.log(message.sid));
