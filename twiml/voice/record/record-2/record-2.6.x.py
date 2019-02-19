from twilio.twiml.voice_response import Record, VoiceResponse

response = VoiceResponse()
response.record()

print(response)
