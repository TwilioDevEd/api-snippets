# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
task_sid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

# update a task's attributes
task = client.taskrouter.v1.workspaces(workspace_sid).tasks(task_sid)

task = task.update(attributes: '{"type":"support"}')

puts task.attributes

# cancel a task
task = client.taskrouter.v1.workspaces(workspace_sid).tasks(task_sid)

task = task.update(assignment_status: 'canceled', reason: 'waiting too long')

puts task.assignment_status

puts task.reason
