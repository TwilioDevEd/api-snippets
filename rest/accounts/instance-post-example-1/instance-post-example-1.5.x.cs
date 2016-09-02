// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Resources.Api.V2010;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        var authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var AccountSidToSuspend = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        var suspendedAccount = AccountResource
            .Update(AccountSidToSuspend)
            .setStatus(AccountResource.Status.SUSPENDED)
            .Execute();

        Console.WriteLine(suspendedAccount.GetDateCreated());
    }
}
