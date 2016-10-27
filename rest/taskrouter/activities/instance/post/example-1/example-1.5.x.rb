# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
activity_sid = 'WAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'


client = Twilio::REST::Client.new(account_sid, auth_token)

activity = client.taskrouter.v1.workspaces(workspace_sid).activities(activity_sid)

activity = activity.update(friendly_name: 'NewAvailableFriendlyName')

puts activity.friendly_name
