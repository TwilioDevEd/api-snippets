// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Lookups.V1;
using Twilio.Types;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var addOns = new List<string> { "payfone_tcpa_compliance" };
        var addOnsData = new Dictionary<string, object>
        {
            { "payfone_tcpa_compliance.RightPartyContactedDate", "20160101" }
        };

        var phoneNumber = PhoneNumberResource.Fetch(
            new PhoneNumber("+16502530000"),
            addOns: addOns,
            addOnsData: addOnsData);

        Console.WriteLine(phoneNumber.Carrier);
    }
}
