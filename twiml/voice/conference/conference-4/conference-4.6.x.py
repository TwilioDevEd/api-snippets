from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.conference(
    'EventedConf',
    status_callback='https://myapp.com/events',
    status_callback_event='start end join leave mute hold'
)
response.append(dial)

print(response)
