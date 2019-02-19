require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(voice: 'alice', language: 'pt-BR', loop: 2, message: 'Bom dia.')

puts response
