from twilio.twiml.voice_response import Record, VoiceResponse

response = VoiceResponse()
response.record(timeout=10, transcribe='true')

print(response)
