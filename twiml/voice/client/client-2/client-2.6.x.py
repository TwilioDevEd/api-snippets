from twilio.twiml.voice_response import Client, Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial(caller_id='+1888XXXXXXX')
dial.number('858-987-6543')
dial.client('joey')
dial.client('charlie')
response.append(dial)

print(response)
