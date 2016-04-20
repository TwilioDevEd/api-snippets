# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

rules = []

sales_queue_sid = "{{ sales_queue_sid }}"
marketing_queue_sid = "{{ marketing_queue_sid }}"
support_queue_sid = "{{ support_queue_sid }}"
everyone_queue_sid = "{{ everyone_queue_sid }}"

salesRuleTargets = []
salesRuleTarget = WorkflowRuleTarget(sales_queue_sid, null, null, null)
salesRuleTargets.append(salesRuleTarget)
salesRule = WorkflowRule("type=='sales'", salesRuleTargets, null)

marketingRuleTargets = []
marketingRuleTarget = WorkflowRuleTarget(marketing_queue_sid, null, null, null)
marketingRuleTargets.append(marketingRuleTarget)
marketingRule = WorkflowRule("type=='marketing'", marketingRuleTargets, null)

supportRuleTargets = []
supportRuleTarget = WorkflowRuleTarget(support_queue_sid, null, null, null)
supportRuleTargets.append(supportRuleTarget)
supportRule = WorkflowRule("type=='support'", supportRuleTargets, null)

rules.append(salesRule)
rules.append(marketingRule)
rules.append(supportRule)

defaultTarget = WorkflowRuleTarget(everyone_queue_sid, null, null, null)
config = WorkflowConfig(rules, defaultTarget)
json = config.toJson()

workflow = client.workflows(workspace_sid).create(
    friendly_name='Sales, Marketing, Support Workflow',
    assignment_callback_url='http://example.com',
    fallback_assignment_callback_url='http://example2.com',
    task_reservation_timeout='30',
    configuration=json
)

print workflow.friendly_name