const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const pay = response.pay({
    chargeAmount: '10.00',
    paymentConnector: 'My_Generic_Pay_Connector',
    action: 'https://your-callback-function-url.com/pay'
});
pay.parameter({
    name: 'card_type',
    value: 'mastercard'
});

console.log(response.toString());