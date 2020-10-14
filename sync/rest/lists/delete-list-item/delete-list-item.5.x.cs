// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Clients;
using Twilio.Rest.Sync.V1.Service.SyncList;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    // To set up environmental variables, see http://twil.io/secure
    const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
    const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
    const string serviceSid = Environment.GetEnvironmentVariable("TWILIO_SERVICE_SID");

    TwilioClient.Init(accountSid, authToken);

    SyncListItemResource.Delete(serviceSid, "MyCollection", 0);

    Console.WriteLine("Item Deleted");
  }
}
