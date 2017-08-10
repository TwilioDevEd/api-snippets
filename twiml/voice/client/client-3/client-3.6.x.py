from twilio.twiml.voice_response import Client, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.client(
    'jenny',
    status_callback_event='initiated ringing answered completed',
    status_callback='https://myapp.com/calls/events',
    status_callback_method='POST'
)
response.append(dial)

print(response)
