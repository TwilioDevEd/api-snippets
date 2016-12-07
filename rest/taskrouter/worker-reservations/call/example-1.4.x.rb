# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
reservation_sid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new(account_sid, auth_token, workspace_sid)

reservation = client.workspace.workers.get(worker_sid).reservations.get(reservation_sid)
reservation.update(instruction: 'call',
                   callFrom: '+15558675309',
                   callUrl: 'http://example.com/agent_answer',
                   callStatusCallbackUrl: 'http://example.com/agent_answer_status_callback',
                   callAccept: 'true')

puts reservation.reservation_status
puts reservation.worker_name
