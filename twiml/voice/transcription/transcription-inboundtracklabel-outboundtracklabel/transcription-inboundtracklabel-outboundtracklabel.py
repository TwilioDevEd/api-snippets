from twilio.twiml.voice_response import VoiceResponse, Start, Transcription

response = VoiceResponse()
start = Start()
start.transcription(
    status_callback_url='https://example.com/your-callback-url',
    inbound_track_label='agent',
    outbound_track_label='customer')
response.append(start)

print(response)
