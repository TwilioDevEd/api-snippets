from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.conference(
    'LoveTwilio',
    record='record-from-start',
    recording_status_callback='www.myexample.com'
)
response.append(dial)

print(response)
