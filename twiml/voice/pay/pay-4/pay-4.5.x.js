const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.pay({
    paymentConnector: 'Stripe_Connector_1'
});

console.log(response.toString());
