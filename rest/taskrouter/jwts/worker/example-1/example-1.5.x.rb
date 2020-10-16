# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

capability = Twilio::JWT::TaskRouterCapability.new(
 (account_sid, auth_token),
  workspace_sid, worker_sid
)

allow_fetch_subresources = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils
  .worker(workspace_sid, worker_sid), 'GET', true
)
capability.add_policy(allow_fetch_subresources)

allow_activity_updates = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils
  .all_activities(workspace_sid), 'POST', true
)
capability.add_policy(allow_activity_updates)

allow_reservation_updates = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils
  .all_reservations(workspace_sid, worker_sid), 'POST', true
)
capability.add_policy(allow_reservation_updates)

Twilio::JWT::TaskRouterCapability::TaskRouterUtils
.worker_policies(workspace_sid, worker_sid).each { |worker_policy|
   capability.add_policy(worker_policy)
}

puts capability.to_s
