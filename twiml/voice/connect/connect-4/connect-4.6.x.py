from twilio.twiml.voice_response import Connect, VoiceResponse, Room

response = VoiceResponse()
connect = Connect(action='https://myactionurl.com/', timeout='5')
connect.room('meeting', status_callback='https://myactionurl.com/')
response.append(connect)

print(response)
