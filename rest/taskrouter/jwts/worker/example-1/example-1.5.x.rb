# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

capability = Twilio::JWT::TaskRouterCapability.new(
  account_sid, auth_token,
  workspace_sid, worker_sid
)

allow_activity_updates = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_activities(workspace_sid), 'POST', true
)
capability.add_policy(allow_activity_updates)

allow_reservation_updates = Twilio::JWT::TaskRouterCapability::Policy.new(
  Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_reservations(workspace_sid, worker_sid), 'POST', true
)
capability.add_policy(allow_reservation_updates)

puts capability.to_s
