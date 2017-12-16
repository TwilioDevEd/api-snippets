// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var calls = CallResource.Read(status: CallResource.StatusEnum.Busy, 
                                      to: new PhoneNumber("+15558675310"));

        foreach (var call in calls)
        {
            Console.WriteLine(call.StartTime);
        }
    }
}
