require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.hangup 

puts response
