# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
reservation_sid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new account_sid,
                                            auth_token,
                                            workspace_sid

reservation = client.workspace
                    .workers.get(worker_sid)
                    .reservations.get(reservation_sid)

call_status_callback_url = 'http://example.com/agent_answer_status_callback'
reservation.update(instruction: 'call',
                   call_from: '+15558675309',
                   call_url: 'http://example.com/agent_answer',
                   call_status_callback_url: call_status_callback_url,
                   call_accept: 'true')

puts reservation.reservation_status
puts reservation.worker_name
