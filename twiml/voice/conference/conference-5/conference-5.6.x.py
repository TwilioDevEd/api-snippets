from twilio.twiml.voice_response import Conference, Dial, VoiceResponse
response = VoiceResponse()
dial = Dial()
dial.conference('SimpleRoom', muted='true')
response.append(dial)

print(response)