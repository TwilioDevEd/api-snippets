from twilio.twiml.voice_response import Pay, VoiceResponse

response = VoiceResponse()
response.pay(token_type='one-time', charge_amount='0')

print(response)
