require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(paymentConnector: 'Stripe_Connector_1')

puts response
