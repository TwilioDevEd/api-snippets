// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json;
using Twilio.Clients;
using Twilio.Resources.Preview.Sync.Service.SyncMap;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var authToken = "your_auth_token";
    var client = new TwilioRestClient(accountSid, authToken);

    var items = SyncMapItemResource.Read("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "Players")
      .ByFrom("steph_curry")
      .ByOrder(SyncMapItemResource.QueryResultOrder.ASC)
      .Execute(client);

    foreach (var item in items)
    {
      Console.WriteLine($"{item.GetKey()} = {item.GetData()}");
    }
  }
}