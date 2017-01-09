using System;
using Twilio.JWT;

class Example
{
    static void Main(string[] args)
    {
        // These values are necessary for any access token
        const string twilioAccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string twilioApiKey = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string twilioApiSecret = "your_secret";

        // These are specific to Video
        const string configurationProfileSid = "VSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string identity = "user";

        // Create an Access Token generator
        var token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
        token.Identity = identity;

        // Create a Video grant for this token
        var grant = new VideoGrant();
        grant.ConfigurationProfileSid = configurationProfileSid;
        token.AddGrant(grant);

        Console.WriteLine(token.ToJwt());
    }
}
