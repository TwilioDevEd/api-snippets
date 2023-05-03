require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.play(digits: 'wwww3')

puts response
