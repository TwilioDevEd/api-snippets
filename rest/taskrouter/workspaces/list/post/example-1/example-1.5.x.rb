# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'


client = Twilio::REST::Client.new(account_sid, auth_token)

workspace = client.taskrouter.v1.workspaces
            .create(friendly_name: 'NewWorkspace',
                    event_callback_url: 'http://requestb.in/vh9reovh',
                    template: 'FIFO'
)

puts workspace.friendly_name
