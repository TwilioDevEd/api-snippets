// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio.Clients;
using Twilio.Resources.Preview.Sync.Service.SyncList;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var authToken = "your_auth_token";
    var client = new TwilioRestClient(accountSid, authToken);

    var items = SyncListItemResource.Read("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "MyCollection")
      .ByFrom("10")
      .ByDirection(SyncListItemResource.QueryDirection.FORWARD)
      .Execute(client);

    foreach (var item in items)
    {
      Console.WriteLine(item.GetData());
    }
  }
}