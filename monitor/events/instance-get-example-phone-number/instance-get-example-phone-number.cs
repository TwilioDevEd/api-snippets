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

    var e = monitor.GetEvent("AE21f24380625e4aa4abec76e39b14458d");
    Console.WriteLine(e.Description);
  }
}

