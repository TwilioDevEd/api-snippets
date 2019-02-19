// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Messaging.V1;


class Example
{
    static void Main (string[] args)
    {
      // Find your Account SID and Auth Token at twilio.com/console
      const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      const string authToken = "your_auth_token";
      const string serviceFriendlyName = "My First Service";

      TwilioClient.Init(accountSid, authToken);

      var service = ServiceResource.Create(serviceFriendlyName);

      Console.WriteLine(service.Sid);
    }
}
