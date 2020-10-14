using System;
using Twilio;
using Twilio.Rest.Api.V2010;


class Program
{
    static void Main(string[] args)
    {
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string apiKey = Environment.GetEnvironmentVariable("TWILIO_API_KEY"); // You can generate this from www.twilio.com/console/runtime/api-keys/create
        const string apiSecret = Environment.GetEnvironmentVariable("TWILIO_API_SECRET"); // You can generate this from www.twilio.com/console/runtime/api-keys/create

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
