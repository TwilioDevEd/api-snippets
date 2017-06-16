require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.leave 

puts response
