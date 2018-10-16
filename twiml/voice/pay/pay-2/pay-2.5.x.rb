require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Calling Twilio Pay')
response.add_text('')
response.pay(chargeAmount: '20.45')

puts response