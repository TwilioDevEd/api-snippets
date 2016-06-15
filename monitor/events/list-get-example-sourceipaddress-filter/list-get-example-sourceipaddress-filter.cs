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
    options.SourceIpAddress = "104.14.155.29";
    options.StartDate = new DateTime(2015, 4, 25);
    options.EndDate = new DateTime(2015, 4, 25, 23, 59, 59);
    var events = monitor.ListEvents(options);
    foreach (var e in events.Events)
    {
      Console.WriteLine(e.Description);
    }
  }
}

