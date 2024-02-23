from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial(
    action='handleLeaveConference.php',
    method='POST',
    hangup_on_star=True,
    time_limit=30
)
dial.conference('LoveTwilio')
response.append(dial)

print(response)
