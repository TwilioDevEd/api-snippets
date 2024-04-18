from twilio.twiml.voice_response import VoiceResponse, Say, Start, Stream

response = VoiceResponse()
start = Start()
start.stream(name='Example Audio Stream', url='wss://example.com/audiostream')
response.append(start)
response.say('The stream has started.')

print(response)
