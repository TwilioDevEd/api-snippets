// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using System.Collections.Generic;
using Twilio.Rest.Api.V2010.Account.AvailablePhoneNumberCountry;
using System.Linq;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        const string nearLatLong = "37.840699,-122.461853";
        var localAvailableNumbers = LocalResource.Read("US",
                                                      nearLatLong: nearLatLong,
                                                      distance: 50,
                                                      contains: "555",
                                                      inRegion: "CA");

        var firstNumber = localAvailableNumbers.First();
        var incomingPhoneNumber = IncomingPhoneNumberResource.Create(
            phoneNumber: firstNumber.PhoneNumber);
        Console.WriteLine(incomingPhoneNumber.Sid);
    }
}
