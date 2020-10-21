// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Net;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string taskQueueSid = "WQf855e98ad280d0a0a325628e24ca9627";

        TwilioClient.Init(accountSid, authToken);

        var workers = WorkerResource.Read(workspaceSid, taskQueueSid);
        foreach(var worker in workers) {
            Console.WriteLine(worker.FriendlyName);
        }

        workers = WorkerResource.Read(
            workspaceSid, taskQueueSid,
            targetWorkersExpression: "type == 'leads'");

        foreach(var worker in workers) {
            Console.WriteLine(worker.FriendlyName);
        }
    }
}
