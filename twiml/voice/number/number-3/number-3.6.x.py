from twilio.twiml.voice_response import Dial, Number, VoiceResponse
response = VoiceResponse()
dial = Dial()
dial.number('+14158675309', status_callback_event='initiated ringing answered completed', status_callback='https://myapp.com/calls/events', status_callback_method='POST')
response.append(dial)

print(response)