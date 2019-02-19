# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient
from twilio.task_router.workflow_ruletarget import WorkflowRuleTarget
from twilio.task_router.workflow_rule import WorkflowRule
from twilio.task_router.workflow_config import WorkflowConfig

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = TwilioTaskRouterClient(account_sid, auth_token)

rules = []

sales_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
marketing_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
support_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
everyone_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

salesRuleTargets = []
salesRuleTarget = WorkflowRuleTarget(sales_queue_sid, None, None, None)
salesRuleTargets.append(salesRuleTarget)
salesRule = WorkflowRule("type=='sales'", salesRuleTargets, None)

marketingRuleTargets = []
marketingRuleTarget = WorkflowRuleTarget(marketing_queue_sid, None, None, None)
marketingRuleTargets.append(marketingRuleTarget)
marketingRule = WorkflowRule("type=='marketing'", marketingRuleTargets, None)

supportRuleTargets = []
supportRuleTarget = WorkflowRuleTarget(support_queue_sid, None, None, None)
supportRuleTargets.append(supportRuleTarget)
supportRule = WorkflowRule("type=='support'", supportRuleTargets, None)

rules.append(salesRule)
rules.append(marketingRule)
rules.append(supportRule)

defaultTarget = WorkflowRuleTarget(everyone_queue_sid, None, None, None)
config = WorkflowConfig(rules, defaultTarget)
json = config.to_json()

workflow = client.workflows(workspace_sid).create(
    friendly_name='Sales, Marketing, Support Workflow',
    assignment_callback_url='http://example.com',
    fallback_assignment_callback_url='http://example2.com',
    task_reservation_timeout='30',
    configuration=json
)

print(workflow.friendly_name)
