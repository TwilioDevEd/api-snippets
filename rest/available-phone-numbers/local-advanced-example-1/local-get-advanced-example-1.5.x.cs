// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using System.Collections.Generic;
using Twilio.Rest.Api.V2010.Account.AvailablePhoneNumberCountry;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var nearLatLong = "37.840699,-122.461853";
    var localResourceResultSet = LocalResource.Read("US",
                                                    nearLatLong: nearLatLong,
                                                    distance: 50,
                                                    contains: "555",
                                                    inRegion: "CA");

    var localResourceEnumerator = localResourceResultSet.GetEnumerator();
    if (localResourceEnumerator.MoveNext()) {
        var availableNumber = localResourceEnumerator.Current.PhoneNumber;
        var incomingPhoneNumber = IncomingPhoneNumberResource.Create(phoneNumber: availableNumber);
        Console.WriteLine(incomingPhoneNumber.Sid);
    }
  }
}
