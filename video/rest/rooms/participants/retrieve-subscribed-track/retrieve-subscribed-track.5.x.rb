# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'

@client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

subscribed_track = @client.video.rooms('RMXXXX').participants('PAXXXX')
    .subscribed_tracks('MTXXXX').fetch()

puts "Read track subscription with sid = " + subscribe_track.sid
