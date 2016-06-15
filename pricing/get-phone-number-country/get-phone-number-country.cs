// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Pricing;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    var pricingClient = new PricingClient(accountSid, authToken);

    // Look up pricing information for the US
    var country = pricingClient.GetPhoneNumberCountry("US");
    // Print number pricing for this country
    foreach (PhoneNumberPrice p in country.PhoneNumberPrices)
    {
        Console.WriteLine(p.NumberType);
        Console.WriteLine(p.CurrentPrice);
    } 
  }
}

