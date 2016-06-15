// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new AddressOptions();
    options.CustomerName = "Customer 456";
    options.Street = "2 Hasselhoff Lane";

    var address = twilio.AddAddress("Billing - Customer 123", "Customer 123", "2 Hasselhoff Lane", "Berlin", "Berlin", "10785", "DE");

    Console.WriteLine(address.Sid);
  }
}
