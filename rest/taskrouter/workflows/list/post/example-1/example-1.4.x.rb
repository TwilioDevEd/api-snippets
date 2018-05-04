# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new(account_sid,
                                            auth_token,
                                            workspace_sid)

# Queues
sales_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
marketing_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
support_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
everyone_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

sales_queue_target = Twilio::TaskRouter::WorkflowRuleTarget.new sales_sid
sales_queue_targets = [sales_queue_target]
sales_rule = Twilio::TaskRouter::WorkflowRule.new 'type == "sales"',
                                                  sales_queue_targets

marketing_target = Twilio::TaskRouter::WorkflowRuleTarget.new marketing_sid
marketing_targets = [marketing_target]
marketing_rule = Twilio::TaskRouter::WorkflowRule.new 'type == "marketing"',
                                                      marketing_targets

support_target = Twilio::TaskRouter::WorkflowRuleTarget.new support_sid
support_targets = [support_target]
support_rule = Twilio::TaskRouter::WorkflowRule.new 'type == "support"',
                                                    support_targets

rules = [sales_rule, marketing_rule, support_rule]
default_target = Twilio::TaskRouter::WorkflowRuleTarget.new everyone_sid

config = Twilio::TaskRouter::WorkflowConfiguration.new rules, default_target
json = config.to_json

workflow = client.workspace.workflows.create(
  friendly_name: 'Sales, Marketing, Support Workflow',
  assignment_callback_url: 'http://example.com',
  fallback_assignment_callback_url: 'http://example.2com',
  task_reservation_timeout: '30',
  configuration: json
)

puts workflow.friendly_name
