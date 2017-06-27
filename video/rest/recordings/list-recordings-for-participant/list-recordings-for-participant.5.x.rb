# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new api_key_sid, api_key_secret

participant_recordings = client.video.recordings
  .list(grouping_sid: 'ParticipantSid')

participant_recordings.each do |recording|
  puts recording.sid
end
