using System;
using Twilio;
using Twilio.Rest.Proxy.V1.Service.Session.Participant;


class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid, Auth Token and Proxy Service sid at twilio.com/console
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
