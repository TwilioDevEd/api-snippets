// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var messageDate = new DateTime(2009, 07, 06);
    var notifications = NotificationResource.Read(log: 1,
                                                  messageDate: messageDate);

    foreach (var notification in notifications)
    {
      Console.WriteLine(notification.MessageText);
    }
  }
}
