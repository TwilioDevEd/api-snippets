# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
taskqueue_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

capability = Twilio::JWT::TaskRouterCapability.new(
 (account_sid, auth_token),
  workspace_sid, taskqueue_sid
)

allow_fetch_subresources = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils
  .all_task_queues(workspace_sid), 'GET', true
)
capability.add_policy(allow_fetch_subresources)

allow_updates = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils
  .all_task_queues(workspace_sid), 'POST', true
)
capability.add_policy(allow_updates)

puts capability.to_s
