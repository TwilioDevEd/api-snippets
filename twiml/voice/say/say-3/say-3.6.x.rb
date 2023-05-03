require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(language: 'sv-SE', message: 'Hej!')

puts response
