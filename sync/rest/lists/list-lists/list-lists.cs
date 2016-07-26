// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio.Clients;
using Twilio.Resources.Preview.Sync.Service;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var authToken = "your_auth_token";
    var client = new TwilioRestClient(accountSid, authToken);

    var lists = SyncListResource.Read("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      .Execute(client);

    foreach (var list in lists)
    {
      Console.WriteLine($"{list.GetSid()}: {list.GetUniqueName()}");
    }
  }
}