from twilio.twiml.voice_response import Connect, VoiceResponse, Room

response = VoiceResponse()
connect = Connect()
connect.room('meeting', status_callback='https://myactionurl.com/')
response.append(connect)

print(response)
