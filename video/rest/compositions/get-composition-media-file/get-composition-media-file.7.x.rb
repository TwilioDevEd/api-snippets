# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'net/http'
require 'open-uri'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)

composition_sid = 'CJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

uri = "https://video.twilio.com/v1/Compositions/#{composition_sid}/Media?Ttl=3600"

response = @client.request("video.twilio.com", 433, 'GET', uri)

media_location = response.body['redirect_to']
# For example, write the composition media to a local file
open('myFile.mp4', "wb") do |file|
  file << open(media_location).read
end
