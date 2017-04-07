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

    Workspace workspace = client.UpdateWorkspace(WorkspaceSid, "NewFriendlyName", "http://requestb.in/vh9reovh", null, null);
    Console.WriteLine(workspace.FriendlyName);
    Console.WriteLine(workspace.EventCallbackUrl);
  }
}