// Get the C# helper library from https://twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Proxy.V1.Service;

class Example
{
    static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string proxyServiceSid = "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string twilioPhoneNumberSid = "PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var proxyNumber = PhoneNumberResource.Create(proxyServiceSid, twilioPhoneNumberSid);

        Console.WriteLine(proxyNumber.Sid);
    }
}
