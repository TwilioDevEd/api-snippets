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

    // Look up pricing information for the UK
    var country = pricingClient.GetVoiceCountry("EE");
    // Print inbound call pricing for this country
    foreach (InboundCallPrice p in country.InboundCallPrices)
    {
        Console.WriteLine(p.NumberType);
        Console.WriteLine(p.CurrentPrice);
    } 
  }
}

