// Get twilio-node from twilio.com/docs/libraries/node
const webhooks = require('twilio/lib/webhooks/webhooks');
const request = require('request');

// Your Auth Token from twilio.com/console
const authToken = process.env.TWILIO_AUTH_TOKEN;

// The Twilio request URL
const url = 'https://mycompany.com/myapp';

// The post variables in Twilio's request
const params = {
  CallSid: 'CA1234567890ABCDE',
  Caller: '+12349013030',
  Digits: '1234',
  From: '+12349013030',
  To: '+18005551212',
};


function testUrl(method, url, params, valid) {
  if(method === "GET") {
    url += "?" + Object.keys(params).map(key => key + '=' + params[key]).join('&');
    params = {};
  }
  const signatureUrl = valid ? url : "http://invalid.com"; 
  const signature = webhooks.getExpectedTwilioSignature(authToken, signatureUrl, params);
  const options = {
      method: method,
      url: url,
      form: params,
      headers: {
        'X-Twilio-Signature': signature
      }
  }

  request(options, function(error, response, body){
      const validStr = valid ? "valid" : "invalid";
      console.log(`HTTP ${method} with ${validStr} signature returned ${response.statusCode}`);
  });
}

testUrl('GET', url, params, true);
testUrl('GET', url, params, false);
testUrl('POST', url, params, true);
testUrl('POST', url, params, false);
