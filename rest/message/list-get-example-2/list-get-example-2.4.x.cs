// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var request = new MessageListRequest
    {
      To = "+15558675310",
      From = "+15017122661",
      DateSent = new DateTime(2016, 8, 31),
      DateSentComparison = ComparisonType.GreaterThanOrEqualTo
    };
    
    var messages = twilio.ListMessages(request);
    
    foreach (var message in messages.Messages)
    {
      Console.WriteLine(message.Body);
    }
  }
}
