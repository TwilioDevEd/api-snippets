# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new(account_sid,
                                            auth_token,
                                            workspace_sid)

client.workspaces.create(
  friendly_name: 'NewWorkspace',
  event_callback_url: 'http://requestb.in/vh9reovh',
  template: 'FIFO'
)
