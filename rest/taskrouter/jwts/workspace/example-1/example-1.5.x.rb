# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'


capability = Twilio::JWT::WorkspaceCapability
             .new(account_sid, auth_token, workspace_sid)

capability.allow_fetch_subresources

capability.allow_updates_subresources

capability.allow_delete_subresources

token = capability.generate_token

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

token = capability.generate_token 28800 # 60 * 60 * 8

puts token
