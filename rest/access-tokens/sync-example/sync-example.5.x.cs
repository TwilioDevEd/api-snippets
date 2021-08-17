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
        const string twilioSyncService = Environment.GetEnvironmentVariable("TWILIO_SYNC_SERVICE_SID");

        // These are specific to Sync
        const string identity = "user";

        // Create a Sync grant for this token
        var grant = new SyncGrant();

        // Create a "grant" which enables a client to use Sync as a given user
        grant.serviceSid = twilioSyncService;

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
