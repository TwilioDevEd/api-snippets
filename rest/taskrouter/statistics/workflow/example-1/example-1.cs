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
    string WorkflowSid = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    WorkflowStatistics stats = client.GetWorkflowStatistics(WorkspaceSid, WorkflowSid);
    Console.WriteLine(stats.Cumulative.AvgTaskAcceptanceTime);
    Console.WriteLine(stats.Cumulative.TasksEntered);
    Console.WriteLine(stats.Realtime.TasksByStatus.Pending);
    Console.WriteLine(stats.Realtime.TasksByStatus.Assigned);
  }
}