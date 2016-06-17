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
    var client = new TaskRouterClient(AccountSid, AuthToken);

    WorkerListRequest filters = new WorkerListRequest();
    filters.TaskQueueSid = "WQf855e98ad280d0a0a325628e24ca9627";
    WorkerResult workerResult = client.ListWorkers(WorkspaceSid, filters);
    foreach(Worker worker in workerResult.Workers) {
        Console.WriteLine(worker.FriendlyName);
    }

    filters = new WorkerListRequest();
    filters.TargetWorkersExpression = "type == 'leads'";
    workerResult = client.ListWorkers(WorkspaceSid, filters);
    foreach(Worker worker in workerResult.Workers) {
        Console.WriteLine(worker.FriendlyName);
    }
  }
}