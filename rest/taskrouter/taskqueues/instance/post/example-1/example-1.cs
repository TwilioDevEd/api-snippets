// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string TaskQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    TaskQueue taskQueue = client.UpdateTaskQueue(WorkspaceSid, TaskQueueSid, null, null, null, "languages HAS 'english'", 100);
    Console.WriteLine(taskQueue.FriendlyName);
    Console.WriteLine(taskQueue.TargetWorkers);
  }
}