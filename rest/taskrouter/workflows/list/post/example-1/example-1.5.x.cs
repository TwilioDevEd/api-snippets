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
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        const string salesQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string marketingQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string supportQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string everyoneQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        // sales
        var salesRule = new {
            friendlyName = "Sales",
            expression = "type == 'sales'",
            targets = new List<object>() {
                new {
                    queue = salesQueue
                }
            }
        };

        // marketing
        var marketingRule = new {
            friendlyName = "Marketing",
            expression = "type == 'marketing'",
            targets = new List<object>() {
                new {
                    queue = marketingQueue
                }
            }
        };

        // support
        var supportRule = new {
            friendlyName = "Support",
            expression = "type == 'support'",
            targets = new List<object>() {
                new {
                    queue = supportQueue
                }
            }
        };

        var workflowConfiguration = new {
          filters = new List<object>() {
            salesRule,
            marketingRule,
            supportRule
          },
          default_filter = new {
            queue = everyoneQueue
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
