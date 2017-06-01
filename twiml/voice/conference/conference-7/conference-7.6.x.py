from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.conference('Customer Waiting Room', beep=False)
response.append(dial)

print(response)
