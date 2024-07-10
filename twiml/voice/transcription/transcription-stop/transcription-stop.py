from twilio.twiml.voice_response import VoiceResponse, Stop, Transcription

response = VoiceResponse()
stop = Stop()
stop.transcription(name='Contact center transcription')
response.append(stop)

print(response)
