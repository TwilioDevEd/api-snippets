// Download the twilio-csharp library from https://www.twilio.com/docs/libraries/csharp#installation
using Newtonsoft.Json.Linq;
using System;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace.Workflow;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string WorkflowSid = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var stats = WorkflowStatisticsResource.Fetch(workspaceSid, WorkflowSid);

        var cumulativeStats = JObject.FromObject(stats.Cumulative);

        Console.WriteLine(cumulativeStats["avg_task_acceptance_time"]);
        Console.WriteLine(cumulativeStats["tasks_entered"]);

        var taskByStatusStats = JObject.FromObject(stats.Realtime)["tasks_by_status"];

        Console.WriteLine(taskByStatusStats["pending"]);
        Console.WriteLine(taskByStatusStats["assigned"]);
    }
}
