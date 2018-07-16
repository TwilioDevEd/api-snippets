require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Chapeau!', voice: 'woman', language: 'fr')

puts response
