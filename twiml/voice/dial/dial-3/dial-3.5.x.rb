require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.dial '415-123-4567', action: '/handleDialCallStatus.php', method: 'GET'
response.say 'I am unreachable'

puts response
