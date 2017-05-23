// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Messaging.V1.Service;


class Example
{
    static void Main (string[] args)
    {
      // Find your Account SID and Auth Token at twilio.com/console
      const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      const string authToken = "your_auth_token";
      const string pathServiceSid = "MG2172dd2db502e20dd981ef0d67850e1a";
      const string phoneNumberSid = "PN557ce644e5ab84fa21cc21112e22c485";

      TwilioClient.Init(accountSid, authToken);

      var phoneNumber = PhoneNumberResource.Create(pathServiceSid, phoneNumberSid);

      Console.WriteLine(phoneNumber.Sid);

    }
}
