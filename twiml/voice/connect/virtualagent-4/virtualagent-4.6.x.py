from twilio.twiml.voice_response import Connect, VoiceResponse, VirtualAgent

response = VoiceResponse()
connect = Connect()
connect.virtualagent(connector_name='project', sentiment_analysis=True)
response.append(connect)

print(response)
