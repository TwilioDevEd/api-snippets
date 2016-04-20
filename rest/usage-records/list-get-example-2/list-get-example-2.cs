// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACed732a3c49700934481addd5ce1659f0";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var records = twilio.ListUsage("calls", "Today", null, null, null, null);
    
    foreach (var record in records.UsageRecords)
    {
      Console.WriteLine(record.Count);
    }
  }
}