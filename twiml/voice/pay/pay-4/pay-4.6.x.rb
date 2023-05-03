require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(payment_connector: 'Stripe_Connector_1')

puts response
