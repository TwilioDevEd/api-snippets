using System;
using Twilio;
using Twilio.Rest.Api.V2010;


class Program
{
    static void Main(string[] args)
    {
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; // Your Account Sid from twilio.com/user/account
        const string apiKey = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; // You can generate this from www.twilio.com/console/runtime/api-keys/create
        const string apiSecret = "your_api_secret"; // You can generate this from www.twilio.com/console/runtime/api-keys/create

        TwilioClient.Init(apiKey, apiSecret, accountSid);

        // Proof request to check credentials are working.
        // Retrieving your account information
        var accounts = AccountResource.Read();

        foreach(var record in accounts)
        {
           Console.WriteLine(record.Sid);
        }
    }
}
