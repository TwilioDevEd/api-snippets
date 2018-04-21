# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid     = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token      = 'your_auth_token'
workspace_sid   = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
task_sid        = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
reservation_sid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new account_sid,
                                            auth_token,
                                            workspace_sid

reservation = client.workspace
                    .tasks.get(task_sid)
                    .reservations.get(reservation_sid)

call_status_callback_url = 'http://example.com/agent_answer_status_callback'
reservation.update(instruction: 'call',
                   call_from: '+15558675310',
                   call_url: 'http://example.com/agent_answer',
                   call_status_callback_url: call_status_callback_url,
                   call_accept: 'true')

puts reservation.reservation_status
puts reservation.worker_name
