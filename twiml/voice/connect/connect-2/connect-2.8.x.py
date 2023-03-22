from twilio.twiml.voice_response import Connect, VoiceResponse, Room

response = VoiceResponse()
connect = Connect()
connect.room('DailyStandup', participant_identity='alice')
response.append(connect)

print(response)
