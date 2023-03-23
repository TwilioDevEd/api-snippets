from twilio.twiml.voice_response import Pay, VoiceResponse

response = VoiceResponse()
response.pay(payment_connector='Stripe_Connector_1')

print(response)
