require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Calling Twilio Pay')
response.pay(charge_amount: '20.45')

puts response
