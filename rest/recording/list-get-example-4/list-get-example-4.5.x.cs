// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var recordings = RecordingResource.Read(
            dateCreatedBefore: new DateTime(2016, 10, 15),
            dateCreatedAfter: new DateTime(2016, 10, 12)
        );

        foreach (var recording in recordings)
        {
            Console.WriteLine(recording.Duration);
        }
    }
}
