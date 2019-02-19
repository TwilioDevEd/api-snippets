# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new api_key_sid, api_key_secret

group_room = client.video.rooms.create(
  unique_name: 'DailyStandup',
  type: 'group',
  record_participants_on_connect: true,
  status_callback: 'http://example.org'
)

puts group_room
