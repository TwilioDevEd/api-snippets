// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using System.Collections.Generic;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    string salesQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string marketingQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string supportQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string everyoneQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    var client = new TaskRouterClient(AccountSid, AuthToken);

    // sales
    var salesRule = new Filter()
    {
        FriendlyName = "Sales",
        Expression = "type == 'sales'",
        Targets = new List<Target>() {
            new Target {
                Queue = salesQueue
            }
        }
    };

    // marketing
    var marketingRule = new Filter()
    {
        FriendlyName = "Marketing",
        Expression = "type == 'marketing'",
        Targets = new List<Target>() {
            new Target {
                Queue = marketingQueue
            }
        }
    };

    // support
    var supportRule = new Filter
    {
        FriendlyName = "Support",
        Expression = "type == 'support'",
        Targets = new List<Target>() {
            new Target {
                Queue = supportQueue
            }
        }
    };

    var workflowConfiguration = new WorkflowConfiguration();

    workflowConfiguration.Filters.Add(salesRule);
    workflowConfiguration.Filters.Add(marketingRule);
    workflowConfiguration.Filters.Add(supportRule);
    workflowConfiguration.DefaultFilter = new Target() { Queue = everyoneQueue };

    // convert to json
    var workflowJSON = workflowConfiguration.ToString();

    // call rest api
    Workflow workflow = client.AddWorkflow(WorkspaceSid, "Sales, Marketing, Support Workflow", workflowJSON, "http://example.com", "http://example2.com", 30);
    Console.WriteLine(workflow.FriendlyName);
  }
}