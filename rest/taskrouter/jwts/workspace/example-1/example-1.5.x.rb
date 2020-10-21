# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

capability = Twilio::JWT::TaskRouterCapability.new(
 (account_sid, auth_token), workspace_sid, workspace_sid
)

allow_fetch_subresources = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_workspaces,
  'GET',
  true
)
capability.add_policy(allow_fetch_subresources)

allow_updates_subresources = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_workspaces,
  'POST',
  true
)
capability.add_policy(allow_updates_subresources)

allow_delete_subresources = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_workspaces,
  'DELETE',
  true
)
capability.add_policy(allow_delete_subresources)

puts capability.to_s
