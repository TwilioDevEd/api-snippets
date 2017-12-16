from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial(
    record='record-from-ringing-dual',
    recording_status_callback='www.myexample.com'
)
dial.conference('myteamroom')
response.append(dial)

print(response)
