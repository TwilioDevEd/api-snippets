// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Usage;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var records = RecordResource.Read(
            category: RecordResource.CategoryEnum.CallsInbound,
            startDate: new DateTime(2012, 09, 01),
            endDate: new DateTime(2012, 09, 30));

        foreach (var record in records)
        {
            Console.WriteLine(record.Price);
        }
    }
}
