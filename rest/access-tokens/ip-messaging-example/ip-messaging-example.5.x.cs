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

        // These are specific to Chat
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string identity = "user@example.com";
        const string deviceId = "someiosdevice";

        // Create an Chat grant for this token

        var grant = new ChatGrant
        {
          ServiceSid = serviceSid,
          EndpointId = $"HipFlowSlackDockRC:{identity}:{deviceId}"
        };

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
