require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(caller_id: '+1888XXXXXXX') do |dial|
  dial.number('858-987-6543')
  dial.client(identity: 'joey')
  dial.client(identity: 'charlie')
end

puts response
