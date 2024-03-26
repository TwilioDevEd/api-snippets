require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(token_type: 'one-time', charge_amount: '0')

puts response
