# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

taskqueue = client.taskrouter.v1.workspaces(workspace_sid).task_queues.create(
  friendly_name:            'English',
  reservation_activity_sid: 'WAxxxx',
  assignment_activity_sid:  'WAyyyy',
  target_workers:           'languages HAS "english"'
)

puts taskqueue.friendly_name
