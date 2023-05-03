require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.reject

puts response
