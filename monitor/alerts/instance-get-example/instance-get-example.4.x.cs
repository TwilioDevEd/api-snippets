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
    var client = new MonitorClient(AccountSid, AuthToken);

    var alert = client.GetAlert("NO5a7a84730f529f0a76b3e30c01315d1a");

    Console.WriteLine(alert.AlertText);
  }
}