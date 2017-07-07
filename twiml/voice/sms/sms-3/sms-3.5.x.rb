require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say('Our store is located at 123 Easy St.')
response.sms('Store Location: 123 Easy St.', action: '/smsHandler.php', method: 'POST')

puts response
