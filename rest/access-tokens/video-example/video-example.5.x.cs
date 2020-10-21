using System;
using System.Collections.Generic;
using Twilio.Jwt.AccessToken;

class Example
{
    static void Main(string[] args)
    {
        // These values are necessary for any access token
        // To set up environmental variables, see http://twil.io/secure
        const string twilioAccountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string twilioApiKey = Environment.GetEnvironmentVariable("TWILIO_API_KEY");
        const string twilioApiSecret = Environment.GetEnvironmentVariable("TWILIO_API_SECRET");

        // These are specific to Video
        const string identity = "user";

        // Create a Video grant for this token
        var grant = new VideoGrant();
        grant.Room = "cool room";

        var grants = new HashSet<IGrant> { grant };

        // Create an Access Token generator
        var token = new Token(
            twilioAccountSid,
            twilioApiKey,
            twilioApiSecret,
            identity: identity,
            grants: grants);

        Console.WriteLine(token.ToJwt());
    }
}
