from twilio.twiml.voice_response import Connect, VoiceResponse, Room

response = VoiceResponse()
connect = Connect()
connect.room('DailyStandup')
response.append(connect)

print(response)
