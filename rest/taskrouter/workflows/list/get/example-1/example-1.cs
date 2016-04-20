// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{ account_sid }}";
    string AuthToken = "{{ auth_token }}";
    string WorkspaceSid = "{{ workspace_sid }}";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    WorkflowResult workflowResult = client.ListWorkflows(WorkspaceSid);
    foreach(Workflow workflow in workflowResult.Workflows) {
        Console.WriteLine(workflow.FriendlyName);
    }
  }
}