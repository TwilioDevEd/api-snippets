// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Conference;
using Twilio.Types;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        const string conferenceFriendlyName = "AgentConf12";
        var from = new PhoneNumber("+18180021216");
        var to = new PhoneNumber("+15624421212");
        var participant = ParticipantResource.Create(
            conferenceFriendlyName, from, to);

        Console.WriteLine(participant.CallSid);
    }
}
