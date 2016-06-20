// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.lang.Exception;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.resource.instance.taskrouter.Workflow;
import com.twilio.sdk.taskrouter.WorkflowRule;
import com.twilio.sdk.taskrouter.WorkflowRuleTarget;
import com.twilio.sdk.taskrouter.WorkflowConfiguration;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws Exception {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Workspace workspace = client.getWorkspace(WORKSPACE_SID);

    //Construct a workflow
    List<WorkflowRule> rules = new ArrayList<WorkflowRule>();

    String salesQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String marketingQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String supportQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String defaultQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    // sales
    List<WorkflowRuleTarget> salesTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget salesTarget = new WorkflowRuleTarget(salesQueueSid);
    salesTargets.add(salesTarget);
    WorkflowRule salesRule = new WorkflowRule("type == \"sales\"", salesTargets);

    // marketing
    List<WorkflowRuleTarget> marketingTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget marketingTarget = new WorkflowRuleTarget(marketingQueueSid);
    marketingTargets.add(marketingTarget);
    WorkflowRule marketingRule = new WorkflowRule("type == \"marketing\"", marketingTargets);

    // support
    List<WorkflowRuleTarget> supportTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget supportTarget = new WorkflowRuleTarget(supportQueueSid);
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

    Map<String, String> workflowParams = new HashMap<String, String>();
    workflowParams.put("Configuration", workflowJSON);
    workflowParams.put("FriendlyName", "Sales, Marketing, Support Workflow");
    workflowParams.put("AssignmentCallbackUrl", "http://example.com");
    workflowParams.put("FallbackAssignmentCallbackUrl", "http://example2.com");
    workflowParams.put("TaskReservationTimeout", "30");
    Workflow workflow = workspace.createWorkflow(workflowParams);
  }
}