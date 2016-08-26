// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio.Lookups;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    var lookupsClient = new LookupsClient(accountSid, authToken);

    var phoneNumber = lookupsClient.GetPhoneNumber("+4402077651182", false);

    Console.WriteLine(phoneNumber.NationalFormat);
  }
}
