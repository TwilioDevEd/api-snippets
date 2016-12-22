// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net;
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

        const string salesQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string marketingQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string supportQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string everyoneQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        // sales
        var salesRule = new {
            FriendlyName = "Sales",
            Expression = "type == 'sales'",
            Targets = new List<object>() {
                new {
                    Queue = salesQueue
                }
            }
        };

        // marketing
        var marketingRule = new {
            FriendlyName = "Marketing",
            Expression = "type == 'marketing'",
            Targets = new List<object>() {
                new {
                    Queue = marketingQueue
                }
            }
        };

        // support
        var supportRule = new {
            FriendlyName = "Support",
            Expression = "type == 'support'",
            Targets = new List<object>() {
                new {
                    Queue = supportQueue
                }
            }
        };

        var workflowConfiguration = new {
          Filters = new List<object>() {
            salesRule,
            marketingRule,
            supportRule
          },
          DefaultFilter = new {
            Queue = everyoneQueue
          }
        };

        // convert to json
        var workflowJSON = JObject.FromObject(workflowConfiguration).ToString();

        // call rest api
        var workflow = WorkflowResource.Create(workspaceSid,
            "Sales, Marketing, Support Workflow", workflowJSON,
            new Uri("http://example.com"), new Uri("http://example2.com"), 30);

        Console.WriteLine(workflow.FriendlyName);
    }
}
