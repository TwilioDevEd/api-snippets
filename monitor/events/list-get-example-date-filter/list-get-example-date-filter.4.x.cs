// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Monitor;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    var monitor = new MonitorClient(AccountSid, AuthToken);

    var options = new EventListRequest();
    options.StartDate = new DateTime(2015, 3, 1);
    options.EndDate = new DateTime(2015, 4, 1);
    var events = monitor.ListEvents(options);
    foreach (var e in events.Events)
    {
      Console.WriteLine(e.Description);
    }
  }
}

