from twilio.twiml.voice_response import VoiceResponse, Start, Transcription

response = VoiceResponse()
start = Start()
start.transcription(
    status_callback_url='https://example.com/your-callback-url',
    name='Contact center transcription')
response.append(start)

print(response)
