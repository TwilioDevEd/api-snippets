// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var address = AddressResource.Create("Customer 123",
                                         "2 Hasselhoff Lane",
                                         "Berlin",
                                         "Berlin",
                                         "10785",
                                         "DE",
                                         friendlyName: "Billing - Customer 123");

    Console.WriteLine(address.Sid);
  }
}
