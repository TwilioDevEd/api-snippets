using System;
using System.Collections.Generic;
using Twilio.Jwt.AccessToken;

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

        // Create a Video grant for this token
        var grant = new VideoGrant();
        grant.ConfigurationProfileSid = configurationProfileSid;

        var grants = new HashSet<IGrant>
        {
            { grant }
        };

        // Create an Access Token generator
        var token = new Token(
            twilioAccountSid,
            twilioApiKey,
            twilioApiSecret,
            identity,
            grants: grants);

        Console.WriteLine(token.ToJwt());
    }
}
