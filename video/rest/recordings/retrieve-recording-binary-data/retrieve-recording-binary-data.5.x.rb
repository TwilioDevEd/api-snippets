# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'net/http'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

recording_sid = 'RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
uri = "https://video.twilio.com/v1/Recordings/#{recording_sid}/Media"

response = client.request('video.twilio.com', 443, 'GET', uri)
media_content = Net::HTTP.get(URI(response.body['redirect_to']))
puts media_content
