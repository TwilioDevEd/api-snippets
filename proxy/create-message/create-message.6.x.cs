using System;
using Twilio;
using Twilio.Rest.Proxy.V1.Service.Session.Participant;


class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid, Auth Token and Proxy Service sid at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string proxyServiceSid = "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string sessionSid = "KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string participantSid = "KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var msgInteraction = MessageInteractionResource.Create(
            proxyServiceSid,
            sessionSid,
            participantSid,
            "Reply to this message to chat");

        Console.WriteLine(msgInteraction.Sid);
    }
}
