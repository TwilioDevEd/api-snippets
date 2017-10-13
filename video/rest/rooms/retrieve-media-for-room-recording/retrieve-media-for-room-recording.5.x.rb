# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'net/http'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

room_sid = 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
recording_sid = 'RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
host = 'https://video.twilio.com'
uri = "#{host}/v1/Rooms/#{room_sid}/Recordings/#{recording_sid}/Media"

response = client.request(method: 'POST', uri: uri)
media_location = JSON.parse(response.body)['location']

media_content = Net::HTTP.get(URI(media_location))
puts media_content
