require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.gather

puts response
