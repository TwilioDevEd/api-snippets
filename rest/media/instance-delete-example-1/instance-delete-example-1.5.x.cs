// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Message;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        const string messageSid = "MM800f449d0399ed014aae2bcc0cc2f2ec";
        const string mediaSid = "ME557ce644e5ab84fa21cc21112e22c485";
        MediaResource.Delete(messageSid,
                             mediaSid);
    }
}
