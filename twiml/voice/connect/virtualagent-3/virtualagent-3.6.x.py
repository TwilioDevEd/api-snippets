from twilio.twiml.voice_response import Connect, VoiceResponse, VirtualAgent

response = VoiceResponse()
connect = Connect()
connect.virtual_agent(connector_name='project', language='fr')
response.append(connect)

print(response)
