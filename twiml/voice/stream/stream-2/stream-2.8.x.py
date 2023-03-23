from twilio.twiml.voice_response import Parameter, VoiceResponse, Start, Stream

response = VoiceResponse()
start = Start()
stream = Stream(url='wss://mystream.ngrok.io/example')
stream.parameter(name='FirstName', value='Jane')
stream.parameter(name='LastName', value='Doe')
start.append(stream)
response.append(start)

print(response)
