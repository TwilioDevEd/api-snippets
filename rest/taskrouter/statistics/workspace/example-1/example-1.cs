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
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    WorkspaceStatistics stats = client.GetWorkspaceStatistics(WorkspaceSid);
    Console.WriteLine(stats.Cumulative.AvgTaskAcceptanceTime);
    Console.WriteLine(stats.Cumulative.TasksCreated);
    Console.WriteLine(stats.Realtime.TasksByStatus.Pending);
    Console.WriteLine(stats.Realtime.TasksByStatus.Assigned);
  }
}