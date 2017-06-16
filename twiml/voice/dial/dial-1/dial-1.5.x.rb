require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new 
dial.number '415-123-4567'
response.append dial

puts response
