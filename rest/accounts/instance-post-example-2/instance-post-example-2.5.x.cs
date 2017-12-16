// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string accountSidToActivate = "ACxxxxxxxxxxxxxxxxxxx";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        AccountResource.Update(
            accountSidToActivate,
            status: AccountResource.StatusEnum.Active);
    }
}
