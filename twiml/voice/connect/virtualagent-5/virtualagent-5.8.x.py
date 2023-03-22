from twilio.twiml.voice_response import Connect, VoiceResponse, VirtualAgent

response = VoiceResponse()
connect = Connect()
virtualagent = VirtualAgent(connector_name='uniqueName')
virtualagent.parameter(name='customer_name', value='Burton Guster')
connect.append(virtualagent)
response.append(connect)

print(response)
