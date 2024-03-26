# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid     = ENV['TWILIO_ACCOUNT_SID']
auth_token      = ENV['TWILIO_AUTH_TOKEN']
workspace_sid   = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
task_sid        = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
reservation_sid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

@client = Twilio::REST::Client.new(account_sid, auth_token)

reservation = @client.taskrouter.v1.workspaces(workspace_sid)
                    .tasks(task_sid).reservations(reservation_sid)

# Update a Reservation with a Conference instruction
status_callback = %w[start end join leave mute hold]
reservation = reservation.update(instruction:  'conference',
                                 from: '+18001231234',
                                 conference_status_callback: 'https://www.example.com/ConferenceEvents',
                                 conference_status_callback_event: status_callback)

puts reservation.reservation_status

puts reservation.worker_name
