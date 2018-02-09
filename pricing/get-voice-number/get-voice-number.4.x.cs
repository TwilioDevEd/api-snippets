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

    // Look up pricing information for calls to/from a specific number
    var number = pricingClient.GetVoiceNumber("+15108675310");
    Console.WriteLine(number.OutboundCallPrice.CurrentPrice);
  }
}

