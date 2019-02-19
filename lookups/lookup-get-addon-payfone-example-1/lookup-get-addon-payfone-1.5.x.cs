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
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

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
