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

        var to = new PhoneNumber("+15005550006");
        var from = new PhoneNumber("+15005550009");
        const string body = "Hey Mr Nugget, you the bomb!";
        var message = MessageResource.Create(to, from: from, body: body);

        Console.WriteLine(message.Sid);
    }
}
