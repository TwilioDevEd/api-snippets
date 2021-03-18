from twilio.twiml.voice_response import Connect, VoiceResponse, VirtualAgent

response = VoiceResponse()
connect = Connect(action='https://myactionurl.com/twiml')
connect.virtual_agent(
    connector_name='project', status_callback='https://mycallbackurl.com'
)
response.append(connect)

print(response)
