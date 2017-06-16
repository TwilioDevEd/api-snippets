require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.say 'Hej!', language: 'sv-SE'

puts response
