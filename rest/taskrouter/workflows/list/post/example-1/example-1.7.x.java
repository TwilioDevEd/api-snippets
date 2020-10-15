// Install the Java helper library from twilio.com/docs/java/install
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.Workflow;
import com.twilio.taskrouter.WorkflowRule;
import com.twilio.taskrouter.WorkflowRuleTarget;

public class Example {
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String salesQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String marketingQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String supportQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String defaultQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    List<WorkflowRule> rules = new ArrayList<WorkflowRule>();

    List<WorkflowRuleTarget> salesTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget salesTarget = new WorkflowRuleTarget.Builder(salesQueueSid).build();
    salesTargets.add(salesTarget);
    WorkflowRule salesRule = new WorkflowRule.Builder("type == \"sales\"", salesTargets).build();

    // marketing
    List<WorkflowRuleTarget> marketingTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget marketingTarget = new WorkflowRuleTarget.Builder(marketingQueueSid).build();
    marketingTargets.add(marketingTarget);
    WorkflowRule marketingRule =
        new WorkflowRule.Builder("type == \"marketing\"", marketingTargets).build();

    // support
    List<WorkflowRuleTarget> supportTargets = new ArrayList<WorkflowRuleTarget>();
    WorkflowRuleTarget supportTarget = new WorkflowRuleTarget.Builder(supportQueueSid).build();
    supportTargets.add(supportTarget);
    WorkflowRule supportRule =
        new WorkflowRule.Builder("type == \"support\"", supportTargets).build();

    // default filter
    WorkflowRuleTarget defaultTarget = new WorkflowRuleTarget.Builder(defaultQueue).build();

    // put rules together in order in which the workflow should process them
    rules.add(salesRule);
    rules.add(marketingRule);
    rules.add(supportRule);

    // build workflow & convert to json
    com.twilio.taskrouter.Workflow config = null;
    try {
      config = new com.twilio.taskrouter.Workflow(rules, defaultTarget);
    } catch (Exception e) {
      e.printStackTrace();
    }

    String workflowJSON = null;
    try {
      workflowJSON = config.toJson();
    } catch (IOException e) {
      e.printStackTrace();
    }

    Workflow workflow =
        Workflow.creator(WORKSPACE_SID, "Sales, Marketing, Support Workflow", workflowJSON)
            .setAssignmentCallbackUrl("http://example.com")
            .setFallbackAssignmentCallbackUrl("http://example2.com")
            .setTaskReservationTimeout(30)
            .create();
  }
}
