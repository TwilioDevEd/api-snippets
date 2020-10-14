// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Messaging.V1.Service;


class Example
{
  static void Main(string[] args)
  {
    // Find your Account SID and Auth Token at twilio.com/console
    // To set up environmental variables, see http://twil.io/secure
    const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
    const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
    const string pathServiceSid = "MG2172dd2db502e20dd981ef0d67850e1a";

    var phoneNumberSids = new List<string> {
      "PN2a0747eba6abf96b7e3c3ff0b4530f6e",
      "PN557ce644e5ab84fa21cc21112e22c485",
      "PN2a0747eba6abf96b7e3c3ff0b4530f6e"
    };

    TwilioClient.Init(accountSid, authToken);

    foreach(var phoneNumberSid in phoneNumberSids)
    {
        var phoneNumber = PhoneNumberResource.Create(pathServiceSid, phoneNumberSid);
        Console.WriteLine(phoneNumber.Sid);
    }
  }
}
