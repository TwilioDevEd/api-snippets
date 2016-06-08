// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    string salesQueue = "WQxxxx";
    string marketingQueue = "WQxxxx";
    string supportQueue = "WQxxxx";
    string everyoneQueue = "WQxxxx";

    var client = new TaskRouterClient(AccountSid, AuthToken);

    // sales
    var salesRule = new WorkflowRule
    {
        FriendlyName = "Sales",
        Expression = "type == 'sales'",
        Targets = new List<WorkflowRuleTarget>() {
            new WorkflowTarget {
                Queue = salesQueue
            }
        }
    };

    // marketing
    var marketingRule = new WorkflowRule
    {
        FriendlyName = "Marketing",
        Expression = "type == 'marketing'",
        Targets = new List<WorkflowRuleTarget>() {
            new WorkflowTarget {
                Queue = marketingQueue
            }
        }
    }

    // support
    var supportRule = new WorkflowRule
    {
        FriendlyName = "Support",
        Expression = "type == 'support'",
        Targets = new List<WorkflowRuleTarget>() {
            new WorkflowTarget {
                Queue = supportQueue
            }
        }
    }

    workFlowConfiguration.Filters.Add(salesRule);
    workFlowConfiguration.Filters.Add(marketingRule);
    workFlowConfiguration.Filters.Add(supportRule);
    workFlowConfiguration.DefaultFilter = new WorkflowTarget() { Queue = everyoneQueue };

    // convert to json
    var workflowJSON = config.ToString();

    // call rest api
    Workflow workflow = client.AddWorkflow(WorkspaceSid, "Sales, Marketing, Support Workflow", workflowJSON, "http://example.com", "http://example2.com", 30);
    Console.WriteLine(workflow.FriendlyName);
  }
}