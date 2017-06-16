require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.reject(reason: 'busy')

puts response
