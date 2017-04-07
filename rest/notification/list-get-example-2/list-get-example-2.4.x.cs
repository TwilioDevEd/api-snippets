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

    var notifications = twilio.ListNotifications(1, new DateTime(2009, 07, 06), null, null);
    
    foreach (var notification in notifications.Notifications)
    {
      Console.WriteLine(notification.MessageText);
    }
  }
}