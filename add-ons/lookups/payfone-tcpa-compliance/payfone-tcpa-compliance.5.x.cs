// Download the C# helper library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Lookups.V1;
using Twilio.Types;

namespace Example
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            // Get your Account SID and Auth Token from twilio.com/console
            const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            const string authToken = "your_auth_token";

            TwilioClient.Init(accountSid, authToken);

            var addOns = new List<string> { "payfone_tcpa_compliance" };
            var addOnsData = new Dictionary<string, object>
            {
                { "payfone_tcpa_compliance.RightPartyContactedDate", "20160101" }
            };

            var phoneNumberFetcher =
                PhoneNumberResource.Fetcher(new PhoneNumber("+16502530000"));
            phoneNumberFetcher.addOns = addOns;
            phoneNumberFetcher.addOnsData = addOnsData;

            var number = phoneNumberFetcher.Fetch();
            Console.WriteLine(number.addOns);
        }
    }
}
