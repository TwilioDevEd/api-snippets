// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Pricing;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "{{ auth_token }}";
    var pricingClient = new PricingClient(accountSid, authToken);

    // Look up pricing information for the UK
    var country = pricingClient.GetMessagingCountry("EE");
    // Print inbound call pricing for this country
    foreach (InboundSmsPrice p in country.InboundSmsPrices)
    {
        Console.WriteLine(p.NumberType);
        Console.WriteLine(p.CurrentPrice);
    } 
  }
}

