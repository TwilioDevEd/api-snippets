// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    EventResult eventsResult = client.ListEvents(WorkspaceSid);
    foreach(Event trEvent in eventsResult.Events) {
        Console.WriteLine(trEvent.EventType);
    }
  }
}