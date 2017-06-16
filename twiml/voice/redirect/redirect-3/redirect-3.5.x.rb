require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.redirect '../nextInstructions'

puts response
