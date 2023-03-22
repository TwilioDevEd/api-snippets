from twilio.twiml.voice_response import Pay, VoiceResponse

response = VoiceResponse()
response.pay()

print(response)
