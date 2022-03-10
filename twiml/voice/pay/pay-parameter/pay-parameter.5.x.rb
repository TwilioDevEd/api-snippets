require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(charge_amount: '10.00', payment_connector: 'My_Generic_Pay_Connector', action: 'https://your-callback-function-url.com/pay') do |pay|
    pay.parameter(name: 'card_type', value: 'mastercard')
end

puts response