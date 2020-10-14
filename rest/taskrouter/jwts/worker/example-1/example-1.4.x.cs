// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    // To set up environmental variables, see http://twil.io/secure
    string AccountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
    string AuthToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string WorkerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    TaskRouterWorkerCapability capability = new TaskRouterWorkerCapability(AccountSid, AuthToken, WorkspaceSid, WorkerSid);
    capability.AllowFetchSubresources();
    capability.AllowActivityUpdates();
    capability.AllowReservationUpdates();
    var token = capability.GenerateToken();

    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:

    token = capability.GenerateToken(28800);  // 60 * 60 * 8
  }
}
