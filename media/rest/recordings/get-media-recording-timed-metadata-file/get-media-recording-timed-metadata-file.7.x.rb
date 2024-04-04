# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'net/http'
require 'open-uri'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)

recording_sid = 'KVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

uri = "https://media.twilio.com/v1/MediaRecordings/#{recording_sid}/TimedMetadata?Ttl=3600"

response = @client.request("media.twilio.com", 433, 'GET', uri)

timed_metadata_location = response.body['redirect_to']
# For example, write the timed metadata to a local file
open('myFile.vtt', "wb") do |file|
  file << open(timed_metadata_location).read
end
