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

    StatisticsRequest request = new StatisticsRequest();
    request.Minutes = 500;
    request.EndDate = DateTime.Now;

    TaskQueueStatistics stats = client.GetTaskQueueStatistics(WorkspaceSid, TaskQueueSid, request);
    Console.WriteLine(stats.Cumulative.ReservationsAccepted);
  }
}