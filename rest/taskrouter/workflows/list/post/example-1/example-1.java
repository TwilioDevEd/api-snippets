//Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Workflow;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.taskrouter.WorkflowConfiguration;
import com.twilio.sdk.taskrouter.WorkflowRule;
import com.twilio.sdk.taskrouter.WorkflowRuleTarget;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.util.ArrayList;

public class CreateWorkflow { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

    public static void main(String[] args) throws TwilioRestException, IOException, Exception {
        TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

        Workspace workspace = client.getWorkspace(WORKSPACE_SID);

        // Construct a workflow
        List<WorkflowRule> rules = new ArrayList<WorkflowRule>();

        String salesQueueSid = "WQ09a6cafb64290711064322147e209a12";
        String marketingQueueSid = "WQ18856a16c74745e28bf99e8352ecde14";
        String supportQueueSid = "WQ2423be93a1c6026f7fcb6daed71a9fd7";
        String defaultQueue = "WQ3168ffe8bcdb0764cdd5f1d16dd08a9f";

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

        System.out.println(workflow.getFriendlyName());

    }
}