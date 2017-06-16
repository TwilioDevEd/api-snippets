require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.say 'Bom dia.', voice: 'alice', language: 'pt-BR', loop: 2

puts response
