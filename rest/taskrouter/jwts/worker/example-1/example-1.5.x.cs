// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.JWT;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string workerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        var capability = new TaskRouterWorkerCapability(
                             accountSid, authToken, workspaceSid, workerSid);

        capability.AllowUpdatesSubresources();

        var token = capability.GenerateToken();
        // By default, tokens are good for one hour.
        // Override this default timeout by specifiying a new value (in seconds).
        // For example, to generate a token good for 8 hours:
        token = capability.GenerateToken(28800);  // 60 * 60 * 8
    }
}
