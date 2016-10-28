# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
reservation_sid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

reservation = client.taskrouter.v1.workspaces(workspace_sid)
  .workers(worker_sid).reservations(reservation_sid)

reservation.update(
  instruction: 'call',
  call_from: '+15558675309',
  call_url: 'http://example.com/agent_answer',
  call_status_callback_url: 'http://example.com/agent_answer_status_callback',
  call_accept: 'true'
)

puts reservation
