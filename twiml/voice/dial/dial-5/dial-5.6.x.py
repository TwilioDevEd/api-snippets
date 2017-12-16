from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial(
    record='record-from-ringing-dual',
    recording_status_callback='www.myexample.com'
)
dial.number('+15558675309')
response.append(dial)

print(response)
