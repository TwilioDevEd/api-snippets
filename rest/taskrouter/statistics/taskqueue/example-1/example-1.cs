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
    string TaskQueueSid = "{{ taskqueue_sid }}";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    TaskQueueStatistics stats = client.GetTaskQueueStatistics(WorkspaceSid, TaskQueueSid);
    Console.WriteLine(stats.Cumulative.ReservationsAccepted);
  }
}