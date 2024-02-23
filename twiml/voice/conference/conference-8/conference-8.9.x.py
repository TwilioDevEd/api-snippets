from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.conference(
    'Customer Waiting Room', beep=False, end_conference_on_exit=True
)
response.append(dial)

print(response)
