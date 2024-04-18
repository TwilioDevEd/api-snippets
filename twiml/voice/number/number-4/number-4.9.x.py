from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.number(
    '+14155555555',
    status_callback_event='initiated ringing answered completed',
    status_callback='https://myapp.com/calls/events',
    status_callback_method='POST'
)
dial.number(
    '+14153333333',
    status_callback_event='initiated ringing answered completed',
    status_callback='https://example.com/events',
    status_callback_method='POST'
)
response.append(dial)

print(response)
