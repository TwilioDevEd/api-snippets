from twilio.twiml.voice_response import Leave, VoiceResponse

response = VoiceResponse()
response.leave()

print(response)
