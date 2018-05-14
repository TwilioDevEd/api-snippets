# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'net/http'
require 'open-uri'

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

composition_sid = 'CJXXXX'

uri = "https://video.twilio.com/v1/Compositions/#{composition_sid}/Media?Ttl=6000"

response = client.request("video.twilio.com", 433, 'GET', uri)

media_location = response.body['redirect_to']
# For example, write the composition media to a local file
open('myFile.mp4', "wb") do |file|
  file << open(media_location).read
end
