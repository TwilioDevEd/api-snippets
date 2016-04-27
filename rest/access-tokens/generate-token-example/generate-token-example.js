var accountSid = '{{ account_sid }}';
var signingKeySid = SID;
var signingKeySecret = SECRET;

var token = new twilio.AccessToken(signingKeySid, accountSid, signingKeySecret);
token.addEndpointGrant(ENDPOINT_ADDRESS);
token.enableNTS();
console.log(token.toJwt());
