# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
workflow_sid = 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

statistics = client.taskrouter.v1.workspaces(workspace_sid)
  .workflows(workflow_sid).statistics.fetch

puts statistics.cumulative["avg_task_acceptance_time"]

puts statistics.cumulative["tasks_created"]

puts statistics.realtime["tasks_by_status"]["pending"]

puts statistics.realtime["tasks_by_status"]["assigned"]
