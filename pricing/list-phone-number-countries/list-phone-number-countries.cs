// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Pricing;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account 
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    var pricingClient = new PricingClient(accountSid, authToken);

    // List countries where Twilio Phone Numbers are available
    var result = pricingClient.ListPhoneNumberCountries();
    foreach (PhoneNumberCountry c in result.Countries)
    {
        Console.WriteLine(c.IsoCountry);
    }
  }
}

