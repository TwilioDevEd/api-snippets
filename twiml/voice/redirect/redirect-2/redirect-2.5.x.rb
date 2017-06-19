require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial('415-123-4567')
response.redirect('http://www.foo.com/nextInstructions')

puts response
