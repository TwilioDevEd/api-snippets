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

# Update a Reservation with a Conference instruction
status_callback = %w[start end join leave mute hold]
reservation = client.workspace
                    .tasks.get(task_sid)
                    .reservations.get(reservation_sid)

reservation.update(instruction: 'conference',
                   from: '+18001231234',
                   conference_status_callback: 'https://www.example.com/ConferenceEvents',
                   conference_status_callback_event: status_callback)
puts reservation.reservation_status
puts reservation.worker_name
