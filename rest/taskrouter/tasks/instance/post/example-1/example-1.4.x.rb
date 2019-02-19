# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
task_sid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new account_sid,
                                            auth_token,
                                            workspace_sid

# update a task's attributes
task = client.workspace.tasks.get(task_sid)
task = task.update(attributes: '{"type":"support"}')
puts task.attributes

# cancel a task
task = client.workspace.tasks.get(task_sid)
task = task.update(assignment_status: 'canceled', reason: 'waiting too long')
puts task.assignment_status
puts task.reason
