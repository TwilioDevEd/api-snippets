using System;
using Twilio;
using Twilio.Rest.Preview.Proxy.Service.Session;

static void Main(string[] args)
{
    // Find your Account Sid, Auth Token and Proxy Service sid at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    const string proxyServiceSid = "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string sessionSid = "KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    TwilioClient.Init(accountSid, authToken);

    var participant = ParticipantResource.Create(
        proxyServiceSid,
        sessionSid,
        "+15558675310",
        "Alice");

    Console.WriteLine(participant.Sid);
}
