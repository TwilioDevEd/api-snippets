from twilio.twiml.voice_response import Conference, Dial, VoiceResponse
response = VoiceResponse()
dial = Dial()
dial.conference('NoMusicNoBeepRoom', beep='false', wait_url='', start_conference_on_enter='true', end_conference_on_exit='true')
response.append(dial)

print(response)