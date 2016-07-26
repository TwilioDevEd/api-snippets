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

    var data = new
    {
      Name = "Stephen Curry",
      Level = 30,
      Username = "spicy_curry"
    };

    var item = SyncMapItemResource.Create("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "Players", "steph_curry", JsonConvert.SerializeObject(data))
      .Execute(client);

    Console.WriteLine(item.GetSid());
  }
}