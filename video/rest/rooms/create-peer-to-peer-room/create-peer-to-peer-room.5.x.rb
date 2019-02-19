# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new api_key_sid, api_key_secret

p2p_room = client.video.rooms.create(
  unique_name: 'DailyStandup',
  type: 'peer-to-peer',
  enable_turn: false,
  status_callback: 'http://example.org'
)

puts p2p_room.sid
