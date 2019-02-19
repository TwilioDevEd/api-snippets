using System;
using Twilio.Auth;

class Example
{
  static void Main(string[] args)
  {
    // These values are necessary for any access token
    var twilioAccountSid = "ACxxxxxxxxxxxx";
    var twilioApiKey = "SKxxxxxxxxxxxx";
    var twilioApiSecret = "xxxxxxxxxxxxxx";

    // These are specific to Voice
    var outgoingApplicationSid = "APxxxxxxxxxxxx";
    var identity = "user";

    // Create an Access Token generator
    var token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
    token.Identity = identity;

    // Create a Voice grant for this token
    var grant = new VoiceGrant();
    grant.OutgoingApplicationSid = outgoingApplicationSid;
    token.AddGrant(grant);

    Console.WriteLine(token.ToJWT());
  }
}
