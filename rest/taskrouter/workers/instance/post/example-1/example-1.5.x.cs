// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using Newtonsoft.Json.Linq;
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
        const string WorkerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var worker = WorkerResource.Update(
            workspaceSid, WorkerSid, attributes: "{\"type\":\"support\"}");

        Console.WriteLine(worker.FriendlyName);
        Console.WriteLine(worker.Attributes);

        var attributes = JObject.Parse(worker.Attributes);
        attributes["type"] = "support";

        worker = WorkerResource.Update(workspaceSid, WorkerSid, attributes.ToString());

        Console.WriteLine(worker.FriendlyName);
        Console.WriteLine(worker.Attributes);
    }
}
