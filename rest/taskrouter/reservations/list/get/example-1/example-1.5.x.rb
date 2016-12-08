# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
task_sid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

reservation = client.taskrouter.v1.workspaces(workspace_sid)
  .tasks(task_sid).reservations.list.each do |reservation|
  puts reservation.reservation_status
  puts reservation.worker_name
end
