# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'net/http'

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = ENV['TWILIO_API_KEY']
api_key_secret = ENV['TWILIO_API_KEY_SECRET']

client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

composition_sid = 'CJXXXX'

uri = "https://video.twilio.com/v1/Compositions/#{composition_sid}/Media?Ttl=3600"

response = client.request('video.twilio.com', 433, 'GET', uri)

media_location = response.body['redirect_to']
# For example, write the composition media to a local file
response = Net::HTTP.get_response(URI.parse(media_location))

open('myFile.mp4', 'wb') do |file|
  file.write(response.body)
end
