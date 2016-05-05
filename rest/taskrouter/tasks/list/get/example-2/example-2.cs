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

    TaskListRequest filters = new TaskListRequest();
    filters.TaskQueueSid = "WQf855e98ad280d0a0a325628e24ca9627";
    TaskResult taskResult = client.ListTasks(WorkspaceSid, filters);
    foreach(Task task in taskResult.Tasks) {
        Console.WriteLine(task.Attributes);
    }

    filters = new TaskListRequest();
    filters.AssignmentStatus = "pending";
    TaskResult taskResult = client.ListTasks(WorkspaceSid, filters);
    foreach(Task task in taskResult.Tasks) {
        Console.WriteLine(task.Attributes);
    }
  }
}