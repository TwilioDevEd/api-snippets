// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var records = twilio.ListUsage("calls-inbound", null, new DateTime(2012, 09, 01), new DateTime(2012, 09, 30), null, null);
    
    foreach (var record in records.UsageRecords)
    {
      Console.WriteLine(record.Price);
    }
  }
}