// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Lookups.V1;
using Twilio.Types;
using Twilio.Exceptions;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        try {
          // Look up a phone number in E.164 format
          var phoneNumber = PhoneNumberResource.Fetch(
              new PhoneNumber("+15108675310"),
              type: new List<string> { "carrier" });

          Console.WriteLine(phoneNumber.Carrier["name"]);
          Console.WriteLine(phoneNumber.Carrier["type"]);
        } catch (ApiException e) {
          if (e.Status == 404) {
            Console.WriteLine("No carrier information");
          } else {
            Console.WriteLine(e.ToString());
          }
        }
    }
}
