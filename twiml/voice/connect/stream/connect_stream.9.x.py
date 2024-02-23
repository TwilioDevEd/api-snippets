from twilio.twiml.voice_response import Connect, VoiceResponse, Say, Stream

response = VoiceResponse()
connect = Connect()
connect.stream(url='wss://example.com/audiostream')
response.append(connect)
response.say(
    'This TwiML instruction is unreachable unless the Stream is ended by your WebSocket server.'
)

print(response)
