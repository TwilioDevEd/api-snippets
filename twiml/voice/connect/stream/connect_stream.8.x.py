from twilio.twiml.voice_response import Connect, VoiceResponse, Stream

response = VoiceResponse()
connect = Connect()
connect.stream(url='wss://mystream.ngrok.io/audiostream')
response.append(connect)

print(response)
