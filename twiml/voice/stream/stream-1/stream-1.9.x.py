from twilio.twiml.voice_response import VoiceResponse, Start, Stream

response = VoiceResponse()
start = Start()
start.stream(
    name='Example Audio Stream', url='wss://mystream.ngrok.io/audiostream'
)
response.append(start)

print(response)
