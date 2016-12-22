// Download the twilio-csharp library from twilio.com/docs/csharp/install
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
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    const string nearLatLong = "37.840699,-122.461853";
    var localAvailableNumber = LocalResource.Read("US",
                                                  nearLatLong: nearLatLong,
                                                  distance: 50,
                                                  contains: "555",
                                                  inRegion: "CA");

    var firstNumber = localAvailableNumber.FirstOrDefault();
    if (firstNumber != null) {
        var incomingPhoneNumber = IncomingPhoneNumberResource.Create(
          phoneNumber: firstNumber.PhoneNumber);
        Console.WriteLine(incomingPhoneNumber.Sid);
    }
  }
}
