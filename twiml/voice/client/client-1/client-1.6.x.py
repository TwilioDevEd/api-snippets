from twilio.twiml.voice_response import Client, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.client('joey')
response.append(dial)

print(response)
