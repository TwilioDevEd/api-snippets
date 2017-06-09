// NOTE: This example uses the ALPHA release of the next generation Twilio
// helper library - for more information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/csharp#accessing-preview-twilio-features
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
        const string twilioPhoneNumberSid = "PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var proxyNumber = PhoneNumberResource.Create(proxyServiceSid, twilioPhoneNumberSid);

        Console.WriteLine(proxyNumber.Sid);
    }
}
