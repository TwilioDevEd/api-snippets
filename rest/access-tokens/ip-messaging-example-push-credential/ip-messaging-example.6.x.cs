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

        // These are specific to Chat
        const string serviceSid = Environment.GetEnvironmentVariable("TWILIO_SERVICE_SID");
        const string pushCredentialSid = Environment.GetEnvironmentVariable("TWILIO_PUSH_CREDENTIAL_SID");
        const string identity = "user@example.com";

        // Create an Chat grant for this token

        var grant = new ChatGrant
        {
          ServiceSid = serviceSid,
          PushCredentialSid = pushCredentialSid
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
