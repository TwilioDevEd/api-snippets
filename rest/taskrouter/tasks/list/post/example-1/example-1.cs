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
    string WorkflowSid = "WFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    Task task = client.AddTask(WorkspaceSid, "{\"type\":\"support\"}", WorkflowSid, null);
    Console.WriteLine(task.Attributes);

    // create a task with a dictionary to map to json
    Dictionary<string,string> attributes = new Dictionary<string,string>();
    attributes.Add("type", "support");
    Task task = client.AddTask(WorkspaceSid, taskAttributes, WorkflowSid, null);
    Console.WriteLine(task.ParseAttributes()['type']);
  }
}