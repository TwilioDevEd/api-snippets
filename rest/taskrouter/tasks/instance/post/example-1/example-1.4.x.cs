// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using System.Collections.Generic;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string TaskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    // update a task's attributes
    Task task = client.UpdateTask(WorkspaceSid, TaskSid, "{\"type\":\"support\"}", null, null, null);
    Console.WriteLine(task.Attributes);
    Console.WriteLine(task.Age);

    // update a task attributes with a dictionary to map to json
    Dictionary<string,string> attributes = new Dictionary<string,string>();
    attributes.Add("type", "support");
    task = client.UpdateTask(WorkspaceSid, TaskSid, attributes, null);
    Console.WriteLine(task.Attributes);
    Console.WriteLine(task.Age);

    // cancel a task
    task = client.UpdateTask(WorkspaceSid, TaskSid, null, null, "canceled", "waiting too long");
    Console.WriteLine(task.AssignmentStatus);
    Console.WriteLine(task.Reason);

    // cancel a task #2
    task = client.CancelTask(WorkspaceSid, TaskSid, "waiting too long");
    Console.WriteLine(task.AssignmentStatus);
    Console.WriteLine(task.Reason);
  }
}