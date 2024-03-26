# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
workflow_sid = 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

statistics = client.taskrouter.v1.workspaces(workspace_sid)
                   .workflows(workflow_sid)
                   .real_time_statistics.fetch

puts statistics.tasks_by_status['pending']
puts statistics.tasks_by_status['assigned']
