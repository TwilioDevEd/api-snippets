from twilio.twiml.voice_response import VoiceResponse, Siprec, Start

response = VoiceResponse()
start = Start()
start.siprec(name='My SIPREC Stream', connector_name='Gridspace_1')
response.append(start)

print(response)
