require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay

puts response
