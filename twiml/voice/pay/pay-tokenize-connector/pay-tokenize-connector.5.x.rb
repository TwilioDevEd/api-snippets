require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(charge_amount: '0', payment_connector: 'My_Pay_Connector', action: 'https://your-callback-function-url.com/pay')

puts response
