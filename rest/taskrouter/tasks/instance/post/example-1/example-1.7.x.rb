# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
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
