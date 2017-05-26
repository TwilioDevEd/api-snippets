from twilio.twiml.voice_response import Record, VoiceResponse

response = VoiceResponse()
response.record(
    transcribe='true', transcribe_callback='/handle_transcribe.php')

print(response)
