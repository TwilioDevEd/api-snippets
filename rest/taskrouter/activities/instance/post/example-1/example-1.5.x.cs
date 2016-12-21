// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
   const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
   const string authToken = "your_auth_token";
   const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
   const string ActivitySid = "WAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    TwilioClient.Init(accountSid, authToken);

    Activity activity = client.UpdateActivity(workspaceSid, ActivitySid, "NewActivityName");
    Console.WriteLine(activity.FriendlyName);
    Console.WriteLine(activity.Available);
  }
}