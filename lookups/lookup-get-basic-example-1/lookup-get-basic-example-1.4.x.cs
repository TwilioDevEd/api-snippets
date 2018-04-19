// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Lookups;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    var lookupsClient = new LookupsClient(accountSid, authToken);

    // Look up a phone number in E.164 format
    var phoneNumber = lookupsClient.GetPhoneNumber("+15108675310", true);
    Console.WriteLine(phoneNumber.Carrier.Type);
    Console.WriteLine(phoneNumber.Carrier.Name);
  }
}