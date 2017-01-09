// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Pricing.V1.Messaging;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var country = CountryResource.Fetch("EE");

        foreach (var price in country.InboundSmsPrices)
        {
            Console.WriteLine(price.Type);
            Console.WriteLine(price.CurrentPrice);
        }
    }
}
