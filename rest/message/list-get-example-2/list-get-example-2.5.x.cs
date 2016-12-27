// Download the twilio-csharp library from twilio.com/docs/csharp/install
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


        var to = new PhoneNumber("+15558675309");
        var from = new PhoneNumber("+15017250604");
        var dateSentAfter = new DateTime(2016, 8, 31);

        var messages = MessageResource.Read(to: to,
                                            from: from,
                                            dateSentAfter: dateSentAfter);

        foreach (var message in messages)
        {
            Console.WriteLine(message.Body);
        }
    }
}
