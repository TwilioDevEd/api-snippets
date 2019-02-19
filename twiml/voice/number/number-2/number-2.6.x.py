from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.number('858-987-6543')
dial.number('415-123-4567')
dial.number('619-765-4321')
response.append(dial)

print(response)
