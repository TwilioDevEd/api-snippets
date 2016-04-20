var accountSid = 'ACdc5f132a3c49700934481addd5ce1659';
var signingKeySid = SID;
var signingKeySecret = SECRET;

var token = new twilio.AccessToken(signingKeySid, accountSid, signingKeySecret);
token.addEndpointGrant(ENDPOINT_ADDRESS);
token.enableNTS();
console.log(token.toJwt());
