// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Conference;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var participants = ParticipantResource.Read(
            "CFbbe4632a3c49700934481addd5ce1659");

        foreach (var participant in participants)
        {
            Console.WriteLine(participant.Muted);
        }
    }
}
