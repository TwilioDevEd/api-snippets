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

    Worker worker = client.UpdateWorker(WorkspaceSid, WorkerSid, null, "{\"type\":\"support\"}", null);
    Console.WriteLine(worker.FriendlyName);
    Console.WriteLine(worker.Attributes);

    // update a worker attributes with a dictionary to map to json
    Dictionary<string,string> attributes = new Dictionary<string,string>();
    attributes.Add("type", "support");
    worker = client.UpdateWorker(WorkspaceSid, TaskSid, attributes, null);
    Console.WriteLine(worker.FriendlyName);
    Console.WriteLine(worker.Attributes);
  }
}