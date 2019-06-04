# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'

@client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

@client.video.rooms('RMXXXX').participants('Customer')
.subscribe_rules.update(
  rules: [
    {"type": "include", "all": true},
    {"type": "exclude", "publisher": "Supervisor"}
  ]
)

puts 'Subscribe Rules updated successfully'
