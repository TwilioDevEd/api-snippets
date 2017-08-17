using System;
using Twilio;
using Twilio.Rest.Preview.Proxy.Service;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid, Auth Token and Proxy Service sid at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string proxyServiceSid = "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var session = SessionResource.Create(proxyServiceSid, "MyFirstSession");

        Console.WriteLine(session.Sid);
    }
}
