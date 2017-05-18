from twilio.twiml.voice_response import Client, Dial, VoiceResponse
response = VoiceResponse()
dial = Dial()
dial.client('jenny')
response.append(dial)

print(response)