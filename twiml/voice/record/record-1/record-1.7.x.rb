require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.record(timeout: 10, transcribe: true)

puts response
