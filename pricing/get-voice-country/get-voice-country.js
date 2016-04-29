// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var PricingClient = require('twilio').PricingClient;
var client = new PricingClient(accountSid, authToken);

client.voice.countries('EE').get(function(err, country) {
    var cpList = country.inboundCallPrices;
    for (var i = 0; i < cpList.length; i++) {
        console.log(cpList[i].numberType + " " + cpList[i].currentPrice + "\n");
    }
});
