from twilio.twiml.voice_response import VoiceResponse, Start, Transcription

response = VoiceResponse()
start = Start()
start.transcription(
    status_callback_url='https://example.com/your-callback-url',
    enable_automatic_punctuation=True,
    transcription_engine='google')
response.append(start)

print(response)
