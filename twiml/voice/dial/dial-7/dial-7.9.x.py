from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial(
    record='record-from-answer',
    recording_track='inbound',
    recording_status_callback='https://www.myexample.com/recording-handler'
)
dial.number('+15551239876')
response.append(dial)

print(response)
