// Get the C# helper library from https://twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Proxy;

class Example
{
    static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string proxyServiceSid = "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string sessionSid = "KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var proxyService = ServiceResource.Create("UNIQUE_NAME");

        Console.WriteLine(proxyService.Sid);
    }
}
