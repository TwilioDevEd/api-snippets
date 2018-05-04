# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

capability = Twilio::TaskRouter::WorkerCapability.new account_sid,
                                                      auth_token,
                                                      workspace_sid,
                                                      worker_sid

capability.allow_fetch_subresources
capability.allow_activity_updates
capability.allow_reservation_updates

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

capability.generate_token 28_800 # 60 * 60 * 8
