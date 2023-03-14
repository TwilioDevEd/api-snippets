// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using Newtonsoft.Json.Linq;
using System;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace.TaskQueue;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string taskQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var stats = TaskQueueStatisticsResource.Fetch(
                        workspaceSid, taskQueueSid, DateTime.Now, 500);

        var cumulativeStats = JObject.FromObject(stats.Cumulative);

        Console.WriteLine(cumulativeStats["reservations_accepted"]);
    }
}
