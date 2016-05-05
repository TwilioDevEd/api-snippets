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
    string WorkspaceSid = "{{ workspace_sid }}";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    TaskQueue taskQueue = client.AddTaskQueue (WorkspaceSid, "English", "WAxxxx", "WAyyyy", "languages HAS 'english'", null);
    Console.WriteLine(taskQueue.FriendlyName);
  }
}