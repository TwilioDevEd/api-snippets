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

    TaskRouterWorkspaceCapability capability = new TaskRouterWorkspaceCapability(AccountSid, AuthToken, WorkspaceSid);
    capability.AllowFetchSubresources();
    capability.AllowUpdatesSubresources();
    capability.AllowDeletesSubresources();
    var token = capability.GenerateToken();

    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:

    token = capability.GenerateToken(28800);  // 60 * 60 * 8
  }
}