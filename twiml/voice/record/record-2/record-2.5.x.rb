require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.record 

puts response
