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
    var client = new TaskRouterClient(AccountSid, AuthToken);

    Worker worker = client.AddWorker(WorkspaceSid, "Support Worker 1", null, "{\"type\":\"support\"}");
    Console.WriteLine(worker.FriendlyName);

    // create a worker with a dictionary to map to json
    Dictionary<string,string> attributes = new Dictionary<string,string>();
    attributes.Add("type", "support");
    worker = client.AddWorker(WorkspaceSid, "Support Worker 1", null, attributes);
    Console.WriteLine(worker.FriendlyName);
  }
}