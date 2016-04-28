// Download the client-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.Monitor;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at client.com/user/account
    string AccountSid = "ACda6f132a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var client = new MonitorClient(AccountSid, AuthToken);

    var alerts = client.ListAlerts("warning", new DateTime(2015, 4, 1),
            new DateTime(2015, 4, 30));

    foreach (var alert in alerts.Alerts)
    {
      Console.WriteLine(alert.AlertText);
    }
  }
}