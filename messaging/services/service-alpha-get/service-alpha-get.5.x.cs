// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Messaging.V1.Service;


class Example
{
    static void Main (string[] args)
    {
      // Find your Account SID and Auth Token at twilio.com/console
      // To set up environmental variables, see http://twil.io/secure
      const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
      const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
      const string pathServiceSid = "MG2172dd2db502e20dd981ef0d67850e1a";
      const string alphaSenderSid = "AIc781610ec0b3400c9e0cab8e757da937";

      TwilioClient.Init(accountSid, authToken);

      var alphaSender = AlphaSenderResource.Fetch(pathServiceSid, alphaSenderSid);

      Console.WriteLine(alphaSender.AlphaSender);
    }
}
