// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json;
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

    var data = new
    {
      DateUpdated = DateTime.UtcNow,
      MovieTitle = "On The Line",
      ShowTimes = (object)null,
      Starring = new[] { "Lance Bass", "Joey Fatone" },
      Genre = "Romance"
    };

    var doc = DocumentResource.Update(
      "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "MyFirstDocument",
      JsonConvert.SerializeObject(data))
      .Execute(client);

    Console.WriteLine(doc.GetData());
  }
}