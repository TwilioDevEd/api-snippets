require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
gather = Twilio::TwiML::Gather.new input: 'speech', action: '/completed'
gather.say 'Welcome to Twilio, please tell us why you\'re calling'
response.append gather

puts response
