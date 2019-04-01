from twilio.twiml.voice_response import Connect, VoiceResponse, Room

response = VoiceResponse()
connect = Connect()
connect.autopilot('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
response.append(connect)

print(response)
