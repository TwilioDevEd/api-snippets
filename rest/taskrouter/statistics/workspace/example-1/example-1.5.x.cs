// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using Newtonsoft.Json.Linq;
using System;
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

        TwilioClient.Init(accountSid, authToken);

        var stats = WorkspaceStatisticsResource.Fetch(workspaceSid);
        var cumulativeStats = JObject.FromObject(stats.Cumulative);

        Console.WriteLine(cumulativeStats["avg_task_acceptance_time"]);
        Console.WriteLine(cumulativeStats["tasks_entered"]);

        var tasksByStatus =
            JObject.FromObject(stats.Realtime)["tasks_by_status"].Value<JObject>();

        Console.WriteLine(tasksByStatus["pending"]);
        Console.WriteLine(tasksByStatus["assigned"]);
    }
}
