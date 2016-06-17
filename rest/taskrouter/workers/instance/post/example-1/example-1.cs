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
    string WorkerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    Worker worker = client.UpdateWorker(WorkspaceSid, WorkerSid, "", "{\"type\":\"support\"}", null);
    Console.WriteLine(worker.FriendlyName);
    Console.WriteLine(worker.Attributes);

    // update a worker attributes with a dictionary to map to json
    Dictionary<string,string> attributes = new Dictionary<string,string>();
    attributes.Add("type", "support");
    worker = client.UpdateWorker(WorkspaceSid, WorkerSid, attributes, null);
    Console.WriteLine(worker.FriendlyName);
    Console.WriteLine(worker.Attributes);
  }
}