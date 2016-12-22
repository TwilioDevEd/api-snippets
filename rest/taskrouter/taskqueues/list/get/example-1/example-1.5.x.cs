// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var taskQueues = TaskQueueResource.Read(workspaceSid);
        
        foreach(var taskQueue in taskQueues) {
            Console.WriteLine(taskQueue.FriendlyName);
        }
    }
}
