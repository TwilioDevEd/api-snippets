require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(caller_id: '+1888XXXXXXX') do |dial|
  dial.number('858-987-6543')
  dial.client('joey')
  dial.client('charlie')
end

puts response
