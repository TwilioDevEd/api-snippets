from twilio.twiml.voice_response import Conference, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.conference('SimpleRoom', muted=True)
response.append(dial)

print(response)
