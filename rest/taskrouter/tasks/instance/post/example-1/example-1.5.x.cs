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
        var task = TaskResource.Update(workspaceSid, taskSid, "{\"type\":\"support\"}", null, null, null);
        Console.WriteLine(task.Attributes);
        Console.WriteLine(task.Age);

        // update a task attributes with a dictionary to map to json
        Dictionary<string,string> attributes = new Dictionary<string,string>();
        attributes.Add("type", "support");

        // task = TaskResource.Update(workspaceSid, taskSid, attributes, null);
        // Console.WriteLine(task.Attributes);
        // Console.WriteLine(task.Age);
        //
        // // cancel a task
        // task = TaskResource.Update(workspaceSid, taskSid, null, null, TaskResource.StatusEnum.Canceled, "waiting too long");
        // Console.WriteLine(task.AssignmentStatus);
        // Console.WriteLine(task.Reason);
        //
        // // cancel a task #2
        // task = client.CancelTask(workspaceSid, taskSid, "waiting too long", TaskResource.StatusEnum.Canceled);
        // Console.WriteLine(task.AssignmentStatus);
        // Console.WriteLine(task.Reason);
    }
}
