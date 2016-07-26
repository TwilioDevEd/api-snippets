// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json;
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

    var data = new
    {
      Number = "001",
      Name = "Bulbasaur",
      Attack = 49
    };

    var item = SyncListItemResource.Create("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "MyCollection", JsonConvert.SerializeObject(data))
      .Execute(client);

    Console.WriteLine(item.GetIndex());
  }
}