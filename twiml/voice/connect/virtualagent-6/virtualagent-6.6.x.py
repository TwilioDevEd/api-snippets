from twilio.twiml.voice_response import Connect, VoiceResponse, VirtualAgent

response = VoiceResponse()
connect = Connect()
virtualagent = VirtualAgent(connector_name='uniqueName')
virtualagent.config(name='language', value='en-us')
virtualagent.config(name='voiceName', value='en-US-Wavenet-C')
connect.append(virtualagent)
response.append(connect)

print(response)
