from twilio.twiml.voice_response import VoiceResponse, Start, Transcription

response = VoiceResponse()
start = Start()
start.transcription(
    status_callback_url='https://example.com/your-callback-url',
    hints='$OOV_CLASS_ALPHANUMERIC_SEQUENCE')
response.append(start)

print(response)
