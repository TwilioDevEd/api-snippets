# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new api_key_sid, api_key_secret

room = client.video.v1.rooms.create(unique_name: 'DailyStandup')

puts room.sid
