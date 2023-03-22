from twilio.twiml.voice_response import Connect, VoiceResponse, Say, VirtualAgent

response = VoiceResponse()
response.say('Hello! You will be now be connected to a virtual agent.')
connect = Connect(action='https://myactionurl.com/virtualagent_ended')
connect.virtual_agent(
    connector_name='project', status_callback='https://mycallbackurl.com'
)
response.append(connect)

print(response)
