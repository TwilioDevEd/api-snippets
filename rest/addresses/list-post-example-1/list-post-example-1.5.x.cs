// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var address = AddressResource.Create(
            customerName: "Customer 123",
            street: "2 Hasselhoff Lane",
            city: "Berlin",
            region: "Berlin",
            postalCode: "10785",
            isoCountry: "DE",
            friendlyName: "Billing - Customer 123");

        Console.WriteLine(address.Sid);
    }
}
