const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.pay({
    chargeAmount: '10.00',
    paymentConnector: 'My_Pay_Connector', 
    action: 'https://your-callback-function-url.com/pay'
});

console.log(response.toString());
