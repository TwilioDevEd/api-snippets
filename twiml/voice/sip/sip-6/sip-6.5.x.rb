require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new 
dial.sip 'kate@example.com'
response.append dial

puts response
