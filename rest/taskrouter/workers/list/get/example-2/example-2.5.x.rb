# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

workspace = client.taskrouter.v1.workspaces(workspace_sid)

workspace.workers.list(available: '1').each do |worker|
  puts worker.friendly_name
end

workspace.workers.list(task_queue_sid: 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
                       available: '1').each do |worker|
  puts worker.friendly_name
end

workspace.workers.list(
  target_workers_expression: "type == 'leads'"
).each do |worker|
  puts worker.friendly_name
end
