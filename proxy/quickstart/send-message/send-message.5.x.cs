// Get the Node helper library from https://twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Preview.Proxy.Service.Session.Participant;

class Example
{
    static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
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
