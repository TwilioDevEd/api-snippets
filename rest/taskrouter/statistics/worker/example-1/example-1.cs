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
    string WorkerSid = "{{ worker_sid }}";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    WorkerStatistics stats = client.GetWorkerStatistics(WorkspaceSid, WorkerSid);
    Console.WriteLine(stats.Cumulative.ReservationsAccepted);
  }
}