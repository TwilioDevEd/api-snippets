// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
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
        const string taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        // update a task's attributes
        var task = TaskResource.Update(workspaceSid, taskSid, "{\"type\":\"support\"}");
        Console.WriteLine(task.Attributes);
        Console.WriteLine(task.Age);

        // update a task attributes
        var attributes = JObject.FromObject(task.Attributes);
        attributes["type"] = "support";

        task = TaskResource.Update(workspaceSid, taskSid, attributes.ToString());
        Console.WriteLine(task.Attributes);
        Console.WriteLine(task.Age);

        // cancel a task
        task = TaskResource.Update(workspaceSid, taskSid, null, TaskResource.StatusEnum.Canceled, "waiting too long");
        Console.WriteLine(task.AssignmentStatus);
        Console.WriteLine(task.Reason);

        // cancel a task #2
        task = TaskResource.Update(workspaceSid, taskSid, null, TaskResource.StatusEnum.Canceled, "waiting too long");
        Console.WriteLine(task.AssignmentStatus);
        Console.WriteLine(task.Reason);
    }
}
