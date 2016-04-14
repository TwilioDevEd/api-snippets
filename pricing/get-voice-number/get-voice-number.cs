// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Pricing;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    const string accountSid = "AC3094732a3c49700934481addd5ce1659";
    const string authToken = "{{ auth_token }}";
    var pricingClient = new PricingClient(accountSid, authToken);

    // Look up pricing information for calls to/from a specific number
    var number = pricingClient.GetVoiceNumber("+15108675309");
    Console.WriteLine(number.OutboundCallPrice.CurrentPrice);
  }
}

