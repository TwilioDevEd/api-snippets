require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.redirect 'http://www.foo.com/nextInstructions'

puts response
