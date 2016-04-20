# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
workspace_sid = '{{ workspace_sid }}'
worker_sid = '{{ worker_sid }}'

capability = Twilio::TaskRouter::WorkerCapability.new account_sid, auth_token, workspace_sid, worker_sid
capability.allow_activity_updates
capability.allow_reservation_updates
token = capability.generate_token

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

token = capability.generate_token 28800 # 60 * 60 * 8