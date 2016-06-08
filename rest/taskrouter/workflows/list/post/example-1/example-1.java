// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Activity;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    //Construct a workflow
    List<WorkflowRule> rules = new ArrayList<WorkflowRule>();

    String salesQueueSid = "YourSalesQueueSid";
    String marketingQueueSid = "YourMarketingQueueSid";
    String supportQueueSid = "YourSupportQueueSid";
    String defaultQueue = "YourDefaultQueueSid";

    // sales
    List<WorkflowRuleTarget> salesTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget salesTarget = new WorkflowRuleTarget(salesQueueSid, null, null, null);
    salesTargets.add(salesTarget);
    WorkflowRule salesRule = new WorkflowRule("type == \"sales\"", salesTargets);

    // marketing
    List<WorkflowRuleTarget> marketingTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget marketingTarget = new WorkflowRuleTarget(marketingQueueSid, null, null, null);
    marketingTargets.add(marketingTarget);
    WorkflowRule marketingRule = new WorkflowRule("type == \"marketing\"", marketingTargets);

    // support
    List<WorkflowRuleTarget> supportTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget supportTarget = new WorkflowRuleTarget(supportQueueSid, null, null, null);
    supportTargets.add(supportTarget);
    WorkflowRule supportRule = new WorkflowRule("type == \"support\"", supportTargets);

    // default filter
    WorkflowRuleTarget defaultTarget = new WorkflowRuleTarget(defaultQueue);

    // put rules together in order in which the workflow should process them
    rules.add(salesRule);
    rules.add(marketingRule);
    rules.add(supportRule);

    // build workflow & convert to json
    WorkflowConfiguration config = new WorkflowConfiguration(rules, defaultTarget);
    String workflowJSON = config.toJSON();

    Map<String, String> params = new HashMap<String, String>();
    params.put("Configuration", workflowJSON);
    params.put("FriendlyName", "Sales, Marketing, Support Workflow");
    params.put("AssignmentCallbackUrl", "http://example.com");
    params.put("FallbackAssignmentCallbackUrl", "http://example2.com");
    params.put("TaskReservationTimeout", "30");
    Workflow workflow = workspace.createWorkflow(params);
    return workflow;

  }
}