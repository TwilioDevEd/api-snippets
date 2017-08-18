from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.conference(
    'NoMusicNoBeepRoom',
    beep=False,
    wait_url='http://your-webhook-host.com',
    start_conference_on_enter=True,
    end_conference_on_exit=True
)
response.append(dial)

print(response)
