// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Pricing;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC3094732a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var pricingClient = new PricingClient(AccountSid, AuthToken);

    // List countries where Twilio Phone Numbers are available
    var result = pricingClient.ListMessagingCountries();
    foreach (MessagingCountry c in result.Countries)
    {
        Console.WriteLine(c.IsoCountry);
    }
  }
}

