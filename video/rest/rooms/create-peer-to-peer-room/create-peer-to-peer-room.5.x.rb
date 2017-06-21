# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new account_sid, auth_token

p2p_room = client.video.rooms.create(
  unique_name: 'DailyStandup',
  type: 'peer-to-peer',
  enable_turn: false,
  status_callback: 'http://example.org')

puts p2p_room.sid
