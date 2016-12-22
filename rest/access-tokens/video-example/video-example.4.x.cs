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

    // These are specific to Video
    var configurationProfileSid = "VSxxxxxxxxxxxx";
    var identity = "user";

    // Create an Access Token generator
    var token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
    token.Identity = identity;

    // Create a Video grant for this token
    var grant = new VideoGrant();
    grant.ConfigurationProfileSid = configurationProfileSid;
    token.AddGrant(grant);

    Console.WriteLine(token.ToJWT());
  }
}
