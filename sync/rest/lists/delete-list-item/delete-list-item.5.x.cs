// Download the next-gen twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio.Clients;
using Twilio.Rest.Preview.Sync.Service.SyncList;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    TwilioClient.Init(accountSid, authToken);

    SyncListItemResource.Delete(serviceSid, "MyCollection", 0);

    Console.WriteLine("Item Deleted");
  }
}