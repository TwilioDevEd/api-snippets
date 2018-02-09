require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.client('joey')
end

puts response
