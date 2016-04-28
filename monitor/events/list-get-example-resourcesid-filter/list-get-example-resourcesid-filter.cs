// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Monitor;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC3094732a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var monitor = new MonitorClient(AccountSid, AuthToken);

    var options = new EventListRequest();
    options.ResourceSid = "PN4aa51b930717ea83c91971b86d99018f";
    var events = monitor.ListEvents(options);
    foreach (var e in events.Events)
    {
      Console.WriteLine(e.Description);
    }
  }
}

