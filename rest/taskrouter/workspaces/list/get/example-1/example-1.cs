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

    WorkspaceResult workspaceResult = client.ListWorkspaces();
    foreach(Workspace workspace in workspaceResult.Workspaces) {
        Console.WriteLine(workspace.FriendlyName);
    }
  }
}